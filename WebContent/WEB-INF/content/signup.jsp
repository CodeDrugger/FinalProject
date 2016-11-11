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
      用户名：<input type="text" name="login.username">
      密码：<input type="text" name="login.password">
      <br>
      我是导师<input type="radio" name="login.userclass" value="1">
      我是学生<input type="radio" name="login.userclass" value="2">
      <br>
      ${info}
    <input type="submit" value="注册">
  </form>
</body>
</html>