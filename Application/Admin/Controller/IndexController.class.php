<?php
namespace Admin\Controller;
use Admin\Common\AController;
class IndexController extends AController {
    public function _init () {
        $this->assign('__ACT__', strtolower(MODULE_NAME.'/'.CONTROLLER_NAME.'/index'));
        $this->meta_head = '<a href="'.U('Index/index').'">网站首页</a>';
    }

    public function _empty(){
        $this->meta_title = '空操作';
        $this->display('index');
    }

    public function index(){

        $this->meta_title = '网站首页';
        $this->display();
    }

    public function help(){

        $this->meta_title = '帮助中心';
        $this->display();
    }
}
