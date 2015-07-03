-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 07 月 03 日 18:52
-- 服务器版本: 5.5.40
-- PHP 版本: 5.3.29

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='管理员表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `jfsd_admin`
--

INSERT INTO `jfsd_admin` (`user_id`, `username`, `password`, `salt`, `status`, `group_id`, `create_time`, `update_time`, `login`, `last_login_time`, `last_login_ip`, `auth_key`, `password_reset_token`) VALUES
(1, 'admin', 'd11d22df89f1ce6d420414b1800dbc14', '', 1, 1, 0, 0, 3, 1435644777, 2130706433, '', ''),
(2, 'test', 'd11d22df89f1ce6d420414b1800dbc14', '', 1, 1, 0, 0, 3, 1435644777, 2130706433, '', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户组表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `jfsd_auth_group`
--

INSERT INTO `jfsd_auth_group` (`id`, `title`, `status`, `rules`) VALUES
(1, '超级管理员', 1, '4,2,19,20,21,7,18,9,15,16,17,24,5,10,6,12'),
(2, '管理员', 1, '1,22,23,4,7,18,9,15,16,17,24,26,27,28,29,5,10,6,12'),
(3, '测试员11', 1, '4,2,19,20,21,7,18,9,15,16,17,24,25');

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

--
-- 转存表中的数据 `jfsd_auth_group_access`
--

INSERT INTO `jfsd_auth_group_access` (`uid`, `group_id`) VALUES
(2, 2);

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
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='规则表' AUTO_INCREMENT=30 ;

--
-- 转存表中的数据 `jfsd_auth_rule`
--

INSERT INTO `jfsd_auth_rule` (`id`, `pid`, `name`, `title`, `type`, `hide`, `status`, `condition`) VALUES
(1, 0, 'Admin/Index/index', '网站首页', 1, 0, 1, ''),
(2, 4, 'Admin/Config/index', '配置管理', 1, 0, 1, ''),
(4, 0, 'Admin/Config/group', '系统管理', 1, 0, 1, ''),
(5, 0, 'Admin/Content/index', '内容管理', 1, 0, 1, ''),
(6, 0, 'Admin/Banner/index', '广告管理', 1, 0, 1, ''),
(7, 4, 'Admin/Config/group', '基本信息', 1, 0, 1, ''),
(9, 4, 'Admin/Menu/index', '菜单管理', 1, 0, 1, ''),
(10, 5, 'Admin/Category/index', '栏目管理', 1, 0, 1, ''),
(12, 0, 'Admin/Page/index', '单页管理', 1, 0, 1, ''),
(15, 9, 'Admin/Menu/add', '新增', 1, 1, 1, ''),
(16, 9, 'Admin/Menu/edit', '修改', 1, 1, 1, ''),
(17, 9, 'Admin/Menu/del', '删除', 1, 1, 1, ''),
(18, 7, 'Admin/Config/save', '保存修改', 1, 1, 1, ''),
(19, 2, 'Admin/Config/add', '新增', 1, 1, 1, ''),
(20, 2, 'Admin/Config/edit', '修改', 1, 1, 1, ''),
(21, 2, 'Admin/Config/del', '删除', 1, 1, 1, ''),
(22, 1, 'Admin/Index/index', '网站首页', 1, 0, 1, ''),
(23, 1, 'Admin/Index/help', '帮助中心', 1, 0, 1, ''),
(24, 4, 'Admin/Auth/index', '权限管理', 1, 0, 1, ''),
(25, 4, 'Admin/Admin/index', '管理员', 1, 0, 1, ''),
(26, 24, 'Admin/Auth/add', '新增', 1, 1, 1, ''),
(27, 24, 'Admin/Auth/edit', '修改', 1, 1, 1, ''),
(28, 24, 'Admin/Auth/del', '删除', 1, 1, 1, ''),
(29, 24, 'Admin/Auth/access', '分配', 1, 1, 1, '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='系统配置表' AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `jfsd_config`
--

INSERT INTO `jfsd_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1, 'WEB_SITE_TITLE', 0, '网站标题', 1, '', '网站标题前台显示标题', 1378898976, 1435720709, 1, '金方时代内容管理框架1', 0),
(2, 'WEB_SITE_DESCRIPTION', 2, '网站描述', 1, '', '网站搜索引擎描述', 1378898976, 1379235841, 1, '金方时代内容管理框架', 1),
(3, 'WEB_SITE_KEYWORD', 2, '网站关键字', 1, '', '网站搜索引擎关键字', 1378898976, 1381390100, 1, '金方时代内容管理框架', 8),
(4, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1379235296, 1, '1', 1),
(5, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', 2),
(6, 'WEB_SITE_ICP', 1, '网站备案号', 1, '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', 1378900335, 1379235859, 1, '1111', 9),
(7, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1384418383, 1, '1:基本\r\n2:前台\r\n3:用户\r\n4:系统', 4),
(9, 'ADMIN_LIST_ROWS', 0, '后台每页记录数', 4, '', '后台数据每页显示记录数，默认10', 1379503896, 1435732761, 1, '15', 10),
(10, 'USER_ALLOW_REGISTER', 4, '是否允许用户注册', 3, '0:关闭注册\r\n1:允许注册', '是否开放用户注册', 1379504487, 1379504580, 1, '1', 3),
(12, 'SHOW_LIST_ROWS', 0, '前台显示列表显示数量', 2, '', '前台显示列表显示数量', 1386645376, 1435815755, 1, '10', 0),
(13, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '192.168.1.1,127.0.0.1', 12),
(14, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 4, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '1', 1),
(15, 'IS_ROOT', 3, '超级管理员', 4, '', '超级管理员用户uid', 1435728710, 1435728871, 1, '1', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
