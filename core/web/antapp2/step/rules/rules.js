if (typeof wx === 'undefined') var wx = getApp().core;
// step/rules/rules.js
Page({
    data: {
        rule: ''
    },

    onLoad: function(obj) {
        let that = this;
        let rules;
        if (obj.rules == 'activity_rule') {
            rules = 2;
        } else if (obj.rules == 'rules') {
            rules = 1;
        }
        getApp().core.showLoading({
            title: '数据加载中...',
            mask: true,
        });
        getApp().request({
            url: getApp().api.step.setting,
            success(res) {
                getApp().core.hideLoading();
                that.setData({
                    rule: res.data.rule,
                    activity_rule: res.data.activity_rule,
                    'rules': rules
                })
            }
        })
    }
})