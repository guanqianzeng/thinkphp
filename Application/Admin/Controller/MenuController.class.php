<?php
namespace Admin\Controller;
use Admin\Common\AController;
class MenuController extends AController {
    /**
     * 栏目列表
     */
    public function index () {
        $tree = D('Menu')->formatTree();
        //print_r($tree);
        $this->assign('list', $tree);
        $this->display();
    }

    /**
     * 添加栏目
     */
    public function add () {
        if (IS_POST) {
            $result =  D('Menu');
            if ($result->input()) {
                $this->success('新增成功');
            } else {
                $this->error($result->getError());
            }
        } else {

            $this->assign('info', array('pid'=>I('pid',0,'intval')));
            $tree = D('Menu')->formatTree();
            $this->assign('tree', $tree);
            $this->display('edit');
        }
    }

    /**
     * 修改栏目
     */
    public function edit () {
        if (IS_POST) {
            $result =  D('Menu');
            if ($result->update()) {
                $this->success('更新成功');
            } else {
                $this->error($result->getError());
            }
        } else {
            $id = I("id");
            $info = D('Menu')->find($id);
            if (!$info) {
                $this->error('不存在！');
            } else {
                $this->assign('info', $info);
            }
            $tree = D('Menu')->formatTree();
            $this->assign('tree', $tree);
            $this->display();
        }
    }

    /**
     * 删除栏目
     */
    public function del(){
        $id = array_unique((array)I('id',0));
        if ( empty($id) ) {
            $this->error('请选择要操作的数据!');
        }
        $map = array('id' => array('in', $id) );
        if(D('Menu')->where($map)->delete()){
            S('DB_MENU_DATA', null);
            //记录行为
            //action_log('update_config','config',$id,UID);
            $this->success('删除成功');
        } else {
            $this->error('删除失败！');
        }
    }
}
