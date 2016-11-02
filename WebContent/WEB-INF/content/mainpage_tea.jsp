<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Insert title here</title>
</head>
<body>
<form action="SearchTea" method="get">
  <input type="hidden" name="search.user" value="0">
  <input type="text" name="search.keyword" value="">
  <input type="submit" value="给我搜">
</form>
<a href="./profile_tea.action">${login.username }</a>
</body>
</html>