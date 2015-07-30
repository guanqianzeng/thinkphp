<?php
namespace Home\Controller;
use Home\Common\HController;
class IndexController extends HController {
    protected $NAVS= array();   // 一级导航
    protected $CATEGORYS = array(); //所有栏目信息

    protected $order = 'sort desc, id asc'; //统一排序

    public function _init() {

        /* 所有栏目信息 */
        $this->CATEGORYS = D('Category')->getAll();
        $this->assign('CATEGORYS', $this->CATEGORYS);

        /* 一级导航 */
        $this->NAVS = S('NAVS');
        if (!$this->NAVS) {
            $catid = I('catid', 0, 'intval');
            foreach ($this->CATEGORYS as $key => $val) {
                if ($val['pid'] == 0 && $val['display']) {
                    $this->NAVS[$key] = $val;
                    // 目前延伸2级
                    if ($catid == $key || $catid == $this->CATEGORYS[$key]['pid']) {
                        $this->NAVS[$key]['action'] = 1;
                    } else {
                        $this->NAVS[$key]['action'] = 0;
                    }
                }
            }
            S('NAVS', $this->NAVS);
        }
        $this->assign('NAVS', $this->NAVS);

    }

    /* 首页 */
    public function index(){
        $meta_title = C('WEB_SITE_TITLE');
        $meta_keywords = C('WEB_SITE_KEYWORD');
        $meta_description = C('WEB_SITE_DESCRIPTION');
        $this->assign('meta_title', $meta_title);
        $this->assign('meta_keywords', $meta_keywords);
        $this->assign('meta_description', $meta_description);
        $this->display();
    }

    /* 列表 */
    public function lists($catid = 0) {
        if (!$catid) {
            $this->redirect('index');
        }

        //子栏目列表
        $child = array();
        foreach ($this->CATEGORYS as $key => $val) {
            if ($val['pid'] == $catid && $val['display']) {
                $child[$key] = $val;
            }
        }
        // 取第一个子catid
        if ($child) {
            $child_shift = array_shift($child);
            $catid = $child_shift['id'];
        }
        $this->assign('catid', $catid);

        //当前栏目信息
        $CAT = $this->CATEGORYS[$catid];
        $this->assign('CAT', $CAT);

        switch ($CAT['type']) {
            case 'News':
            case 'Product':
                $template = $CAT['setting']['list_template'] ? $CAT['setting']['list_template'] : 'lists';
                $where = array();
                $where['status'] = 1;
                $where['catid'] = $catid;
                if ($CAT['setting']['page_num']) {
                    $page_num = $CAT['setting']['page_num'];
                } else {
                    $page_num = 0;
                }
                $list = $this->getAll($CAT['type'], $where, $this->order, $page_num);
                foreach ($list as $key => $val) {
                    $list[$key]['url'] = U('show?catid='. $catid .'&id='. $val['id']);
                }
                $this->assign('list', $list);

                $meta_title = $CAT['setting']['meta_title'] ? $CAT['setting']['meta_title'] : $CAT['title'] . ' - ';
                $meta_keywords = $CAT['setting']['meta_keywords'] ? $CAT['setting']['meta_keywords'] : '';
                $meta_description = $CAT['setting']['meta_description'] ? $CAT['setting']['meta_description'] : '';
                break;

            case 'Pages':
                $template = $CAT['setting']['page_template'] ? $CAT['setting']['page_template'] : 'pages';
                $content = M('Pages')->where(array('catid'=>$catid))->getField('content');
                $this->assign('content', html_entity_decode($content));

                $meta_title = $CAT['setting']['meta_title'] ? $CAT['setting']['meta_title'] : $CAT['title'] . ' - ';
                $meta_keywords = $CAT['setting']['meta_keywords'] ? $CAT['setting']['meta_keywords'] : '';
                $meta_description = $CAT['setting']['meta_description'] ? $CAT['setting']['meta_description'] : '';
                break;

            default:
                $this->redirect('index');
                break;
        }

        $meta_title .= C('WEB_SITE_TITLE');
        $meta_keywords = $meta_keywords ? $meta_keywords : C('WEB_SITE_KEYWORD');
        $meta_description = $meta_description ? $meta_description : C('WEB_SITE_DESCRIPTION');
        $this->assign('meta_title', $meta_title);
        $this->assign('meta_keywords', $meta_keywords);
        $this->assign('meta_description', $meta_description);
        $this->display($template);
    }

    /* 详情 */
    public function show($catid = 0, $id = 0) {
        if (!$catid || !$id) {
            $this->redirect('index');
        }
        $this->assign('catid', $catid);
        //当前栏目信息
        $CAT = $this->CATEGORYS[$catid];
        $this->assign('CAT', $CAT);
        $info = M($CAT['type'])->find($id);
        if (empty($info)) {
            $this->redirect('index');
        }
        $info['content'] = html_entity_decode($info['content']);
        $this->assign('info', $info);

        $template = $CAT['setting']['show_template'] ? $CAT['setting']['show_template'] : 'show';


        $meta_title = $info['title'] . ' - ' . C('WEB_SITE_TITLE');
        $meta_keywords = $info['title'];
        $meta_description = $info['description'];
        $this->assign('meta_title', $meta_title);
        $this->assign('meta_keywords', $meta_keywords);
        $this->assign('meta_description', $meta_description);
        $this->display($template);
    }

    /* 在线留言 */
    public function message() {
        if (IS_POST) {
            $model = D('Message');
            if ($model->input()) {
                $this->success('留言成功');
            } else {
                $this->error($model->getError());
            }
        } else {
            $this->display();
        }
    }


}
