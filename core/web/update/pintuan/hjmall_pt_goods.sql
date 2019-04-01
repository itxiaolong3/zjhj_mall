/*
Navicat MySQL Data Transfer

Source Server         : 小程序商城
Source Server Version : 50546
Source Host           : 120.27.113.57:3306
Source Database       : dev_zjhj_mall

Target Server Type    : MYSQL
Target Server Version : 50546
File Encoding         : 65001

Date: 2017-11-22 16:13:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hjmall_pt_goods
-- ----------------------------
DROP TABLE IF EXISTS `hjmall_pt_goods`;
CREATE TABLE `hjmall_pt_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '商品名称',
  `original_price` decimal(10,2) unsigned NOT NULL COMMENT '商品原价',
  `price` decimal(10,2) unsigned NOT NULL COMMENT '团购价',
  `detail` longtext CHARACTER SET utf8 NOT NULL COMMENT '商品详情，图文',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类',
  `status` smallint(6) unsigned NOT NULL DEFAULT '2' COMMENT '上架状态【1=> 上架，2=> 下架】',
  `grouptime` int(11) NOT NULL DEFAULT '0' COMMENT '拼团时间/小时',
  `attr` longtext CHARACTER SET utf8 NOT NULL COMMENT '规格的库存及价格',
  `service` varchar(2000) CHARACTER SET utf8 NOT NULL COMMENT '服务选项',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '商品排序 升序',
  `virtual_sales` int(11) unsigned DEFAULT NULL COMMENT '虚拟销量',
  `cover_pic` longtext CHARACTER SET utf8 COMMENT '商品缩略图',
  `weight` int(11) unsigned DEFAULT '0' COMMENT '重量',
  `freight` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '运费模板ID',
  `unit` varchar(255) NOT NULL DEFAULT '件' COMMENT '单位',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_delete` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `group_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品成团数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
