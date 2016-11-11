<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Insert title here</title>
</head>
<body>
${message}
<form action="Mytea" method="get">
<input type="hidden" name="id_in" value="${teacher_id}"/>
<input type="submit" value="返回"/>
</form>
</body>
</html>