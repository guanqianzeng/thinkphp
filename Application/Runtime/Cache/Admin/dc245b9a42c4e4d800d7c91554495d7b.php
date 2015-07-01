<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>后台登录页面</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script language="javascript" src="/Public/Admin/js/jquery-1.4.2.min.js"></script>
    </head>
    <style media="screen">
        body {background-color: rebeccapurple;}
        .login {width: 520px; margin: 0 auto; margin-top: 300px; }
        .login .xx {width: 120px; float: left; padding: 5px;}
        .login .xx input {height: 25px; padding: 5px 10px; border: none; width:100px;}
        .login .xx input[type=submit] {background-color: #00FFBB; height: 35px; font-weight: bold; color: #FFF;}
        .login .verify {position: relative; padding:5px}
        img.login .verify::before {
            width:200px;
        }

        .login .verify img{position: absolute; top: -38px; display: none;}
    </style>
    <body>
        <div class="login">
            <form class="" action="" method="post">
                <div class="xx">
                    <input type="text" name="username" value="" placeholder="管理员帐号">
                </div>
                <div class="xx">
                    <input type="text" name="password" value="" placeholder="管理员密码">
                </div>
                <div class="xx verify">
                    <input type="text" name="verify" value="" placeholder="验证码">
                    <img src="<?php echo U('verify'), '', '';?>" width="120" height="40" />
                </div>
                <div class="xx">
                    <input type="submit" value="登 录">
                </div>
            </form>
        </div>
        <script type="text/javascript">
            $(function(){
                $(".verify img").click(function(){
                    $(this).attr("src", "<?php echo U('verify');?>");
                });
                $('.verify').hover(
                    function(){
                        $(this).find('img').fadeIn();
                    },
                    function(){
                        $(this).find('img').fadeOut();
                    }
                );
            })
        </script>
    </body>
</html>