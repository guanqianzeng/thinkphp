<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo C('WEB_SITE_TITLE');?></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/Public/Admin/css/style.css" rel="stylesheet" type="text/css" />
<link href="/Public/Admin/css/tablestyle.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="/Public/Admin/js/jquery-1.4.2.min.js"></script>
<script language="javascript" src="/Public/Admin/js/js.js"></script>

</head>
<body>
<div class="container">
	<div class="head">
    	<div class="head1"><?php echo C('WEB_SITE_TITLE');?></div>
        <div class="head2">
        	<a href="<?php echo U('Index/index');?>" class="xz"><img src="/Public/Admin/images/ttb1.png" width="24" height="23" />网站首页</a>
            <a href="<?php echo U('Index/index');?>"><img src="/Public/Admin/images/ttb2.png" width="24" height="23" />系统管理</a>
            <a href="<?php echo U('Index/help');?>"><img src="/Public/Admin/images/ttb3.png" width="24" height="23" />帮助中心</a>
            <a href="<?php echo U('Public/logout');?>"><img src="/Public/Admin/images/ttb4.png" width="24" height="23" />安全退出</a>
        </div>
    </div>
    <div class="main">
    	<div class="mleft">
        	<ul class="ul">
            	<li><a href="<?php echo U('Config/index');?>">信息管理</a>
                	<ul class="ul1">
                    	<li class="xz"><a href="<?php echo U('Config/group');?>">基本信息</a></li>
                    	<li class="xz"><a href="<?php echo U('Config/index');?>">配置管理</a></li>
                        <li><a href="02.html">幻灯管理</a></li>
                        <li><a href="#">客户列表</a></li>
                        <li><a href="03.html">客户图片</a></li>
                        <li><a href="#">单页管理</a></li>
                        <div class="lt"></div>
                    </ul>
                </li>
                <li><a href="#">新闻管理</a>
                	<ul class="ul1">
                    	<li><a href="05.html">分类管理</a></li>
                        <li><a href="04.html">信息管理</a></li>
                        <div class="lt"></div>
                    </ul>
                </li>
                <li><a href="#">图文管理</a>
                	<ul class="ul1">
                    	<li><a href="05.html">分类管理</a></li>
                        <li><a href="07.html">信息管理</a></li>
                        <div class="lt"></div>
                    </ul>
                </li>
                <li><a href="#">单页管理</a></li>
                <li><a href="#">广告管理</a>
                	<ul class="ul1">
                    	<li><a href="#">关于我们</a></li>
                        <li><a href="14.html">资讯中心</a></li>
                        <li><a href="#">业务体系</a></li>
                        <li><a href="#">成功案例</a></li>
                        <li><a href="16.html">关于我们左侧</a></li>
                        <div class="lt"></div>
                    </ul>
                </li>
                <li><a href="#">系统管理</a>
                	<ul class="ul1">
                    	<li><a href="11.html">管理员管理</a></li>
                        <div class="lt"></div>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="mright">


        	<div class="mrtop">
            	<div class="breadCrumb">
                	您当前的位置： <a href="#">首页</a> &gt; <a href="#">信息管理</a> &gt; <a href="#">基本信息</a>
                </div>
                <div class="mrtr">
                	管理员：xxx
                </div>
                <div class="clear"></div>
            </div>
            <div class="mrbot">
            	<div class="mrbot1">
                	<div class="mrbt1">基本信息</div>
                    <div class="mrnr1">
                    	<div style="min-height:500px;">
    <h2><?php echo date('Y-m-d H:i:s');?></h2>
</div>

                    </div>
                </div>
            </div>



            <div class="copyRight">北京金方时代科技有限公司&nbsp;&nbsp;&nbsp; 版权所有 Inc All Rights Reserved  &nbsp;&nbsp;&nbsp;联系电话：朝阳营业部：010-51654311 &nbsp;&nbsp;&nbsp;  丰台营业部：010-51654321 &nbsp;&nbsp;&nbsp;  海淀营业部：010-51654300</div>
        </div>

        <div class="clear"></div>
    </div>
</div>
</body>
</html>