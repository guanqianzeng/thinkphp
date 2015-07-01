<?php
namespace Admin\Model;
use Think\Model;
class AdminModel extends Model {
    protected $_validate = array(
        //array('verify','check_verify','验证码错误！',1,'function',4),
        array('username','require','用户名必填！'),
        array('password','require','密码必填！')
    );

    /* 登录处理 */
    public function login () {
        if (!$this->create('', 4)) {
            return false;
        } else {
            $password = I('password');
            $user = $this->where(array('username'=>I('username')))->field(true)->find();
            if ($user['password'] !== password_md5($password)) {
                $this->error = '密码错误！';
                return false;
            } else {
                /* 更新登录信息 */
                $data = array(
                    'uid'             => $user['user_id'],
                    'login'           => array('exp', '`login`+1'),
                    'last_login_time' => NOW_TIME,
                    'last_login_ip'   => get_client_ip(1),
                );
                //print_r($data); exit;
                $this->save($data);
                /* 记录登录SESSION和COOKIES */
                $auth = array(
                    'uid'             => $user['user_id'],
                    'username'        => $user['username'],
                    'last_login_time' => $user['last_login_time'],
                );
                session('user_auth', $auth);
                session('user_auth_sign', data_auth_sign($auth));
                return true;
            }
        }
    }

    /* 注销当前用户 */
    public function logout(){
        session('user_auth', null);
        session('user_auth_sign', null);
    }

}
