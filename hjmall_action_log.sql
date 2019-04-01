/*
Navicat MySQL Data Transfer

Source Server         : 公司数据库
Source Server Version : 50557
Source Host           : 39.106.26.3:3306
Source Database       : web

Target Server Type    : MYSQL
Target Server Version : 50557
File Encoding         : 65001

Date: 2019-04-01 09:25:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hjmall_action_log
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_action_log`;
CREATE TABLE `hjmall_action_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL DEFAULT '' COMMENT '操作记录描述',
  `addtime` int(11) NOT NULL COMMENT '记录时间',
  `admin_name` varchar(45) NOT NULL DEFAULT '' COMMENT '操作人姓名',
  `admin_id` int(11) NOT NULL COMMENT '操作人ID',
  `admin_ip` varchar(255) DEFAULT NULL COMMENT '操作人IP地址',
  `route` varchar(255) NOT NULL DEFAULT '' COMMENT '操作路由',
  `action_type` varchar(45) NOT NULL DEFAULT '' COMMENT '操作类型',
  `obj_id` int(11) NOT NULL COMMENT '操作数据ID',
  `result` text COMMENT '操作结果',
  `store_id` int(11) NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '日志类型:1.操作日志 2.定时任务日志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_ad
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_ad`;
CREATE TABLE `hjmall_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0关闭 1开启',
  `unit_id` varchar(255) NOT NULL DEFAULT '' COMMENT '广告id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '1抽奖首页',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_address
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_address`;
CREATE TABLE `hjmall_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `mobile` varchar(255) NOT NULL COMMENT '手机号',
  `province_id` int(11) NOT NULL DEFAULT '0',
  `province` varchar(255) NOT NULL COMMENT '省份名称',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `city` varchar(255) NOT NULL COMMENT '城市名称',
  `district_id` int(11) NOT NULL DEFAULT '0',
  `district` varchar(255) NOT NULL COMMENT '县区名称',
  `detail` varchar(1000) NOT NULL COMMENT '详细地址',
  `is_default` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否是默认地址：0=否，1=是',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_default` (`is_default`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户收货地址';

-- ----------------------------
-- Table structure for hjmall_admin
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_admin`;
CREATE TABLE `hjmall_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `auth_key` varchar(255) NOT NULL,
  `access_token` varchar(255) NOT NULL,
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(6) NOT NULL DEFAULT '0',
  `app_max_count` int(11) NOT NULL DEFAULT '0',
  `permission` longtext,
  `remark` varchar(255) NOT NULL DEFAULT '',
  `expire_time` int(11) NOT NULL DEFAULT '0' COMMENT '账户有效期至，0表示永久',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_admin_permission
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_admin_permission`;
CREATE TABLE `hjmall_admin_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `display_name` varchar(255) NOT NULL,
  `is_delete` smallint(6) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '1000',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_admin_register
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_admin_register`;
CREATE TABLE `hjmall_admin_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL COMMENT '帐户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `mobile` varchar(15) NOT NULL COMMENT '手机号',
  `name` varchar(255) NOT NULL COMMENT '姓名/企业名',
  `desc` varchar(1000) NOT NULL DEFAULT '' COMMENT '申请原因',
  `addtime` int(11) NOT NULL,
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '审核状态：0=待审核，1=通过，2=不通过',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_article
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_article`;
CREATE TABLE `hjmall_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `article_cat_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类id：1=关于我们，2=服务中心',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `content` longtext COMMENT '内容',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序：升序',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统文章';

-- ----------------------------
-- Table structure for hjmall_attr
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_attr`;
CREATE TABLE `hjmall_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attr_group_id` int(11) NOT NULL,
  `attr_name` varchar(255) NOT NULL,
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `is_default` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否是默认属性',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_default` (`is_default`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=966 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='商品规格';

-- ----------------------------
-- Table structure for hjmall_attr_group
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_attr_group`;
CREATE TABLE `hjmall_attr_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `attr_group_name` varchar(255) NOT NULL,
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='商品规格组';

-- ----------------------------
-- Table structure for hjmall_auth_role
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_auth_role`;
CREATE TABLE `hjmall_auth_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `creator_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_auth_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_auth_role_permission`;
CREATE TABLE `hjmall_auth_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_auth_role_user
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_auth_role_user`;
CREATE TABLE `hjmall_auth_role_user` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_banner
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_banner`;
CREATE TABLE `hjmall_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL COMMENT '商城id',
  `pic_url` varchar(2048) DEFAULT NULL,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `page_url` varchar(2048) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序，升序',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_delete` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0=未删除，1=已删除',
  `type` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型 【1=> 商城，2=> 拼团】',
  `open_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=333 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='商店幻灯片';

-- ----------------------------
-- Table structure for hjmall_bargain_goods
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_bargain_goods`;
CREATE TABLE `hjmall_bargain_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `min_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '最低价',
  `begin_time` int(11) NOT NULL DEFAULT '0' COMMENT '活动开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '活动结束时间',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '砍价小时数',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '砍价方式 0--按人数 1--按价格',
  `status_data` varchar(255) NOT NULL DEFAULT '' COMMENT '砍价方式数据',
  `is_delete` smallint(6) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_bargain_order
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_bargain_order`;
CREATE TABLE `hjmall_bargain_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `order_no` varchar(255) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `original_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品售价',
  `min_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品最低价',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '砍价时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0--进行中 1--成功 2--失败',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `attr` varchar(255) NOT NULL DEFAULT '',
  `status_data` varchar(255) NOT NULL DEFAULT '' COMMENT '砍价方式数据',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_bargain_setting
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_bargain_setting`;
CREATE TABLE `hjmall_bargain_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `is_print` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否打印 0--否 1--是',
  `is_share` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否参与分销 0--不参与 1--参与',
  `is_sms` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否发送短信 0--否 1--是',
  `is_mail` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否发送邮件 0--否 1--是',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '活动规则',
  `share_title` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_bargain_user_order
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_bargain_user_order`;
CREATE TABLE `hjmall_bargain_user_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_card
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_card`;
CREATE TABLE `hjmall_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '卡券名称',
  `pic_url` varchar(2048) DEFAULT NULL,
  `content` longtext COMMENT '卡券描述',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for hjmall_cart
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_cart`;
CREATE TABLE `hjmall_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `attr` longtext NOT NULL COMMENT '规格',
  `mch_id` int(11) NOT NULL DEFAULT '0' COMMENT '入驻商id',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='购物车';

-- ----------------------------
-- Table structure for hjmall_cash
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_cash`;
CREATE TABLE `hjmall_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '提现金额',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '申请状态 0--申请中 1--确认申请 2--已打款 3--驳回  5--余额通过',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `pay_time` int(11) NOT NULL COMMENT '付款',
  `type` smallint(1) NOT NULL DEFAULT '0' COMMENT '支付方式 0--微信支付  1--支付宝  2--银行卡  3--余额',
  `mobile` varchar(255) DEFAULT NULL COMMENT '支付宝账号',
  `name` varchar(255) DEFAULT NULL COMMENT '支付宝姓名',
  `bank_name` varchar(30) DEFAULT NULL COMMENT '开户行名称',
  `pay_type` int(11) DEFAULT '0' COMMENT '打款方式 0--之前未统计的 1--微信自动打款 2--手动打款',
  `order_no` varchar(255) DEFAULT NULL COMMENT '微信自动打款订单号',
  `service_charge` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '提现手续费',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='提现表';

-- ----------------------------
-- Table structure for hjmall_cat
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_cat`;
CREATE TABLE `hjmall_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL COMMENT '商城id',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级分类id',
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `pic_url` varchar(2048) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序，升序',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `big_pic_url` varchar(2048) DEFAULT NULL,
  `advert_pic` longtext COMMENT '广告图片',
  `advert_url` varchar(2048) DEFAULT NULL,
  `is_show` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示【1=> 显示，2=> 隐藏】',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_show` (`is_show`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1221 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='商品分类';

-- ----------------------------
-- Table structure for hjmall_color
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_color`;
CREATE TABLE `hjmall_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rgb` varchar(255) NOT NULL COMMENT 'rgb颜色码 例如："0，0，0"',
  `color` varchar(255) NOT NULL COMMENT '16进制颜色码例如：#ffffff',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='颜色库';

-- ----------------------------
-- Table structure for hjmall_coupon
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_coupon`;
CREATE TABLE `hjmall_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '优惠券名称',
  `desc` varchar(2000) NOT NULL DEFAULT '',
  `pic_url` varchar(2048) DEFAULT NULL,
  `discount_type` smallint(6) NOT NULL DEFAULT '1' COMMENT '优惠券类型：1=折扣，2=满减',
  `min_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '最低消费金额',
  `sub_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠金额',
  `discount` decimal(3,1) NOT NULL DEFAULT '10.0' COMMENT '折扣率',
  `expire_type` smallint(1) NOT NULL DEFAULT '1' COMMENT '到期类型：1=领取后N天过期，2=指定有效期',
  `expire_day` int(11) NOT NULL DEFAULT '0' COMMENT '有效天数，expire_type=1时',
  `begin_time` int(11) NOT NULL DEFAULT '0' COMMENT '有效期开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '有效期结束时间',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(6) NOT NULL DEFAULT '0',
  `total_count` int(11) NOT NULL DEFAULT '-1' COMMENT '发放总数量',
  `is_join` smallint(6) NOT NULL DEFAULT '1' COMMENT '是否加入领券中心 1--不加入领券中心 2--加入领券中心',
  `sort` int(11) DEFAULT '100' COMMENT '排序按升序排列',
  `cat_id_list` varchar(255) DEFAULT NULL,
  `appoint_type` tinyint(1) DEFAULT NULL,
  `is_integral` smallint(6) NOT NULL DEFAULT '1' COMMENT '是否加入积分商城 1--不加入 2--加入',
  `integral` int(11) NOT NULL DEFAULT '0' COMMENT '兑换需要积分数量',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '售价',
  `total_num` int(11) NOT NULL DEFAULT '0' COMMENT '积分商城发放总数',
  `user_num` int(11) NOT NULL DEFAULT '0' COMMENT '每人限制兑换数量',
  `rule` varchar(1000) DEFAULT '' COMMENT '使用说明',
  `goods_id_list` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_join` (`is_join`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='优惠券';

-- ----------------------------
-- Table structure for hjmall_coupon_auto_send
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_coupon_auto_send`;
CREATE TABLE `hjmall_coupon_auto_send` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `event` int(11) NOT NULL DEFAULT '1' COMMENT '触发事件：1=分享，2=购买并付款',
  `send_times` int(11) NOT NULL DEFAULT '1' COMMENT '最多发放次数，0表示不限制',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='优惠券自动发放';

-- ----------------------------
-- Table structure for hjmall_delivery
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_delivery`;
CREATE TABLE `hjmall_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `express_id` int(11) DEFAULT NULL COMMENT '快递公司id',
  `customer_name` varchar(255) DEFAULT NULL COMMENT '电子面单客户账号',
  `customer_pwd` varchar(255) DEFAULT NULL COMMENT '电子面单密码',
  `month_code` varchar(255) DEFAULT NULL COMMENT '月结编码',
  `send_site` varchar(255) DEFAULT NULL COMMENT '网点编码',
  `send_name` varchar(255) DEFAULT NULL COMMENT '网点名称',
  `is_delete` smallint(2) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_district
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_district`;
CREATE TABLE `hjmall_district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `citycode` varchar(255) NOT NULL,
  `adcode` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lng` varchar(255) NOT NULL COMMENT '经度',
  `lat` varchar(255) NOT NULL COMMENT '纬度',
  `level` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3264 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='高德行政区域数据';

-- ----------------------------
-- Table structure for hjmall_diy_page
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_diy_page`;
CREATE TABLE `hjmall_diy_page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `title` varchar(45) NOT NULL DEFAULT '' COMMENT '页面标题',
  `template_id` int(11) NOT NULL COMMENT '模板ID',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0--禁用 1--启用',
  `is_index` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否覆盖首页 0--不覆盖 1--覆盖',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_diy_template
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_diy_template`;
CREATE TABLE `hjmall_diy_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL DEFAULT '' COMMENT '模板名称',
  `template` longtext NOT NULL COMMENT '模板数据',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_express
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_express`;
CREATE TABLE `hjmall_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `code` varchar(255) NOT NULL DEFAULT '',
  `sort` int(11) NOT NULL DEFAULT '100',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '数据类型：kdniao=快递鸟',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='快递公司';

-- ----------------------------
-- Table structure for hjmall_favorite
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_favorite`;
CREATE TABLE `hjmall_favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `addtime` int(11) NOT NULL,
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='我喜欢的商品';

-- ----------------------------
-- Table structure for hjmall_file_group
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_file_group`;
CREATE TABLE `hjmall_file_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `is_default` int(11) DEFAULT '0' COMMENT '是否可编辑',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_default` (`is_default`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_form
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_form`;
CREATE TABLE `hjmall_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `required` int(11) DEFAULT NULL COMMENT '必填项',
  `default` varchar(255) DEFAULT NULL COMMENT '默认值',
  `tip` varchar(255) DEFAULT NULL COMMENT '提示语',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_form_id
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_form_id`;
CREATE TABLE `hjmall_form_id` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL COMMENT '店铺id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `wechat_open_id` varchar(255) NOT NULL DEFAULT '' COMMENT '微信openid',
  `form_id` varchar(255) NOT NULL DEFAULT '',
  `order_no` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '可选值：form_id或prepay_id',
  `send_count` int(11) NOT NULL DEFAULT '0' COMMENT '使用次数',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order_no` (`order_no`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=776 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='小程序form_id和prepay_id记录';

-- ----------------------------
-- Table structure for hjmall_free_delivery_rules
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_free_delivery_rules`;
CREATE TABLE `hjmall_free_delivery_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `city` longtext,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_fxhb_hongbao
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_fxhb_hongbao`;
CREATE TABLE `hjmall_fxhb_hongbao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_num` int(11) NOT NULL COMMENT '拆红包所需用户数,最少2人',
  `coupon_total_money` decimal(10,2) NOT NULL COMMENT '红包总金额',
  `coupon_money` decimal(10,2) NOT NULL COMMENT '分到的红包金额',
  `coupon_use_minimum` decimal(10,2) NOT NULL COMMENT '红包使用最低消费金额',
  `coupon_expire` int(11) NOT NULL DEFAULT '30' COMMENT '优惠券有效期，天',
  `distribute_type` tinyint(1) NOT NULL COMMENT '红包分配类型：0=随机，1=平分',
  `is_expire` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否已过期',
  `expire_time` int(11) NOT NULL COMMENT '到期时间',
  `is_finish` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已完成',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `form_id` varchar(255) NOT NULL DEFAULT '' COMMENT '小程序form_id',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_expire` (`is_expire`) USING BTREE,
  KEY `is_finish` (`is_finish`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_fxhb_setting
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_fxhb_setting`;
CREATE TABLE `hjmall_fxhb_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `user_num` int(11) NOT NULL DEFAULT '2' COMMENT '拆红包所需用户数,最少2人',
  `coupon_total_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '红包总金额',
  `coupon_use_minimum` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '赠送的优惠券最低消费金额',
  `coupon_expire` int(11) NOT NULL DEFAULT '30' COMMENT '红包优惠券有效期',
  `distribute_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '红包分配类型：0=随机，1=平分',
  `tpl_msg_id` varchar(255) NOT NULL DEFAULT '' COMMENT '红包到账通知模板消息id',
  `game_time` int(11) NOT NULL DEFAULT '24' COMMENT '每个红包有效期,单位：小时',
  `game_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启活动，0=不开启，1=开启',
  `rule` longtext COMMENT '规则',
  `share_pic` longtext,
  `share_title` longtext,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_goods
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_goods`;
CREATE TABLE `hjmall_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '售价',
  `original_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '原价（只做显示用）',
  `detail` longtext NOT NULL COMMENT '商品详情，图文',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品类别',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '上架状态：0=下架，1=上架',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `attr` longtext NOT NULL COMMENT '规格的库存及价格',
  `service` varchar(2000) NOT NULL DEFAULT '' COMMENT '商品服务选项',
  `sort` int(11) NOT NULL DEFAULT '1000' COMMENT '排序  升序',
  `virtual_sales` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟销量',
  `cover_pic` longtext COMMENT '商品缩略图',
  `video_url` varchar(2048) DEFAULT NULL,
  `unit` varchar(255) NOT NULL DEFAULT '件' COMMENT '单位',
  `individual_share` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否单独分销设置：0=否，1=是',
  `share_commission_first` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '一级分销佣金比例',
  `share_commission_second` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '二级分销佣金比例',
  `share_commission_third` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '三级分销佣金比例',
  `weight` double(10,2) unsigned DEFAULT '0.00' COMMENT '重量',
  `freight` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '运费模板ID',
  `full_cut` longtext COMMENT '满减',
  `integral` text COMMENT '积分设置',
  `use_attr` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否使用规格：0=不使用，1=使用',
  `share_type` int(11) DEFAULT '0' COMMENT '佣金配比 0--百分比 1--固定金额',
  `quick_purchase` smallint(1) DEFAULT NULL COMMENT '是否加入快速购买  0--关闭   1--开启',
  `hot_cakes` smallint(1) DEFAULT NULL COMMENT '是否加入热销  0--关闭   1--开启',
  `cost_price` decimal(10,2) DEFAULT '0.00',
  `member_discount` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否参与会员折扣  0=参与   1=不参与',
  `rebate` decimal(10,2) DEFAULT '0.00' COMMENT '自购返利',
  `mch_id` int(11) NOT NULL DEFAULT '0' COMMENT '入驻商户的id',
  `goods_num` int(11) NOT NULL DEFAULT '0' COMMENT '商品总库存',
  `mch_sort` int(11) NOT NULL DEFAULT '1000' COMMENT '多商户自己的排序',
  `confine_count` int(11) NOT NULL DEFAULT '0' COMMENT '购买限制:0.不限制|大于0等于限购数量',
  `is_level` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否享受会员折扣 0-不享受 1--享受',
  `type` smallint(1) NOT NULL DEFAULT '0' COMMENT '类型 0--商城或多商户 2--砍价商品',
  `is_negotiable` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否面议 0 不面议 1面议',
  `attr_setting_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分销设置类型 0.普通设置|1.详细设置',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE,
  KEY `cat_id` (`cat_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2912 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品';

-- ----------------------------
-- Table structure for hjmall_goods_card
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_goods_card`;
CREATE TABLE `hjmall_goods_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `card_id` int(11) DEFAULT NULL COMMENT '卡券id',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hjmall_goods_cat
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_goods_cat`;
CREATE TABLE `hjmall_goods_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL COMMENT '分类id',
  `addtime` int(11) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE,
  KEY `cat_id` (`cat_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2944 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_goods_pic
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_goods_pic`;
CREATE TABLE `hjmall_goods_pic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `pic_url` varchar(2048) DEFAULT NULL,
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9437 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_goods_share
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_goods_share`;
CREATE TABLE `hjmall_goods_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT '0' COMMENT '商品类型 0--拼团',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `individual_share` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否单独分销设置：0=否，1=是',
  `share_commission_first` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '一级分销佣金比例',
  `share_commission_second` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '二级分销佣金比例',
  `share_commission_third` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '三级分销佣金比例',
  `share_type` int(11) DEFAULT '0' COMMENT '佣金配比 0--百分比 1--固定金额',
  `rebate` decimal(10,2) DEFAULT '0.00' COMMENT '自购返利',
  `attr_setting_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分销设置类型 0.普通设置|1.详细设置',
  `relation_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联临时分销佣金ID，秒杀商品设置|拼团阶梯团',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_home_block
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_home_block`;
CREATE TABLE `hjmall_home_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `data` longtext,
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `style` int(11) DEFAULT '0' COMMENT '板块样式 0--默认样式 1--样式一 2--样式二 。。。',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=365 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='首页自定义版块';

-- ----------------------------
-- Table structure for hjmall_home_nav
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_home_nav`;
CREATE TABLE `hjmall_home_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '图标名称',
  `url` varchar(2048) DEFAULT NULL,
  `open_type` varchar(255) NOT NULL DEFAULT '' COMMENT '打开方式',
  `pic_url` varchar(2048) DEFAULT NULL,
  `addtime` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序，升序',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `is_hide` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否隐藏 0 显示 1隐藏 ',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=421 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='首页导航图标';

-- ----------------------------
-- Table structure for hjmall_in_order_comment
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_in_order_comment`;
CREATE TABLE `hjmall_in_order_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `score` decimal(10,1) NOT NULL COMMENT '评分：1=差评，2=中评，3=好',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '评价内容',
  `pic_list` longtext COMMENT '图片',
  `is_hide` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否隐藏：0=不隐藏，1=隐藏',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `reply_content` varchar(255) NOT NULL DEFAULT '0',
  `is_virtual` smallint(6) NOT NULL DEFAULT '0',
  `virtual_user` varchar(255) NOT NULL DEFAULT '0',
  `virtual_avatar` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_integral_cat
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_integral_cat`;
CREATE TABLE `hjmall_integral_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `is_delete` int(11) NOT NULL,
  `addtime` int(11) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '商品名称',
  `pic_url` longtext NOT NULL COMMENT '分类图片url',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序，升序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_integral_coupon_order
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_integral_coupon_order`;
CREATE TABLE `hjmall_integral_coupon_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `coupon_id` int(11) NOT NULL COMMENT '优惠券ID',
  `order_no` varchar(255) NOT NULL COMMENT '订单号',
  `is_pay` int(11) NOT NULL COMMENT '是否支付  0-未支付   1-支付 纯积分兑换',
  `pay_time` int(11) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `integral` int(11) NOT NULL DEFAULT '0' COMMENT '积分数量',
  `addtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_integral_goods
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_integral_goods`;
CREATE TABLE `hjmall_integral_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '售价',
  `original_price` decimal(10,2) NOT NULL COMMENT '原价（只做显示用）',
  `detail` longtext NOT NULL COMMENT '商品详情，图文',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品类别',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '上架状态：0=下架，1=上架',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `attr` longtext NOT NULL COMMENT '规格的库存及价格',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序  升序',
  `virtual_sales` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟销量',
  `cover_pic` longtext COMMENT '商品缩略图',
  `unit` varchar(255) NOT NULL DEFAULT '件' COMMENT '单位',
  `weight` double(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '重量',
  `freight` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '运费模板ID',
  `use_attr` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否使用规格：0=不使用，1=使用',
  `goods_num` int(11) NOT NULL DEFAULT '0' COMMENT '商品总库存',
  `integral` int(11) NOT NULL COMMENT '所需积分',
  `service` varchar(2000) NOT NULL DEFAULT '' COMMENT '商品服务选项',
  `cost_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_pic_list` longtext,
  `is_index` smallint(1) NOT NULL DEFAULT '0' COMMENT '放置首页：0=不放，1=放',
  `user_num` int(11) NOT NULL COMMENT '每人限制兑换数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_integral_log
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_integral_log`;
CREATE TABLE `hjmall_integral_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL COMMENT '用户id',
  `content` longtext NOT NULL COMMENT '描述',
  `integral` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `addtime` int(11) unsigned NOT NULL COMMENT '添加时间',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `operator` varchar(255) NOT NULL COMMENT '操作者',
  `store_id` int(11) unsigned NOT NULL,
  `operator_id` int(11) unsigned NOT NULL COMMENT '分销商id',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '数据类型 0--积分修改 1--余额修改',
  `pic_url` varchar(255) NOT NULL DEFAULT '',
  `explain` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hjmall_integral_order
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_integral_order`;
CREATE TABLE `hjmall_integral_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `order_no` varchar(255) NOT NULL COMMENT '订单号',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总费用(包含运费）',
  `pay_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际支付总费用(含运费）',
  `express_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `name` varchar(255) NOT NULL DEFAULT '0' COMMENT '收货人姓名',
  `mobile` varchar(255) NOT NULL DEFAULT '0' COMMENT '收货人手机',
  `address` varchar(1000) NOT NULL DEFAULT '0' COMMENT '收货地址',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '订单备注',
  `is_pay` smallint(6) NOT NULL DEFAULT '0' COMMENT '支付状态：0=未支付，1=已支付',
  `pay_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '支付方式：0--在线支付未支付 1=支付 ',
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
  `address_data` longtext COMMENT '收货地址信息，json格式',
  `is_offline` int(11) NOT NULL DEFAULT '0' COMMENT '是否到店自提 1--否 2--是',
  `clerk_id` int(11) NOT NULL DEFAULT '-1' COMMENT '核销员user_id',
  `is_cancel` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否取消',
  `offline_qrcode` longtext COMMENT '核销码',
  `shop_id` int(11) NOT NULL DEFAULT '-1' COMMENT '自提门店ID',
  `is_sale` int(11) NOT NULL DEFAULT '0' COMMENT '是否超过售后时间',
  `version` varchar(255) NOT NULL DEFAULT '0' COMMENT '版本',
  `mch_id` int(11) NOT NULL DEFAULT '0' COMMENT '入驻商户id',
  `integral` int(11) NOT NULL COMMENT '花费的积分',
  `goods_id` int(11) NOT NULL,
  `words` longtext COMMENT '商家留言',
  `is_recycle` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否加入回收站 0--不加入 1--加入',
  `is_show` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否显示 0--不显示 1--显示（软删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_integral_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_integral_order_detail`;
CREATE TABLE `hjmall_integral_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '此商品的总价',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `attr` longtext NOT NULL COMMENT '商品规格',
  `pic` varchar(255) NOT NULL COMMENT '商品规格图片',
  `pay_integral` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '积分花费',
  `goods_name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_integral_setting
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_integral_setting`;
CREATE TABLE `hjmall_integral_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `integral_shuoming` longtext NOT NULL COMMENT '积分说明',
  `register_rule` longtext NOT NULL COMMENT '签到规则',
  `register_integral` int(11) NOT NULL COMMENT '每日签到获得分数',
  `register_continuation` int(11) NOT NULL COMMENT '连续签到天数',
  `register_reward` varchar(255) NOT NULL COMMENT '连续签到奖励',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_level
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_level`;
CREATE TABLE `hjmall_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '等级名称',
  `money` decimal(10,2) DEFAULT NULL COMMENT '会员完成订单金额满足则升级',
  `discount` decimal(10,1) DEFAULT NULL COMMENT '折扣',
  `status` int(11) DEFAULT NULL COMMENT '状态 0--禁用 1--启用',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `image` longtext COMMENT '会员图片',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '会员价格',
  `detail` varchar(255) DEFAULT '' COMMENT '会员介绍',
  `buy_prompt` varchar(255) DEFAULT '' COMMENT '购买之前提示',
  `synopsis` longtext COMMENT '会员权益(禁用)',
  PRIMARY KEY (`id`),
  KEY `level` (`level`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员等级';

-- ----------------------------
-- Table structure for hjmall_level_order
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_level_order`;
CREATE TABLE `hjmall_level_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `order_no` varchar(255) DEFAULT NULL COMMENT '订单号',
  `user_id` int(11) DEFAULT NULL COMMENT '用户',
  `pay_price` decimal(10,2) DEFAULT NULL COMMENT '支付金额',
  `pay_type` int(11) DEFAULT '0' COMMENT '支付方式 1--微信支付',
  `is_pay` int(11) DEFAULT '0' COMMENT '是否支付 0--未支付 1--支付',
  `pay_time` int(11) DEFAULT NULL COMMENT '支付时间',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `current_level` int(11) DEFAULT NULL,
  `after_level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_pay` (`is_pay`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_lottery_goods
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_lottery_goods`;
CREATE TABLE `hjmall_lottery_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `attr` longtext NOT NULL COMMENT '规格',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '是否关闭',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0未完成 1已完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_lottery_log
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_lottery_log`;
CREATE TABLE `hjmall_lottery_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `lottery_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0待开奖 1未中奖 2中奖3已领取',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `attr` longtext NOT NULL,
  `raffle_time` int(11) NOT NULL DEFAULT '0' COMMENT '领取时间',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `obtain_time` int(11) DEFAULT '0',
  `form_id` varchar(255) NOT NULL DEFAULT '',
  `child_id` int(11) NOT NULL DEFAULT '0' COMMENT '下级用户',
  `lucky_code` varchar(255) NOT NULL DEFAULT '' COMMENT '幸运码',
  PRIMARY KEY (`id`),
  KEY `lottery_id` (`lottery_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_lottery_reserve
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_lottery_reserve`;
CREATE TABLE `hjmall_lottery_reserve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `lottery_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_lottery_setting
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_lottery_setting`;
CREATE TABLE `hjmall_lottery_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `rule` varchar(2000) NOT NULL DEFAULT '' COMMENT '规则',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '小程序标题',
  `type` int(10) DEFAULT '0' COMMENT '0不强制 1强制',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_mail_setting
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_mail_setting`;
CREATE TABLE `hjmall_mail_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `send_mail` longtext COMMENT '发件人邮箱',
  `send_pwd` varchar(255) DEFAULT NULL COMMENT '授权码',
  `send_name` varchar(255) DEFAULT NULL COMMENT '发件人名称',
  `receive_mail` longtext COMMENT '收件人邮箱 多个用英文逗号隔开',
  `status` int(11) DEFAULT NULL COMMENT '是否开启邮件通知 0--关闭 1--开启',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hjmall_mch
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_mch`;
CREATE TABLE `hjmall_mch` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `is_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否营业：0=否，1=是',
  `is_lock` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否被系统关闭：0=否，1=是',
  `review_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核状态：0=待审核，1=审核通过，2=审核不通过',
  `review_result` longtext COMMENT '审核结果',
  `review_time` int(11) NOT NULL DEFAULT '0' COMMENT '审核时间',
  `realname` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `province_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `mch_common_cat_id` int(11) NOT NULL COMMENT '所售类目',
  `service_tel` varchar(1000) NOT NULL COMMENT '客服电话',
  `logo` longtext COMMENT 'logo',
  `header_bg` longtext COMMENT '背景图',
  `transfer_rate` int(11) NOT NULL DEFAULT '0' COMMENT '商户手续费',
  `account_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商户余额',
  `sort` int(11) NOT NULL DEFAULT '1000' COMMENT '排序：升序',
  `wechat_name` varchar(255) DEFAULT '' COMMENT '微信号',
  `is_recommend` int(11) NOT NULL DEFAULT '1' COMMENT '好店推荐：0.不推荐|1.推荐',
  `longitude` varchar(255) NOT NULL DEFAULT '0' COMMENT '经度',
  `latitude` varchar(255) NOT NULL DEFAULT '0' COMMENT '纬度',
  `main_content` varchar(255) NOT NULL DEFAULT '' COMMENT '主营范围',
  `summary` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_open` (`is_open`) USING BTREE,
  KEY `is_lock` (`is_lock`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_mch_account_log
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_mch_account_log`;
CREATE TABLE `hjmall_mch_account_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL COMMENT '金额',
  `type` smallint(6) NOT NULL COMMENT '类型：1=收入，2=支出',
  `desc` longtext,
  `addtime` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_mch_cash
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_mch_cash`;
CREATE TABLE `hjmall_mch_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `order_no` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '提现状态：0=待处理，1=已转账，2=已拒绝',
  `addtime` int(11) NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT '0' COMMENT '提现类型 0--微信自动打款 1--微信线下打款 2--支付宝线下打款 3--银行卡线下打款 4--充值到余额',
  `type_data` varchar(255) NOT NULL DEFAULT '' COMMENT '不同提现类型，提交的数据',
  `virtual_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '实际上打款方式',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_mch_cat
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_mch_cat`;
CREATE TABLE `hjmall_mch_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '分类名称',
  `icon` longtext COMMENT '分类图标',
  `sort` int(11) NOT NULL DEFAULT '1000',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_mch_common_cat
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_mch_common_cat`;
CREATE TABLE `hjmall_mch_common_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '1000' COMMENT '排序，升序',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_mch_goods_cat
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_mch_goods_cat`;
CREATE TABLE `hjmall_mch_goods_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_mch_option
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_mch_option`;
CREATE TABLE `hjmall_mch_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `group` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_mch_plugin
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_mch_plugin`;
CREATE TABLE `hjmall_mch_plugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `is_share` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否开启分销 0--不开启 1--开启',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_mch_postage_rules
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_mch_postage_rules`;
CREATE TABLE `hjmall_mch_postage_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mch_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `express_id` int(11) NOT NULL COMMENT '物流公司',
  `detail` longtext NOT NULL COMMENT '规则详细',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_enable` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否启用：0=否，1=是',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `express` varchar(255) NOT NULL DEFAULT '' COMMENT '快递公司',
  `type` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '计费方式【1=>按重计费、2=>按件计费】',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_mch_setting
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_mch_setting`;
CREATE TABLE `hjmall_mch_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `is_share` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否开启分销 0--不开启 1--开启',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_mch_visit_log
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_mch_visit_log`;
CREATE TABLE `hjmall_mch_visit_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL,
  `addtime` int(11) NOT NULL,
  `visit_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=910 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_miaosha
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_miaosha`;
CREATE TABLE `hjmall_miaosha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `open_time` longtext COMMENT '开放时间，JSON格式',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_miaosha_goods
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_miaosha_goods`;
CREATE TABLE `hjmall_miaosha_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `start_time` smallint(6) NOT NULL COMMENT '开始时间：0~23',
  `open_date` date NOT NULL COMMENT '开放日期，例：2017-08-21',
  `attr` longtext NOT NULL COMMENT '规格秒杀价数量',
  `is_delete` smallint(6) NOT NULL DEFAULT '0',
  `buy_max` int(11) NOT NULL DEFAULT '0' COMMENT '限购数量，0=不限购',
  `buy_limit` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '限单',
  `is_level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否享受会员折扣 0-不享受 1--享受',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `start_time` (`start_time`) USING BTREE,
  KEY `open_date` (`open_date`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=75656 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_ms_goods
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_ms_goods`;
CREATE TABLE `hjmall_ms_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `original_price` decimal(10,2) unsigned NOT NULL COMMENT '原价',
  `detail` longtext NOT NULL COMMENT '商品详情，图文',
  `status` smallint(6) unsigned NOT NULL DEFAULT '2' COMMENT '上架状态【1=> 上架，2=> 下架】',
  `service` varchar(2000) DEFAULT NULL COMMENT '服务选项',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '商品排序 升序',
  `virtual_sales` int(11) unsigned DEFAULT '0' COMMENT '虚拟销量',
  `cover_pic` longtext COMMENT '商品缩略图',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_delete` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `sales` int(11) unsigned DEFAULT NULL COMMENT '实际销量',
  `store_id` int(11) unsigned NOT NULL,
  `video_url` varchar(2048) DEFAULT NULL,
  `unit` varchar(255) NOT NULL DEFAULT '件' COMMENT '单位',
  `weight` double(10,2) unsigned DEFAULT '0.00' COMMENT '重量',
  `freight` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '运费模板ID',
  `full_cut` longtext COMMENT '满减',
  `integral` text COMMENT '积分设置',
  `use_attr` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否使用规格：0=不使用，1=使用',
  `attr` longtext NOT NULL COMMENT '规格的库存及价格',
  `is_discount` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否支持会员折扣',
  `coupon` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否支持优惠劵',
  `payment` varchar(255) DEFAULT '' COMMENT '支付方式',
  `individual_share` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否单独分销设置：0=否，1=是',
  `share_commission_first` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '一级分销佣金比例',
  `share_commission_second` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '二级分销佣金比例',
  `share_commission_third` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '三级分销佣金比例',
  `share_type` int(11) DEFAULT '0' COMMENT '佣金配比 0--百分比 1--固定金额',
  `rebate` decimal(10,2) DEFAULT '0.00' COMMENT '自购返利',
  `attr_setting_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分销设置类型 0.普通设置|1.详细设置',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_discount` (`is_discount`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_ms_goods_pic
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_ms_goods_pic`;
CREATE TABLE `hjmall_ms_goods_pic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `pic_url` varchar(2048) DEFAULT NULL,
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_ms_order
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_ms_order`;
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
  `integral` longtext COMMENT '积分使用',
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
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  `limit_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '可支付截止时间',
  `is_sum` smallint(1) DEFAULT '0' COMMENT '是否计算分销 0--不计算 1--计算',
  `rebate` decimal(10,2) DEFAULT '0.00' COMMENT '自购返利',
  `before_update_express` decimal(10,2) DEFAULT '0.00' COMMENT '价格修改前的运费',
  `is_recycle` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否在回收站 0--不在回收站 1--在回收站',
  `is_show` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否显示 0--不显示 1--显示（软删除用）',
  `seller_comments` mediumtext COMMENT '商家备注',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_pay` (`is_pay`) USING BTREE,
  KEY `is_send` (`is_send`) USING BTREE,
  KEY `is_confirm` (`is_confirm`) USING BTREE,
  KEY `is_comment` (`is_comment`) USING BTREE,
  KEY `is_price` (`is_price`) USING BTREE,
  KEY `is_offline` (`is_offline`) USING BTREE,
  KEY `is_cancel` (`is_cancel`) USING BTREE,
  KEY `is_sale` (`is_sale`) USING BTREE,
  KEY `is_sum` (`is_sum`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_ms_order_comment
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_ms_order_comment`;
CREATE TABLE `hjmall_ms_order_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `score` decimal(10,1) NOT NULL COMMENT '评分：1=差评，2=中评，3=好',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '评价内容',
  `pic_list` longtext COMMENT '图片',
  `is_hide` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否隐藏：0=不隐藏，1=隐藏',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_hide` (`is_hide`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_ms_order_refund
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_ms_order_refund`;
CREATE TABLE `hjmall_ms_order_refund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_refund_no` varchar(255) NOT NULL DEFAULT '' COMMENT '退款单号',
  `type` smallint(6) NOT NULL DEFAULT '1' COMMENT '售后类型：1=退货退款，2=换货',
  `refund_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `desc` varchar(500) NOT NULL DEFAULT '' COMMENT '退款说明',
  `pic_list` longtext COMMENT '凭证图片列表：json格式',
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '状态：0=待商家处理，1=同意并已退款，2=已同意换货，3=已拒绝退换货',
  `refuse_desc` varchar(500) NOT NULL DEFAULT '' COMMENT '拒绝退换货原因',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `response_time` int(11) NOT NULL DEFAULT '0' COMMENT '商家处理时间',
  `is_agree` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否已同意退、换货：0=待处理，1=已同意，2=已拒绝',
  `is_user_send` smallint(1) NOT NULL DEFAULT '0' COMMENT '用户已发货：0=未发货，1=已发货',
  `user_send_express` varchar(32) NOT NULL DEFAULT '' COMMENT '用户发货快递公司',
  `user_send_express_no` varchar(32) NOT NULL DEFAULT '' COMMENT '用户发货快递单号',
  `address_id` int(11) DEFAULT '0' COMMENT '退货 换货地址id',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_ms_setting
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_ms_setting`;
CREATE TABLE `hjmall_ms_setting` (
  `store_id` int(11) unsigned NOT NULL,
  `unpaid` int(2) unsigned NOT NULL DEFAULT '1' COMMENT '未付款自动取消时间',
  `is_share` int(11) DEFAULT '0' COMMENT '是否开启分销 0--关闭 1--开启',
  `is_sms` int(11) DEFAULT '0' COMMENT '是否开启短信通知',
  `is_print` int(11) DEFAULT '0' COMMENT '是否开启订单打印',
  `is_mail` int(11) DEFAULT '0' COMMENT '是否开启邮件通知',
  `is_area` tinyint(1) DEFAULT NULL COMMENT '区域限制  1-开启 0-关闭',
  PRIMARY KEY (`store_id`),
  KEY `is_share` (`is_share`) USING BTREE,
  KEY `is_sms` (`is_sms`) USING BTREE,
  KEY `is_print` (`is_print`) USING BTREE,
  KEY `is_mail` (`is_mail`) USING BTREE,
  KEY `is_area` (`is_area`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_option
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_option`;
CREATE TABLE `hjmall_option` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `group` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE,
  KEY `group` (`group`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=574 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_order
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_order`;
CREATE TABLE `hjmall_order` (
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
  `pay_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '支付方式：1=微信支付',
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
  `content` longtext,
  `is_offline` int(11) NOT NULL DEFAULT '0' COMMENT '是否到店自提 0--否 1--是',
  `clerk_id` int(11) DEFAULT NULL COMMENT '核销员user_id',
  `address_data` longtext COMMENT '收货地址信息，json格式',
  `is_cancel` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否取消',
  `offline_qrcode` longtext COMMENT '核销码',
  `before_update_price` decimal(10,2) DEFAULT NULL COMMENT '修改前的价格',
  `shop_id` int(11) DEFAULT NULL COMMENT '自提门店ID',
  `discount` decimal(11,2) DEFAULT NULL COMMENT '会员折扣',
  `user_coupon_id` int(11) DEFAULT NULL COMMENT '使用的优惠券ID',
  `integral` longtext COMMENT '积分使用',
  `give_integral` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否发放积分【1=> 已发放 ， 0=> 未发放】',
  `parent_id_1` int(11) DEFAULT '0' COMMENT '用户上二级ID',
  `parent_id_2` int(11) DEFAULT '0' COMMENT '用户上三级ID',
  `is_sale` int(11) DEFAULT '0' COMMENT '是否超过售后时间',
  `words` longtext COMMENT '商家留言',
  `version` varchar(255) DEFAULT NULL COMMENT '版本',
  `express_price_1` decimal(10,2) DEFAULT NULL COMMENT '减免的运费',
  `is_recycle` smallint(1) DEFAULT '0',
  `rebate` decimal(10,2) DEFAULT '0.00' COMMENT '自购返利',
  `before_update_express` decimal(10,2) DEFAULT '0.00' COMMENT '价格修改前的运费',
  `seller_comments` text COMMENT '商家备注',
  `mch_id` int(11) NOT NULL DEFAULT '0' COMMENT '入驻商户id',
  `order_union_id` int(11) NOT NULL DEFAULT '0' COMMENT '合并订单的id',
  `is_transfer` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否已转入商户账户：0=否，1=是',
  `type` int(11) DEFAULT '0' COMMENT '0:普通订单 1大转盘订单',
  `share_price` decimal(11,2) DEFAULT '0.00' COMMENT '发放佣金的金额',
  `is_show` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否显示 0--不显示 1--显示',
  `currency` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '货币：活力币',
  PRIMARY KEY (`id`),
  KEY `addtime` (`addtime`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `order_no` (`order_no`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_pay` (`is_pay`) USING BTREE,
  KEY `is_send` (`is_send`) USING BTREE,
  KEY `is_confirm` (`is_confirm`) USING BTREE,
  KEY `is_comment` (`is_comment`) USING BTREE,
  KEY `is_price` (`is_price`) USING BTREE,
  KEY `is_offline` (`is_offline`) USING BTREE,
  KEY `is_cancel` (`is_cancel`) USING BTREE,
  KEY `is_sale` (`is_sale`) USING BTREE,
  KEY `is_recycle` (`is_recycle`) USING BTREE,
  KEY `is_transfer` (`is_transfer`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=523 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='订单表';

-- ----------------------------
-- Table structure for hjmall_order_ad
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_order_ad`;
CREATE TABLE `hjmall_order_ad` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号',
  `address` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_order_comment
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_order_comment`;
CREATE TABLE `hjmall_order_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `score` decimal(10,1) NOT NULL COMMENT '评分：1=差评，2=中评，3=好',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '评价内容',
  `pic_list` longtext COMMENT '图片',
  `is_hide` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否隐藏：0=不隐藏，1=隐藏',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `reply_content` varchar(255) DEFAULT NULL,
  `is_virtual` smallint(6) DEFAULT NULL,
  `virtual_user` varchar(255) DEFAULT NULL,
  `virtual_avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_hide` (`is_hide`) USING BTREE,
  KEY `is_virtual` (`is_virtual`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='订单评价';

-- ----------------------------
-- Table structure for hjmall_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_order_detail`;
CREATE TABLE `hjmall_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '此商品的总价',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `attr` longtext NOT NULL COMMENT '商品规格',
  `pic` varchar(255) NOT NULL COMMENT '商品规格图片',
  `integral` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '单品积分获得',
  `is_level` smallint(6) NOT NULL DEFAULT '1' COMMENT '是否使用会员折扣 0--不适用 1--使用',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `addtime` (`addtime`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=524 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='订单明细';

-- ----------------------------
-- Table structure for hjmall_order_express
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_order_express`;
CREATE TABLE `hjmall_order_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_type` int(11) DEFAULT NULL COMMENT '订单类型 0--商城订单 1--秒杀订单 2--拼团订单 ',
  `express_code` varchar(255) DEFAULT NULL COMMENT '快递公司编码',
  `EBusinessID` varchar(255) DEFAULT NULL COMMENT '快递鸟id',
  `order` longtext,
  `printTeplate` longtext,
  `is_delete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_order_form
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_order_form`;
CREATE TABLE `hjmall_order_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL COMMENT '表单key',
  `value` varchar(255) DEFAULT NULL COMMENT '表单value',
  `is_delete` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '表单信息类型',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_order_message
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_order_message`;
CREATE TABLE `hjmall_order_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL COMMENT '类型id 系统消息时为0',
  `is_read` int(11) DEFAULT NULL COMMENT '消息是否已读 0--未读 1--已读',
  `is_sound` int(11) DEFAULT NULL COMMENT '是否提示 0--未提示  1--已提示',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `type` smallint(1) DEFAULT '0' COMMENT '订单类型  0--已下订单   1--售后订单',
  `order_type` int(11) DEFAULT '0' COMMENT '订单类型 0--商城订单 1--秒杀订单 2--拼团订单 3--预约订单',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_read` (`is_read`) USING BTREE,
  KEY `is_sound` (`is_sound`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hjmall_order_non
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_order_non`;
CREATE TABLE `hjmall_order_non` (
  `id` int(11) NOT NULL DEFAULT '0',
  `order_no` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_order_refund
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_order_refund`;
CREATE TABLE `hjmall_order_refund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `order_refund_no` varchar(255) NOT NULL DEFAULT '' COMMENT '退款单号',
  `type` smallint(6) NOT NULL DEFAULT '1' COMMENT '售后类型：1=退货退款，2=换货',
  `refund_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `desc` varchar(500) NOT NULL DEFAULT '' COMMENT '退款说明',
  `pic_list` longtext COMMENT '凭证图片列表：json格式',
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '状态：0=待商家处理，1=同意并已退款，2=已同意换货，3=已拒绝退换货',
  `refuse_desc` varchar(500) NOT NULL DEFAULT '' COMMENT '拒绝退换货原因',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `response_time` int(11) NOT NULL DEFAULT '0' COMMENT '商家处理时间',
  `is_agree` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否已同意退、换货：0=待处理，1=已同意，2=已拒绝',
  `is_user_send` smallint(1) NOT NULL DEFAULT '0' COMMENT '用户已发货：0=未发货，1=已发货',
  `user_send_express` varchar(32) NOT NULL DEFAULT '' COMMENT '用户发货快递公司',
  `user_send_express_no` varchar(32) NOT NULL DEFAULT '' COMMENT '用户发货快递单号',
  `address_id` int(11) DEFAULT '0' COMMENT '退货 换货地址id',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='售后订单';

-- ----------------------------
-- Table structure for hjmall_order_share
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_order_share`;
CREATE TABLE `hjmall_order_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT '0' COMMENT '类型 0--拼团 1--预约',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `parent_id_1` int(11) DEFAULT '0' COMMENT '一级分销商id',
  `parent_id_2` int(11) DEFAULT '0' COMMENT '二级分销商id',
  `parent_id_3` int(11) DEFAULT '0' COMMENT '三级分销商id',
  `first_price` decimal(10,2) DEFAULT '0.00' COMMENT '一级分销佣金',
  `second_price` decimal(10,2) DEFAULT '0.00' COMMENT '二级分销佣金',
  `third_price` decimal(10,2) DEFAULT '0.00' COMMENT '三级分销佣金',
  `is_delete` int(11) DEFAULT '0',
  `version` varchar(255) DEFAULT '0',
  `rebate` decimal(10,2) DEFAULT '0.00' COMMENT '自购返利',
  `user_id` int(11) DEFAULT '0' COMMENT '下单用户id',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_order_union
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_order_union`;
CREATE TABLE `hjmall_order_union` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_no` varchar(255) NOT NULL COMMENT '支付单号',
  `order_id_list` longtext NOT NULL COMMENT '订单id列表',
  `price` decimal(10,2) NOT NULL COMMENT '支付金额',
  `is_pay` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否已付款0=未付款，1=已付款',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_pay` (`is_pay`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_pic
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_pic`;
CREATE TABLE `hjmall_pic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '0 步数海报',
  `type` int(11) NOT NULL,
  `pic_url` varchar(2048) DEFAULT '',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_plugin
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_plugin`;
CREATE TABLE `hjmall_plugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `display_name` varchar(255) NOT NULL DEFAULT '',
  `route` varchar(255) NOT NULL DEFAULT '',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hjmall_pond
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_pond`;
CREATE TABLE `hjmall_pond` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '1.红包2.优惠卷3.积分4.实物.5.无',
  `num` int(11) DEFAULT '0' COMMENT '积分数量',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '红包价格',
  `image_url` varchar(255) DEFAULT '' COMMENT '图片',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `orderby` int(11) DEFAULT '0' COMMENT '排序',
  `coupon_id` int(11) DEFAULT '0' COMMENT '优惠卷',
  `gift_id` int(11) DEFAULT '0' COMMENT '赠品',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `attr` varchar(255) DEFAULT '' COMMENT '规格',
  `name` varchar(255) DEFAULT '' COMMENT '别名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_pond_log
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_pond_log`;
CREATE TABLE `hjmall_pond_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `pond_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT ' 0未领取1 已领取',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `raffle_time` int(11) DEFAULT '0' COMMENT '领取时间',
  `type` int(11) NOT NULL DEFAULT '0',
  `num` int(11) DEFAULT '0',
  `gift_id` int(11) DEFAULT '0',
  `coupon_id` int(11) DEFAULT '0',
  `price` decimal(10,2) DEFAULT '0.00',
  `attr` varchar(255) DEFAULT '',
  `order_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_pond_setting
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_pond_setting`;
CREATE TABLE `hjmall_pond_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `probability` int(11) NOT NULL DEFAULT '0' COMMENT '概率',
  `oppty` int(11) NOT NULL DEFAULT '0' COMMENT '抽奖次数',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '1.天 2 用户',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `title` varchar(255) DEFAULT '' COMMENT '小程序标题',
  `rule` varchar(1000) DEFAULT '' COMMENT '规则',
  `deplete_register` int(11) DEFAULT '0' COMMENT '消耗积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_postage_rules
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_postage_rules`;
CREATE TABLE `hjmall_postage_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `express_id` int(11) NOT NULL COMMENT '物流公司',
  `detail` longtext NOT NULL COMMENT '规则详细',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_enable` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否启用：0=否，1=是',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `express` varchar(255) NOT NULL DEFAULT '' COMMENT '快递公司',
  `type` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '计费方式【1=>按重计费、2=>按件计费】',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='运费规则';

-- ----------------------------
-- Table structure for hjmall_printer
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_printer`;
CREATE TABLE `hjmall_printer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '打印机名称',
  `printer_type` varchar(255) DEFAULT NULL COMMENT '打印机类型',
  `printer_setting` longtext COMMENT '打印机设置',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='小票打印机';

-- ----------------------------
-- Table structure for hjmall_printer_setting
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_printer_setting`;
CREATE TABLE `hjmall_printer_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `printer_id` int(11) DEFAULT NULL COMMENT '打印机ID',
  `block_id` int(11) DEFAULT NULL COMMENT '打印模板ID',
  `type` longtext COMMENT '打印方式 ',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `is_attr` int(11) DEFAULT '0' COMMENT '是否打印规格 0--不打印 1--打印',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_attr` (`is_attr`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='打印设置';

-- ----------------------------
-- Table structure for hjmall_pt_cat
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_pt_cat`;
CREATE TABLE `hjmall_pt_cat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '标题名称',
  `store_id` int(11) unsigned NOT NULL COMMENT '商城ID',
  `pic_url` varchar(2048) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序 升序',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `is_delete` smallint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hjmall_pt_goods
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_pt_goods`;
CREATE TABLE `hjmall_pt_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `original_price` decimal(10,2) unsigned NOT NULL COMMENT '商品原价',
  `price` decimal(10,2) unsigned NOT NULL COMMENT '团购价',
  `detail` longtext NOT NULL COMMENT '商品详情，图文',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类',
  `status` smallint(6) unsigned NOT NULL DEFAULT '2' COMMENT '上架状态【1=> 上架，2=> 下架】',
  `grouptime` int(11) NOT NULL DEFAULT '0' COMMENT '拼团时间/小时',
  `attr` longtext NOT NULL COMMENT '规格的库存及价格',
  `service` varchar(2000) DEFAULT '' COMMENT '服务选项',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '商品排序 升序',
  `virtual_sales` int(11) unsigned DEFAULT '0' COMMENT '虚拟销量',
  `cover_pic` longtext COMMENT '商品缩略图',
  `weight` int(11) unsigned DEFAULT '0' COMMENT '重量',
  `freight` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '运费模板ID',
  `unit` varchar(255) NOT NULL DEFAULT '件' COMMENT '单位',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_delete` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `group_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品成团数',
  `is_hot` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否热卖【0=>热卖1=>不是】',
  `limit_time` int(11) unsigned DEFAULT NULL COMMENT '拼团限时',
  `is_only` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否允许单独购买',
  `is_more` smallint(1) unsigned DEFAULT '1' COMMENT '是否允许多件购买',
  `colonel` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '团长优惠',
  `buy_limit` int(11) unsigned DEFAULT '0' COMMENT '限购数量',
  `type` int(1) unsigned NOT NULL DEFAULT '1' COMMENT '商品类型【1=> 送货上门，2=> 到店自提，3=> 全部支持】',
  `use_attr` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否使用规格：0=不使用，1=使用',
  `one_buy_limit` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '单次限购数量',
  `payment` varchar(255) DEFAULT '' COMMENT '支付方式',
  `is_level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否享受会员折扣 0-不享受 1--享受',
  `video_url` varchar(255) DEFAULT NULL COMMENT '视频url',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_hot` (`is_hot`) USING BTREE,
  KEY `is_only` (`is_only`) USING BTREE,
  KEY `is_more` (`is_more`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hjmall_pt_goods_detail
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_pt_goods_detail`;
CREATE TABLE `hjmall_pt_goods_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `colonel` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '团长优惠',
  `group_num` int(11) unsigned DEFAULT '0' COMMENT '商品成团数',
  `group_time` int(11) DEFAULT NULL COMMENT '拼团时间/小时',
  `attr` longtext COMMENT '规格的库存及价格',
  `is_level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否享受会员折扣 0-不享受 1--享受',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_pt_goods_pic
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_pt_goods_pic`;
CREATE TABLE `hjmall_pt_goods_pic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `pic_url` varchar(2048) DEFAULT NULL,
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hjmall_pt_order
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_pt_order`;
CREATE TABLE `hjmall_pt_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
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
  `pay_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '支付方式：1=微信支付',
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
  `address_data` longtext COMMENT '收货地址信息，json格式',
  `is_group` smallint(1) unsigned NOT NULL COMMENT '是否团购',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '团ID【0=> 团长ID】',
  `colonel` decimal(10,2) DEFAULT '0.00' COMMENT '团长优惠',
  `is_success` smallint(1) unsigned DEFAULT '0' COMMENT '是否成团',
  `success_time` int(11) unsigned DEFAULT NULL COMMENT '成团时间',
  `status` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '拼团状态【1=> 待付款，2= 拼团中，3=拼团成功，4=拼团失败】',
  `is_returnd` smallint(1) unsigned DEFAULT '0' COMMENT '是否退款',
  `is_cancel` smallint(1) DEFAULT '0' COMMENT '是否取消',
  `limit_time` int(1) unsigned DEFAULT NULL COMMENT '拼团限时',
  `content` longtext COMMENT '备注',
  `words` longtext COMMENT '商家留言',
  `shop_id` int(11) unsigned DEFAULT '0' COMMENT '自提店铺',
  `offline` smallint(1) unsigned DEFAULT '1' COMMENT '拿货方式',
  `clerk_id` int(11) unsigned DEFAULT '0' COMMENT '核销员ID',
  `is_price` smallint(1) DEFAULT '0' COMMENT '是否发放佣金',
  `express_price_1` decimal(10,2) DEFAULT NULL COMMENT '减免的运费',
  `class_group` int(11) DEFAULT '0' COMMENT '阶级团',
  `is_recycle` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否加入回收站 0--不加入 1--加入',
  `is_show` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否显示 0--不显示 1--显示（软删除）',
  `seller_comments` mediumtext COMMENT '商家备注',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_pay` (`is_pay`) USING BTREE,
  KEY `is_send` (`is_send`) USING BTREE,
  KEY `is_confirm` (`is_confirm`) USING BTREE,
  KEY `is_comment` (`is_comment`) USING BTREE,
  KEY `is_group` (`is_group`) USING BTREE,
  KEY `is_success` (`is_success`) USING BTREE,
  KEY `is_returnd` (`is_returnd`) USING BTREE,
  KEY `is_cancel` (`is_cancel`) USING BTREE,
  KEY `is_price` (`is_price`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hjmall_pt_order_comment
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_pt_order_comment`;
CREATE TABLE `hjmall_pt_order_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `score` decimal(10,1) NOT NULL COMMENT '评分：1=差评，2=中评，3=好',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '评价内容',
  `pic_list` longtext COMMENT '图片',
  `is_hide` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否隐藏：0=不隐藏，1=隐藏',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_virtual` smallint(6) DEFAULT '0',
  `virtual_user` varchar(255) DEFAULT '',
  `virtual_avatar` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_hide` (`is_hide`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hjmall_pt_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_pt_order_detail`;
CREATE TABLE `hjmall_pt_order_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '此商品的总价',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `attr` longtext NOT NULL COMMENT '商品规格',
  `pic` varchar(255) NOT NULL COMMENT '商品规格图片',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hjmall_pt_order_refund
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_pt_order_refund`;
CREATE TABLE `hjmall_pt_order_refund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `order_refund_no` varchar(255) NOT NULL DEFAULT '' COMMENT '退款单号',
  `type` smallint(6) NOT NULL DEFAULT '1' COMMENT '售后类型：1=退货退款，2=换货',
  `refund_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `desc` varchar(500) NOT NULL DEFAULT '' COMMENT '退款说明',
  `pic_list` longtext COMMENT '凭证图片列表：json格式',
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '状态：0=待商家处理，1=同意并已退款，2=已同意换货，3=已拒绝退换货',
  `refuse_desc` varchar(500) NOT NULL DEFAULT '' COMMENT '拒绝退换货原因',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `response_time` int(11) NOT NULL DEFAULT '0' COMMENT '商家处理时间',
  `is_agree` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否已同意退、换货：0=待处理，1=已同意，2=已拒绝',
  `is_user_send` smallint(1) NOT NULL DEFAULT '0' COMMENT '用户已发货：0=未发货，1=已发货',
  `user_send_express` varchar(32) NOT NULL DEFAULT '' COMMENT '用户发货快递公司',
  `user_send_express_no` varchar(32) NOT NULL DEFAULT '' COMMENT '用户发货快递单号',
  `address_id` int(11) DEFAULT '0' COMMENT '退货 换货地址id',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_pt_robot
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_pt_robot`;
CREATE TABLE `hjmall_pt_robot` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '机器人名',
  `pic` varchar(255) NOT NULL COMMENT '头像',
  `is_delete` smallint(1) unsigned DEFAULT NULL COMMENT '是否删除',
  `addtime` int(11) unsigned DEFAULT NULL COMMENT '添加时间',
  `store_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_pt_setting
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_pt_setting`;
CREATE TABLE `hjmall_pt_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `is_share` int(11) DEFAULT '0' COMMENT '是否开启分销 0--关闭 1--开启',
  `is_sms` int(11) DEFAULT '0' COMMENT '是否开启短信通知',
  `is_print` int(11) DEFAULT '0' COMMENT '是否开启订单打印',
  `is_mail` int(11) DEFAULT '0' COMMENT '是否开启邮件通知',
  `is_area` tinyint(1) DEFAULT NULL COMMENT '区域限制  0--关闭 1--开启',
  PRIMARY KEY (`id`),
  KEY `is_share` (`is_share`) USING BTREE,
  KEY `is_sms` (`is_sms`) USING BTREE,
  KEY `is_print` (`is_print`) USING BTREE,
  KEY `is_mail` (`is_mail`) USING BTREE,
  KEY `is_area` (`is_area`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_qrcode
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_qrcode`;
CREATE TABLE `hjmall_qrcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `qrcode_bg` longtext NOT NULL COMMENT '背景图片',
  `avatar_size` varchar(255) NOT NULL COMMENT '头像大小{"w":"","h":""}',
  `avatar_position` varchar(255) NOT NULL COMMENT '头像坐标{"x":"","y":""}',
  `qrcode_size` varchar(255) NOT NULL COMMENT '二维码宽度',
  `qrcode_position` varchar(255) NOT NULL COMMENT '二维码坐标{"x":"","y":""}',
  `font_position` varchar(255) NOT NULL COMMENT '字体坐标{"x":"","y":""}',
  `font` longtext NOT NULL COMMENT '字体设置\r\n{\r\n  "size":大小,\r\n  "color":"r,g,b"\r\n}',
  `preview` longtext NOT NULL COMMENT '预览图',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='海报图的设置';

-- ----------------------------
-- Table structure for hjmall_re_order
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_re_order`;
CREATE TABLE `hjmall_re_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `order_no` varchar(255) DEFAULT NULL COMMENT '订单号',
  `user_id` int(11) DEFAULT NULL COMMENT '用户',
  `pay_price` decimal(10,2) DEFAULT NULL COMMENT '支付金额',
  `send_price` decimal(10,2) DEFAULT NULL COMMENT '赠送金额',
  `pay_type` int(11) DEFAULT '0' COMMENT '支付方式 1--微信支付',
  `is_pay` int(11) DEFAULT '0' COMMENT '是否支付 0--未支付 1--支付',
  `pay_time` int(11) DEFAULT NULL COMMENT '支付时间',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_pay` (`is_pay`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_recharge
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_recharge`;
CREATE TABLE `hjmall_recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `pay_price` decimal(10,2) DEFAULT NULL COMMENT '支付金额',
  `send_price` decimal(10,2) DEFAULT '0.00' COMMENT '赠送金额',
  `name` varchar(255) DEFAULT NULL COMMENT '充值名称',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_refund_address
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_refund_address`;
CREATE TABLE `hjmall_refund_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '收件人名称',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '收件人地址',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '收件人电话',
  `is_delete` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_register
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_register`;
CREATE TABLE `hjmall_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `register_time` varchar(25) NOT NULL,
  `addtime` int(11) NOT NULL DEFAULT '0',
  `continuation` int(11) NOT NULL COMMENT '连续签到天数',
  `integral` int(11) NOT NULL COMMENT '获得积分',
  `type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1--签到',
  `order_id` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_scratch
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_scratch`;
CREATE TABLE `hjmall_scratch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '1.红包2.优惠卷3.积分4.实物',
  `num` int(11) DEFAULT '0' COMMENT '积分数量',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '红包价格',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `coupon_id` int(11) DEFAULT '0' COMMENT '优惠卷',
  `gift_id` int(11) DEFAULT '0' COMMENT '赠品',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `attr` varchar(255) DEFAULT '' COMMENT '规格',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0关闭 1开启',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_scratch_log
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_scratch_log`;
CREATE TABLE `hjmall_scratch_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `pond_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT ' 0预领取 1 未领取 2 已领取',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `raffle_time` int(11) DEFAULT '0' COMMENT '领取时间',
  `type` int(11) NOT NULL DEFAULT '0',
  `num` int(11) DEFAULT '0',
  `gift_id` int(11) DEFAULT '0',
  `coupon_id` int(11) DEFAULT '0',
  `price` decimal(10,2) DEFAULT '0.00',
  `attr` varchar(255) DEFAULT '' COMMENT '规格',
  `order_id` int(11) DEFAULT '0' COMMENT '订单号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_scratch_setting
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_scratch_setting`;
CREATE TABLE `hjmall_scratch_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `probability` int(11) NOT NULL DEFAULT '0' COMMENT '概率',
  `oppty` int(11) NOT NULL DEFAULT '0' COMMENT '抽奖次数',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '1.天 2 用户',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `title` varchar(255) DEFAULT '' COMMENT '小程序标题',
  `rule` varchar(1000) DEFAULT '' COMMENT '规则说明',
  `deplete_register` int(11) DEFAULT '0' COMMENT '消耗积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_sender
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_sender`;
CREATE TABLE `hjmall_sender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `post_code` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `exp_area` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `is_delete` smallint(2) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `delivery_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_session
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_session`;
CREATE TABLE `hjmall_session` (
  `id` varchar(32) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `data` varchar(10240) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_setting
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_setting`;
CREATE TABLE `hjmall_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first` decimal(10,2) NOT NULL DEFAULT '0.00',
  `second` decimal(10,2) NOT NULL DEFAULT '0.00',
  `third` decimal(10,2) NOT NULL DEFAULT '0.00',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '商城id',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '分销层级 0--不开启 1--一级分销 2--二级分销 3--三级分销',
  `condition` int(11) NOT NULL DEFAULT '0' COMMENT '成为下线条件 0--首次点击分享链接 1--首次下单 2--首次付款',
  `share_condition` int(11) NOT NULL DEFAULT '0' COMMENT '成为分销商的条件 \r\n0--无条件\r\n1--申请',
  `content` longtext COMMENT '分销佣金 的 用户须知',
  `pay_type` smallint(1) NOT NULL DEFAULT '0' COMMENT '提现方式 0--支付宝转账  1--微信企业支付',
  `min_money` decimal(10,2) NOT NULL DEFAULT '1.00' COMMENT '最小提现额度',
  `agree` longtext COMMENT '分销协议',
  `first_name` varchar(255) DEFAULT NULL,
  `second_name` varchar(255) DEFAULT NULL,
  `third_name` varchar(255) DEFAULT NULL,
  `pic_url_1` longtext,
  `pic_url_2` longtext,
  `price_type` int(11) DEFAULT '0' COMMENT '分销金额 0--百分比金额  1--固定金额',
  `bank` tinyint(4) DEFAULT NULL COMMENT '银行卡支付  0 --不使用  1--使用',
  `remaining_sum` tinyint(1) DEFAULT '0' COMMENT '余额提现 0=关闭 1=开启',
  `rebate` decimal(10,2) DEFAULT '0.00' COMMENT '自购返利',
  `is_rebate` int(11) DEFAULT '0' COMMENT '是否开启自购返利',
  `share_good_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '购买商品自动成为分销商：0.关闭 1.任意商品 2.指定商品',
  `share_good_id` int(11) NOT NULL DEFAULT '0' COMMENT '购买指定分销商品Id',
  PRIMARY KEY (`id`),
  KEY `is_rebate` (`is_rebate`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='分销商佣金设置';

-- ----------------------------
-- Table structure for hjmall_share
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_share`;
CREATE TABLE `hjmall_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL COMMENT '审核状态 0--未审核 1--审核通过 2--审核不通过',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL,
  `seller_comments` text COMMENT '商家备注',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='分销商';

-- ----------------------------
-- Table structure for hjmall_shop
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_shop`;
CREATE TABLE `hjmall_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `is_delete` smallint(6) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `longitude` longtext,
  `latitude` longtext,
  `score` int(11) DEFAULT '5' COMMENT '评分 1~5',
  `cover_url` varchar(2048) DEFAULT NULL,
  `pic_url` varchar(2048) DEFAULT NULL,
  `shop_time` varchar(255) DEFAULT NULL COMMENT '营业时间',
  `content` longtext COMMENT '门店介绍',
  `is_default` int(11) DEFAULT '0' COMMENT '是否设为默认 0--否 1--是 （只能设置一个门店为默认门店）',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_default` (`is_default`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='门店设置';

-- ----------------------------
-- Table structure for hjmall_shop_pic
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_shop_pic`;
CREATE TABLE `hjmall_shop_pic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `pic_url` varchar(2048) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_sms_record
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_sms_record`;
CREATE TABLE `hjmall_sms_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(255) DEFAULT NULL,
  `tpl` varchar(255) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='短信发送记录';

-- ----------------------------
-- Table structure for hjmall_sms_setting
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_sms_setting`;
CREATE TABLE `hjmall_sms_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `AccessKeyId` varchar(255) DEFAULT NULL COMMENT '阿里云AccessKeyId',
  `AccessKeySecret` varchar(255) DEFAULT NULL COMMENT '阿里云AccessKeySecret',
  `name` varchar(255) DEFAULT NULL COMMENT '短信模板名称',
  `sign` varchar(255) DEFAULT NULL COMMENT '短信模板签名',
  `tpl` varchar(255) DEFAULT NULL COMMENT '短信模板code',
  `msg` varchar(255) DEFAULT NULL COMMENT '短信模板参数',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '开启状态 0--关闭 1--开启',
  `mobile` varchar(255) DEFAULT NULL,
  `is_delete` smallint(6) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `tpl_refund` longtext COMMENT '退款模板参数',
  `tpl_code` longtext COMMENT '验证码模板参数',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='短信设置';

-- ----------------------------
-- Table structure for hjmall_step_activity
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_step_activity`;
CREATE TABLE `hjmall_step_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '活动标题',
  `currency` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '奖金池',
  `bail_currency` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '保证金',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0关闭 1开启',
  `step_num` int(11) NOT NULL DEFAULT '0' COMMENT '挑战布数',
  `open_date` date NOT NULL COMMENT '开放日期，例：2017-08-21',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0进行中 1 已完成',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_step_log
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_step_log`;
CREATE TABLE `hjmall_step_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `step_id` int(11) NOT NULL DEFAULT '0' COMMENT 'stepID',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '兑换布数',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '1收入 2支出 ',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0 布数兑换 1商品兑换 2 布数挑战',
  `step_currency` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '活力币',
  `type_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单/活动',
  `raffle_time` int(11) NOT NULL DEFAULT '0' COMMENT '领取时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `step_currency` (`step_currency`) USING BTREE,
  KEY `num` (`num`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_step_remind
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_step_remind`;
CREATE TABLE `hjmall_step_remind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `date` date NOT NULL DEFAULT '0000-00-00' COMMENT '日期',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_step_setting
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_step_setting`;
CREATE TABLE `hjmall_step_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `rule` varchar(2000) DEFAULT '' COMMENT '规则',
  `title` varchar(255) DEFAULT '' COMMENT '小程序标题',
  `convert_max` int(11) DEFAULT '0' COMMENT '最大步数兑换限制',
  `convert_ratio` int(11) DEFAULT '0' COMMENT '兑换比率',
  `invite_ratio` int(11) DEFAULT '0' COMMENT '邀请比率',
  `remind_time` varchar(255) DEFAULT '8' COMMENT '0-24',
  `activity_rule` varchar(2000) DEFAULT '' COMMENT '活动规则',
  `share_title` varchar(2000) DEFAULT '' COMMENT '转发标题',
  `ranking_num` int(11) DEFAULT '0' COMMENT '全国排行限制',
  `qrcode_title` varchar(255) DEFAULT '' COMMENT '海报文字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_step_user
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_step_user`;
CREATE TABLE `hjmall_step_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `step_currency` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '活力币 ',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `ratio` int(11) NOT NULL DEFAULT '0' COMMENT '概率加成',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '邀请ID',
  `invite_ratio` int(11) NOT NULL DEFAULT '0' COMMENT '邀请好友加成',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `remind` int(11) NOT NULL DEFAULT '0' COMMENT '0提醒 1开启',
  PRIMARY KEY (`id`),
  KEY `step_currency` (`step_currency`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_store
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_store`;
CREATE TABLE `hjmall_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(6) NOT NULL DEFAULT '0',
  `is_recycle` smallint(1) NOT NULL DEFAULT '0' COMMENT '回收站：0=否，1=是',
  `acid` int(11) NOT NULL DEFAULT '0' COMMENT '微擎公众号id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `wechat_platform_id` int(11) NOT NULL DEFAULT '0' COMMENT '微信公众号id',
  `wechat_app_id` int(11) NOT NULL DEFAULT '0' COMMENT '微信小程序id',
  `name` varchar(255) NOT NULL COMMENT '店铺名称',
  `order_send_tpl` varchar(255) NOT NULL DEFAULT '' COMMENT '发货通知模板消息id',
  `contact_tel` varchar(255) NOT NULL DEFAULT '' COMMENT '联系电话',
  `show_customer_service` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否显示在线客服：0=否，1=是',
  `copyright` varchar(255) NOT NULL DEFAULT '',
  `copyright_pic_url` varchar(2048) DEFAULT NULL,
  `copyright_url` varchar(2048) DEFAULT NULL,
  `delivery_time` int(11) NOT NULL DEFAULT '10' COMMENT '收货时间',
  `after_sale_time` int(11) NOT NULL DEFAULT '7' COMMENT '售后时间',
  `use_wechat_platform_pay` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否使用公众号支付：0=否，1=是',
  `kdniao_mch_id` varchar(255) NOT NULL DEFAULT '' COMMENT '快递鸟商户号',
  `kdniao_api_key` varchar(255) NOT NULL DEFAULT '' COMMENT '快递鸟api key',
  `cat_style` smallint(6) NOT NULL DEFAULT '1' COMMENT '分类页面样式：1=无侧栏，2=有侧栏',
  `home_page_module` longtext COMMENT '首页模块布局',
  `address` longtext COMMENT '店铺地址',
  `cat_goods_cols` int(11) NOT NULL DEFAULT '3' COMMENT '首页分类商品列数',
  `over_day` int(11) NOT NULL DEFAULT '0' COMMENT '未支付订单超时时间',
  `is_offline` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否开启自提',
  `is_coupon` smallint(6) DEFAULT '0' COMMENT '是否开启优惠券',
  `cat_goods_count` int(11) NOT NULL DEFAULT '6' COMMENT '首页分类的商品个数',
  `send_type` smallint(6) NOT NULL DEFAULT '1' COMMENT '发货方式：0=快递或自提，1=仅快递，2=仅自提',
  `member_content` longtext COMMENT '会员等级说明',
  `nav_count` int(11) DEFAULT '0' COMMENT '首页导航栏个数 0--4个 1--5个',
  `integral` int(11) unsigned NOT NULL DEFAULT '10' COMMENT '一元抵多少积分',
  `integration` longtext COMMENT '积分使用说明',
  `cut_thread` smallint(1) DEFAULT NULL COMMENT '分类分割线   0关闭   1开启',
  `dial` smallint(1) DEFAULT NULL COMMENT '一键拨号开关  0关闭  1开启',
  `dial_pic` tinytext COMMENT '拨号图标',
  `purchase_frame` smallint(1) DEFAULT '0',
  `is_recommend` int(10) NOT NULL DEFAULT '0' COMMENT '推荐商品状态 1：开启 0 ：关闭',
  `recommend_count` int(10) NOT NULL DEFAULT '0' COMMENT '推荐商品数量',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '禁用状态：0.未禁用|1.禁用',
  `is_comment` tinyint(4) NOT NULL DEFAULT '1' COMMENT '商城评价开关：0.关闭 1.开启',
  `is_sales` tinyint(4) NOT NULL DEFAULT '1' COMMENT '商城商品销量开关：0.关闭 1.开启',
  `good_negotiable` varchar(255) DEFAULT '' COMMENT '1 电话 2 客服',
  `buy_member` smallint(1) DEFAULT '0' COMMENT '是否购买会员 0不支持 1支持',
  `logo` varchar(255) DEFAULT NULL COMMENT '商城logo',
  `is_member_price` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员价是否显示 0.不显示|1.显示',
  `is_share_price` tinyint(1) NOT NULL DEFAULT '1' COMMENT '分销价是否显示 0.不显示|1.显示',
  `is_member` smallint(1) DEFAULT '0' COMMENT '是否购买会员 0不支持 1支持',
  `is_official_account` tinyint(1) NOT NULL DEFAULT '0' COMMENT '公众号关注组件 0.否 | 1.是',
  PRIMARY KEY (`id`),
  KEY `acid` (`acid`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_offline` (`is_offline`) USING BTREE,
  KEY `is_coupon` (`is_coupon`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商城';

-- ----------------------------
-- Table structure for hjmall_task
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_task`;
CREATE TABLE `hjmall_task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(128) NOT NULL,
  `delay_seconds` int(11) NOT NULL COMMENT '多少秒后执行',
  `is_executed` int(1) NOT NULL DEFAULT '0' COMMENT '是否已执行：0=未执行，1=已执行',
  `class` varchar(255) NOT NULL,
  `params` longtext,
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` int(1) NOT NULL DEFAULT '0',
  `content` longtext NOT NULL COMMENT '任务说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_template_msg
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_template_msg`;
CREATE TABLE `hjmall_template_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `tpl_name` varchar(32) NOT NULL COMMENT '模版名称',
  `tpl_id` varchar(64) NOT NULL COMMENT '模版ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `store_id_tpl_name` (`store_id`,`tpl_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_territorial_limitation
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_territorial_limitation`;
CREATE TABLE `hjmall_territorial_limitation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `detail` longtext NOT NULL COMMENT '规则详细',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_enable` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否启用：0=否，1=是',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_enable` (`is_enable`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_topic
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_topic`;
CREATE TABLE `hjmall_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `sub_title` varchar(255) NOT NULL DEFAULT '' COMMENT '副标题',
  `cover_pic` longtext COMMENT '封面图片',
  `content` longtext COMMENT '专题内容',
  `read_count` int(11) NOT NULL DEFAULT '0' COMMENT '阅读量',
  `virtual_read_count` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟阅读量',
  `layout` smallint(6) NOT NULL DEFAULT '0' COMMENT '布局方式：0=小图，1=大图模式',
  `sort` int(11) NOT NULL DEFAULT '1000' COMMENT '排序：升序',
  `agree_count` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `virtual_agree_count` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟点赞数',
  `virtual_favorite_count` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟收藏量',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(6) NOT NULL DEFAULT '0',
  `is_chosen` smallint(6) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `qrcode_pic` longtext COMMENT '海报分享图',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_chosen` (`is_chosen`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='专题';

-- ----------------------------
-- Table structure for hjmall_topic_favorite
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_topic_favorite`;
CREATE TABLE `hjmall_topic_favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户收藏的专题';

-- ----------------------------
-- Table structure for hjmall_topic_type
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_topic_type`;
CREATE TABLE `hjmall_topic_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `is_delete` smallint(6) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_upload_config
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_upload_config`;
CREATE TABLE `hjmall_upload_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `storage_type` varchar(255) NOT NULL DEFAULT '' COMMENT '存储类型：留空=本地，aliyun=阿里云oss，qcloud=腾讯云cos，qiniu=七牛云存储',
  `aliyun` longtext COMMENT '阿里云oss配置，json格式',
  `qcloud` longtext COMMENT '腾讯云cos配置，json格式',
  `qiniu` longtext COMMENT '七牛云存储配置，json格式',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='文件上传方式配置';

-- ----------------------------
-- Table structure for hjmall_upload_file
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_upload_file`;
CREATE TABLE `hjmall_upload_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `file_url` varchar(2048) DEFAULT NULL,
  `extension` varchar(255) NOT NULL DEFAULT '' COMMENT '文件扩展名',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '文件类型：',
  `size` int(11) NOT NULL DEFAULT '0' COMMENT '文件大小，字节',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `group_id` int(11) DEFAULT '0' COMMENT '分组id',
  `mch_id` int(11) DEFAULT '0' COMMENT '商户id',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13898 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户上传的文件';

-- ----------------------------
-- Table structure for hjmall_user
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_user`;
CREATE TABLE `hjmall_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '用户类型：0=管理员，1=普通用户',
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `auth_key` varchar(255) NOT NULL,
  `access_token` varchar(255) NOT NULL,
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `wechat_open_id` varchar(255) NOT NULL DEFAULT '' COMMENT '微信openid',
  `wechat_union_id` varchar(255) NOT NULL DEFAULT '' COMMENT '微信用户union id',
  `nickname` varchar(255) NOT NULL DEFAULT '' COMMENT '昵称',
  `avatar_url` varchar(2048) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '商城id',
  `is_distributor` int(11) NOT NULL DEFAULT '0' COMMENT '是否是分销商 0--不是 1--是 2--申请中',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级ID',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '成为分销商的时间',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '累计佣金',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '可提现佣金',
  `is_clerk` int(11) NOT NULL DEFAULT '0' COMMENT '是否是核销员 0--不是 1--是',
  `we7_uid` int(11) NOT NULL DEFAULT '0' COMMENT '微擎账户id',
  `shop_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT '-1' COMMENT '会员等级',
  `integral` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户当前积分',
  `total_integral` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户总获得积分',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '余额',
  `contact_way` varchar(255) DEFAULT NULL COMMENT '联系方式',
  `comments` varchar(255) DEFAULT NULL COMMENT '备注',
  `binding` char(11) DEFAULT NULL COMMENT '授权手机号',
  `wechat_platform_open_id` varchar(64) NOT NULL DEFAULT '' COMMENT '微信公众号openid',
  `platform` tinyint(4) NOT NULL DEFAULT '0' COMMENT '小程序平台 0 => 微信, 1 => 支付宝',
  `blacklist` tinyint(1) NOT NULL DEFAULT '0' COMMENT '黑名单 0.否 | 1.是',
  `parent_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '可能成为上级的ID',
  PRIMARY KEY (`id`),
  KEY `access_token` (`access_token`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE,
  KEY `level` (`level`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_distributor` (`is_distributor`) USING BTREE,
  KEY `is_clerk` (`is_clerk`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7417 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户';

-- ----------------------------
-- Table structure for hjmall_user_account_log
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_user_account_log`;
CREATE TABLE `hjmall_user_account_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` smallint(6) NOT NULL COMMENT '类型：1=收入，2=支出',
  `price` decimal(10,2) NOT NULL COMMENT '变动金额',
  `desc` longtext NOT NULL COMMENT '变动说明',
  `addtime` int(11) NOT NULL,
  `order_type` int(11) NOT NULL DEFAULT '0' COMMENT '订单类型 0--充值 1--商城订单 2--秒杀订单 3--拼团订单 4--商城订单退款 5--秒杀订单退款 6--拼团订单退款',
  `order_id` int(11) DEFAULT '0' COMMENT '订单ID',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_user_auth_login
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_user_auth_login`;
CREATE TABLE `hjmall_user_auth_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `token` varchar(225) NOT NULL,
  `is_pass` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已确认登录：0=未扫码，1=已确认登录',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `token` (`token`(191)) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_pass` (`is_pass`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_user_card
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_user_card`;
CREATE TABLE `hjmall_user_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `card_id` int(11) DEFAULT NULL COMMENT '卡券ID',
  `card_name` varchar(255) DEFAULT NULL COMMENT '卡券名称',
  `card_pic_url` varchar(2048) DEFAULT NULL,
  `card_content` longtext COMMENT '卡券描述',
  `is_use` int(11) DEFAULT NULL COMMENT '是否使用 0--未使用 1--已使用',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `clerk_id` int(11) DEFAULT NULL COMMENT '核销人id',
  `shop_id` int(11) DEFAULT NULL COMMENT '店铺ID',
  `clerk_time` int(11) DEFAULT NULL COMMENT ' 核销时间',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '发放卡券的订单id',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_use` (`is_use`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hjmall_user_coupon
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_user_coupon`;
CREATE TABLE `hjmall_user_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `coupon_auto_send_id` int(11) NOT NULL DEFAULT '0' COMMENT '自动发放id',
  `begin_time` int(11) NOT NULL DEFAULT '0' COMMENT '有效期开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '有效期结束时间',
  `is_expire` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否已过期：0=未过期，1=已过期',
  `is_use` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否已使用：0=未使用，1=已使用',
  `is_delete` smallint(6) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `type` smallint(6) DEFAULT '0' COMMENT '领取类型 0--平台发放 1--自动发放 2--领券中心领取',
  `integral` int(11) NOT NULL DEFAULT '0' COMMENT '兑换支付积分数量',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '兑换支付价格',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `coupon_id` (`coupon_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_expire` (`is_expire`) USING BTREE,
  KEY `is_use` (`is_use`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=686 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户-优惠券关系';

-- ----------------------------
-- Table structure for hjmall_user_form_id
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_user_form_id`;
CREATE TABLE `hjmall_user_form_id` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `form_id` varchar(255) NOT NULL,
  `times` int(11) NOT NULL DEFAULT '1' COMMENT '剩余使用次数',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=607 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_user_log
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_user_log`;
CREATE TABLE `hjmall_user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '改变的字段',
  `before_change` varchar(255) NOT NULL DEFAULT '' COMMENT '改变前字段的值',
  `after_change` varchar(255) NOT NULL DEFAULT '' COMMENT '改变后字段的值',
  `is_delete` smallint(6) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=577 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_user_share_money
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_user_share_money`;
CREATE TABLE `hjmall_user_share_money` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `type` int(11) DEFAULT NULL COMMENT '类型 0--佣金 1--提现',
  `source` int(11) DEFAULT '1' COMMENT '佣金来源 1--一级分销 2--二级分销 3--三级分销',
  `money` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `order_type` int(11) DEFAULT '0' COMMENT '订单类型 0--商城订单 1--秒杀订单 2--拼团订单 3--预约订单',
  `version` varchar(255) DEFAULT '0' COMMENT '版本',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='用户佣金明细表';

-- ----------------------------
-- Table structure for hjmall_video
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_video`;
CREATE TABLE `hjmall_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `url` varchar(2048) DEFAULT NULL,
  `sort` varchar(255) DEFAULT NULL COMMENT '排序  升序',
  `is_delete` smallint(6) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL COMMENT '商城id',
  `pic_url` varchar(2048) DEFAULT NULL,
  `content` longtext COMMENT '详情介绍',
  `type` int(11) DEFAULT '0' COMMENT '视频来源 0--源地址 1--腾讯视频',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_we7_user_auth
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_we7_user_auth`;
CREATE TABLE `hjmall_we7_user_auth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `we7_user_id` int(11) NOT NULL,
  `auth` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hjmall_wechat_app
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_wechat_app`;
CREATE TABLE `hjmall_wechat_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acid` int(11) NOT NULL DEFAULT '0' COMMENT '微擎公众号id',
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `app_id` varchar(255) NOT NULL,
  `app_secret` varchar(255) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `mch_id` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `cert_pem` longtext,
  `key_pem` longtext,
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='微信小程序';

-- ----------------------------
-- Table structure for hjmall_wechat_platform
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_wechat_platform`;
CREATE TABLE `hjmall_wechat_platform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acid` int(11) NOT NULL DEFAULT '0' COMMENT '微擎公众号id',
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '公众号名称',
  `app_id` varchar(255) NOT NULL COMMENT '公众号appid',
  `app_secret` varchar(255) NOT NULL COMMENT '公众号appsecret',
  `desc` varchar(255) DEFAULT NULL COMMENT '公共号说明、备注',
  `mch_id` varchar(255) DEFAULT NULL COMMENT '微信支付商户号',
  `key` varchar(255) DEFAULT NULL COMMENT '微信支付key',
  `cert_pem` longtext COMMENT '微信支付cert文件内容',
  `key_pem` longtext COMMENT '微信支付key文件内容',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='微信公众号';

-- ----------------------------
-- Table structure for hjmall_wechat_template_message
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_wechat_template_message`;
CREATE TABLE `hjmall_wechat_template_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `pay_tpl` varchar(255) NOT NULL DEFAULT '' COMMENT '支付通知模板消息id',
  `send_tpl` varchar(255) NOT NULL DEFAULT '' COMMENT '发货通知模板消息id',
  `refund_tpl` varchar(255) NOT NULL DEFAULT '' COMMENT '退款通知模板消息id',
  `not_pay_tpl` varchar(255) NOT NULL DEFAULT '' COMMENT '订单未支付通知模板消息id',
  `revoke_tpl` varchar(255) NOT NULL DEFAULT '' COMMENT '订单取消通知模板消息id',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_wx_title
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_wx_title`;
CREATE TABLE `hjmall_wx_title` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(45) NOT NULL DEFAULT '' COMMENT '小程序页面路径',
  `store_id` int(11) DEFAULT NULL COMMENT '商城ID',
  `title` varchar(45) NOT NULL DEFAULT '默认标题' COMMENT '小程序页面标题',
  `addtime` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for hjmall_youhuiorder
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_youhuiorder`;
CREATE TABLE `hjmall_youhuiorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `price` varchar(255) NOT NULL,
  `u_id` int(11) DEFAULT NULL,
  `acid` int(11) DEFAULT NULL COMMENT '微擎公众号id',
  `username` varchar(255) NOT NULL,
  `addtime` int(11) NOT NULL,
  `is_delete` smallint(3) NOT NULL DEFAULT '0',
  `status` smallint(3) NOT NULL DEFAULT '0',
  `order_no` varchar(255) NOT NULL,
  `pay_time` varchar(255) NOT NULL,
  `form_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hjmall_yy_cat
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_yy_cat`;
CREATE TABLE `hjmall_yy_cat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '标题名称',
  `store_id` int(11) unsigned NOT NULL COMMENT '商城ID',
  `pic_url` varchar(2048) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序 升序',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `is_delete` smallint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='商城预约';

-- ----------------------------
-- Table structure for hjmall_yy_form
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_yy_form`;
CREATE TABLE `hjmall_yy_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '字段名称',
  `type` varchar(255) DEFAULT NULL COMMENT '字段类型',
  `required` int(1) unsigned DEFAULT NULL COMMENT '是否必填',
  `default` varchar(255) DEFAULT NULL COMMENT '默认值',
  `tip` varchar(255) DEFAULT NULL COMMENT '提示语',
  `sort` int(11) DEFAULT NULL,
  `is_delete` int(1) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `option` longtext COMMENT '单选、复选项 值',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COMMENT='预约自定义表单';

-- ----------------------------
-- Table structure for hjmall_yy_form_id
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_yy_form_id`;
CREATE TABLE `hjmall_yy_form_id` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL COMMENT '店铺id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `wechat_open_id` varchar(255) NOT NULL DEFAULT '' COMMENT '微信openid',
  `form_id` varchar(255) NOT NULL DEFAULT '',
  `order_no` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '可选值：form_id或prepay_id',
  `send_count` int(11) NOT NULL DEFAULT '0' COMMENT '使用次数',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hjmall_yy_goods
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_yy_goods`;
CREATE TABLE `hjmall_yy_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `price` decimal(10,2) unsigned NOT NULL COMMENT '预约金额',
  `original_price` decimal(10,2) unsigned NOT NULL COMMENT '原价',
  `detail` longtext NOT NULL COMMENT '商品详情，图文',
  `cat_id` int(11) unsigned DEFAULT '0' COMMENT '商品分类',
  `status` smallint(6) unsigned NOT NULL DEFAULT '2' COMMENT '上架状态【1=> 上架，2=> 下架】',
  `service` varchar(2000) NOT NULL COMMENT '服务选项',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '商品排序 升序',
  `virtual_sales` int(11) unsigned DEFAULT '0' COMMENT '虚拟销量',
  `cover_pic` longtext COMMENT '商品缩略图',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_delete` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `sales` int(11) unsigned NOT NULL COMMENT '实际销量',
  `shop_id` varchar(255) DEFAULT '0' COMMENT '门店id',
  `store_id` int(11) unsigned NOT NULL,
  `buy_limit` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '限购次数',
  `stock` int(11) unsigned DEFAULT '0' COMMENT '库存',
  `attr` longtext COMMENT '规格',
  `use_attr` smallint(1) DEFAULT '0' COMMENT '是否启用规格',
  `is_level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否享受会员折扣 0-不享受 1--享受',
  `video_url` varchar(255) DEFAULT NULL COMMENT '视频url',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hjmall_yy_goods_pic
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_yy_goods_pic`;
CREATE TABLE `hjmall_yy_goods_pic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `pic_url` varchar(2048) DEFAULT NULL,
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hjmall_yy_order
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_yy_order`;
CREATE TABLE `hjmall_yy_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品id',
  `user_id` int(11) unsigned NOT NULL COMMENT '用户id',
  `order_no` varchar(255) NOT NULL COMMENT '订单号',
  `total_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总费用',
  `pay_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '实际支付总费用',
  `is_pay` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态：0=未支付，1=已支付',
  `pay_type` smallint(6) unsigned DEFAULT '0' COMMENT '支付方式：1=微信支付',
  `pay_time` int(11) unsigned DEFAULT '0' COMMENT '支付时间',
  `is_use` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否使用',
  `is_comment` int(1) unsigned DEFAULT '0' COMMENT '是否评论',
  `apply_delete` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否申请取消订单：0=否，1=申请取消订单',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `offline_qrcode` longtext COMMENT '核销码',
  `is_cancel` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否取消',
  `store_id` int(11) unsigned NOT NULL,
  `use_time` int(11) unsigned DEFAULT NULL COMMENT '核销时间',
  `clerk_id` int(11) unsigned DEFAULT NULL COMMENT '核销员user_id',
  `shop_id` int(11) unsigned DEFAULT NULL COMMENT '自提门店ID',
  `is_refund` smallint(1) unsigned DEFAULT '0' COMMENT '是否取消',
  `form_id` varchar(255) NOT NULL DEFAULT '0' COMMENT '表单ID',
  `refund_time` int(11) DEFAULT '0' COMMENT '取消时间',
  `is_recycle` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否加入回收站 0--不加入 1--加入',
  `is_show` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否显示 0--不显示 1--显示（软删除）',
  `seller_comments` mediumtext COMMENT '商家备注',
  `attr` longtext COMMENT '规格',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_pay` (`is_pay`) USING BTREE,
  KEY `is_use` (`is_use`) USING BTREE,
  KEY `is_comment` (`is_comment`) USING BTREE,
  KEY `is_cancel` (`is_cancel`) USING BTREE,
  KEY `is_refund` (`is_refund`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='预约订单表';

-- ----------------------------
-- Table structure for hjmall_yy_order_comment
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_yy_order_comment`;
CREATE TABLE `hjmall_yy_order_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `score` decimal(10,1) NOT NULL COMMENT '评分：1=差评，2=中评，3=好',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '评价内容',
  `pic_list` longtext COMMENT '图片',
  `is_hide` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否隐藏：0=不隐藏，1=隐藏',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_hide` (`is_hide`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hjmall_yy_order_form
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_yy_order_form`;
CREATE TABLE `hjmall_yy_order_form` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) unsigned DEFAULT NULL,
  `goods_id` int(11) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `order_id` int(11) unsigned DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `is_delete` int(11) unsigned DEFAULT NULL,
  `addtime` int(11) unsigned DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hjmall_yy_setting
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_yy_setting`;
CREATE TABLE `hjmall_yy_setting` (
  `store_id` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示分类',
  `cat` smallint(1) NOT NULL COMMENT '参数',
  `success_notice` longtext COMMENT '预约成功模板通知',
  `refund_notice` longtext COMMENT '退款模板id',
  `is_share` int(11) DEFAULT '0' COMMENT '是否开启分销 0--关闭 1--开启',
  `is_sms` int(11) DEFAULT '0' COMMENT '是否开启短信通知',
  `is_print` int(11) DEFAULT '0' COMMENT '是否开启订单打印',
  `is_mail` int(11) DEFAULT '0' COMMENT '是否开启邮件通知',
  PRIMARY KEY (`store_id`),
  KEY `is_share` (`is_share`) USING BTREE,
  KEY `is_sms` (`is_sms`) USING BTREE,
  KEY `is_print` (`is_print`) USING BTREE,
  KEY `is_mail` (`is_mail`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
