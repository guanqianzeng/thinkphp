<?php
namespace Admin\Controller;
use Admin\Common\AController;
class MenuController extends AController {

    public function index () {

        $this->display();
    }

    public function add () {
        if (IS_POST) {
            $result =  D('Menu');
            //var_dump($result->input()); exit;
            if ($result->input()) {
                exit('1111');
                $this->success('新增成功');
            } else {
                $this->error($result->getError());
            }
        } else {
            $this->display('edit');
        }
    }

    public function edit () {
        if (IS_POST) {
            print_r(I('post.'));
        } else {
            $this->display();
        }
    }
}
