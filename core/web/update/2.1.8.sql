/* 2018-03-06 */
ALTER TABLE `hjmall_yy_goods`
  ADD COLUMN `buy_limit`  int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '限购次数' AFTER `store_id`;
ALTER TABLE `hjmall_yy_goods`
  ADD COLUMN `stock`  int(11) UNSIGNED NULL DEFAULT 0 COMMENT '库存' AFTER `one_buy_limit`;
ALTER TABLE `hjmall_pt_goods`
  ADD COLUMN `one_buy_limit`  int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单次限购数量' ;