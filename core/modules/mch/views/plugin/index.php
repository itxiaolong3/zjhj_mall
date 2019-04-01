<?php
defined('YII_ENV') or exit('Access Denied');
/**
 * Created by IntelliJ IDEA.
 * User: luwei
 * Date: 2017/6/19
 * Time: 16:52
 */
$urlManager = Yii::$app->urlManager;
$this->title = '安装应用';
$this->params['active_nav_group'] = 10;
?>
<style>
    /*    .plugin-list {
            margin-left: -.75rem;
        }

        .plugin-item {
            display: inline-block;
            border: 1px solid rgba(0, 0, 0, .1);
            border-radius: .15rem;
            background: #fff;
            margin-left: .75rem;
            margin-bottom: .75rem;
        }

        .plugin-item .plugin-pic {
            background-size: cover;
            background-position: center;
            width: 10rem;
            height: 10rem;
            background-color: #f6f6f6;
        }

        .plugin-item .plugin-name {
            text-align: center;
            margin: .5rem 0;
            font-weight: bold;
        }

        .plugin-item .plugin-detail {
            margin: .5rem 0;
            padding: 0 .5rem;
        }

        .plugin-item .plugin-price {
            color: #ff4544;
            font-weight: bold;
        }*/

    .plugin-list {
        margin-left: -1rem;
    }

    .plugin-item {
        display: inline-block;
        text-decoration: none;
        color: inherit;
        border: 1px solid #eee;
        padding: 1rem;
        margin-left: 1rem;
    }

    .plugin-item:hover {
        text-decoration: none;
        color: inherit;
        border-color: #7cc5e6;
    }

    .plugin-item .plugin-pic {
        display: inline-block;
        width: 60px;
        height: 60px;
        border-radius: 8px;
        vertical-align: top;
    }

    .plugin-item .plugin-name {
        display: inline-block;
        width: 140px;
        height: 60px;
        vertical-align: top;
        padding: 2px 0 2px 5px;
    }

    .topic-item {
        border-radius: 0;
    }
</style>
<?php if (is_array($topic) && count($topic) > 0) : ?>
    <?php foreach ($topic as $item) : ?>
        <?php if (time() >= $item['show_time']['begin'] && time() <= $item['show_time']['end']) : ?>
            <div class="alert alert-info topic-item">
                <div><?= $item['title'] ?></div>
                <div><?= $item['content'] ?></div>
            </div>
        <?php endif; ?>
    <?php endforeach; ?>
<?php endif; ?>
<div class="panel">
    <div class="panel-body">
        <div class="p-3">
            <div class="mb-3">应用列表</div>
            <div class="plugin-list">
                <?php foreach ($list as $item) : ?>
                    <a class="plugin-item"
                       href="<?= $urlManager->createUrl(['mch/plugin/detail', 'id' => $item['id']]) ?>">
                        <img class="plugin-pic" src="<?= $item['pic_url'] ?>">
                        <span class="plugin-name"><?= $item['display_name'] ?></span>
                    </a>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
</div>