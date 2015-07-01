#2015年6月29日 15:56:50
#项目数据结构
#字段说明（word自动首字母大写，对照数据库查看时请注意）
DROP TABLE IF EXISTS `jfsd_admin`;
CREATE TABLE if not exists `jfsd_admin` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT comment '主键自增Id',
  `username` varchar(100) NOT NULL default '' comment '用户名',
  `password` varchar(100) NOT NULL default '' comment '密码',
  `salt` varchar(100) NOT NULL default '' comment '加密盐',
  `status` tinyint NOT NULL DEFAULT '0' comment '状态',
  `group_id` tinyint unsigned NOT NULL DEFAULT '0' comment '用户组group_id',
  `create_time` int unsigned NOT NULL DEFAULT '0' comment '创建时间',
  `update_time` int unsigned NOT NULL DEFAULT '0' comment '更新时间',
  `auth_key` varchar(100) NOT NULL default '' comment '身份验证秘钥',
  `password_reset_token` varchar(100) NOT NULL default '' comment '修改密码验证秘钥',
  PRIMARY KEY (`user_id`),
  unique key (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '管理员表';

drop table if exists `jfsd_config`;
CREATE TABLE IF NOT EXISTS `jfsd_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `sort` smallint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY (`name`),
  index (`type`),
  index (`group`)
) ENGINE=innodb  DEFAULT CHARSET=utf8 comment '系统配置表';
