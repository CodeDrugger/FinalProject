<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>注册</title>
</head>
<body>
<form action="SignUpInit" method="get">
  <input type="hidden" name="userclass" value="1">
  <input type="submit" value="我是导师">       
</form>
<form action="SignUpInit" method="get">  
  <input type="hidden" name="userclass" value="2">  
  <input type="submit" value="我是学生">    
</form>
</body>
</html>