<?php
/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2018 浙江禾匠信息科技有限公司
 * author: wxf
 */

namespace app\models\task\order;

use app\hejiang\task\TaskRunnable;
use app\models\ActionLog;
use app\models\common\CommonGoodsAttr;
use app\models\Goods;
use app\models\MiaoshaGoods;
use app\models\Model;
use app\models\MsGoods;
use app\models\MsOrder;
use app\models\Order;
use app\models\OrderDetail;
use app\models\PtGoods;
use app\models\PtOrder;
use app\models\PtOrderDetail;
use app\models\Register;
use app\models\Store;
use app\models\User;

class OrderAutoCancel extends TaskRunnable
{
    const STORE = 'STORE';
    const MS = 'MIAOSHA';
    const PT = 'PINTUAN';

    public $store;
    public $time;
    public $params = [];
    public $orderTypeName;

    public function run($params = [])
    {
        $this->store = Store::findOne($params['store_id']);
        $this->time = time();
        $this->params = $params;

        switch ($params['order_type']) {
            case self::STORE:
                $res = $this->storeOrder();
                $this->orderTypeName = '商城';
                break;

            case self::PT:
                $res = $this->ptOrder();
                $this->orderTypeName = '拼团';
                break;

            case self::MS:
                $res = $this->msOrder();
                $this->orderTypeName = '秒杀';
                break;

            default:
                $res = true;
                break;
        }

        return $res;
    }

    /**
     * 存储错误日志
     * @param $e
     * @return bool
     */
    public function saveActionLog($e)
    {
        // 记录错误信息
        $errorInfo = [
            'message' => $e->getMessage(),
            'file' => $e->getFile(),
            'trace' => $e->getTraceAsString(),
        ];

        $actionLog = new ActionLog();
        $actionLog->store_id = $this->params['store_id'];
        $actionLog->title = '定时任务';
        $actionLog->addtime = time();
        $actionLog->admin_name = '系统自身';
        $actionLog->admin_id = 0;
        $actionLog->admin_ip = '';
        $actionLog->route = '';

        $actionLog->action_type = $this->orderTypeName . '订单取消';
        $actionLog->obj_id = $this->params['order_id'];
        $actionLog->result = json_encode($errorInfo);
        $actionLog->save();

        return false;
    }

    /**
     * 商城订单自动取消
     * @return bool
     */
    public function storeOrder()
    {
        try {
            $transaction = \Yii::$app->db->beginTransaction();
            // 商城未支付订单取消时间(按小时)
            if ($this->store->over_day > 0) {
                $overDay = $this->time - ($this->store->over_day * 3600);
                $order = Order::find()->where([
                    'is_pay' => Order::IS_PAY_FALSE,
                    'id' => $this->params['order_id'],
                    'is_cancel' => Order::IS_CANCEL_FALSE,
                    'is_delete' => Model::IS_DELETE_FALSE,
                ])
                    ->andWhere(['<=', 'addtime', $overDay])
                    ->andWhere(['!=', 'pay_type', Order::PAY_TYPE_COD])
                    ->one();

                if (!$order) {
                    return false;
                }

                $integral = json_decode($order['integral'])->forehead_integral;
                $user = User::findOne(['id' => $order['user_id']]);
                $user->integral += $integral ? $integral : 0;

                if ($integral) {
                    $register = new Register();
                    $register->store_id = $this->store->id;
                    $register->user_id = $user->id;
                    $register->register_time = '..';
                    $register->addtime = time();
                    $register->continuation = 0;
                    $register->type = 6;
                    $register->integral = $integral;
                    $register->order_id = $order['id'];
                    $register->save();
                }
                $user->save();

                //库存恢复
                $order_detail_list = OrderDetail::find()->where(['order_id' => $order['id'], 'is_delete' => Model::IS_DELETE_FALSE])->all();
                foreach ($order_detail_list as $order_detail) {
                    $goods = Goods::findOne($order_detail->goods_id);
                    $attr_id_list = [];
                    foreach (json_decode($order_detail->attr) as $item) {
                        array_push($attr_id_list, $item->attr_id);
                    }

                    $goods->numAdd($attr_id_list, $order_detail->num);
                }

                // 订单超过设置的未支付时间，自动取消
                $order->is_cancel = Order::IS_CANCEL_TRUE;

                if ($order->save()) {
                    $transaction->commit();
                    return true;
                }

                $transaction->rollBack();
                return false;
            }
        } catch (\Exception $e) {
            $transaction->rollBack();
            $this->saveActionLog($e);
            return false;
        }
    }

    /**
     * 秒杀订单自动取消
     * @return bool
     */
    public function msOrder()
    {
        try {
            $transaction = \Yii::$app->db->beginTransaction();

            $order = MsOrder::find()->where([
                'AND',
                [
                    'id' => $this->params['order_id'],
                    'is_pay' => 0,
                    'is_cancel' => 0,
                    'is_delete' => Model::IS_DELETE_FALSE,
                ],
                ['<=', 'limit_time', time()],
                ['!=', 'pay_type', 2],
            ])->one();

            if (!$order) {
                return false;
            }


            //秒杀订单所属秒杀时间段库存恢复
            $miaosha_goods = MiaoshaGoods::findOne([
                'goods_id' => $order->goods_id,
                'start_time' => intval(date('H', $order->addtime)),
                'open_date' => date('Y-m-d', $order->addtime),
                'is_delete' => Model::IS_DELETE_FALSE
            ]);
            $attr_id_list = [];
            foreach (json_decode($order->attr) as $item) {
                array_push($attr_id_list, $item->attr_id);
            }

            $miaosha_goods->numAdd($attr_id_list, $order->num);
            //秒杀商品总库存恢复
            $goods = MsGoods::findOne($order->goods_id);
            $attr_id_list = [];
            foreach (json_decode($order->attr) as $item) {
                array_push($attr_id_list, $item->attr_id);
            }

            $goods->numAdd($attr_id_list, $order->num);

            $integral = json_decode($order->integral)->forehead_integral;
            if ($integral) {
                $user = User::findOne(['id' => $order->user_id]);
                $user->integral += $integral ? $integral : 0;
                $user->save();
                $register = new Register();
                $register->store_id = $this->store->id;
                $register->user_id = $user->id;
                $register->register_time = '..';
                $register->addtime = time();
                $register->continuation = 0;
                $register->type = 13;
                $register->integral = $integral;
                $register->order_id = $order->id;
                $register->save();
            }

            $order->is_cancel = 1;
            if ($order->save(false)) {
                $transaction->commit();
                return true;
            }

            $transaction->rollBack();
            return false;

        } catch (\Exception $e) {
            $transaction->rollBack();
            $this->saveActionLog($e);
            return false;
        }
    }

    public function ptOrder()
    {
        try {
            $transaction = \Yii::$app->db->beginTransaction();

            $overDay = $this->time - ($this->store->over_day * 3600);
            $order = PtOrder::find()->where([
                'AND',
                [
                    'id' => $this->params['order_id'],
                    'is_pay' => 0,
                    'is_cancel' => 0,
                    'is_delete' => Model::IS_DELETE_FALSE,
                ],
                ['<=', 'addtime', $overDay],
                ['!=', 'pay_type', 2],
            ])->one();

            if (!$order) {
                return false;
            }

            //库存恢复
            $order_detail_list = PtOrderDetail::find()->where(['order_id' => $order['id'], 'is_delete' => Model::IS_DELETE_FALSE])->all();
            foreach ($order_detail_list as $order_detail) {
                $attr_id_list = [];
                foreach (json_decode($order_detail->attr) as $item) {
                    array_push($attr_id_list, $item->attr_id);
                }

                $res = CommonGoodsAttr::num($attr_id_list, $order_detail->num, [
                    'good_type' => 'PINTUAN',
                    'good_id' => $order_detail->goods_id,
                    'action_type' => 'add'
                ]);

                if ($res['code'] === 1) {
                    return false;
                }
            }

            $order->is_cancel = 1;
            if ($order->save(false)) {
                $transaction->commit();
                return true;
            }

            $transaction->rollBack();
            return false;

        } catch (\Exception $e) {
            $transaction->rollBack();
            $this->saveActionLog($e);
            return false;
        }
    }

}