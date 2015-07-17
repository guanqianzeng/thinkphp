<extend name="Public/main" />
<block name="main">
<div class="banner5" style="background:url('{:thumb($CATEGORYS[$CAT['pid']]['image'], 1440, 210)}') no-repeat bottom;"></div>
<div class="ejmain">
	<div class="ejmt"></div>
	<div class="ejmb">
		<div class="ejml">
			<div class="ejmltop">
				<span>{$CAT['title']}</span>
				您当前的位置：{:catpos($catid)}
			</div>

			<div class="ejmlbot2">
				<div class="kuai3">
					<volist name="list" id="val">
						<div class="k3l">
							<a href="{$val['url']}"><img src="{:thumb($val['thumb'], 315, 171)}" width="315" height="171" /><br />{$val['title']}</a>
						</div>
						<if condition="$i%2 == 0 && $i lt count($list)">
								<div class="clear"></div>
							</div>
							<div class="kuai3">
						</if>
					</volist>
					<div class="clear"></div>
				</div>
			</div>

			<div class="yema2">{$_page}</div>
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

			<div class="ejmrbt"><font>STORE DISPLAY</font>店面展示</div>
			<a href="#" class="ak"><img src="__HOME__images/tp5.png" width="244"  height="124" /></a>
			<a href="#" class="ak"><img src="__HOME__images/tp5.png" width="244"  height="124" /></a>
		</div>
		<div class="clear"></div>
	</div>
</div>
</block>
