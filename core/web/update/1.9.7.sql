/* 2017-12-28 */
ALTER TABLE `hjmall_yy_goods`
MODIFY COLUMN `shop_id`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '门店id' AFTER `sales`;