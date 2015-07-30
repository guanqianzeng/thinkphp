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
        <td class="td1" align="right">英文名称：</td>
        <td class="ms">
            <input type="text" name="english" value="{$info['english']|default=''}" class="inputt input" />
            （英文名称）
        </td>
    </tr>
    <tr>
        <td class="td1" align="right">栏目类型：</td>
        <td class="ms">
            <select class="select" name="type" <if condition="$count">disabled="disabled"</if>>
                <volist name="cateType" id="v">
                    <option value="{$key}" <eq name="info['type']" value="$key">selected="selected"</eq>>{$v}</option>
                </volist>
            </select>
            （栏目类型<if condition="$count">---<font color="red">删除该分类下的信息</font></if>）
        </td>
    </tr>
    <tr>
        <td class="td1" align="right">上级栏目：</td>
        <td class="ms">
            <select class="select" name="pid">
                <option value="0">≡ 作为一级栏目 ≡</option>
                <volist name="list" id="v">
                    <option value="{$v['id']}" <eq name="info['pid']" value="$v['id']">selected="selected"</eq>>{$v['title']}</option>
                </volist>
            </select>
            （栏目类型）
        </td>
    </tr>
    <tr>
        <td align="right">栏目图片：</td>
        <td class="upload-row">
            <input type="text" name="image" value="{$info['image']|default=''}" readonly="readonly" class="inputt input3">
            <input type="button" class="button1 cr" value="上 传">建议图片尺寸：{:get_news_px('width')}*{:get_news_px('height')}px;
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
        <td class="td1" align="right">栏目分页数：</td>
        <td class="ms">
            <input type="text" name="setting[page_num]" value="{$info['setting']['page_num']|default=''}" class="inputt input" />
            （栏目分页数）
        </td>
    </tr>
    <tr>
        <td class="td1" align="right">列表页模板：</td>
        <td class="ms">
            <input type="text" name="setting[list_template]" value="{$info['setting']['list_template']|default=''}" class="inputt input" />
            <!-- <select class="select" name="setting[list_template]">
                <option>等待完善...</option>
            </select> -->
            （列表页模板-目前先手工书写吧）
        </td>
    </tr>
    <tr>
        <td class="td1" align="right">内容页模板：</td>
        <td class="ms">
            <input type="text" name="setting[show_template]" value="{$info['setting']['show_template']|default=''}" class="inputt input" />
            <!-- <select class="select" name="setting[show_template]">
                <option>等待完善...</option>
            </select> -->
            （内容页模板-目前先手工书写吧）
        </td>
    </tr>
    <tr>
        <td class="td1" align="right">单页模板：</td>
        <td class="ms">
            <input type="text" name="setting[page_template]" value="{$info['setting']['page_template']|default=''}" class="inputt input" />
            <!-- <select class="select" name="setting[page_template]">
                <option>等待完善...</option>
            </select> -->
            （单页页模板-目前先手工书写吧）
        </td>
    </tr>
</table>
<table width="900" border="0" cellspacing="0" cellpadding="0" class="table">
    <tr>
        <td class="td1" align="right">META Title：</td>
        <td class="ms">
            <input type="text" name="setting[meta_title]" value="{$info['setting'][meta_title]|default=''}" class="inputt input" />
            （栏目标题针对搜索引擎设置的标题）
        </td>
    </tr>
    <tr>
        <td class="td1" align="right">META Keywords：</td>
        <td class="ms">
            <textarea class="text1" name="setting[meta_keywords]">{$info['setting'][meta_keywords]|default=''}</textarea>
            （栏目关键词关键字中间用半角逗号隔开）
        </td>
    </tr>
    <tr>
        <td class="td1" align="right">META Description：</td>
        <td class="ms">
            <textarea class="text1" name="setting[meta_description]">{$info['setting']['meta_description']|default=''}</textarea>
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
<!-- 图片上传 -->
<script type="text/javascript">
    var Tool = {};
    $(function(){
        // 上传处理
        Tool.uploadSend = function(){
            $(".upload-row").each(function(i){
                $(this).find(".button1").click(function(){
                    window.open('{:U('Tool/uploadImage', '', '')}&id='+ i, '文件上传', 'height=100, width=400, top='+(screen.availHeight-100)/2+', left='+(screen.availWidth-400)/2+', toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
                })
            })
        }
        // 绑定
        Tool.uploadSend();
    })
</script>
