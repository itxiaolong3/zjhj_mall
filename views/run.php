<?php
/**
 * Created by IntelliJ IDEA.
 * User: luwei
 * Date: 2017/8/2
 * Time: 10:01
 */
defined('IN_IA') or exit('Access Denied');
?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0">
    <title>禾匠商城</title>
    <link href="//cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            max-width: 600px;
            margin: 100px auto;
            border: 1px solid #ccc;
        }
    </style>
    <script src="//cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<?php if (!$is_admin): ?>
    <div class="container">
        <h3 style="text-align: center">模块初始化</h3>
        <hr>
        <div style="padding: 20px;text-align: center">
            <div class="alert alert-danger" role="alert">您不是管理员，请使用管理员账号登录以完成初始化操作！</div>
        </div>
    </div>
<?php else: ?>
    <div class="container">
        <h3 style="text-align: center">模块初始化</h3>
        <hr>
        <div style="padding: 20px;text-align: center">
            <div class="text-warning">初始化过程将花费几分钟的时间，<b>初始化过程请不要关闭或刷新页面！</b></div>
            <div class="progress">
                <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuemin="0"
                     aria-valuemax="100">
                </div>
            </div>
            <div class="alert alert-danger" style="display: none" role="alert"></div>
            <div class="alert alert-success" style="display: none" role="alert"></div>
            <a class="btn btn-primary run-btn" data-loading-text="正在初始化">初始化</a>
        </div>
    </div>
    <script>
        $(document).on("click", ".run-btn", function () {

            window.onbeforeunload = function () {
                return "系统初始化还没完成，确认关闭页面？";
            };

            var btn = $(this);
            btn.button('loading');
            var error = $(".alert-danger");
            var success = $(".alert-success");
            var progress_bar = $(".progress-bar");

            progress_bar.css("width", "0%");
            progress_bar.text("0%");
            error.hide();
            success.hide();


            var init_width = 5;
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
            $.ajax({
                type: "post",
                dataType: "json",
                timeout: 60 * 30 * 1000,
                success: function (res) {
                    clearInterval(timer);
                    window.onbeforeunload = null;
                    if (res.code == 1) {
                        error.html(res.msg).show();
                    }
                    if (res.code == 0) {
                        success.html(res.msg).show();
                        progress_bar.css("width", "100%");
                        progress_bar.text("100%");
                    }
                }
            });
        });
    </script>
<?php endif; ?>
</body>
</html>