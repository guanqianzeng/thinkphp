<?php
namespace Admin\Controller;
use Admin\Common\AController;
class AuthController extends AController {
    public $db = null;

    public function _init () {
        $this->assign('__ACT__', strtolower(MODULE_NAME.'/'.CONTROLLER_NAME.'/index'));
        $this->meta_head = '<a href="'.U('Auth/index').'">权限管理</a>';
        $this->db = D('Admin');
    }

    public function _empty(){
        $this->meta_title = '空操作';
        $this->display('Index/index');
    }

    public function index(){

        $list = D('Admin')->select();

        //print_r($list);
        $this->assign('list', $list);
        $this->meta_title = '管理组';
        $this->display("index");

    }

    public function add() {
        if (IS_POST) {
            $db = D('Admin');
            if (!$db->input()) {
                $this->error($db->getError());
            } else {
                $this->success('新增成功');
            }
        } else {
            $this->meta_title = '新增管理组';
            $this->display("edit");
        }
    }

    public function edit() {
        if (IS_POST) {
            $db = D('Admin');
            if (!$db->update()) {
                $this->error($db->getError());
            } else {
                $this->success('更新成功');
            }
        } else {
            $id = I('id',0,'intval');
            $info = D('Admin')->find($id);
            if (!$info) {
                $this->error('不存在！');
            } else {
                $this->assign('info', $info);
            }
            $this->meta_title = '更新管理组';
            $this->display("edit");
        }
    }

    /*  删除 */
    public function del() {
        $id = array_unique((array)I('id',0));
        if ( empty($id) ) {
            $this->error('请选择要操作的数据!');
        }
        $map = array('id' => array('in', $id) );
        if(D('Admin')->where($map)->delete()){
            action_log();
            $this->success('删除成功');
        } else {
            $this->error('删除失败！');
        }
    }
}
