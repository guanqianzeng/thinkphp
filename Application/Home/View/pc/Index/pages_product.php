<extend name="Public/main" />
<block name="main">
    <div class="banner_cp" style="background:url('{:thumb($CATEGORYS[$CAT['pid']]['image'], 1440, 210)}') no-repeat bottom;"></div>
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
