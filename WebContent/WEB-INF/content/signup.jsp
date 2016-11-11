<%@ page language="java" contentType="text/html; charset=utf8"
pageEncoding="utf8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/font-awesome.css">
    <style>
        body{
            font-family: 'microsoft yahei',Arial,sans-serif;
            background-image: url("images/1.png");
        }
        .signuppanel {
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
    <title>注册</title>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="panel signuppanel">
            <h2>
                <span class="fa fa-user-circle-o"></span>
                注册
            </h2>
            <form action="SignUp" method="get" role="form">
                <input type="text" name="login.username" class="form-control" placeholder="用户名">
                <input type="text" name="login.password" class="form-control" placeholder="密码">
                <select class="selectpicker form-control" data-style="btn-primary" style="margin-bottom: 5%">
                    <option value="导师">导师</option>
                    <option value="学生">学生</option>
                </select>
                <input type="submit" value="注册" class="form-control">
            </form>
        </div>
    </div>
</div>

</body>
</html>