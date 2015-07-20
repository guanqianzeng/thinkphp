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
					<div class="ejmlbot">{$content}</div>
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
