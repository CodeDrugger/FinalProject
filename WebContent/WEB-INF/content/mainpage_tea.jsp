<%@ page language="java" contentType="text/html; charset=utf8" import="java.sql.*"
pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/font-awesome.css">
    <style>
        body{
            font-family: 'microsoft yahei',Arial,sans-serif;
            background-image: url("images/1.png");
            padding-top: 70px;
        }
        .becenter{
            text-align: center}
        .mmm{
            margin-bottom: 5%;
            font-size: larger;
        }
    </style>
</head>
<body>
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
<nav class="navbar navbar-default navopa navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="./mainpage_tea.action">主页</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="#">我关注的</a></li>
                <li><a href="#">关注我的</a></li>
                <li><a href="./My_ques.action?id=${id}&q.id=${id}">我的问卷</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="./Show_tea.action?teac.id=${id }" data-toggle="tooltip" data-placement="left" title="查看个人资料"><%=name%></a></li>
                <li><a href="#">注销账户</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container becenter">
    <img src="images/4.jpg" height="150" width="200" style="margin-bottom: 2% ;border-radius: 5em">
    <form action="SearchTea" method="get" class="mmm">
        <input type="hidden" name="id" value="${id}" style="width:50%;height:50px">
        <input type="hidden" name="search.user" value="0" style="width:50%;height:50px">
        <input type="text" name="search.keyword" value="" style="width:50%;height:50px;padding-left: 5px">
        <input type="submit" value="给我搜" style="width:10%;height:50px">
    </form>
    <c:set var="id" value="${id }" scope="request"></c:set>
   
    推荐学生：
    <a href=""></a>
</div>
</body>
</html>