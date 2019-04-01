<?php

namespace app\modules\mch\controllers;

use app\hejiang\Cloud;
use app\hejiang\CloudPlugin;
use yii\helpers\VarDumper;

class PluginController extends Controller
{
    public function actionIndex()
    {
        $data = CloudPlugin::getList();
        return $this->render('index', [
            'list' => $data['list'],
            'topic' => $data['topic'],
        ]);
    }

    public function actionBuy()
    {
        $plugin_id = \Yii::$app->request->post('plugin_id');
        return CloudPlugin::buy($plugin_id);
    }

    public function actionInstall()
    {
        $plugin_id = \Yii::$app->request->get('plugin_id');
        return CloudPlugin::install($plugin_id);
    }

    public function actionPay()
    {
        return CloudPlugin::pay(\Yii::$app->request->get('order_no'));
    }

    public function actionDetail($id)
    {
        $url = Cloud::$cloud_server_prefix . Cloud::$cloud_server_host . '/api/mall/plugin-detail';
        $curl = Cloud::apiGet($url, [
            'id' => $id,
        ]);
        $res = json_decode($curl->response, true);
        if ($res && $res['code'] == 0) {
            $plugin_list = CloudPlugin::getInstalledPluginList();
            $is_install = 0;
            foreach ($plugin_list as $plugin) {
                if ($plugin['name'] == $res['data']['name']) {
                    $is_install = 1;
                    break;
                }
            }
            $res['data']['is_install'] = $is_install;
        }

        return $this->render('detail', [
            'res' => $res,
            'plugin_list' => $plugin_list,
        ]);
    }
}
