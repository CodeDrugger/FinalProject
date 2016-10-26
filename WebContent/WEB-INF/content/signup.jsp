<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>注册</title>
</head>
<body>
  <form action="SignUp" method="get">
    <input type="hidden" name="login.userclass" value="${userclass }">
      用户名：<input type="text" name="login.username">
      密码：<input type="text" name="login.password">
    <input type="submit" value="注册">
  </form>
</body>
</html>