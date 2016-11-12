<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Insert title here</title>
<script src="js/jump.js" charset="utf-8"></script>
</head>
<body>
${message}
<form id="form" method="get">
<input id="msg" type="hidden" value="${message}">
<input id="input" type="hidden">
<input type="submit" value="返回">
</form>
</body>
</html>