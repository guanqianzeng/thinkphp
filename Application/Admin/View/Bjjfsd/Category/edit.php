<style media="screen">
    .ms select {
        padding:0px 10px;height:24px;border:solid 1px #d2d2d2;margin-right:10px; background:#fafafa
    }
    .select {width:400px;}
    .text1{height:100px;}
	.head-a{margin: 10px 0px 20px 20px; border-bottom: 3px solid #343843; line-height: 32px;}
	.head-a a {
	    background-color: #08A3BB;
	    padding: 10px 20px;
	    color: #FFF;
	    font-weight: bold;
	}
	.head-a .act {background-color: #343843;}
    .submit {margin:30px 0 0 80px;}
</style>
<script type="text/javascript">
    $(function(){
        var tabHead = $(".tab-head a");
        var tabList = $(".tab-list table");
        tabList.slice(1).hide();
        tabHead.each(function(index){
            $(this).click(function(){
                tabHead.removeClass('act');
                tabList.hide();
                $(this).addClass('act');
                tabList.eq(index).show();
            })
        })
    })
</script>
<div class="head-a tab-head">
	<a class="act" href="javascript:void(0);">基本选项</a>
    <a href="javascript:void(0);">模版选项</a>
    <a href="javascript:void(0);">SEO选项</a>
</div>
<form action="" method="post">
<div class="tab-list">
<table width="900" border="0" cellspacing="0" cellpadding="0" class="table">
    <tr>
        <td class="td1" align="right">栏目名称：</td>
        <td class="ms">
            <input type="text" name="title" value="{$info['title']|default=''}" class="inputt input" />
            （栏目名称）
        </td>
    </tr>
    <tr>
        <td class="td1" align="right">栏目类型：</td>
        <td class="ms">
            <select class="select" name="type">
                <volist name="cateType" id="v">
                    <option value="{$key}" <eq name="info['type']" value="$key">selected="selected"</eq>>{$v}</option>
                </volist>
            </select>
            （栏目类型）
        </td>
    </tr>
    <tr>
        <td class="td1" align="right">上级栏目：</td>
        <td class="ms">
            <select class="select" name="pid">
                <volist name="list" id="v">
                    <option value="{$v['id']}" <eq name="info['pid']" value="$v['id']">selected="selected"</eq>>{$v['title']}</option>
                </volist>
            </select>
            （栏目类型）
        </td>
    </tr>
    <tr>
        <td class="td1" align="right">栏目图片：</td>
        <td class="ms">
            <input type="text" name="image" value="{$info['image']|default=''}" class="inputt input" />
            （栏目图片）
        </td>
    </tr>
    <tr>
        <td class="td1" align="right">栏目描述：</td>
        <td class="ms">
            <textarea class="text1" name="description">{$info['description']|default=''}</textarea>
            （栏目描述）
        </td>
    </tr>
	<tr>
        <td class="td1" align="right">导航显示：</td>
        <td class="ms">
            <select class="select" name="display">
                    <option value="1" <eq name="info['display']" value="1">selected="selected"</eq>>显示</option>
                    <option value="0" <eq name="info['display']" value="0">selected="selected"</eq>>隐藏</option>
            </select>
            （状态）
        </td>
    </tr>
    <tr>
        <td class="td1" align="right">栏目排序：</td>
        <td class="ms">
            <input type="text" name="sort" value="{$info['sort']|default=0}" class="inputt input" />
            （栏目排序）
        </td>
    </tr>
</table>
<table width="900" border="0" cellspacing="0" cellpadding="0" class="table">
    <tr>
        <td class="td1" align="right">可用风格：</td>
        <td class="ms">
            <select class="select" name="setting[style][theme]">
                <option>等待完善...</option>
            </select>
            （可用风格）
        </td>
    </tr>
    <tr>
        <td class="td1" align="right">栏目首页模板：</td>
        <td class="ms">
            <select class="select" name="setting[style][category]">
                <option>等待完善...</option>
            </select>
            （栏目首页模板）
        </td>
    </tr>
    <tr>
        <td class="td1" align="right">栏目列表页模板：</td>
        <td class="ms">
            <select class="select" name="setting[style][list]">
                <option>等待完善...</option>
            </select>
            （栏目列表页模板）
        </td>
    </tr>
    <tr>
        <td class="td1" align="right">内容页模板：</td>
        <td class="ms">
            <select class="select" name="setting[style][show]">
                <option>等待完善...</option>
            </select>
            （内容页模板）
        </td>
    </tr>
</table>
<table width="900" border="0" cellspacing="0" cellpadding="0" class="table">
    <tr>
        <td class="td1" align="right">META Title：</td>
        <td class="ms">
            <input type="text" name="setting[seo][title]" value="{$info['setting']['seo']['title']|default=''}" class="inputt input" />
            （栏目标题针对搜索引擎设置的标题）
        </td>
    </tr>
    <tr>
        <td class="td1" align="right">META Keywords：</td>
        <td class="ms">
            <textarea class="text1" name="setting[seo][keywords]">{$info['setting']['seo']['description']|default=''}</textarea>
            （栏目关键词关键字中间用半角逗号隔开）
        </td>
    </tr>
    <tr>
        <td class="td1" align="right">META Description：</td>
        <td class="ms">
            <textarea class="text1" name="setting[seo][description]">{$info['setting']['seo']['description']|default=''}</textarea>
            （栏目描述针对搜索引擎设置的网页描述）
        </td>
    </tr>

</table>
</div>

<div class="submit">
    <input type="hidden" name="id" value="{$info['id']|default=''}">
    <input type="submit" class="tjanniu cr" value="提 交" /><input type="reset" class="czanniu cr" value="重 置" />
</div>
</form>
