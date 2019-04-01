/* 2018-01-11 */
ALTER TABLE `hjmall_pt_goods`
DROP COLUMN `type`,
ADD COLUMN `type`  int(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '商品类型【1=> 送货上门，2=> 到店自提，3=> 全部支持】' ;
/* 2018-01-12 */
ALTER TABLE `hjmall_pt_order`
ADD COLUMN `shop_id`  int(11) UNSIGNED NULL DEFAULT 0 COMMENT '自提店铺' AFTER `words`,
ADD COLUMN `offline`  smallint(1) UNSIGNED NULL DEFAULT 1 COMMENT '拿货方式' AFTER `shop_id`;
/* 2018-01-15 */
ALTER TABLE `hjmall_pt_order`
ADD COLUMN `clerk_id`  int(11) UNSIGNED NULL DEFAULT 0 COMMENT '核销员ID' AFTER `offline`;
