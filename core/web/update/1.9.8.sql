/*2018-01-06*/
ALTER TABLE `hjmall_pt_order`
MODIFY COLUMN `is_returnd`  smallint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否退款' ;