<?php

namespace app\modules\mch\controllers;

use app\models\User;
use app\modules\mch\models\goods\Taobaocsv;
use app\utils\Sms;

/**
 * Default controller for the `mch` module
 */
class DefaultController extends Controller
{

    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        return $this->redirect(\Yii::$app->urlManager->createUrl(['mch/store/index']))->send();
    }

    // 淘宝csv文件上传
    public function actionTaobaoCsv()
    {
        $form = new Taobaocsv();
        $form->attributes = \Yii::$app->request->post();
        $form->store_id = $this->store->id;dd($form->search());
        return $form->search();
    }
}
