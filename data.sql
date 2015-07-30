-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 07 月 21 日 09:49
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
(1, 'admin', 'd11d22df89f1ce6d420414b1800dbc14', '', 1, 1, 1436174970, 1436174970, 29, 1437095318, 2130706433, '', ''),
(2, 'test', 'd11d22df89f1ce6d420414b1800dbc14', '', 1, 2, 1436174970, 1436174970, 3, 1436771222, 2130706433, '', '');

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
(2, '管理员', 1, '1,22,23,4,2,18,7,9,15,16,17,24,26,27,28,29,5,10,12,6'),
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
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='规则表' AUTO_INCREMENT=41 ;

--
-- 转存表中的数据 `jfsd_auth_rule`
--

INSERT INTO `jfsd_auth_rule` (`id`, `pid`, `name`, `title`, `type`, `hide`, `status`, `condition`, `sort`) VALUES
(1, 0, 'Admin/Index/index', '网站首页', 1, 0, 1, '', 0),
(2, 4, 'Admin/Config/index', '基本信息', 1, 0, 1, '', 0),
(4, 0, 'Admin/Config/index', '系统管理', 1, 0, 1, '', 0),
(5, 0, 'Admin/Category/index', '内容管理', 1, 0, 1, '', 0),
(6, 0, 'Admin/Banner/index', '广告管理', 1, 0, 1, '', 0),
(7, 4, 'Admin/Config/group', '配置管理', 1, 0, 1, '', 0),
(9, 4, 'Admin/Menu/index', '菜单管理', 1, 0, 1, '', 0),
(10, 5, 'Admin/Category/index', '栏目管理', 1, 0, 1, '', 0),
(12, 5, 'Admin/Position/index', '推荐管理', 1, 0, 1, '', 0),
(15, 9, 'Admin/Menu/add', '新增', 1, 1, 1, '', 0),
(16, 9, 'Admin/Menu/edit', '修改', 1, 1, 1, '', 0),
(17, 9, 'Admin/Menu/del', '删除', 1, 1, 1, '', 0),
(18, 2, 'Admin/Config/save', '保存修改', 1, 1, 1, '', 0),
(19, 7, 'Admin/Config/add', '新增', 1, 1, 1, '', 0),
(20, 7, 'Admin/Config/edit', '修改', 1, 1, 1, '', 0),
(21, 7, 'Admin/Config/del', '删除', 1, 1, 1, '', 0),
(22, 1, 'Admin/Index/index', '网站首页', 1, 0, 1, '', 0),
(23, 1, 'Admin/Index/help', '帮助中心', 1, 0, 1, '', 0),
(24, 4, 'Admin/Auth/index', '权限管理', 1, 0, 1, '', 0),
(25, 4, 'Admin/Admin/index', '管理员', 1, 0, 1, '', 0),
(26, 24, 'Admin/Auth/add', '新增', 1, 1, 1, '', 0),
(27, 24, 'Admin/Auth/edit', '修改', 1, 1, 1, '', 0),
(28, 24, 'Admin/Auth/del', '删除', 1, 1, 1, '', 0),
(29, 24, 'Admin/Auth/access', '分配', 1, 1, 1, '', 0),
(30, 25, 'Admin/Admin/add', '新增', 1, 1, 1, '', 0),
(31, 25, 'Admin/Admin/edit', '修改', 1, 1, 1, '', 0),
(32, 25, 'Admin/Admin/del', '删除', 1, 1, 1, '', 0),
(33, 5, 'Admin/News/index', '新闻管理', 1, 0, 1, '', 0),
(34, 5, 'Admin/Pages/index', '单页管理', 1, 0, 1, '', 0),
(35, 5, 'Admin/Product/index', '产品管理', 1, 0, 1, '', 0),
(36, 0, 'Admin/Message/index', '在线留言', 1, 0, 1, '', 0),
(37, 0, 'Admin/Attachment/index', '附件管理', 1, 0, 1, '', 0),
(38, 37, 'Admin/Attachment/index', '附件列表', 1, 0, 1, '', 0),
(39, 6, 'Admin/Banner/index', '广告列表', 1, 0, 1, '', 0),
(40, 36, 'Admin/Message/index', '留言列表', 1, 0, 1, '', 0);

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
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='广告位' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `jfsd_banner`
--

INSERT INTO `jfsd_banner` (`id`, `type`, `name`, `width`, `height`, `sort`) VALUES
(1, '2', '首页幻灯片', '', '', 0),
(2, '1', '首页店面展示上面广告', '', '', 0),
(3, '2', '龙翔美校', '', '', 0);

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
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `bid` (`bid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='广告位数据表' AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `jfsd_banner_data`
--

INSERT INTO `jfsd_banner_data` (`id`, `bid`, `title`, `description`, `url`, `image`, `sort`) VALUES
(2, 1, '哪一个答案最能贴切地描绘你一般的感受或行', '11111111111111111111', 'http://www.bjjfsd.com/', 'Content/2015-07-13/55a39eb918eb1.jpg', 1),
(3, 2, '万方研发服务中心', '111111', '', 'Content/2015-07-13/55a39ed60608f.jpg', 0),
(4, 1, '邮件标题', '111', 'http://www.bjjfsd.com/', 'Content/2015-07-20/55ac8c5b0309e.png', 0),
(5, 1, '邮件标题', '', 'http://www.bjjfsd.com/', 'Content/2015-07-20/55ac8c6a7d91d.png', 0),
(6, 3, '龙翔美校1', '龙翔美校1', 'http://www.bjjfsd.com/', 'Content/2015-07-20/55ac947c69970.png', 0),
(7, 3, '龙翔美校1', '龙翔美校1', 'http://www.bjjfsd.com/', 'Content/2015-07-20/55ac947c69970.png', 0),
(8, 3, '龙翔美校1', '龙翔美校1', 'http://www.bjjfsd.com/', 'Content/2015-07-20/55ac947c69970.png', 0),
(9, 3, '龙翔美校1', '龙翔美校1', 'http://www.bjjfsd.com/', 'Content/2015-07-20/55ac947c69970.png', 0),
(10, 3, '龙翔美校1', '龙翔美校1', 'http://www.bjjfsd.com/', 'Content/2015-07-20/55ac947c69970.png', 0),
(11, 3, '龙翔美校1', '龙翔美校1', 'http://www.bjjfsd.com/', 'Content/2015-07-20/55ac947c69970.png', 0),
(12, 3, '龙翔美校1', '龙翔美校1', 'http://www.bjjfsd.com/', 'Content/2015-07-20/55ac947c69970.png', 0),
(13, 3, '龙翔美校1', '龙翔美校1', 'http://www.bjjfsd.com/', 'Content/2015-07-20/55ac947c69970.png', 0),
(14, 3, '龙翔美校1', '龙翔美校1', 'http://www.bjjfsd.com/', 'Content/2015-07-20/55ac947c69970.png', 0);

-- --------------------------------------------------------

--
-- 表的结构 `jfsd_category`
--

CREATE TABLE IF NOT EXISTS `jfsd_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `title` char(50) NOT NULL DEFAULT '' COMMENT '栏目标题',
  `english` varchar(50) NOT NULL DEFAULT '' COMMENT '英文标题',
  `type` char(20) NOT NULL DEFAULT '' COMMENT '类型',
  `childid` varchar(255) NOT NULL DEFAULT '' COMMENT '子分类',
  `image` char(100) NOT NULL DEFAULT '' COMMENT '栏目图片',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '栏目描述',
  `setting` varchar(255) NOT NULL DEFAULT '' COMMENT '设置',
  `display` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1显示，0隐藏',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='栏目分类表' AUTO_INCREMENT=29 ;

--
-- 转存表中的数据 `jfsd_category`
--

INSERT INTO `jfsd_category` (`id`, `pid`, `title`, `english`, `type`, `childid`, `image`, `description`, `setting`, `display`, `sort`) VALUES
(1, 0, '企业篇', 'Enterprise', 'Pages', '', 'Content/2015-07-16/55a7a7f266f58.png', '企业篇', 'a:7:{s:8:"page_num";s:0:"";s:13:"list_template";s:0:"";s:13:"show_template";s:0:"";s:13:"page_template";s:0:"";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1, 0),
(2, 0, '仪器篇', 'Instrument', 'Pages', '', 'Content/2015-07-17/55a857bcd9184.jpg', '仪器篇', 'a:7:{s:8:"page_num";s:0:"";s:13:"list_template";s:0:"";s:13:"show_template";s:0:"";s:13:"page_template";s:10:"pages_yiqi";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1, 0),
(3, 0, '产品篇', 'Product', 'Pages', '', '', '产品篇', '', 1, 0),
(4, 0, '项目篇', 'Project', 'Pages', '', 'Content/2015-07-17/55a85caaba603.jpg', '项目篇', 'a:7:{s:8:"page_num";s:0:"";s:13:"list_template";s:0:"";s:13:"show_template";s:0:"";s:13:"page_template";s:13:"pages_xiangmu";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1, 0),
(5, 0, '市场运营', 'Operating', 'Pages', '', '', '市场运营', '', 1, 0),
(6, 0, '新闻动态', 'News', 'News', '', '', '新闻动态', '', 1, 0),
(7, 0, '联系我们', 'Contact us', 'Pages', '', '', '联系我们', 'a:7:{s:8:"page_num";s:0:"";s:13:"list_template";s:0:"";s:13:"show_template";s:0:"";s:13:"page_template";s:0:"";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1, 0),
(8, 6, '店面展示', 'STORE DISPLAY', 'News', '', '', '店名展示', 'a:7:{s:8:"page_num";s:1:"4";s:13:"list_template";s:0:"";s:13:"show_template";s:0:"";s:13:"page_template";s:0:"";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1, 0),
(9, 6, '市场分析', '', 'News', '', '', '市场分析', 'a:7:{s:8:"page_num";s:2:"16";s:13:"list_template";s:10:"lists_news";s:13:"show_template";s:0:"";s:13:"page_template";s:0:"";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1, 0),
(10, 6, '店面视频', '', 'News', '', '', '店面视频', 'a:7:{s:8:"page_num";s:1:"4";s:13:"list_template";s:0:"";s:13:"show_template";s:0:"";s:13:"page_template";s:0:"";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1, 0),
(11, 1, '企业介绍', 'INTRODUCTION', 'Pages', '', '', '企业介绍', 'a:7:{s:8:"page_num";s:0:"";s:13:"list_template";s:0:"";s:13:"show_template";s:0:"";s:13:"page_template";s:0:"";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1, 0),
(12, 1, '企业文化', 'CULTURE', 'Pages', '', '', '企业文化', 'a:7:{s:8:"page_num";s:0:"";s:13:"list_template";s:0:"";s:13:"show_template";s:0:"";s:13:"page_template";s:0:"";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1, 0),
(13, 1, '企业荣誉', 'HONOR', 'Pages', '', '', '企业荣誉', 'a:7:{s:8:"page_num";s:0:"";s:13:"list_template";s:0:"";s:13:"show_template";s:0:"";s:13:"page_template";s:0:"";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1, 0),
(14, 1, '核心团队', 'TEAM', 'News', '', '', '核心团队', 'a:7:{s:8:"page_num";s:1:"6";s:13:"list_template";s:10:"lists_team";s:13:"show_template";s:0:"";s:13:"page_template";s:0:"";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1, 0),
(15, 3, '精品套系', '', 'Pages', '', '', '精品套系', 'a:7:{s:8:"page_num";s:0:"";s:13:"list_template";s:0:"";s:13:"show_template";s:0:"";s:13:"page_template";s:13:"pages_product";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1, 0),
(16, 3, '单品', '', 'Pages', '', '', '单品', 'a:7:{s:8:"page_num";s:0:"";s:13:"list_template";s:0:"";s:13:"show_template";s:0:"";s:13:"page_template";s:13:"pages_product";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1, 0),
(17, 3, '蓝色畅想', '', 'Pages', '', '', '蓝色畅想', 'a:7:{s:8:"page_num";s:0:"";s:13:"list_template";s:0:"";s:13:"show_template";s:0:"";s:13:"page_template";s:13:"pages_product";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1, 0),
(18, 2, '经典仪器', '', 'Pages', '', '', '经典仪器', 'a:7:{s:8:"page_num";s:0:"";s:13:"list_template";s:0:"";s:13:"show_template";s:0:"";s:13:"page_template";s:10:"pages_yiqi";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1, 0),
(19, 2, '经典仪器2', '', 'Pages', '', '', '经典仪器2', 'a:7:{s:8:"page_num";s:0:"";s:13:"list_template";s:0:"";s:13:"show_template";s:0:"";s:13:"page_template";s:10:"pages_yiqi";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1, 0),
(20, 4, '国际经典SPA', '', 'Pages', '', '', '国际经典SPA', 'a:7:{s:8:"page_num";s:0:"";s:13:"list_template";s:0:"";s:13:"show_template";s:0:"";s:13:"page_template";s:13:"pages_xiangmu";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1, 0),
(21, 4, '经典项目', '', 'Pages', '', '', '经典项目', 'a:7:{s:8:"page_num";s:0:"";s:13:"list_template";s:0:"";s:13:"show_template";s:0:"";s:13:"page_template";s:13:"pages_xiangmu";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1, 0),
(22, 4, '男士项目', '', 'Pages', '', '', '男士项目', 'a:7:{s:8:"page_num";s:0:"";s:13:"list_template";s:0:"";s:13:"show_template";s:0:"";s:13:"page_template";s:13:"pages_xiangmu";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1, 0),
(23, 5, '私人定制', 'KANGSHUAI', 'Pages', '', 'Content/2015-07-17/55a8af93db17b.png', '专人、专项、打造您的私人财富', 'a:7:{s:8:"page_num";s:0:"";s:13:"list_template";s:0:"";s:13:"show_template";s:0:"";s:13:"page_template";s:0:"";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1, 0),
(24, 5, '智囊团扶持', 'FUCHI', 'Pages', '', 'Content/2015-07-17/55a8af9f31d12.png', '专家团队、专项管理', 'a:7:{s:8:"page_num";s:0:"";s:13:"list_template";s:0:"";s:13:"show_template";s:0:"";s:13:"page_template";s:0:"";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1, 0),
(25, 7, '联系我们', 'Contact us', 'Pages', '', '', '', 'a:7:{s:8:"page_num";s:0:"";s:13:"list_template";s:0:"";s:13:"show_template";s:0:"";s:13:"page_template";s:0:"";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1, 0),
(26, 7, '在线留言', 'MESSAGE', 'Pages', '', '', '', 'a:7:{s:8:"page_num";s:0:"";s:13:"list_template";s:0:"";s:13:"show_template";s:0:"";s:13:"page_template";s:13:"pages_message";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1, 0),
(27, 5, '三维立体式营销', 'YINGXIAO', 'Pages', '', 'Content/2015-07-17/55a8afa96634a.png', '保客源、保业绩、保经营', 'a:7:{s:8:"page_num";s:0:"";s:13:"list_template";s:0:"";s:13:"show_template";s:0:"";s:13:"page_template";s:0:"";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1, 0),
(28, 5, '龙翔美校', 'MEIXIAO', 'Pages', '', 'Content/2015-07-17/55a8afb456bbc.png', '每年输出6000余行业精英', 'a:7:{s:8:"page_num";s:0:"";s:13:"list_template";s:0:"";s:13:"show_template";s:0:"";s:13:"page_template";s:0:"";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='系统配置表' AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `jfsd_config`
--

INSERT INTO `jfsd_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1, 'WEB_SITE_TITLE', 0, '网站标题', 1, '', '网站标题前台显示标题', 1378898976, 1436345744, 1, '金方时代内容管理框架1', 0),
(2, 'WEB_SITE_DESCRIPTION', 2, '网站描述', 1, '', '网站搜索引擎描述', 1378898976, 1379235841, 1, '金方时代内容管理框架', 1),
(3, 'WEB_SITE_KEYWORD', 2, '网站关键字', 1, '', '网站搜索引擎关键字', 1378898976, 1381390100, 1, '金方时代内容管理框架', 8),
(4, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1379235296, 1, '1', 1),
(5, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', 2),
(6, 'WEB_SITE_ICP', 1, '网站备案号', 1, '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', 1378900335, 1379235859, 1, '1111', 9),
(7, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1384418383, 1, '1:基本\r\n2:前台\r\n3:用户\r\n4:系统', 4),
(9, 'ADMIN_LIST_ROWS', 0, '后台每页记录数', 4, '', '后台数据每页显示记录数，默认10', 1379503896, 1436427099, 1, '15', 20),
(10, 'USER_ALLOW_REGISTER', 4, '是否允许用户注册', 3, '0:关闭注册\r\n1:允许注册', '是否开放用户注册', 1379504487, 1379504580, 1, '1', 3),
(12, 'SHOW_LIST_ROWS', 0, '前台显示列表显示数量', 2, '', '前台显示列表显示数量：默认', 1386645376, 1437048910, 1, '9', 0),
(13, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '', 12),
(14, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 4, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '0', 1),
(15, 'IS_ROOT', 3, '超级管理员', 4, '', '超级管理员用户uid', 1435728710, 1435728871, 1, '1\r\n2', 0),
(16, 'CATEGORY_TYPE', 3, '栏目类型', 4, '', '栏目类型', 1436250193, 1436250220, 1, 'News:新闻\r\nPages:单页\r\nProduct:产品', 0),
(17, 'NEWS_IMAGE_PX', 3, '新闻图片尺寸', 4, '', '建议新闻图片尺寸', 1436508822, 1436508919, 1, 'width:100\r\nheight:200', 0),
(18, 'PRODUCT_IMAGE_PX', 3, '产品图片尺寸', 4, '', '建议产品图片尺寸', 1436508899, 1436508947, 1, 'width:100\r\nheight:200', 0),
(19, 'BANNER_TYPE', 3, '广告位类型', 4, '', '广告位类型', 1436770102, 1436770143, 1, '1:单条\r\n2:多条', 0),
(20, 'COPYRIGHT', 2, '底部copyRight', 2, '', '底部copyRight', 1437116639, 1437116639, 1, '0咨询热线：15321543866     联系人：杜女士     地址：北京市三台区时代风帆大厦2-2702\r\n<br />\r\n	版权所有：北京欧韵美业管理咨询有限公司     京ICP 证070504 号 京网文[2015]1078-1127 京公网安备：110105001275', 0);

-- --------------------------------------------------------

--
-- 表的结构 `jfsd_link`
--

CREATE TABLE IF NOT EXISTS `jfsd_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT 'URL',
  `thumb` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='友情链接' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jfsd_message`
--

CREATE TABLE IF NOT EXISTS `jfsd_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `tel` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `content` varchar(9999) NOT NULL DEFAULT '',
  `extend` varchar(9999) NOT NULL DEFAULT '' COMMENT '扩展字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='在线留言' AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `jfsd_message`
--

INSERT INTO `jfsd_message` (`id`, `title`, `tel`, `email`, `content`, `extend`, `create_time`, `update_time`, `status`) VALUES
(19, '万方研发服务中心', '15044858848', '5723008080@qq.com', '222222222222222222222222222222222', 'a:1:{s:7:"address";s:24:"内蒙古巴彦淖尔市";}', 1437375300, 0, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='新闻数据表' AUTO_INCREMENT=169 ;

--
-- 转存表中的数据 `jfsd_news`
--

INSERT INTO `jfsd_news` (`id`, `catid`, `title`, `description`, `thumb`, `content`, `sort`, `create_time`, `update_time`, `status`) VALUES
(20, 14, '金牌护理员', '金牌护理员金牌护理员金牌护理员金牌护理员金牌护理员金牌护理员金牌护理员金牌护理员金牌护理员金牌护理员金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '&lt;p&gt;金牌护理员&lt;/p&gt;', 0, 1437033290, 1437378492, 1),
(21, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '&lt;p&gt;金牌护理员&lt;/p&gt;', 0, 1437033290, 1437045331, 1),
(22, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '&lt;p&gt;金牌护理员&lt;/p&gt;', 0, 1437033290, 1437045331, 1),
(23, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '&lt;p&gt;金牌护理员&lt;/p&gt;', 0, 1437033290, 1437045331, 1),
(24, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '&lt;p&gt;金牌护理员&lt;/p&gt;', 0, 1437033290, 1437045331, 1),
(25, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(26, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(27, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(28, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(29, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(30, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(31, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(32, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(33, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(34, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(35, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(36, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(37, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(38, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(39, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(40, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(41, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(42, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(43, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(44, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(45, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(46, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(47, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(48, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(49, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(50, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(51, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(52, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(53, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(54, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(55, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(56, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(57, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(58, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(59, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(60, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(61, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(62, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(63, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(64, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(65, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(66, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(67, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(68, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(69, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(70, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(71, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(72, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(73, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(74, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(75, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(76, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(77, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(78, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(79, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(80, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(81, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(82, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(83, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(84, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(85, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(86, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(87, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(88, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(89, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(90, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(91, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(92, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(93, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(94, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(95, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(96, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(97, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(98, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(99, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(100, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(101, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(102, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(103, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(104, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(105, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(106, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(107, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(108, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(109, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(110, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(111, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(112, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(113, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(114, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(115, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(116, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(117, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(118, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(119, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(120, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(121, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(122, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(123, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(124, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(125, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(126, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(127, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(128, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(129, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(130, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(131, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(132, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(133, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(134, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(135, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(136, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(137, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(138, 14, '金牌护理员', '金牌护理员', 'Content/2015-07-16/55a7924fb948e.png', '<p>金牌护理员</p>', 0, 1437033290, 1437045331, 1),
(139, 8, '前厅接待', '', 'Content/2015-07-17/55a89d67d3fe2.png', '&lt;p&gt;asdfasdfadsfadsfadfasdfasdfasdfsadf&lt;/p&gt;', 0, 1437113715, 0, 1),
(140, 8, '前厅接待', '', 'Content/2015-07-17/55a89d67d3fe2.png', '&lt;p&gt;asdfasdfadsfadsfadfasdfasdfasdfsadf&lt;/p&gt;', 0, 1437113715, 0, 1),
(141, 8, '前厅接待', '', 'Content/2015-07-17/55a89d67d3fe2.png', '<p>asdfasdfadsfadsfadfasdfasdfasdfsadf</p>', 0, 1437113715, 0, 1),
(142, 8, '前厅接待', '', 'Content/2015-07-17/55a89d67d3fe2.png', '<p>asdfasdfadsfadsfadfasdfasdfasdfsadf</p>', 0, 1437113715, 0, 1),
(143, 8, '前厅接待', '', 'Content/2015-07-17/55a89d67d3fe2.png', '<p>asdfasdfadsfadsfadfasdfasdfasdfsadf</p>', 0, 1437113715, 0, 1),
(144, 8, '前厅接待', '', 'Content/2015-07-17/55a89d67d3fe2.png', '<p>asdfasdfadsfadsfadfasdfasdfasdfsadf</p>', 0, 1437113715, 0, 1),
(145, 8, '前厅接待', '', 'Content/2015-07-17/55a89d67d3fe2.png', '<p>asdfasdfadsfadsfadfasdfasdfasdfsadf</p>', 0, 1437113715, 0, 1),
(146, 10, '前厅接待', '', 'Content/2015-07-17/55a89d67d3fe2.png', '&lt;p&gt;asdfasdfadsfadsfadfasdfasdfasdfsadf&lt;/p&gt;', 0, 1437113715, 1437114227, 1),
(147, 10, '前厅接待', '', 'Content/2015-07-17/55a89d67d3fe2.png', '&lt;p&gt;asdfasdfadsfadsfadfasdfasdfasdfsadf&lt;/p&gt;', 0, 1437113715, 1437114190, 1),
(148, 10, '前厅接待', '', 'Content/2015-07-17/55a89d67d3fe2.png', '&lt;p&gt;asdfasdfadsfadsfadfasdfasdfasdfsadf&lt;/p&gt;', 0, 1437113715, 1437114178, 1),
(149, 10, '前厅接待', '', 'Content/2015-07-17/55a89d67d3fe2.png', '&lt;p&gt;asdfasdfadsfadsfadfasdfasdfasdfsadf&lt;/p&gt;', 0, 1437113715, 1437114170, 1),
(150, 10, '前厅接待', '', 'Content/2015-07-17/55a89d67d3fe2.png', '&lt;p&gt;asdfasdfadsfadsfadfasdfasdfasdfsadf&lt;/p&gt;', 0, 1437113715, 1437114160, 1),
(151, 9, '“我，为美丽代言”大型选秀活动总决赛圆满举行', '“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......', 'Content/2015-07-17/55a8a2b467401.jpg', '&lt;p&gt;&lt;span style=&quot;color: rgb(141, 141, 141); font-family: 宋体; font-size: 12px; line-height: 25px; background-color: rgb(255, 255, 255);&quot;&gt;“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......&lt;/span&gt;&lt;/p&gt;', 0, 1437115064, 0, 1),
(152, 9, '“我，为美丽代言”大型选秀活动总决赛圆满举行', '“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......', 'Content/2015-07-17/55a8a2b467401.jpg', '&lt;p&gt;&lt;span style=&quot;color: rgb(141, 141, 141); font-family: 宋体; font-size: 12px; line-height: 25px; background-color: rgb(255, 255, 255);&quot;&gt;“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......&lt;/span&gt;&lt;/p&gt;', 0, 1437115064, 0, 1),
(153, 9, '“我，为美丽代言”大型选秀活动总决赛圆满举行', '“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......', 'Content/2015-07-17/55a8a2b467401.jpg', '&lt;p&gt;&lt;span style=&quot;color: rgb(141, 141, 141); font-family: 宋体; font-size: 12px; line-height: 25px; background-color: rgb(255, 255, 255);&quot;&gt;“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......&lt;/span&gt;&lt;/p&gt;', 0, 1437115064, 0, 1),
(154, 9, '“我，为美丽代言”大型选秀活动总决赛圆满举行', '“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......', 'Content/2015-07-17/55a8a2b467401.jpg', '&lt;p&gt;&lt;span style=&quot;color: rgb(141, 141, 141); font-family: 宋体; font-size: 12px; line-height: 25px; background-color: rgb(255, 255, 255);&quot;&gt;“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......&lt;/span&gt;&lt;/p&gt;', 0, 1437115064, 0, 1),
(155, 9, '“我，为美丽代言”大型选秀活动总决赛圆满举行', '“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......', 'Content/2015-07-17/55a8a2b467401.jpg', '&lt;p&gt;&lt;span style=&quot;color: rgb(141, 141, 141); font-family: 宋体; font-size: 12px; line-height: 25px; background-color: rgb(255, 255, 255);&quot;&gt;“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......&lt;/span&gt;&lt;/p&gt;', 0, 1437115064, 0, 1),
(156, 9, '“我，为美丽代言”大型选秀活动总决赛圆满举行', '“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......', 'Content/2015-07-17/55a8a2b467401.jpg', '&lt;p&gt;&lt;span style=&quot;color: rgb(141, 141, 141); font-family: 宋体; font-size: 12px; line-height: 25px; background-color: rgb(255, 255, 255);&quot;&gt;“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......&lt;/span&gt;&lt;/p&gt;', 0, 1437115064, 0, 1),
(157, 9, '“我，为美丽代言”大型选秀活动总决赛圆满举行', '“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......', 'Content/2015-07-17/55a8a2b467401.jpg', '&lt;p&gt;&lt;span style=&quot;color: rgb(141, 141, 141); font-family: 宋体; font-size: 12px; line-height: 25px; background-color: rgb(255, 255, 255);&quot;&gt;“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......&lt;/span&gt;&lt;/p&gt;', 0, 1437115064, 0, 1),
(158, 9, '“我，为美丽代言”大型选秀活动总决赛圆满举行', '“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......', 'Content/2015-07-17/55a8a2b467401.jpg', '&lt;p&gt;&lt;span style=&quot;color: rgb(141, 141, 141); font-family: 宋体; font-size: 12px; line-height: 25px; background-color: rgb(255, 255, 255);&quot;&gt;“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......&lt;/span&gt;&lt;/p&gt;', 0, 1437115064, 0, 1),
(159, 9, '“我，为美丽代言”大型选秀活动总决赛圆满举行', '“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......', 'Content/2015-07-17/55a8a2b467401.jpg', '&lt;p&gt;&lt;span style=&quot;color: rgb(141, 141, 141); font-family: 宋体; font-size: 12px; line-height: 25px; background-color: rgb(255, 255, 255);&quot;&gt;“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......&lt;/span&gt;&lt;/p&gt;', 0, 1437115064, 0, 1),
(160, 9, '“我，为美丽代言”大型选秀活动总决赛圆满举行', '“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......', 'Content/2015-07-17/55a8a2b467401.jpg', '&lt;p&gt;&lt;span style=&quot;color: rgb(141, 141, 141); font-family: 宋体; font-size: 12px; line-height: 25px; background-color: rgb(255, 255, 255);&quot;&gt;“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......&lt;/span&gt;&lt;/p&gt;', 0, 1437115064, 0, 1),
(161, 9, '“我，为美丽代言”大型选秀活动总决赛圆满举行', '“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......', 'Content/2015-07-17/55a8a2b467401.jpg', '&lt;p&gt;&lt;span style=&quot;color: rgb(141, 141, 141); font-family: 宋体; font-size: 12px; line-height: 25px; background-color: rgb(255, 255, 255);&quot;&gt;“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......&lt;/span&gt;&lt;/p&gt;', 0, 1437115064, 0, 1),
(162, 9, '“我，为美丽代言”大型选秀活动总决赛圆满举行', '“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......', 'Content/2015-07-17/55a8a2b467401.jpg', '&lt;p&gt;&lt;span style=&quot;color: rgb(141, 141, 141); font-family: 宋体; font-size: 12px; line-height: 25px; background-color: rgb(255, 255, 255);&quot;&gt;“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......&lt;/span&gt;&lt;/p&gt;', 0, 1437115064, 0, 1),
(163, 9, '“我，为美丽代言”大型选秀活动总决赛圆满举行', '“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......', 'Content/2015-07-17/55a8a2b467401.jpg', '&lt;p&gt;&lt;span style=&quot;color: rgb(141, 141, 141); font-family: 宋体; font-size: 12px; line-height: 25px; background-color: rgb(255, 255, 255);&quot;&gt;“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......&lt;/span&gt;&lt;/p&gt;', 0, 1437115064, 0, 1),
(164, 9, '“我，为美丽代言”大型选秀活动总决赛圆满举行', '“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......', 'Content/2015-07-17/55a8a2b467401.jpg', '&lt;p&gt;&lt;span style=&quot;color: rgb(141, 141, 141); font-family: 宋体; font-size: 12px; line-height: 25px; background-color: rgb(255, 255, 255);&quot;&gt;“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......&lt;/span&gt;&lt;/p&gt;', 0, 1437115064, 0, 1),
(165, 9, '“我，为美丽代言”大型选秀活动总决赛圆满举行', '“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......', 'Content/2015-07-17/55a8a2b467401.jpg', '&lt;p&gt;&lt;span style=&quot;color: rgb(141, 141, 141); font-family: 宋体; font-size: 12px; line-height: 25px; background-color: rgb(255, 255, 255);&quot;&gt;“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......&lt;/span&gt;&lt;/p&gt;', 0, 1437115064, 0, 1),
(166, 9, '“我，为美丽代言”大型选秀活动总决赛圆满举行', '“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......', 'Content/2015-07-17/55a8a2b467401.jpg', '&lt;p&gt;&lt;span style=&quot;color: rgb(141, 141, 141); font-family: 宋体; font-size: 12px; line-height: 25px; background-color: rgb(255, 255, 255);&quot;&gt;“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......&lt;/span&gt;&lt;/p&gt;', 0, 1437115064, 0, 1),
(167, 9, '“我，为美丽代言”大型选秀活动总决赛圆满举行', '“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......', 'Content/2015-07-17/55a8a2b467401.jpg', '&lt;p&gt;&lt;span style=&quot;color: rgb(141, 141, 141); font-family: 宋体; font-size: 12px; line-height: 25px; background-color: rgb(255, 255, 255);&quot;&gt;“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......&lt;/span&gt;&lt;/p&gt;', 0, 1437115064, 0, 1),
(168, 9, '“我，为美丽代言”大型选秀活动总决赛圆满举行', '“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......', 'Content/2015-07-17/55a8a2b467401.jpg', '&lt;p&gt;&lt;span style=&quot;color: rgb(141, 141, 141); font-family: 宋体; font-size: 12px; line-height: 25px; background-color: rgb(255, 255, 255);&quot;&gt;“娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......&lt;/span&gt;&lt;/p&gt;', 0, 1437115064, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `jfsd_pages`
--

CREATE TABLE IF NOT EXISTS `jfsd_pages` (
  `catid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '对应栏目id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `sort` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='单页数据表';

--
-- 转存表中的数据 `jfsd_pages`
--

INSERT INTO `jfsd_pages` (`catid`, `title`, `content`, `sort`) VALUES
(4, '', '', 0),
(6, '', '22222222222222222222222222222222', 0),
(11, '', '&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150716/55a768bc4d6e4.png&quot; width=&quot;696&quot; height=&quot;124&quot; title=&quot;55a768bc4d6e4.png&quot; alt=&quot;tp4.png&quot;/&gt;\r\n				 &amp;nbsp; &amp;nbsp; &amp;nbsp;欧韵娅诗/Olaysha.十二愿SPA空间是定位于高端养生、拥有七大核心特色项目的SPA品牌，在行业内率先打造了高端女士SPA与男士奢华SPA养生相结合的综合性SPA馆，公司根植于美容业这方沃土，总揽国内外美容业发展的大势所趋，秉承着对中国美业发展的成熟把握，沉潜到中国美业执着前行的根脉所系，创造业界良好的生态软环境。该品牌以博大精深的藏医盛典《四部医典》为核心背景，深度融合欧洲生物学理论，结合中医脏腑经络学，精心打造了匠心独具的七大核心特色SPA养生疗程，再辅以使人清心涤虑的十二个美好祝愿，深度调理心理要素，从而以内养外，摒弃传统SPA不能标本同步调理的弊端，是在国际SPA沃土上盛开的一朵奇葩，是医学、艺术与美容的完美融合。&lt;br/&gt;欧韵娅诗/Olaysha.十二愿SPA空间是定位于高端养生、拥有七大核心特色项目的SPA品牌，在行业内率先打造了高端女士SPA与男士奢华SPA养生相结合的综合性SPA馆，公司根植于美容业这方沃土，总揽国内外美容业发展的大势所趋，秉承着对中国美业发展的成熟把握，沉潜到中国美业执着前行的根脉所系，创造业界良好的生态软环境。该品牌以博大精深的藏医盛典《四部医典》为核心背景，深度融合欧洲生物学理论，结合中医脏腑经络学，精心打造了匠心独具的七大核心特色SPA养生疗程，再辅以使人清心涤虑的十二个美好祝愿，深度调理心理要素，从而以内养外，摒弃传统SPA不能标本同步调理的弊端，是在国际SPA沃土上盛开的一朵奇葩，是医&lt;/p&gt;&lt;p&gt;&lt;strong&gt;企业介绍&lt;/strong&gt;&lt;/p&gt;', 0),
(12, '', '&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150716/55a768bc4d6e4.png&quot; width=&quot;696&quot; height=&quot;124&quot; title=&quot;55a768bc4d6e4.png&quot; alt=&quot;tp4.png&quot;/&gt;\r\n				 &amp;nbsp; &amp;nbsp; &amp;nbsp;欧韵娅诗/Olaysha.十二愿SPA空间是定位于高端养生、拥有七大核心特色项目的SPA品牌，在行业内率先打造了高端女士SPA与男士奢华SPA养生相结合的综合性SPA馆，公司根植于美容业这方沃土，总揽国内外美容业发展的大势所趋，秉承着对中国美业发展的成熟把握，沉潜到中国美业执着前行的根脉所系，创造业界良好的生态软环境。该品牌以博大精深的藏医盛典《四部医典》为核心背景，深度融合欧洲生物学理论，结合中医脏腑经络学，精心打造了匠心独具的七大核心特色SPA养生疗程，再辅以使人清心涤虑的十二个美好祝愿，深度调理心理要素，从而以内养外，摒弃传统SPA不能标本同步调理的弊端，是在国际SPA沃土上盛开的一朵奇葩，是医学、艺术与美容的完美融合。&lt;br/&gt;欧韵娅诗/Olaysha.十二愿SPA空间是定位于高端养生、拥有七大核心特色项目的SPA品牌，在行业内率先打造了高端女士SPA与男士奢华SPA养生相结合的综合性SPA馆，公司根植于美容业这方沃土，总揽国内外美容业发展的大势所趋，秉承着对中国美业发展的成熟把握，沉潜到中国美业执着前行的根脉所系，创造业界良好的生态软环境。该品牌以博大精深的藏医盛典《四部医典》为核心背景，深度融合欧洲生物学理论，结合中医脏腑经络学，精心打造了匠心独具的七大核心特色SPA养生疗程，再辅以使人清心涤虑的十二个美好祝愿，深度调理心理要素，从而以内养外，摒弃传统SPA不能标本同步调理的弊端，是在国际SPA沃土上盛开的一朵奇葩，是医&lt;/p&gt;&lt;p&gt;&lt;strong&gt;企业文化&lt;/strong&gt;&lt;/p&gt;', 0),
(13, '', '&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150716/55a768bc4d6e4.png&quot; width=&quot;696&quot; height=&quot;124&quot; title=&quot;55a768bc4d6e4.png&quot; alt=&quot;tp4.png&quot;/&gt;\r\n				 &amp;nbsp; &amp;nbsp; &amp;nbsp;欧韵娅诗/Olaysha.十二愿SPA空间是定位于高端养生、拥有七大核心特色项目的SPA品牌，在行业内率先打造了高端女士SPA与男士奢华SPA养生相结合的综合性SPA馆，公司根植于美容业这方沃土，总揽国内外美容业发展的大势所趋，秉承着对中国美业发展的成熟把握，沉潜到中国美业执着前行的根脉所系，创造业界良好的生态软环境。该品牌以博大精深的藏医盛典《四部医典》为核心背景，深度融合欧洲生物学理论，结合中医脏腑经络学，精心打造了匠心独具的七大核心特色SPA养生疗程，再辅以使人清心涤虑的十二个美好祝愿，深度调理心理要素，从而以内养外，摒弃传统SPA不能标本同步调理的弊端，是在国际SPA沃土上盛开的一朵奇葩，是医学、艺术与美容的完美融合。&lt;br/&gt;欧韵娅诗/Olaysha.十二愿SPA空间是定位于高端养生、拥有七大核心特色项目的SPA品牌，在行业内率先打造了高端女士SPA与男士奢华SPA养生相结合的综合性SPA馆，公司根植于美容业这方沃土，总揽国内外美容业发展的大势所趋，秉承着对中国美业发展的成熟把握，沉潜到中国美业执着前行的根脉所系，创造业界良好的生态软环境。该品牌以博大精深的藏医盛典《四部医典》为核心背景，深度融合欧洲生物学理论，结合中医脏腑经络学，精心打造了匠心独具的七大核心特色SPA养生疗程，再辅以使人清心涤虑的十二个美好祝愿，深度调理心理要素，从而以内养外，摒弃传统SPA不能标本同步调理的弊端，是在国际SPA沃土上盛开的一朵奇葩，是医&lt;/p&gt;&lt;p&gt;&lt;strong&gt;企业荣誉&lt;/strong&gt;&lt;/p&gt;', 0),
(15, '', '&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85b94e9c41.png&quot; style=&quot;&quot; title=&quot;55a85b94e9c41.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85b95001fc.png&quot; style=&quot;&quot; title=&quot;55a85b95001fc.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85b950bd7e.png&quot; style=&quot;&quot; title=&quot;55a85b950bd7e.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85b9526b35.png&quot; style=&quot;&quot; title=&quot;55a85b9526b35.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85b9533e28.png&quot; style=&quot;&quot; title=&quot;55a85b9533e28.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0),
(16, '', '&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85b94e9c41.png&quot; style=&quot;&quot; title=&quot;55a85b94e9c41.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85b95001fc.png&quot; style=&quot;&quot; title=&quot;55a85b95001fc.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85b950bd7e.png&quot; style=&quot;&quot; title=&quot;55a85b950bd7e.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85b9526b35.png&quot; style=&quot;&quot; title=&quot;55a85b9526b35.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85b9533e28.png&quot; style=&quot;&quot; title=&quot;55a85b9533e28.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0),
(17, '', '&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85b94e9c41.png&quot; style=&quot;&quot; title=&quot;55a85b94e9c41.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85b95001fc.png&quot; style=&quot;&quot; title=&quot;55a85b95001fc.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85b950bd7e.png&quot; style=&quot;&quot; title=&quot;55a85b950bd7e.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85b9526b35.png&quot; style=&quot;&quot; title=&quot;55a85b9526b35.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85b9533e28.png&quot; style=&quot;&quot; title=&quot;55a85b9533e28.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0),
(18, '', '&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85889581d3.png&quot; title=&quot;55a85889581d3.png&quot; alt=&quot;yq7.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a858896490e.png&quot; style=&quot;&quot; title=&quot;55a858896490e.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a8588971819.png&quot; style=&quot;&quot; title=&quot;55a8588971819.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a858897fe94.png&quot; style=&quot;&quot; title=&quot;55a858897fe94.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a858898ece0.png&quot; style=&quot;&quot; title=&quot;55a858898ece0.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a8588998922.png&quot; style=&quot;&quot; title=&quot;55a8588998922.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85889a44a5.png&quot; style=&quot;&quot; title=&quot;55a85889a44a5.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0),
(19, '', '&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85889581d3.png&quot; title=&quot;55a85889581d3.png&quot; alt=&quot;yq7.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a858896490e.png&quot; style=&quot;&quot; title=&quot;55a858896490e.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a8588971819.png&quot; style=&quot;&quot; title=&quot;55a8588971819.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a858897fe94.png&quot; style=&quot;&quot; title=&quot;55a858897fe94.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a858898ece0.png&quot; style=&quot;&quot; title=&quot;55a858898ece0.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a8588998922.png&quot; style=&quot;&quot; title=&quot;55a8588998922.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85889a44a5.png&quot; style=&quot;&quot; title=&quot;55a85889a44a5.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0),
(20, '', '&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85dbc56ae3.png&quot; style=&quot;&quot; title=&quot;55a85dbc56ae3.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85dbc61e96.png&quot; style=&quot;&quot; title=&quot;55a85dbc61e96.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85dbc6de01.png&quot; style=&quot;&quot; title=&quot;55a85dbc6de01.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85dbc77e2b.png&quot; style=&quot;&quot; title=&quot;55a85dbc77e2b.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85dbc8511e.png&quot; style=&quot;&quot; title=&quot;55a85dbc8511e.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0),
(21, '', '&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85dbc56ae3.png&quot; style=&quot;&quot; title=&quot;55a85dbc56ae3.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85dbc61e96.png&quot; style=&quot;&quot; title=&quot;55a85dbc61e96.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85dbc6de01.png&quot; style=&quot;&quot; title=&quot;55a85dbc6de01.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85dbc77e2b.png&quot; style=&quot;&quot; title=&quot;55a85dbc77e2b.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85dbc8511e.png&quot; style=&quot;&quot; title=&quot;55a85dbc8511e.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0),
(22, '', '&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85dbc56ae3.png&quot; style=&quot;&quot; title=&quot;55a85dbc56ae3.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85dbc61e96.png&quot; style=&quot;&quot; title=&quot;55a85dbc61e96.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85dbc6de01.png&quot; style=&quot;&quot; title=&quot;55a85dbc6de01.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85dbc77e2b.png&quot; style=&quot;&quot; title=&quot;55a85dbc77e2b.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85dbc8511e.png&quot; style=&quot;&quot; title=&quot;55a85dbc8511e.png&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0),
(25, '', '&lt;p&gt;&lt;img src=&quot;/Uploads/ueditor/image/20150717/55a85f7261ae2.png&quot; width=&quot;696&quot; height=&quot;274&quot; class=&quot;imggg&quot; title=&quot;55a85f7261ae2.png&quot; alt=&quot;map.png&quot;/&gt;&lt;/p&gt;&lt;table width=&quot;600&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; class=&quot;table&quot;&gt;&lt;tbody&gt;&lt;tr class=&quot;firstRow&quot;&gt;&lt;td&gt;北京欧韵美业管理咨询有限公司&lt;/td&gt;&lt;td&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;联系人：杜女士&lt;/td&gt;&lt;td&gt;手机：15321543866&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;电话：010-88888888&lt;/td&gt;&lt;td&gt;邮箱：ouyunmeiye@163.com&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;传真：010-88888888&lt;/td&gt;&lt;td&gt;地址：北京市丰台区角门西时代风帆大厦2-2702&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;', 0),
(26, '', '&lt;p&gt;&lt;iframe src=&quot;http://www.thinkphp.net/index.php/Index/message.html&quot; width=&quot;400&quot; height=&quot;400&quot; scrolling=&quot;no&quot; frameborder=&quot;0&quot; align=&quot;&quot;&gt;&lt;/iframe&gt;&lt;/p&gt;', 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='推荐位数据表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `jfsd_position`
--

INSERT INTO `jfsd_position` (`id`, `type`, `name`, `data`, `sort`) VALUES
(1, 'News', '店面展示推荐', '16,15', 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品数据表' AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
