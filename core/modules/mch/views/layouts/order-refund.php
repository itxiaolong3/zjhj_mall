<?php
/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2018 浙江禾匠信息科技有限公司
 * author: wxf
 */

$address = \app\models\RefundAddress::find()->where(['store_id' => Yii::$app->controller->store->id, 'is_delete' => 0])->all();
foreach ($address as &$v) {
    if (mb_strlen($v->address) > 20) {
        $v->address = mb_substr($v->address, 0, 20) . '···';
    }
}
unset($v);

$urlManager = Yii::$app->urlManager;
$urlHandle = $urlManager->createUrl(['mch/order/refund-handle']);

?>

<!-- 退货 -->
<div class="modal fade" id="retreatModal" data-backdrop="static">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">提示</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <input type="hidden" id="retreat_id" name="retreat_id" value="">

                <div class="mb-3">确认同意退货？同意后由客户填写退货快递单号，确认收到货后退款金额返还给客户。</div><div>请输入退款金额（最多<span id="max_price"></span>元）：</div>
                <input type="number" id="retreat_price" class="form-control" style="margin:10px 0" name="retreat_price"
                       min="0.01" max="" step="0.01" value="">

                <div class="mb-3">收货地址（用户参考填写）</div>
                <select class="form-control" id="retreat_address" name="retreat_address">
                    <?php foreach ($address as $v): ?>
                        <option value="<?= $v->id;?>"><?= $v->name.'/'.$v->mobile.'/'.$v->address;?></option>
                    <?php endforeach; ?>
                </select>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary retreat-submit">提交</button>
            </div>
        </div>
    </div>
</div>


<!-- 换货 -->
<div class="modal fade" id="changeModal" data-backdrop="static">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">提示</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <input type="hidden" id="change_id" name="change_id" value="">

                <div class="mb-3">收货地址（用户参考填写）</div>
                <select class="form-control" id="change_address" name="change_address">
                    <?php foreach ($address as $v): ?>
                        <option value="<?= $v->id;?>"><?= $v->name.'/'.$v->mobile.'/'.$v->address;?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary change-submit">提交</button>
            </div>
        </div>
    </div>
</div>

<script>

    $(document).on("click", ".img-view", function () {
        var src = $(this).attr("data-src");
        $(".img-view-box").addClass("active").find("img").attr("src", src);
    });

    $(document).on("click", ".img-view-close", function () {
        $(".img-view-box").removeClass("active");
    });

    function refund_retreat(id,retreat_price){
        $("#retreat_id").val(id);
        $("#max_price").text(retreat_price);
        $("#retreat_price").attr("max",retreat_price);
        $("#retreat_price").val(retreat_price);
    };
    function refund_change(id){
        $("#change_id").val(id);
    };
    //同意退货
    $(document).on("click", ".retreat-submit", function () {
        var id = $("#retreat_id").val();
        var retreat_price = $("#retreat_price").val();
        var retreat_address = $("#retreat_address option:checked").val();
        $("#retreatModal").modal("hide");
        $.myLoading({
            title: "正在提交"
        });
        $.ajax({
            url:'<?=$urlHandle?>',
            type: "post",
            data: {
                _csrf: _csrf,
                order_refund_id: id,
                type: 1,
                action: 1,
                refund_price: retreat_price,
                address_id: retreat_address,
                orderType: '<?= $orderType ?>'
            },
            dataType: "json",
            success: function (res) {
                if (res.code == 0) {
                    $.myAlert({
                        content: res.msg,
                        confirm: function () {
                            location.reload();
                        }
                    });

                }
                if (res.code == 1) {
                    $.myAlert({
                        content: res.msg,
                        confirm: function () {
                            $.myLoadingHide();
                        }
                    });
                }
            }
        });

        return;
        var id = $(this).attr("data-id");
        var price = $(this).attr("data-price");
        $.myPrompt({
            content: '<div class="mb-3">确认同意退货？同意后由客户填写退货快递单号，确认收到货后退款金额返还给客户。</div><div>请输入退款金额（最多' + price + '元）：</div>',
            input_params: {
                type: 'number',
                min: 0.01,
                max: price,
                step: 0.01,
                value: price,
            },
            confirm: function (refund_price) {
                $.myLoading({
                    title: "正在提交"
                });
                $.ajax({
                    url:'<?=$urlHandle?>',
                    type: "post",
                    data: {
                        _csrf: _csrf,
                        order_refund_id: id,
                        type: 1,
                        action: 1,
                        refund_price: refund_price,
                        orderType: '<?= $orderType ?>',
                    },
                    dataType: "json",
                    success: function (res) {
                        if (res.code == 0) {
                            $.myAlert({
                                content: res.msg,
                                confirm: function () {
                                    location.reload();
                                }
                            });
                        }
                        if (res.code == 1) {
                            $.myAlert({
                                content: res.msg,
                                confirm: function () {
                                    $.myLoadingHide();
                                }
                            });
                        }
                    }
                });
            }
        });
    });

    //确认收货，退款
    $(document).on('click', '.agree-btn-3', function () {
        var id = $(this).attr("data-id");
        var price = $(this).attr("data-price");
        $.myConfirm({
            content: "确认已收到货？<br>确认通过后退款金额<b class=text-danger>" + price + "元</b>将直接返还给用户！",
            confirm: function () {
                $.myLoading({
                    title: "正在提交"
                });
                $.ajax({
                    url:'<?=$urlHandle?>',
                    type: "post",
                    data: {
                        _csrf: _csrf,
                        order_refund_id: id,
                        type: 1,
                        action: 1,
                        refund: 1,
                        orderType: '<?= $orderType ?>',
                    },
                    dataType: "json",
                    success: function (res) {
                        if (res.code == 0) {
                            $.myAlert({
                                content: res.msg,
                                confirm: function () {
                                    location.reload();
                                }
                            });
                        }
                        if (res.code == 1) {
                            $.myAlert({
                                content: res.msg,
                                confirm: function () {
                                    $.myLoadingHide();
                                }
                            });
                        }
                    }
                });

            }
        });
    });

    //拒绝退货退款
    $(document).on("click", ".disagree-btn-1", function () {
        var id = $(this).attr("data-id");
        var price = $(this).attr("data-price");
        $.myConfirm({
            content: "确认拒绝该退货退款申请？",
            confirm: function () {
                $.myLoading({
                    title: "正在提交"
                });
                $.ajax({
                    url:'<?=$urlHandle?>',
                    type: "post",
                    data: {
                        _csrf: _csrf,
                        order_refund_id: id,
                        type: 1,
                        action: 2,
                        orderType: '<?= $orderType ?>',
                    },
                    dataType: "json",
                    success: function (res) {
                        if (res.code == 0) {
                            $.myAlert({
                                content: res.msg,
                                confirm: function () {
                                    location.reload();
                                }
                            });
                        }
                        if (res.code == 1) {
                            $.myAlert({
                                content: res.msg,
                                confirm: function () {
                                    $.myLoadingHide();
                                }
                            });
                        }
                    }
                });
            }
        });
    });


    //同意换货
    $(document).on("click", ".change-submit", function () {
        var id = $("#change_id").val();
        var change_address = $("#change_address option:checked").val();
        $("#changeModal").modal("hide");
        $.myLoading({
            title: "正在提交"
        });
        $.ajax({
            url:'<?=$urlHandle?>',
            type: "post",
            data: {
                _csrf: _csrf,
                order_refund_id: id,
                type: 2,
                action: 1,
                address_id:change_address,
                orderType: '<?= $orderType ?>',
            },
            dataType: "json",
            success: function (res) {
                if (res.code == 0) {
                    $.myAlert({
                        content: res.msg,
                        confirm: function () {
                            location.reload();
                        }
                    });
                }
                if (res.code == 1) {
                    $.myAlert({
                        content: res.msg,
                        confirm: function () {
                            $.myLoadingHide();
                        }
                    });
                }
            }
        });
        return;
        var id = $(this).attr("data-id");
        var price = $(this).attr("data-price");
        $.myConfirm({
            content: "确认同意换货？",
            confirm: function () {
                $.myLoading({
                    title: "正在提交"
                });
                $.ajax({
                    url:'<?=$urlHandle?>',
                    type: "post",
                    data: {
                        _csrf: _csrf,
                        order_refund_id: id,
                        type: 2,
                        action: 1,
                        orderType: '<?= $orderType ?>',
                    },
                    dataType: "json",
                    success: function (res) {
                        if (res.code == 0) {
                            $.myAlert({
                                content: res.msg,
                                confirm: function () {
                                    location.reload();
                                }
                            });
                        }
                        if (res.code == 1) {
                            $.myAlert({
                                content: res.msg,
                                confirm: function () {
                                    $.myLoadingHide();
                                }
                            });
                        }
                    }
                });

            }
        });
    });


    //拒绝换货
    $(document).on("click", ".disagree-btn-2", function () {
        var id = $(this).attr("data-id");
        var price = $(this).attr("data-price");
        $.myConfirm({
            content: "确认拒绝该换货申请？",
            confirm: function () {
                $.myLoading({
                    title: "正在提交"
                });
                $.ajax({
                    url:'<?=$urlHandle?>',
                    type: "post",
                    data: {
                        _csrf: _csrf,
                        order_refund_id: id,
                        type: 2,
                        action: 2,
                        orderType: '<?= $orderType ?>',
                    },
                    dataType: "json",
                    success: function (res) {
                        if (res.code == 0) {
                            $.myAlert({
                                content: res.msg,
                                confirm: function () {
                                    location.reload();
                                }
                            });
                        }
                        if (res.code == 1) {
                            $.myAlert({
                                content: res.msg,
                                confirm: function () {
                                    $.myLoadingHide();
                                }
                            });
                        }
                    }
                });
            }
        });
    });

</script>
