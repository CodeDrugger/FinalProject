<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/font-awesome.css">
    <title>登录</title>
    <style>
        body{
            font-family: 'microsoft yahei',Arial,sans-serif;
            background-image: url("images/1.png");
        }
        .loginpanel {
            text-align: center;
            width: 300px;
            border-radius: 0.5rem;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            margin: 10px auto;
            padding: 20px;
            opacity:0.8;
        }
        .row {
            padding: 13% 0px;
        }
        input {
            margin-bottom: 17px;
            padding: 15px;
            background-color: #ECF4F4;
            border-radius: 2px;
            border: none;
        }

    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="panel loginpanel">
            <h2>
                <span class="fa fa-user-circle-o"></span>
                登录
            </h2>
            <form role="form" action="LoginAction" method="get">
                <input class="form-control" name="login.username" type="text" placeholder="登录账号">
                <input class="form-control" name="login.password" type="password" placeholder="输入密码">
                ${info}
                <input class="form-control" type="submit" value="登录">
            </form>
            <a  href="./signup.action">没有账号?注册</a>
        </div>
    </div>
</div>
</body>
</html>