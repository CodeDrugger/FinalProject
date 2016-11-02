<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Insert title here</title>
</head>
<body>
${info }
<form action="LoginAction" method="get">
  用户名：<input type="text" name="login.username">
  密码：<input type="text" name="login.password">
  <input type="submit" value="登录">
<a href="./signup.action">注册</a>
</form>
</body>
</html>