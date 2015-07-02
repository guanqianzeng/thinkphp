<?php
namespace Admin\Model;
use Think\Model;
class MenuModel extends Model {
    //修改表名称
    protected $tableName = 'auth_rule';

    /* 自动验证 */
    protected $_validate = array(
        //array('verify','check_verify','验证码错误！',1,'function',4),
        array('title','require','规则名称必填！'),
        array('name','require','规则标识必填！')
    );

    public function input () {
        if (!$this->create()) {
            return flase;
        } else {
            exit('111');
            $this->add();
            return true;
        }

    }
}
