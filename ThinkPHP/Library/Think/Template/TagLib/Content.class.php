<?php

namespace Think\Template\TagLib;
use Think\Template\TagLib;
/**
 * My标签库驱动
 */
class Content extends TagLib{

    // 标签定义
    protected $tags   =  array(
        // 标签定义： attr 属性列表 close 是否闭合（0 或者1 默认1） alias 标签别名 level 嵌套层次
        'position'    => array('attr' => 'i,val,key,id,limit', 'close' => 1),
        'lists'       => array('attr' => 'i,catid,val,key,name,limit', 'close'=>1),
        'banner'      => array('attr' => 'i,val,key,id,limit', 'close' => 1),
        'banner_1'    => array('attr' => 'id,limit', 'close' => 1),

    );

    /**
     * banner标签解析 插入可视化编辑器
     * 格式： <banner id="1" limit="6">{$val['id']}</banner>
     * @access public
     * @param array $tag 标签属性
     * @return string|void
     */
    public function _banner($tag, $content) {
        if (empty($tag['id'])) {
            return '';
        }

        $i = !empty($tag['i']) ? $tag['i'] : 'i';
        $val = !empty($tag['val']) ? $tag['val'] : 'val';
        $key = !empty($tag['key']) ? $tag['key'] : 'key';
        $banner = M('Banner')->find(intval($tag['id']));
        if (empty($banner)) {
            return '';
        }

        $model = M('BannerData');
        $map = array();
        $map['bid'] = $banner['id'];
        $lists = $model->cache(true, 60)->where($map)->order('sort desc, id desc')->limit($tag['limit'])->select();
        if (empty($lists) || !is_array($lists)) {
            return '';
        }
        //print_r($lists);
        $rand_key = '__position' . rand(1000, 9999) . '__';
        $this->tpl->set($rand_key, $lists);

        $parseStr = '<?php $'. $i .' = 0; $count = count('.$rand_key.'); ';
        $parseStr .= 'foreach($'. $rand_key .' as $'. $key .' => $'. $val .'): ';
        $parseStr .= '$'. $i .'++; ?>';
        $parseStr .= $this->tpl->parse($content);
        $parseStr .= '<?php endforeach; ?>';
        //var_dump($parseStr);
        if(!empty($parseStr)) {
            return $parseStr;
        }
        return ;
    }

    /**
     * position标签解析 插入可视化编辑器
     * 格式： <position id="1" limit="6">{$val['id']}</position>
     * @access public
     * @param array $tag 标签属性
     * @return string|void
     */
    public function _position($tag, $content) {
        if (empty($tag['id'])) {
            return '';
        }

        $i = !empty($tag['i']) ? $tag['i'] : 'i';
        $val = !empty($tag['val']) ? $tag['val'] : 'val';
        $key = !empty($tag['key']) ? $tag['key'] : 'key';
        $position = M('Position')->find(intval($tag['id']));
        if (empty($position) || empty($position['type']) || empty($position['data'])) {
            return '';
        }
        $model = M($position['type']);
        $map = array();
        $map['id'] = array('in', $position['data']);
        $lists = $model->cache(true, 60)->where($map)->order('sort desc, id desc')->limit($tag['limit'])->select();
        if (empty($lists) || !is_array($lists)) {
            return '';
        }
        foreach ($lists as $k=> $v) {
            $lists[$k]['url'] = U('show?catid='.$v['catid'].'&id='.$v['id']);
        }
        //print_r($lists);
        $rand_key = '__position' . rand(1000, 9999) . '__';
        $this->tpl->set($rand_key, $lists);

        $parseStr = '<?php $'. $i .' = 0; $count = count('.$rand_key.'); ';
        $parseStr .= 'foreach($'. $rand_key .' as $'. $key .' => $'. $val .'): ';
        $parseStr .= '$'. $i .'++; ?>';
        $parseStr .= $this->tpl->parse($content);
        $parseStr .= '<?php endforeach; ?>';
        //var_dump($parseStr);
        if(!empty($parseStr)) {
            return $parseStr;
        }
        return ;
    }

    /**
     * lists标签解析 插入可视化编辑器
     * 格式： <lists name="News" catid="9" limit="6">{$val['id']}</lists>
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
        $lists = $model->cache(true, 60)->where($map)->order('sort desc, catid desc')->limit($tag['limit'])->select();
        if (empty($lists) || !is_array($lists)) {
            return '';
        }
        foreach ($lists as $k=> $v) {
            $lists[$k]['url'] = U('show?catid='.$v['catid'].'&id='.$v['id']);
        }
        //print_r($lists);

        $rand_key = '__lists' . rand(1000, 9999) . '__';
        $this->tpl->set($rand_key, $lists);

        $parseStr = '<?php $'. $i .' = 0; $count = count('.$rand_key.'); ';
        $parseStr .= 'foreach($'. $rand_key .' as $'. $key .' => $'. $val .'): ';
        $parseStr .= '$'. $i .'++; ?>';
        $parseStr .= $this->tpl->parse($content);
        $parseStr .= '<?php endforeach; ?>';
        //var_dump($parseStr);
        if(!empty($parseStr)) {
            return $parseStr;
        }
        return ;
    }
}
