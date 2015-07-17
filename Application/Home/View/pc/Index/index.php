<extend name="Public/main" />
<block name="main">
		<div class="banner2">
			<div id="js" class="js">
				<a class="aa" href="#"><IMG class="imgb" src="__HOME__images/banner2.png" width="1440"></a>
				<a class="aa" href="#"><IMG class="imgb" style="DISPLAY: none" alt="" src="__HOME__images/banner2.png" width="1440"></a>
				<a class="aa" href="#"><IMG class="imgb" style="DISPLAY: none" alt="" src="__HOME__images/banner2.png" width="1440"></a>
				<a class="aa" href="#"><IMG class="imgb" style="DISPLAY: none" alt="" src="__HOME__images/banner2.png" width="1440"></a>
				<a class="aa" href="#"><IMG class="imgb" style="DISPLAY: none" alt="" src="__HOME__images/banner2.png" width="1440"></a>
				<div id="jsNav" class="jsNav">
					<A id="prev" class="prevBtn" href="javascript:void(0)"></A>
					<A class="trigger xz" href="javascript:void(0)">1</A>
					<A class="trigger"  href="javascript:void(0)">2</A>
					<A class="trigger"  href="javascript:void(0)">3</A>
					<A class="trigger" href="javascript:void(0)">4</A>
					<A class="trigger" href="javascript:void(0)">5</A>
					<A id="next" class="nextBtn" href="javascript:void(0)"></A>
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
  <area shape="poly" coords="89,155" href="#1" /><area shape="poly" coords="117,206" href="#" /><area shape="poly" coords="116,204,178,206,206,158,175,104,118,105,90,153" href="#" />
<area shape="poly" coords="117,102,176,104,208,56,180,8,115,6,93,48" href="#2" />
<area shape="poly" coords="179,105,204,155,263,154,294,103,265,50,207,55" href="#3" />
<area shape="poly" coords="206,156,263,155,293,204,266,260,209,257,179,208,204,157" href="#4" />
<area shape="poly" coords="117,207,179,206,208,258,181,305,112,307,91,258" href="#5" />
<area shape="poly" coords="88,256,114,207,90,157,31,156,3,207,28,257" href="#6" />
<area shape="poly" coords="28,55,91,55,114,105,85,156,33,156,5,107" href="#7" />
</map>
		  </div>

			<div class="m2right">


				<div class="m2top">
					<div class="m2tl"><a href="#"><img src="__HOME__images/tp2.png" width="179" height="120" /></a></div>
					<div class="m2tr">
						<div class="m2bt"><a href="#">艾尔建亚洲区总监亲临美莱助阵娜琦丽签约仪式</a></div>
						<div class="m2sj">2014-12-08 15:16</div>
						<div class="m2xx"> “娜琦丽”的问世，被称为是世界乳房植入体的第二次科技革命，并被世界美胸医学界认为是目前最安全、最持久的美胸假体。经过12年的研究和临床试验后才正式全球使用。全球有十多个发达国家的超过100多万女性均先后选择娜琦丽......</div>
					</div>
					<div class="clear"></div>
				</div>
				<ul class="ul">
				<h2>111111111</h2>
					<lists name="News" catid="9" limit="2">
		  			  <h1>{$val['title']}</h1>
		  		  	</lists>
					<li><a href="#">“我，为美丽代言”大型选秀活动总决赛圆满举行</a>2014-12-08</li>
					<li><a href="#">“我，为美丽代言”大型选秀活动总决赛圆满举行</a>2014-12-08</li>
					<li><a href="#">“我，为美丽代言”大型选秀活动总决赛圆满举行</a>2014-12-08</li>
					<li><a href="#">“我，为美丽代言”大型选秀活动总决赛圆满举行</a>2014-12-08</li>
					<li><a href="#">“我，为美丽代言”大型选秀活动总决赛圆满举行</a>2014-12-08</li>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
		<div class="ggw"><img src="__HOME__images/ggw.png" width="1000" height="164" /></div>
		<div class="main3">
			<div class="m3bt"><a href="#"><img src="__HOME__images/btwz1.png" width="259" height="34" /></a></div>
			<div class="m3nr">

				<div id="demo">
					<div id="indemo">
						<div id="demo1" style="margin-right:25px">
							<div class="kuai1 k1"><a href="#"><img src="__HOME__images/tp3.png" width="229" height="214" /></a></div>
							<div class="kuai1 k1"><a href="#"><img src="__HOME__images/tp3.png" width="229" height="214" /></a></div>
							<div class="kuai1 k1"><a href="#"><img src="__HOME__images/tp3.png" width="229" height="214" /></a></div>
							<div class="kuai1 k1"><a href="#"><img src="__HOME__images/tp3.png" width="229" height="214" /></a></div>
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
			<div class="m3bt"><a href="#"><img src="__HOME__images/btwz2.png" width="344" height="35" /></a></div>
			<div class="m3nr2">

				<div id="demoa">
					<div id="indemo2">
						<div id="demo3" style="margin-right:25px">
							<div class="kuai1 k1"><a href="#"><img src="__HOME__images/tp3.png" width="229" height="214" /></a></div>
							<div class="kuai1 k1"><a href="#"><img src="__HOME__images/tp3.png" width="229" height="214" /></a></div>
							<div class="kuai1 k1"><a href="#"><img src="__HOME__images/tp3.png" width="229" height="214" /></a></div>
							<div class="kuai1 k1"><a href="#"><img src="__HOME__images/tp3.png" width="229" height="214" /></a></div>
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
