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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='系统配置表';

DROP TABLE IF EXISTS `jfsd_auth_rule`;
CREATE TABLE `jfsd_auth_rule` (
    `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT comment '主键',
    `name` char(80) NOT NULL DEFAULT '' comment '规则唯一标识',
    `title` char(20) NOT NULL DEFAULT '' comment '规则中文名称',
    `type` tinyint(1) NOT NULL DEFAULT '1' comment '',
    `status` tinyint(1) NOT NULL DEFAULT '1' comment '状态：为1正常，为0禁用',
    `condition` char(100) NOT NULL DEFAULT '' comment '规则表达式，为空表示存在就验证，不为空表示按照条件验证',
    PRIMARY KEY (`id`),
    UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 comment '规则表';

DROP TABLE IF EXISTS `jfsd_auth_group`;
CREATE TABLE `jfsd_auth_group` (
    `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT comment '主键',
    `title` char(100) NOT NULL DEFAULT '' comment '用户组中文名称',
    `status` tinyint(1) NOT NULL DEFAULT '1' comment '状态：为1正常，为0禁用',
    `rules` char(80) NOT NULL DEFAULT '' comment '用户组拥有的规则id',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 comment '用户组表';

DROP TABLE IF EXISTS `jfsd_auth_group_access`;
CREATE TABLE `jfsd_auth_group_access` (
    `uid` mediumint(8) unsigned NOT NULL comment '用户id',
    `group_id` mediumint(8) unsigned NOT NULL comment '用户组id',
    UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
    KEY `uid` (`uid`),
    KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '用户组明细表';
