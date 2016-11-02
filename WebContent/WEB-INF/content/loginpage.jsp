<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8"%>
<!doctype html>
<html lang="zh">
<head>
    <title>登录</title>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        /* 导入CDN提供的bootstrap3相关样式文件 */
        @import url("//cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css");
        @import url("//cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css");
        /* 导入font-awesome相关样式文件 */
        @import url("//cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css");
        /* 定义一些基础CSS */
        body{
            font-family: 'microsoft yahei',Arial,sans-serif;
            background-image: url('images/1.jpg');
            background-repeat:no-repeat;
        }

        .row {
            padding: 9% 0px;
        }

        /* 定义loginpanel */

        .loginpanel {
            text-align: center;
            width: 300px;
            border-radius: 0.5rem;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            margin: 10px auto;
            background-color: #555;
            padding: 20px;
            opacity: .7;
        }

        input{
            width: 100%;
            margin-bottom: 17px;
            padding: 15px;
            background-color: #ECF4F4;
            border-radius: 2px;
            border: none;
        }

        /* 其它基本元素定义 */
        h2 {
            margin-bottom: 20px;
            font-weight: normal;
            color: #EFEFEF;
        }

        a{
            color: #f96145;
        }
        a:hover{
            color: #265a88;
        }
        .btn {
            border-radius: 2px;
            padding: 10px;
        }

        .btn span {
            font-size: 27px;
            color: white;
        }

        /* 定义一个大一些的图标 */
        .bigicon {
            font-size: 97px;
            color: #f08000;
        }

        /* 定义登录按钮和锁定按钮,这里我们使用绝对定位，将两个按钮中的登录按钮隐藏　*/

        .buttonwrapper{
            position:relative;
            overflow:hidden;
            height:50px;
        }


        .loginbutton {
            background-color: #f08000;
            width: 100%;
            -webkit-border-top-right-radius: 0;
            -webkit-border-bottom-right-radius: 0;
            -moz-border-radius-topright: 0;
            -moz-border-radius-bottomright: 0;
            border-top-right-radius: 0;
            border-bottom-right-radius: 0;
            left: -260px; /* 这里定义绝对定位，设置left可以使得按钮消失，设置为0则出现 */
            position:absolute;
            top:0;
        }

        .lockbutton {
            font-size: 27px;
            color: #f96145;
            padding: 10px;
            width:100%;
            position:absolute; /* 同样使用绝对定位，并且left为0*/
            top:0;
            left:0;
        }

        /* 添加边框 */
        .redborder {
            border:2px solid #f96145;
            border-radius:2px;
        }
    </style>
</head>
<body>
<!-- 这里定义全屏的布局，自适应浏览器宽度 -->
<div class="container-fluid">
    <div class="row">

        <!-- 定义登录面板 -->
        <div class="loginpanel">
            <i id="loading" class="fa fa-spin fa-spinner bigicon hidden"></i>
            <h2>
                <span class="fa fa-user-circle-o"></span>
                登录
            </h2>

            <form role="form">

                <!-- 定义登录用户名和密码输入 -->

                <!-- 这里将定义的check_value方法绑定到onkeypress -->
                <input name="login.username" type="text" placeholder="登录账号" onkeypress="check_value();">
                <input name="login.password" type="password" placeholder="输入密码" onkeypress="check_value();">
                ${info}
                <!-- 以下定义按钮，包括两个按钮 -->
                <div class="buttonwrapper">

                    <!-- 这里添加按钮class，这里使用图标替换文字 -->
                    <input id="loginbtn" class="btn btn-warning loginbutton" type="submit">

                    <!-- 定义另外一个按钮，用来判断用户输入是否正确，否则不显示上面登录按钮 -->

                    <!-- 这里添加锁定按钮class -->
                    <span id="lockbtn" class="lockbutton redborder fa fa-lock"></span>

                </div>
                <a href="signup.html">没有账号？注册一个</a>

            </form>
        </div>

    </div>
</div>

<!-- 导入jQuery类库 -->
<script type='text/javascript' src="//cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<script>
    /*Javascript代码片段*/

    /* 定义一个检查数据的方法 */
    function check_value(){
        //判断用户输入的用户名和密码不为空
        if($('#username').val().length !=0 && $('#password').val().length!=0){
            //调用jquery的animate方法重新定义CSS
            $('#loginbtn').animate({left:'0', duration:'slow'});//这行控制登录按钮从左边滑入，通过控制left属性
            $('#lockbtn').animate({left:'260px', duration:'slow'});//同样控制锁定按钮向右滑动消失
        }
    }

    /* 接下来定义登录按钮出现后点击登录按钮的处理 */

    $(function(){
        //当用户输入登录信息后，#loginbtn元素出现，点击此按钮将看到登录中效果
        $('#loginbtn').click(function(){
            //此处定义回调方法
            $('#loading').removeClass('hidden');//点击登录按钮触发“加载中效果”
        });
    });
</script>
</body>
</html>