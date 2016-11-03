<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Insert title here</title>
</head>
<body>
<%
/*
 * id varchar(20) not null,
	name varchar(20) not null,
	sex varchar(20) not null,
	age varchar(20) not null,
	benke_major varchar(20) not null,
	wish_major varchar(20) not null,
	zhibo varchar(20) not null,
	wish_class varchar(20) not null,
	bein_class varchar(20) not null,
	score varchar(20) not null,
	honor varchar(1000) not null,
	self_intro varchar(1000) not null,
	tel varchar(20) not null,
	email varchar(20) not null
 */
%>
<form action="AdvSearch_tea" method="get">
  <select name="advsch.benke_major">
    <option value=""></option>
  </select>
  <input type="submit" value="给我搜">
</form>
<select name="advsch.benke_major" form="advsch"></select>
</body>
</html>