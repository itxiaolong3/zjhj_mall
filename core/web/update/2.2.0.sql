/* 2018-03-05 */
CREATE TABLE `hjmall_pt_robot` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '机器人名',
  `pic` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '头像',
  `is_delete` smallint(1) unsigned DEFAULT NULL COMMENT '是否删除',
  `addtime` int(11) unsigned DEFAULT NULL COMMENT '添加时间',
  `store_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='拼团机器人表';