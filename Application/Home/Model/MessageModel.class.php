<?php
namespace Home\Model;
use Think\Model;
class MessageModel extends Model {

    protected $fields = array('id', 'title', 'email', 'tel', 'content');

    /* 自动验证 */
    protected $_validate = array(
        array('title', 'require', '标题必填!'),
        array('email', 'email', '邮箱格式错误！'),
        array('tel', 'require', '联系方式必填！'),
        array('content', 'require', '内容必填！')
    );

    /* 自动完成 */
    protected $_auto = array(
        array('create_time', 'time', 1, 'function'),
        array('update_time', 'time', 1, 'function'),
        array('status', 0)
    );


    public function input() {
        if(!$this->create()) {
            return false;
        } else {
            if($this->add()) {
                return true;
            } else {
                $this->error = '留言失败';
                return false;
            }
        }
    }

}
