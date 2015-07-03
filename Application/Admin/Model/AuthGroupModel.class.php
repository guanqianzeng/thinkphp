<?php
namespace Admin\Model;
use Think\Model;
class AuthGroupModel extends Model {

    private $_formatTree = array();

    //修改表名称
    protected $tableName = 'auth_group';

    /* 自动验证 */
    protected $_validate = array(
        array('title','require','规则名称必填！'),
    );

    /* 自动完成 */
    protected $_auto = array(
        //array('status', '1', self::MODEL_BOTH),
    );

    /* 插入操作 */
    public function input () {
        if (!$this->create()) {
            return false;
        } else {
            $this->add();
            return true;
        }
    }

    /* 更新操作 */
    public function update () {
        if (!$this->create()) {
            return false;
        } else {
            $this->save();
            return true;
        }
    }


}
