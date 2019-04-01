<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/9/22
 * Time: 17:06
 */

namespace app\modules\mch\models;

use app\models\Order;
use app\models\Shop;
use app\models\ShopPic;
use app\models\Store;
use app\models\UserCard;
use yii\data\Pagination;

/**
 * @property \app\models\Shop $shop
 */
class ShopForm extends MchModel
{
    public $store_id;
    public $shop;
    public $limit;

    public $name;
    public $mobile;
    public $address;
    public $longitude;
    public $latitude;
    public $score;
    public $cover_url;
    public $pic_url;
    public $content;
    public $shop_time;
    public $shop_pic;

    public function rules()
    {
        return [
            [['name', 'mobile', 'address', 'latitude', 'longitude'], 'required'],
            [['name', 'mobile', 'address', 'latitude', 'longitude', 'cover_url', 'pic_url', 'shop_time'], 'string', 'max' => 255],
            [['name', 'mobile', 'address', 'cover_url', 'pic_url', 'content', 'shop_time'], 'trim'],
            [['score'], 'integer', 'min' => 1, 'max' => 5],
            [['shop_pic'], 'safe'],
            [['content'], 'string']
        ];
    }

    public function attributeLabels()
    {
        return [
            'name' => '门店名称',
            'mobile' => '联系方式',
            'address' => '门店地址',
            'latitude' => '经纬度',
            'longitude' => '经纬度',
            'score' => '评分',
            'cover_url' => '门店大图',
            'pic_url' => '门店小图',
            'content' => '门店介绍',
            'shop_time' => '营业时间',
        ];
    }

    public function save()
    {
        if (!$this->validate()) {
            return $this->errorResponse;
        }
        $shop = $this->shop;
        if ($shop->isNewRecord) {
            $shop->is_delete = 0;
            $shop->addtime = time();
            $shop->store_id = $this->store_id;
        }
        $this->content = str_replace('&nbsp;', ' ', $this->content);
        $this->content = str_replace('&amp;nbsp;', ' ', $this->content);
        $shop->attributes = $this->attributes;
        if (is_array($this->shop_pic)) {
            $shop->cover_url = $this->shop_pic[0];
        }
        $shop->name = \yii\helpers\Html::encode($shop->name);
        $shop->shop_time = \yii\helpers\Html::encode($shop->shop_time);
        $shop->address = \yii\helpers\Html::encode($shop->address);
        if ($shop->save()) {
            ShopPic::updateAll(['is_delete' => 1], ['shop_id' => $shop->id]);
            foreach ($this->shop_pic as $pic_url) {
                $shop_pic = new ShopPic();
                $shop_pic->shop_id = $shop->id;
                $shop_pic->pic_url = $pic_url;
                $shop_pic->store_id = $shop->store_id;
                $shop_pic->is_delete = 0;
                $shop_pic->save();
            }
            return [
                'code' => 0,
                'msg' => '成功'
            ];
        } else {
            return [
                'code' => 1,
                'msg' => '网络异常'
            ];
        }
    }


    public function getList()
    {
        $query = Shop::find()->where(['is_delete' => 0, 'store_id' => $this->store_id]);
        $count = $query->count();
        $p = new Pagination(['totalCount' => $count, 'pageSize' => $this->limit]);
        $list = $query->offset($p->offset)->limit($p->limit)->asArray()->all();
        $store = Store::findOne(['id' => $this->store_id]);
        $time = time() - $store->after_sale_time * 86400;
        foreach ($list as $index => $value) {
            $order_count = Order::find()->where([
                'store_id' => $this->store_id, 'is_delete' => 0, 'shop_id' => $value['id'], 'is_cancel' => 0, 'is_recycle' => 0
            ])->count();
            $list[$index]['order_count'] = $order_count;
            $list[$index]['card_count'] = UserCard::find()->where([
                'store_id' => $this->store_id, 'is_delete' => 0, 'shop_id' => $value['id']
            ])->count();
        }
        return [
            'row_count' => $count,
            'pagination' => $p,
            'list' => $list
        ];
    }
}
