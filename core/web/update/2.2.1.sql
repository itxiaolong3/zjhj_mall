/* 2018-03-07 */
CREATE TABLE `hjmall_ms_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '商品名称',
  `original_price` decimal(10,2) unsigned NOT NULL COMMENT '原价',
  `detail` longtext CHARACTER SET utf8 NOT NULL COMMENT '商品详情，图文',
  `status` smallint(6) unsigned NOT NULL DEFAULT '2' COMMENT '上架状态【1=> 上架，2=> 下架】',
  `service` varchar(2000) CHARACTER SET utf8 NOT NULL COMMENT '服务选项',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '商品排序 升序',
  `virtual_sales` int(11) unsigned DEFAULT '0' COMMENT '虚拟销量',
  `cover_pic` longtext CHARACTER SET utf8 COMMENT '商品缩略图',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_delete` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `sales` int(11) unsigned NOT NULL COMMENT '实际销量',
  `store_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/* 2018-03-08 */
ALTER TABLE `hjmall_ms_goods`
  ADD COLUMN `video_url`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '视频' AFTER `store_id`,
  ADD COLUMN `unit`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '件' COMMENT '单位' AFTER `video_url`,
  ADD COLUMN `weight`  double(10,2) UNSIGNED NULL DEFAULT 0.00 COMMENT '重量' AFTER `unit`,
  ADD COLUMN `freight`  int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '运费模板ID' AFTER `weight`,
  ADD COLUMN `full_cut`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '满减' AFTER `freight`,
  ADD COLUMN `integral`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '积分设置' AFTER `full_cut`,
  ADD COLUMN `use_attr`  smallint(1) NOT NULL DEFAULT 1 COMMENT '是否使用规格：0=不使用，1=使用' AFTER `integral`;
ALTER TABLE `hjmall_ms_goods`
  ADD COLUMN `attr`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规格的库存及价格' AFTER `use_attr`;
ALTER TABLE `hjmall_ms_goods`
  MODIFY COLUMN `service`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '服务选项' AFTER `status`;
ALTER TABLE `hjmall_ms_goods`
  MODIFY COLUMN `sales`  int(11) UNSIGNED NULL COMMENT '实际销量' AFTER `is_delete`;
ALTER TABLE `hjmall_miaosha_goods`
  ADD COLUMN `buy_limit`  int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '限单' AFTER `buy_max`;
/* 2018-03-14 */
CREATE TABLE `hjmall_ms_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `order_no` varchar(255) NOT NULL COMMENT '订单号',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总费用(包含运费）',
  `pay_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际支付总费用(含运费）',
  `express_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `name` varchar(255) DEFAULT NULL COMMENT '收货人姓名',
  `mobile` varchar(255) DEFAULT NULL COMMENT '收货人手机',
  `address` varchar(1000) DEFAULT NULL COMMENT '收货地址',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '订单备注',
  `is_pay` smallint(6) NOT NULL DEFAULT '0' COMMENT '支付状态：0=未支付，1=已支付',
  `pay_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '支付方式：1=微信支付 2--货到付款',
  `pay_time` int(11) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `is_send` smallint(1) NOT NULL DEFAULT '0' COMMENT '发货状态：0=未发货，1=已发货',
  `send_time` int(11) NOT NULL DEFAULT '0' COMMENT '发货时间',
  `express` varchar(255) NOT NULL DEFAULT '' COMMENT '物流公司',
  `express_no` varchar(255) NOT NULL DEFAULT '',
  `is_confirm` smallint(1) NOT NULL DEFAULT '0' COMMENT '确认收货状态：0=未确认，1=已确认收货',
  `confirm_time` int(11) NOT NULL DEFAULT '0' COMMENT '确认收货时间',
  `is_comment` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否已评价：0=未评价，1=已评价',
  `apply_delete` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否申请取消订单：0=否，1=申请取消订单',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `is_price` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否发放佣金',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户上级ID',
  `first_price` decimal(10,2) NOT NULL COMMENT '一级佣金',
  `second_price` decimal(10,2) NOT NULL COMMENT '二级佣金',
  `third_price` decimal(10,2) NOT NULL COMMENT '三级佣金',
  `coupon_sub_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠券抵消金额',
  `address_data` longtext COMMENT '收货地址信息，json格式',
  `content` longtext,
  `is_offline` int(11) NOT NULL DEFAULT '0' COMMENT '是否到店自提 0--否 1--是',
  `clerk_id` int(11) DEFAULT NULL COMMENT '核销员user_id',
  `is_cancel` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否取消',
  `offline_qrcode` longtext COMMENT '核销码',
  `before_update_price` decimal(10,2) DEFAULT NULL COMMENT '修改前的价格',
  `shop_id` int(11) DEFAULT NULL COMMENT '自提门店ID',
  `discount` decimal(11,2) DEFAULT NULL COMMENT '会员折扣',
  `user_coupon_id` int(11) DEFAULT NULL COMMENT '使用的优惠券ID',
  `integral` longtext CHARACTER SET utf8 COMMENT '积分使用',
  `give_integral` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否发放积分【1=> 已发放 ， 0=> 未发放】',
  `parent_id_1` int(11) DEFAULT NULL COMMENT '用户上二级ID',
  `parent_id_2` int(11) DEFAULT NULL COMMENT '用户上三级ID',
  `is_sale` int(11) DEFAULT '0' COMMENT '是否超过售后时间',
  `words` longtext COMMENT '商家留言',
  `express_price_1` decimal(10,2) DEFAULT NULL COMMENT '减免的运费',
  `goods_id` int(11) NOT NULL,
  `attr` longtext NOT NULL COMMENT '商品规格',
  `pic` varchar(255) NOT NULL COMMENT '商品规格图片',
  `integral_amount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '单品积分获得',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/* 2018-03-16 */
CREATE TABLE `hjmall_ms_order_refund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_refund_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '退款单号',
  `type` smallint(6) NOT NULL DEFAULT '1' COMMENT '售后类型：1=退货退款，2=换货',
  `refund_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `desc` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '退款说明',
  `pic_list` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '凭证图片列表：json格式',
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '状态：0=待商家处理，1=同意并已退款，2=已同意换货，3=已拒绝退换货',
  `refuse_desc` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '拒绝退换货原因',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `response_time` int(11) NOT NULL DEFAULT '0' COMMENT '商家处理时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
ALTER TABLE `hjmall_ms_order`
  ADD COLUMN `num`  int(11) NOT NULL DEFAULT 1 COMMENT '商品数量' AFTER `integral_amount`;
CREATE TABLE `hjmall_ms_setting` (
  `store_id` int(11) unsigned NOT NULL,
  `unpaid` int(2) unsigned NOT NULL DEFAULT '1' COMMENT '未付款自动取消时间',
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
ALTER TABLE `hjmall_ms_order`
  ADD COLUMN `limit_time`  int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '可支付截止时间' AFTER `num`;

/* 2018-03-19 */
ALTER TABLE `hjmall_ms_goods`
  ADD COLUMN `is_discount`  smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否支持会员折扣' AFTER `attr`,
  ADD COLUMN `coupon`  smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否支持优惠劵' AFTER `is_discount`;
