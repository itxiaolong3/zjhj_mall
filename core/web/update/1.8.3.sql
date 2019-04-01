/* v1.8.3 */

ALTER TABLE `hjmall_postage_rules`
  ADD COLUMN `type` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 1
COMMENT '计费方式【1=>按重计费、2=>按件计费】';

ALTER TABLE `hjmall_goods`
  ADD COLUMN `weight` DOUBLE(10, 2) UNSIGNED NULL DEFAULT 0
COMMENT '重量';

ALTER TABLE `hjmall_goods`
  ADD COLUMN `freight` INT(11) UNSIGNED NOT NULL DEFAULT 0
COMMENT '运费模板ID';

ALTER TABLE `hjmall_order_detail`
  ADD COLUMN `pic` VARCHAR(255) NOT NULL
COMMENT '商品规格图片';

ALTER TABLE `hjmall_shop`
  ADD COLUMN `longitude` LONGTEXT NULL,
  ADD COLUMN `latitude` LONGTEXT NULL;


ALTER TABLE `hjmall_order`
  ADD COLUMN `user_coupon_id` INT NULL
COMMENT '使用的优惠券ID';

ALTER TABLE `hjmall_store`
  ADD COLUMN `nav_count` INT(11) NULL DEFAULT 0
COMMENT '首页导航栏个数 0--4个 1--5个';


CREATE TABLE `hjmall_order_message` (
  `id`        INT(11) NOT NULL AUTO_INCREMENT,
  `store_id`  INT(11)          DEFAULT NULL,
  `order_id`  INT(11)          DEFAULT NULL
  COMMENT '类型id 系统消息时为0',
  `is_read`   INT(11)          DEFAULT NULL
  COMMENT '消息是否已读 0--未读 1--已读',
  `is_sound`  INT(11)          DEFAULT NULL
  COMMENT '是否提示 0--未提示  1--已提示',
  `is_delete` INT(11)          DEFAULT NULL,
  `addtime`   INT(11)          DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  DEFAULT CHARSET = utf8;