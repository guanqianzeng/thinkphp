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
						<p style="text-align:center; font-size:14px; line-height:24px;">
							{$info['title']}<br>
							<span style="font-size:12px;color:#000;">发布时间：{:date('Y-m-d H:i')}</span>
						</p>
						<p style="width:100%; height:10px; border-bottom:1px dashed #CCCCCC; margin-bottom:10px;"></p>
 					 	{$info['content']}
				 	</div>
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
