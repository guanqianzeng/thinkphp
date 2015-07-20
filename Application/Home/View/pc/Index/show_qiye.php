<extend name="Public/main" />
<block name="main">
		<div class="banner3" style="background:url('{:thumb($CATEGORYS[$CAT['pid']]['image'], 1440, 210)}') no-repeat bottom;"></div>
		<div class="ejmain">
			<div class="ejmt"></div>
			<div class="ejmb">
				<div class="ejml">
					<div class="ejmltop">
						<span>{$CAT['title']}</span>
						您当前的位置：{:catpos($catid)}
					</div>
					<div class="ejmlbot">
					<volist name="list" id="val">{$v['thumb']}
						<div class="kuai2">
							<img src="{:thumb($val['thumb'], 206, 282)}" width="206" height="282" />
							<div class="k2btm"><a href="{$val['url']}">{$val['title']}</a></div>
						</div>
					</volist>
						<div class="clear"></div>
					</div>
					<style media="screen">
						.current {
							color: #ffffff;
  							background: #5d3f1b;
							color: #989994;
							font-size: 14px;
							border: solid 1px #f2f2f2;
							padding: 10px 15px;
							font-family: "微软雅黑";
						}

					</style>
					<div class="yema">{$_page}</div>
				</div>
				<div class="ejmr">
					<div class="ejmrbt"><font>{$CATEGORYS[$CAT['pid']]['english']}</font>{$CATEGORYS[$CAT['pid']]['title']}</div>
					<ul class="ul1">
					<volist name=":get_category($CAT['pid'])" id="val">
						<eq name="key" value="$catid">
							<li><a href="{$val['url']}" class="xz">{$val['title']}<font>{$val['english']}</font></a></li>
						<else />
							<li><a href="{$val['url']}">{$val['title']}<font>{$val['english']}</font></a></li>
						</eq>
					</volist>
					</ul>

					<include file="Public/dianmian" />
				</div>
				<div class="clear"></div>
			</div>
		</div>
</block>
