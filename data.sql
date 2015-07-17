-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 07 月 13 日 14:01
-- 服务器版本: 5.5.40
-- PHP 版本: 5.3.29

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- 数据库: `jfsd_thinkphp`
--

-- --------------------------------------------------------

--
-- 表的结构 `jfsd_admin`
--

CREATE TABLE IF NOT EXISTS `jfsd_admin` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键自增Id',
  `username` varchar(100) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(100) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(100) NOT NULL DEFAULT '' COMMENT '加密盐',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `group_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '用户组group_id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `login` int(10) unsigned NOT NULL COMMENT '登录次数',
  `last_login_time` int(10) unsigned NOT NULL COMMENT '下次登录时间',
  `last_login_ip` int(10) unsigned NOT NULL COMMENT '下次登录ip',
  `auth_key` varchar(100) NOT NULL DEFAULT '' COMMENT '身份验证秘钥',
  `password_reset_token` varchar(100) NOT NULL DEFAULT '' COMMENT '修改密码验证秘钥',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- --------------------------------------------------------

--
-- 表的结构 `jfsd_auth_group`
--

CREATE TABLE IF NOT EXISTS `jfsd_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` char(100) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  `rules` char(80) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户组表';

-- --------------------------------------------------------

--
-- 表的结构 `jfsd_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `jfsd_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组明细表';

-- --------------------------------------------------------

--
-- 表的结构 `jfsd_auth_rule`
--

CREATE TABLE IF NOT EXISTS `jfsd_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文名称',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `hide` tinyint(3) NOT NULL DEFAULT '1' COMMENT '隐藏',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  `condition` char(100) NOT NULL DEFAULT '' COMMENT '规则表达式，为空表示存在就验证，不为空表示按照条件验证',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='规则表';

-- --------------------------------------------------------

--
-- 表的结构 `jfsd_banner`
--

CREATE TABLE IF NOT EXISTS `jfsd_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` char(30) NOT NULL DEFAULT '' COMMENT '广告类型保留',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `width` varchar(20) NOT NULL DEFAULT '' COMMENT '宽',
  `height` varchar(20) NOT NULL DEFAULT '' COMMENT '高',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告位';

-- --------------------------------------------------------

--
-- 表的结构 `jfsd_banner_data`
--

CREATE TABLE IF NOT EXISTS `jfsd_banner_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `bid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '广告位id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '超链接',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  PRIMARY KEY (`id`),
  KEY `bid` (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告位数据表';

-- --------------------------------------------------------

--
-- 表的结构 `jfsd_category`
--

CREATE TABLE IF NOT EXISTS `jfsd_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `title` char(50) NOT NULL DEFAULT '' COMMENT '栏目标题',
  `type` char(20) NOT NULL DEFAULT '' COMMENT '类型',
  `childid` varchar(255) NOT NULL DEFAULT '' COMMENT '子分类',
  `image` char(100) NOT NULL DEFAULT '' COMMENT '栏目图片',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '栏目描述',
  `setting` varchar(255) NOT NULL DEFAULT '' COMMENT '设置',
  `display` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1显示，2隐藏',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='栏目分类表';

-- --------------------------------------------------------

--
-- 表的结构 `jfsd_config`
--

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

-- --------------------------------------------------------

--
-- 表的结构 `jfsd_message`
--

CREATE TABLE IF NOT EXISTS `jfsd_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `tel` varchar(20) NOT NULL DEFAULT '',
  `content` varchar(9999) NOT NULL DEFAULT '',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线留言';

-- --------------------------------------------------------

--
-- 表的结构 `jfsd_news`
--

CREATE TABLE IF NOT EXISTS `jfsd_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `catid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '栏目名称',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `thumb` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `content` text NOT NULL COMMENT '内容',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='新闻数据表';

-- --------------------------------------------------------

--
-- 表的结构 `jfsd_pages`
--

CREATE TABLE IF NOT EXISTS `jfsd_pages` (
  `catid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '对应栏目id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  PRIMARY KEY (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='单页数据表';

-- --------------------------------------------------------

--
-- 表的结构 `jfsd_position`
--

CREATE TABLE IF NOT EXISTS `jfsd_position` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` char(30) NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '推荐位名称',
  `data` varchar(255) NOT NULL DEFAULT '' COMMENT '推荐位数据',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='推荐位数据表';

-- --------------------------------------------------------

--
-- 表的结构 `jfsd_product`
--

CREATE TABLE IF NOT EXISTS `jfsd_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `catid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '栏目名称',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `thumb` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `images` varchar(9999) NOT NULL DEFAULT '' COMMENT '产品图片',
  `content` text NOT NULL COMMENT '内容',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='产品数据表';


create table if not exists `jfsd_link` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键自增',
    `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
    `url` varchar(100) NOT NULL DEFAULT '' COMMENT 'URL',
    `thumb` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
    `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
    `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
    `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
    `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
    PRIMARY KEY (`id`)
) engine=innodb charset=utf8 comment '友情链接';
