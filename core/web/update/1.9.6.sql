/* 2017-12-26 */
ALTER TABLE `hjmall_yy_goods`
MODIFY COLUMN `virtual_sales`  int(11) UNSIGNED NULL DEFAULT 0 COMMENT '虚拟销量' AFTER `sort`;
