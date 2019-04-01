<?php
/**
 * Created by IntelliJ IDEA.
 * User: luwei
 * Date: 2017/12/28
 * Time: 15:53
 */
$urlManager = Yii::$app->urlManager;
$this->title = '应用详情';
?>
<style>
    .plugin-info {
        background: #f5f7f9;
        padding: 1rem;
        color: #888;
    }

    .plugin-info .plugin-pic {
        width: 120px;
        height: 120px;
        float: left;
        margin-right: 1rem;
    }

    .plugin-info div {
    }

    .plugin-info .plugin-name {
        font-size: 1.3rem;
        color: #333;
    }

    .plugin-info .plugin-price {
        color: #ff4544;
        font-weight: bold;
    }

    .not-allow-btn {
        background-color: #fff;
        border-color: #ccc;
        opacity: .65;
    }

</style>
<?php if ($res) : ?>
    <?php if ($res['code'] == 0) :
        $model = $res['data']; ?>
        <div class="panel mb-3">
            <div class="panel-body">
                <div class="plugin-info clearfix">
                    <img class="plugin-pic" src="<?= $model['pic_url'] ?>">
                    <div>
                        <div class="plugin-name mb-2"><?= $model['display_name'] ?></div>
                        <div class="plugin-desc mb-2"><?= $model['desc'] ? $model['desc'] : '暂无描述' ?></div>
                        <?php if ($model['is_install'] != 1) : ?>
                            <div class="mb-2">售价：<span class="plugin-price">￥<?= $model['price'] ?></span></div>
                        <?php endif; ?>
                        <div>
                            <?php if ($model['is_install'] == 1) : ?>
                                <a class="btn btn-secondary disabled" href="javascript:">已安装</a>
                            <?php else : ?>
                                <?php if (version_compare(hj_core_version(), $model['version']) == -1) : ?>
                                    <a class="btn btn-secondary not-allow-btn" href="javascript:" data-toggle="popover"
                                       data-placement="bottom"
                                       data-content="此插件要求系统版本最低为<?= $model['version'] ?>，请升级您的系统后再安装此插件">版本不符</a>
                                <?php else : ?>
                                    <?php if (!$model['order_no']) : ?>
                                        <a class="btn btn-primary buy-plugin"
                                           data-id="<?= $model['id'] ?>"
                                           href="javascript:">立即购买</a>
                                    <?php else : ?>
                                        <?php if ($model['is_pay'] == 1) : ?>
                                            <a class="btn btn-primary install-plugin"
                                               data-id="<?= $model['id'] ?>"
                                               href="javascript:">安装插件</a>
                                        <?php else : ?>
                                            <a class="btn btn-primary pay-plugin"
                                               href="<?= $urlManager->createUrl(['mch/plugin/pay', 'order_no' => $model['order_no']]) ?>">付款</a>
                                        <?php endif; ?>
                                    <?php endif; ?>
                                <?php endif; ?>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-header">应用详情</div>
            <div class="panel-body"><?= $model['content'] ?></div>
        </div>
    <?php else : ?>
        <script>
            $.alert({
                content: '<?=$res['msg']?>',
                confirm: function () {
                    window.history.back();
                }
            });
        </script>
    <?php endif; ?>
<?php else : ?>
    <script>
        $.alert({
            content: '系统出错',
            confirm: function () {
                window.history.back();
            }
        });
    </script>
<?php endif; ?>
<script>
    $(function () {
        $('[data-toggle="popover"]').popover()
    });

    $(document).on("click", ".buy-plugin", function () {
        var id = $(this).attr("data-id");
        var url = "<?=$urlManager->createUrl(['mch/plugin/buy'])?>";
        $.confirm({
            content: "确认购买插件？",
            confirm: function () {
                $.loading();
                $.ajax({
                    url: url,
                    type: "post",
                    dataType: "json",
                    data: {
                        _csrf: _csrf,
                        plugin_id: id,
                    },
                    success: function (res) {
                        $.loadingHide();
                        $.alert({
                            content: res.msg,
                            confirm: function () {
                                location.reload();
                            }
                        });
                    },
                });
            }
        });
    });

    $(document).on("click", ".pay-plugin", function () {
        var href = $(this).attr("href");
        $.loading({});
        $.ajax({
            url: href,
            dataType: "json",
            success: function (res) {
                $.loadingHide();
                $.alert({
                    content: res.msg,
                    confirm: function () {
                        location.reload();
                    }
                });
            }
        });
        return false;
    });


    $(document).on("click", ".install-plugin", function () {
        var id = $(this).attr("data-id");
        var url = "<?=$urlManager->createUrl(['mch/plugin/install'])?>";
        $.confirm({
            content: "确认安装插件？",
            confirm: function () {
                $.loading({
                    title: "正在安装",
                });
                $.ajax({
                    url: url,
                    dataType: "json",
                    data: {
                        _csrf: _csrf,
                        plugin_id: id,
                    },
                    success: function (res) {
                        $.loadingHide();
                        $.alert({
                            content: res.msg,
                            confirm: function () {
                                location.reload();
                            }
                        });
                    },
                });
            }
        });
    });
</script>
