<extend name="Public/main" />
<block name="main">
    <div class="banner_xm">
        <div id="js" class="js2">
            <a class="aa" href="javascript:void(0);"><IMG class="imgb" src="__HOME__images/banner3.png" width="1440"></a>
            <a class="aa" href="javascript:void(0);"><IMG class="imgb" style="DISPLAY: none" alt="" src="__HOME__images/banner3.png" width="1440"></a>
            <a class="aa" href="javascript:void(0);"><IMG class="imgb" style="DISPLAY: none" alt="" src="__HOME__images/banner3.png" width="1440"></a>
            <a class="aa" href="javascript:void(0);"><IMG class="imgb" style="DISPLAY: none" alt="" src="__HOME__images/banner3.png" width="1440"></a>
            <a class="aa" href="javascript:void(0);"><IMG class="imgb" style="DISPLAY: none" alt="" src="__HOME__images/banner3.png" width="1440"></a>
            <div id="jsNav" class="jsNav2">
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
    <div class="nav3">
        <div class="nav3l"><img src="__HOME__images/zjian.png" width="38" height="36" /></div>
        <div class="nav3c">
            <div class="nav3cc">
                <volist name=":get_category($CAT['pid'])" id="val">
                    <eq name="key" value="$catid">
                        <a href="{$val['url']}" class="xz">{$val['title']}</a>
                    <else />
                        <a href="{$val['url']}">{$val['title']}</a>
                    </eq>
                </volist>
            </div>
        </div>
        <div class="nav3r"><img src="__HOME__images/yjian.png" width="38" height="36" /></div>
        <div class="clear"></div>
    </div>
    <div class="ejmain2">
        {$content}
    </div>
</block>
