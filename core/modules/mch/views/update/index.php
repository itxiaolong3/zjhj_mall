<?php
defined('YII_ENV') or exit('Access Denied');

use yii\widgets\LinkPager;

$urlManager = Yii::$app->urlManager;
$this->title = '系统更新';
$this->params['active_nav_group'] = 1;
?>
<style>
    .alert {
        border-radius: .15rem;
    }

    .alert-primary {
        color: #004085;
        background-color: #cce5ff;
        border-color: #b8daff;
    }

    .alert-secondary {
        color: #464a4e;
        background-color: #e7e8ea;
        border-color: #dddfe2;
    }

    .alert-success {
        color: #155724;
        background-color: #d4edda;
        border-color: #c3e6cb;
    }

    .alert-dark {
        color: #1b1e21;
        background-color: #d6d8d9;
        border-color: #c6c8ca;
    }
</style>
<div class="panel mb-3">
    <div class="panel-header"><?= $this->title ?></div>
    <div class="panel-body">
        <div class="alert alert-dark p-3" role="alert">当前系统版本：<b>v<?= $res['data']['current_version'] ?></b></div>

        <?php if ($res['data']['next_version']) : ?>
            <div class="alert alert-secondary p-3" role="alert">
                <div class="mb-3">下一版本：<b>v<?= $res['data']['next_version']['version'] ?></b></div>
                <div class="mb-3">发布时间：<b><?= $res['data']['next_version']['update_datetime'] ?></b></div>
                <div>
                    <div>更新内容：</div>
                    <div><?= $res['data']['next_version']['desc'] ?></div>
                </div>
                <hr>
                <div class="mt-3">
                    <div class="progress mb-3">
                        <div class="progress-bar progress-bar-striped progress-bar-animated"
                             role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 0%">0%
                        </div>
                    </div>
                    <div class="text-danger mb-3">更新过程请勿关闭或刷新页面</div>
                    <div class="alert alert-danger update-error mb-3" style="display: none" role="alert">11</div>
                    <div class="alert alert-success update-success mb-3" style="display: none" role="alert">22</div>
                </div>
                <a class="btn btn-primary btn-sm update-btn" href="javascript:">立即更新</a>

            </div>
        <?php else : ?>
            <div class="alert alert-secondary p-3">已经更新到最新版</div>
        <?php endif; ?>
    </div>
</div>

<div><b>更新记录</b></div>
<div class="version-list">
    <?php
    $_list = $res['data']['version_list'];
    rsort($_list);
    ?>

    <?php foreach ($_list as $item) : ?>
        <hr>
        <div>
            <div>版本：v<?= $item['version'] ?></div>
            <div>时间：<?= $item['datetime'] ?></div>
            <div>内容：<br><?= $item['desc'] ?></div>
        </div>
    <?php endforeach; ?>
</div>

<script>
    $(document).on("click", ".update-btn", function () {
        if (!confirm('警告：更新前请确认您已做好了相关数据备份！点击确定开始更新系统'))
            return;
        window.onbeforeunload = function () {
            return "系统更新还没完成，确认关闭页面？";
        };
        var btn = $(this);
        var error = $(".update-error");
        var success = $(".update-success");
        var progress_bar = $(".progress-bar");

        progress_bar.css("width", "0%");
        progress_bar.text("0%");
        error.hide();
        success.hide();


        var init_width = 1;
        progress_bar.css("width", init_width + "%");
        progress_bar.text(init_width + "%");
        var timer = setInterval(function () {
            if (init_width >= 90) {
                clearInterval(timer);
                return;
            }
            init_width++;
            progress_bar.css("width", init_width + "%");
            progress_bar.text(init_width + "%");
        }, 1000);
        btn.btnLoading("正在更新");
        $.ajax({
            url: "<?=$urlManager->createUrl(['mch/update/update'])?>",
            type: "post",
            dataType: "json",
            timeout: 60 * 30 * 1000,
            data: {
                target_version: "<?= $res['data']['next_version']['version'] ?>",
                _csrf: _csrf
            },
            success: function (res) {
                clearInterval(timer);
                window.onbeforeunload = null;
                if (res.code == 0) {
                    progress_bar.css("width", "100%");
                    progress_bar.text("100%");
                    success.html(res.msg).show();
                    btn.hide();
                    $.myAlert({
                        content: res.msg,
                        confirm: function () {
                            location.reload();
                        },

                    });
                }
                if (res.code == 1) {
                    error.html(res.msg).show();
                    btn.btnReset();
                }
            },
        });

    });
</script>