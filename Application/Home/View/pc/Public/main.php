<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>{:C('WEB_SITE_TITLE')}</title>
<link href="__HOME__css/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="__HOME__js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script language="javascript" src="__HOME__js/js.js" type="text/javascript"></script>
<script language="javascript" src="__HOME__js/lanrentuku.js"></script>
</head>

<body>
	<div class="continer">
		<block name="header">
		<div class="head">
			<div class="head1">
				<div class="logo">
					<a href="{:U('Index/index')}"><img src="__HOME__images/logo.png" width="199" height="91" /></a>
				</div>
				<div class="nav">
					<a href="{:U('Index/index')}" style="padding-left:0px;" <if condition="empty($catid)">class="xz"</if>>首页<br /><font>Home</font></a>
				<volist name="NAVS" id="val">
					<if condition="$i lt 4">
						<a href="{$val['url']}" class="a1 <if condition="$catid==$key || $key==$CATEGORYS[$catid]['pid']">xz</if>">{$val['title']}<br /><font>{$val['english']}</font></a>
					</if>
					<if condition="$i == 4">
						<div class="zhanwei">&nbsp;</div>
						<a href="{$val['url']}" <if condition="$catid==$key || $key==$CATEGORYS[$catid]['pid']">class="xz"</if>>{$val['title']}<br /><font>{$val['english']}</font></a>
					</if>
					<if condition="$i gt 4">
						<a href="{$val['url']}" <if condition="$catid==$key || $key==$CATEGORYS[$catid]['pid']">class="xz"</if>>{$val['title']}<br /><font>{$val['english']}</font></a>
					</if>
				</volist>
				</div>
			</div>
		</div>
		</block>

		<block name="main">

		</block>

		<block name="footer">
		<div class="footer2">
			<div class="footer3">
				<div class="footer1">
					<div class="logo2"><a href="#"><img src="__HOME__images/logo2.png" width="215" height="58" /></a></div>
					<div class="nav2">
						<a href="{:U('Index/index')}">首页</a>
						<volist name="NAVS" id="val">
							|<a href="{$val['url']}">{$val['title']}</a>
						</volist>
					</div>
					<div class="copyRight">{:C('COPYRIGHT')}</div>
				</div>
			</div>
		</div>
		</block>
	</div>
</body>
</html>
