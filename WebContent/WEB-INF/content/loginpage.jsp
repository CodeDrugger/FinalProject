<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>登录</title>
<link rel="stylesheet" href="css/uikit.almost-flat.min.css">
<script src="js/uikit.min.js"></script>
</head>
 <body class="uk-height-1-1">
        <div class="uk-vertical-align uk-text-center uk-height-1-1">
            <div class="uk-vertical-align-middle" style="width: 27%;">
                <form class="uk-panel uk-panel-box uk-form" action="LoginAction" method="get">
                    <h2 class="uk-panel-title">登录</h2>
                    <div class="uk-form-row">
                        <input class="uk-width-1-1 uk-form-large" type="text" placeholder="用户名" name="login.username">
                    </div>
                    <div class="uk-form-row">
                        <input class="uk-width-1-1 uk-form-large" type="text" placeholder="密码" name="login.password">
                    </div>
                    ${info}
                    <div class="uk-form-row">
                    	<input class="uk-width-1-1 uk-button uk-button-primary uk-button-large" type="submit" value="登录">
                    </div>
                     <div class="uk-form-row uk-text-small">
                        <a class="uk-float-right uk-link uk-link-muted" href="./signup.action">没有账号?注册</a>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>