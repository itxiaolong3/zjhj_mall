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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `hjmall_banner`
ADD COLUMN `type`  smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '类型 【1=> 商城，2=> 拼团】' ;