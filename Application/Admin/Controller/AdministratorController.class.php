<?php
/**
 * Created by PhpStorm.
 * User: 小官
 * Date: 2015/6/24
 * Time: 14:13
 */

namespace Admin\Controller;

use Think\Controller;
use Admin\Lib\AdminController;



class AdministratorController extends AdminController{

    public function index(){



        $this->display("index");
    }

}