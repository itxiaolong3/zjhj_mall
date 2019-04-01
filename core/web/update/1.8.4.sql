-- --------------------------------------------------------
-- 2017-11-13
-- --------------------------------------------------------
ALTER TABLE `hjmall_goods`
ADD COLUMN `full_cut`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '满减' AFTER `freight`;
-- --------------------------------------------------------
-- 2017-11-14
-- --------------------------------------------------------
ALTER TABLE `hjmall_cat`
ADD COLUMN `advert_pic`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '广告图片' AFTER `big_pic_url`,
ADD COLUMN `advert_url`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '广告链接' AFTER `advert_pic`,
ADD COLUMN `is_show`  smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示【1=> 显示，2=> 隐藏】' AFTER `advert_url`;
-- --------------------------------------------------------
-- 2017-11-15
-- --------------------------------------------------------
ALTER TABLE `hjmall_user`
ADD COLUMN `integral`  decimal(10,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户当前积分' AFTER `level`,
ADD COLUMN `total_integral`  decimal(10,2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户总获得积分' AFTER `integral`;
ALTER TABLE `hjmall_goods`
ADD COLUMN `integral`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '积分设置' AFTER `full_cut`;
ALTER TABLE `hjmall_store`
ADD COLUMN `integral`  int(11) UNSIGNED NOT NULL DEFAULT 10 COMMENT '一元抵多少积分' AFTER `nav_count`;
ALTER TABLE `hjmall_user`
MODIFY COLUMN `integral`  int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户当前积分' AFTER `level`,
MODIFY COLUMN `total_integral`  int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户总获得积分' AFTER `integral`;
-- --------------------------------------------------------
-- 2017-11-16
-- --------------------------------------------------------
ALTER TABLE `hjmall_store`
ADD COLUMN `integration`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '积分使用说明' AFTER `integral`;
-- --------------------------------------------------------
-- 2017-11-17
-- --------------------------------------------------------
ALTER TABLE `hjmall_order`
ADD COLUMN `integral`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '积分使用' AFTER `user_coupon_id`;
ALTER TABLE `hjmall_order_detail`
ADD COLUMN `integral`  int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单品积分获得' AFTER `pic`;
ALTER TABLE `hjmall_order`
ADD COLUMN `give_integral`  smallint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否发放积分【1=> 已发放 ， 0=> 未发放】' AFTER `integral`;