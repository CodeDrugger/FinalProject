<%@ page language="java" contentType="text/html; charset=utf8" import="java.sql.*"
    pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>..</title>
</head>
<body>
<form action="SearchStu" method="get">
  <input type="hidden" name="search.user" value="1">
  <input type="text" name="search.keyword" value="">
  <input type="submit" value="给我搜">
</form>
<c:set var="id" value="${login.id }" scope="request"></c:set>
<%
String name = "点此完善信息";
String id = (String)request.getAttribute("id");
try {
	Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}
try {
	Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb","fp_user","123456");
	Statement stmt = connect.createStatement();
	ResultSet rs = stmt.executeQuery("select * from stu_inf where id='"+ id + "'");
  	if (rs.next())
  	{
  		if (rs.getString("name").length() > 0)
  			name = rs.getString("name");
  	}
  	connect.close();
} catch (SQLException e) {
  	e.printStackTrace();
}
%>
您好，<a href="./show_stu.action?stus.id=${login.id }"><%=name%></a>
</body>
</html>