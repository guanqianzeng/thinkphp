<extend name="Public/main" />
<block name="main">
		<div class="banner2">
			<div id="js" class="js">
				<banner id="1" limit="5">
					<a class="aa" href="{$val['url']|default='javascript:void(0);'}">
						<img class="imgb" <neq name="i" value="1">style="display:none;"</neq> src="{:thumb($val['image'], 1440, 470)}" width="1440">
					</a>
				</banner>
				<div id="jsNav" class="jsNav">
					<a id="prev" class="prevBtn" href="javascript:void(0)"></a>
					<banner id="1" limit="5">
						<a class="trigger <eq name="i" value="1">xz</eq>" href="javascript:void(0)">{$i}</a>
					</banner>
					<a id="next" class="nextBtn" href="javascript:void(0)"></a>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div class="main1">
			<div class="main11">
				<volist name=":get_category(5, 4)" id="val">
					<a class="kuai" href="{$val['url']}">
						<span class="kbt"><img src="{:thumb($val['image'])}" width="33" height="31" />{$val['title']}</span>
						<span class="knr">{$val['description']}</span>
					</a>
				</volist>
				<div class="clear"></div>
			</div>
		</div>
		<div class="main2">
			<div class="m2left">
				<img src="__HOME__images/tp1.png" width="297" height="310" border="0" usemap="#Map" />
<map name="Map" id="Map">
	<area shape="poly" coords="89,155" href="#1" />
	<area shape="poly" coords="117,206" href="#" />
	<area shape="poly" coords="116,204,178,206,206,158,175,104,118,105,90,153" href="{$CATEGORYS[20]['url']}" />
	<area shape="poly" coords="117,102,176,104,208,56,180,8,115,6,93,48" href="{$CATEGORYS[16]['url']}" />
	<area shape="poly" coords="179,105,204,155,263,154,294,103,265,50,207,55" href="{$CATEGORYS[15]['url']}" />
	<area shape="poly" coords="206,156,263,155,293,204,266,260,209,257,179,208,204,157" href="{$CATEGORYS[17]['url']}" />
	<area shape="poly" coords="117,207,179,206,208,258,181,305,112,307,91,258" href="{$CATEGORYS[22]['url']}" />
	<area shape="poly" coords="88,256,114,207,90,157,31,156,3,207,28,257" href="{$CATEGORYS[18]['url']}" />
	<area shape="poly" coords="28,55,91,55,114,105,85,156,33,156,5,107" href="{$CATEGORYS[21]['url']}" />
</map>
		  </div>
			<div class="m2right">
			<lists name="News" catid="9" limit="6">
				<eq name="i" value="1">
					<div class="m2top">
						<div class="m2tl"><a href="{$val['url']}"><img src="{:thumb($val['thumb'], 179, 120)}" width="179" height="120" /></a></div>
						<div class="m2tr">
							<div class="m2bt"><a href="{$val['url']}">{$val['title']}</a></div>
							<div class="m2sj">{:date('Y-m-d H:i:s',$val['create_time'])}</div>
							<div class="m2xx">{$val['description']}</div>
						</div>

						<div class="clear"></div>
					</div>
				<else />
					<if condition="$i == 2">
						<ul class="ul">
					</if>
						<li><a href="{$val['url']}">{$val['title']}</a>{:date('Y-m-d',$val['create_time'])}</li>
					<if condition="$i == $count">
						</ul>
					</if>
				</eq>
			</lists>
			</div>
			<div class="clear"></div>
		</div>
		<div class="ggw">
		<banner id="2" limit="1">
			<a href="{$val['url']}"><img src="{:thumb($val['image'], 1000, 164)}" width="1000" height="164" /></a>
		</banner>
		</div>
		<div class="main3">
			<div class="m3bt"><a href="{$CATEGORYS[8]['url']}"><img src="__HOME__images/btwz1.png" width="259" height="34" /></a></div>
			<div class="m3nr">

				<div id="demo">
					<div id="indemo">
						<div id="demo1" style="margin-right:25px">
						<lists name="News" catid="8" limit="6">
							<div class="kuai1 k1"><a href="{$val['url']}"><img src="{:thumb($val['thumb'], 229, 214)}" width="229" height="214" /></a></div>
						</lists>
						</div>
						<div id="demo2"></div>
					</div>
				</div>
				<script>
				<!--
				var speed=30;
				var tab=document.getElementById("demo");
				var tab1=document.getElementById("demo1");
				var tab2=document.getElementById("demo2");
				tab2.innerHTML=tab1.innerHTML;
				function Marquee(){
				if(tab2.offsetWidth-tab.scrollLeft<=0)
				tab.scrollLeft-=tab1.offsetWidth
				else{
				tab.scrollLeft++;
				}
				}
				var MyMar=setInterval(Marquee,speed);
				tab.onmouseover=function() {clearInterval(MyMar)};
				tab.onmouseout=function() {MyMar=setInterval(Marquee,speed)};
				-->
				</script>

			</div>
		</div>
		<div class="main3">
			<div class="m3bt"><a href="javascript:void(0);"><img src="__HOME__images/btwz2.png" width="344" height="35" /></a></div>
			<div class="m3nr2">
				<div id="demoa">
					<div id="indemo2">
						<div id="demo3" style="margin-right:25px">
							<banner id="3">
								<div class="kuai1 k1"><a href="{$val['url']}"><img src="{:thumb($val['image'], 229, 214)}" width="229" height="214" /></a></div>
							</banner>
						</div>
						<div id="demo4"></div>
					</div>
				</div>
				<script>
				<!--
				var speeda=30;
				var taba=document.getElementById("demoa");
				var tab1a=document.getElementById("demo3");
				var tab2a=document.getElementById("demo4");
				tab2a.innerHTML=tab1a.innerHTML;
				function Marqueea(){
				if(tab2a.offsetWidth-taba.scrollLeft<=0)
				taba.scrollLeft-=tab1a.offsetWidth
				else{
				taba.scrollLeft++;
				}
				}
				var MyMara=setInterval(Marqueea,speeda);
				taba.onmouseover=function() {clearInterval(MyMara)};
				taba.onmouseout=function() {MyMara=setInterval(Marqueea,speeda)};
				-->
				</script>

			</div>
		</div>
</block>
