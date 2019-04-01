/* 拼团商品表 */
ALTER TABLE `hjmall_pt_goods`
MODIFY COLUMN `virtual_sales`  int(11) UNSIGNED NULL DEFAULT 0 COMMENT '虚拟销量' AFTER `sort`;
/* 2017-12-15 */
ALTER TABLE `hjmall_pt_goods`
ADD COLUMN `buy_limit`  int(11) UNSIGNED NULL DEFAULT 0 COMMENT '限购数量' AFTER `colonel`;