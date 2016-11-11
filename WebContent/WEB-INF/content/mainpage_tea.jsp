<%@ page language="java" contentType="text/html; charset=utf8" import="java.sql.*"
    pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<c:set var="id" value="${id }" scope="request"></c:set>
<%
String name = "点此完善信息";
String major = "";
String id = (String)request.getAttribute("id");
try {
	Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}
try {
	Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb","fp_user","123456");
	Statement stmt = connect.createStatement();
	ResultSet rs = stmt.executeQuery("select * from tea_inf where id='"+ id + "'");
  	if (rs.next())
  	{
  		if (rs.getString("name") != null && rs.getString("name").length() > 0)
  		{
  			name = rs.getString("name");
  			major = rs.getString("major");
  		}	
  	}
  	ResultSet rst = stmt.executeQuery("select * from stu_inf where wish_major='" + major + "' order by rate desc,score desc");
  	connect.close();
} catch (SQLException e) {
  	e.printStackTrace();
}
%>
您好，<a href="./Show_tea.action?teac.id=${id }"><%=name%></a>
导师推荐：
<a href=""></a>
</body>
</html>