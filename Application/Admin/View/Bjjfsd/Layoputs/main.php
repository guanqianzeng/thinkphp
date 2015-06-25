<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="__PUBLIC__/Admin/css/style.css" rel="stylesheet" type="text/css" />
    <link href="__PUBLIC__/Admin/css/tablestyle.css" rel="stylesheet" type="text/css" />
    <script language="javascript" src="__PUBLIC__/Admin/js/jquery-1.4.2.min.js"></script>
    <script language="javascript" src="__PUBLIC__/Admin/js/js.js"></script>

</head>
<body>

<?php
    echo $aaa;
?>
<div class="container">
    <div class="head">
        <div class="head1">欢迎登录后台管理系统！</div>
        <div class="head2">
            <a href="#" class="xz"><img src="__PUBLIC__/Admin/images/ttb1.png" width="24" height="23" />网站首页<a href="<?php echo U("Administrator/index")?>">aaaa</a></a>
            <a href="#"><img src="__PUBLIC__/Admin/images/ttb2.png" width="24" height="23" />系统管理</a>
            <a href="#"><img src="__PUBLIC__/Admin/images/ttb3.png" width="24" height="23" />帮助中心</a>
            <a href="#"><img src="__PUBLIC__/Admin/images/ttb4.png" width="24" height="23" />安全退出</a>
        </div>
    </div>
    <div class="main">
        <include file="Public:left" />

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
            {__CONTENT__}
        <div class="copyRight">北京金方时代科技有限公司&nbsp;&nbsp;&nbsp; 版权所有 Inc All Rights Reserved  &nbsp;&nbsp;&nbsp;联系电话：朝阳营业部：010-51654311 &nbsp;&nbsp;&nbsp;  丰台营业部：010-51654321 &nbsp;&nbsp;&nbsp;  海淀营业部：010-51654300</div>
    </div>
    <div class="clear"></div>
</div>
</div>
</body>
</html>