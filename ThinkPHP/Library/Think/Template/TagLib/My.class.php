<?php

namespace Think\Template\TagLib;
use Think\Template\TagLib;
/**
 * My标签库驱动
 */
class My extends TagLib{
    // 标签定义
    protected $tags   =  array(
        // 标签定义： attr 属性列表 close 是否闭合（0 或者1 默认1） alias 标签别名 level 嵌套层次
        'position'    => array('attr' => 'id,limit', 'close' => 1),
        'lists'       => array('attr' => 'i,catid,val,key,name,limit', 'close'=>1),
        'banner'      => array('attr' => 'id,limit', 'close' => 1),
        'banner_1'    => array('attr' => 'id,limit', 'close' => 1),

    );

    /**
     * editor标签解析 插入可视化编辑器
     * 格式： <html:editor id="editor" name="remark" type="FCKeditor" style="" >{$vo.remark}</html:editor>
     * @access public
     * @param array $tag 标签属性
     * @return string|void
     */
    public function _lists($tag, $content) {
        if (empty($tag['name'])) {
            return '';
        }

        $i = !empty($tag['i']) ? $tag['i'] : 'i';
        $val = !empty($tag['val']) ? $tag['val'] : 'val';
        $key = !empty($tag['key']) ? $tag['key'] : 'key';

        $model = M($tag['name']);

        $map = array();
        if (!empty($tag['catid'])) {
            $map['catid'] = $tag['catid'];
        }

        $lists = $model->where($map)->order('sort desc, catid desc')->limit($tag['limit'])->select();

        if (empty($lists) || !is_array($lists)) {
            return '';
        }

        $parseStr = '<?php $'. $i .' = 0; ';
        $parseStr .= 'foreach($lists as $'. $key .' => $'. $val .'): ';
        $parseStr .= '$'. $i .'++; ?>';
        $parseStr .= $this->tpl->parse($content);
        $parseStr .= '<?php endforeach; ?>';

        if(!empty($parseStr)) {
            return $parseStr;
        }
        return ;
    }


}
