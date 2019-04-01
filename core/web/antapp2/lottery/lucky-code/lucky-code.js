if (typeof wx === 'undefined') var wx = getApp().core;
var is_loading = false;
Page({
    data: {
        page:1,
        num:0,
    },

    onLoad (options) {
        getApp().page.onLoad(this, options);
        if(!options){
            return;
        };
       
        var self = this; self.setData(options);
        getApp().core.showLoading({
            title: '加载中',
        });
        getApp().request({
            url: getApp().api.lottery.lucky_code,
            data: {
                id:options.id,
            },
            success: function (res) {
                if(res.code == 0){
                    self.setData(res.data);
                    var list = res.data;
                    if(list.award && (list.award.lucky_code == res.data.own.lucky_code)){
                        var num = res.data.parent.length;
                    } else {
                        var num = res.data.parent.length + 1
                    }
                    self.setData({
                        num:num
                    })
                }
            },
            complete: function(res){
                getApp().core.hideLoading();
            }
        });
    },

    onShow(){
        getApp().page.onShow(this);
    },


    // 上拉加载数据
    userload: function() {
        if (is_loading) {
            return;
        }
        is_loading = true;
        getApp().core.showLoading({
            title: '加载中',
        });

        var self = this;
        var page = self.data.page + 1;
        getApp().request({
            url: getApp().api.lottery.lucky_code,
            data: {
                id:self.data.id,
                page: page,
            },
            success: function (res) {
                if (res.code == 0) {
                    if (res.data.parent == null || res.data.parent.length == 0) {
                        is_loading = true;
                        return;
                    }
                    self.setData({
                        parent: self.data.parent.concat(res.data.parent),
                        page: page,
                        num:self.data.parent.concat(res.data.parent).length
                    });
                } else {
                    self.showToast({
                        title: res.msg,
                    });
                }
            },
            complete: function () {
                getApp().core.hideLoading();
                this.data.is_loading = false;
            }
        });
    },
})

