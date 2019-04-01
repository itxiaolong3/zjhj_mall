<?php
/**
 * @copyright ©2018 浙江禾匠信息科技
 * @author Lu Wei
 * @link http://www.zjhejiang.com/
 * Created by IntelliJ IDEA
 * Date Time: 2018/7/6 19:07
 */


namespace app\modules\mch\models\wechatplatform;

use app\models\FormId;
use app\models\tplmsg\TplmsgSender;
use app\models\User;
use app\modules\mch\models\MchModel;

class SendMsgForm extends MchModel
{
    public $store_id;
    public $send_all;
    public $open_id_list;
    public $tpl;

    public function rules()
    {
        return [
            [['tpl'], 'required'],
            [['send_all'], 'safe'],
            [['tpl', 'open_id_list',], 'string'],
        ];
    }

    public function send()
    {
        if (!$this->validate()) {
            return $this->getErrorResponse();
        }
        if ($this->send_all == 1) {
            $this->open_id_list = $this->getAllOpenIdList();
        } else {
            $this->open_id_list = \Yii::$app->serializer->decode($this->open_id_list);
        }


        $this->tpl = \Yii::$app->serializer->decode($this->tpl);

        if (is_array($this->tpl['maps'])) {
            foreach ($this->tpl['maps'] as $k => $map) {
                $keyName = 'keyword' . ($k + 1);
                $tpl[$keyName] = [
                    'value' => $map['value'],
                    'color' => $map['color'] ? $map['color'] : '#000000',
                ];
            }
        }

        $data = [];
        foreach ($this->open_id_list as $item) {
            if ($item['form_id']) {

                $titleStyle = '';
                if ($this->tpl['title_style'] == 1) {
                    $titleStyle = 'keyword1.DATA';
                }

                $data[] = [
                    'emphasis_keyword' => $titleStyle,
                    'touser' => $item['wechat_open_id'],
                    'template_id' => $this->tpl['tpl_id'],
                    'form_id' => $item['form_id'],
                    'page' => $this->tpl['miniprogram']['pagepath'],
                    'data' => $tpl
                ];
            }
        }

//        $sender = new TplmsgSender($this->store_id);
        $error_list = [];
        $data_list = [];
        foreach ($data as $item) {
//            $data['touser'] = $item;
            $data_list[] = $data;
            $res = $this->tplSend($item);

            if ($res['code'] === 1) {
                $error_list[] = [
                    'msg' => $res['msg'],
                    'data' => $item,
                ];
            }
        }


        return [
            'code' => 0,
            'msg' => '发送成功。',
            'data' => [
                'count' => count($data),
                'error_count' => count($error_list),
                'error_list' => $error_list,
                //'data_list' => $data_list,
            ],
        ];
    }

    public function getAllOpenIdList()
    {
        $query = User::find()->where([
            'AND',
//            ['IS NOT', 'wechat_platform_open_id', null],
//            ['!=', 'wechat_platform_open_id', ''],
            ['is_delete' => 0,],
            ['store_id' => $this->store_id,],
        ]);
        $query->select('wechat_open_id');
        $list = $query->asArray()->all();
        $open_id_list = [];
        foreach ($list as $item) {
            $newItem['wechat_open_id'] = $item['wechat_open_id'];
            $formId = FormId::find()->where([
                'wechat_open_id' => $item['wechat_open_id'],
                'send_count' => 0,
                'store_id' => $this->getCurrentStoreId(),
                'type' => 'form_id'
            ])
                ->andWhere(['>', 'addtime', time() - (7 * 24 * 60 * 60)])
                ->select('form_id')->one();
            $newItem['form_id'] = $formId->form_id;
            $open_id_list[] = $newItem;
        }
        return $open_id_list;
    }

    public function tplSend($data)
    {
        $newData = $data;
        $access_token = $this->wechat->getAccessToken();
        $api = "https://api.weixin.qq.com/cgi-bin/message/wxopen/template/send?access_token={$access_token}";
        $data = json_encode($data, JSON_UNESCAPED_UNICODE);
        $this->wechat->curl->post($api, $data);
        $res = json_decode($this->wechat->curl->response, true);


        $form = FormId::find()->where(['form_id' => $newData['form_id']])->one();
        $form->send_count = $form->send_count + 1;
        $form->save();
        
        if (!empty($res['errcode']) && $res['errcode'] != 0) {
            \Yii::warning("模板消息发送失败：\r\ndata=>{$data}\r\nresponse=>" . json_encode($res, JSON_UNESCAPED_UNICODE));
            return [
                'code' => 1,
                'msg' => "模板消息发送失败：\r\ndata=>{$data}\r\nresponse=>" . json_encode($res, JSON_UNESCAPED_UNICODE),
            ];
        }
    }
}
