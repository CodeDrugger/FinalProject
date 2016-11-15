<%@ taglib uri="/struts-tags" prefix="s"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,domain.Student,domain.Teacher,java.util.List,java.util.ArrayList" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.css">
<link rel="stylesheet" href="css/font-awesome.css">
<title>选择我的</title>
<style>
  body{
    font-family: 'microsoft yahei',Arial,sans-serif;
    background-image: url("images/1.png");
    padding-top: 70px;
  }
  .card{
    background-image: url("images/2.jpg");
    border: none;
  }
  .incard{
    margin-bottom: 10%;
  }
  .btninp{
    border-radius: 5px;
    background: #fafafe
  }
</style>
</head>
<body>
<c:set var="id" value="${id_in}" scope="request"></c:set>
	<%
	String id = (String)request.getAttribute("id");
	String name = "点此完善信息";
	try {
	    Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
	    e.printStackTrace();
	}
	try {
	    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb", "fp_user", "123456");
	    Statement stmt = connect.createStatement();
	    ResultSet rs = stmt.executeQuery("select * from tea_inf where id='" + id + "'");
	    if (rs.next()) {
	        if (rs.getString("name") != null && rs.getString("name").length() > 0) {
	        	name = rs.getString("name");
	        }
	    }
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
            <a class="navbar-brand" href="./MainPage.action?id=${id_in}&userclass=1">主页</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="./my_attention_stu?id_in=${id_in}">我关注的学生</a></li>
                <li><a href="./attention_me_stu?id_in=${id_in}">关注我的学生</a></li>
                <li><a href="./my_choose_stu?id_in=${id_in}">我选择的学生</a></li>
                <li><a href="./choose_me_stu?id_in=${id_in}">选择我的学生</a></li>
                <li><a href="./My_ques.action?id=${id_in}&q.id=${id_in}">我的问卷</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="./Show_tea.action?teac.id=${id }" data-toggle="tooltip" data-placement="left" title="查看个人资料"><%=name%></a></li>
                <li><a href="./loginpage.action">注销账户</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
  <h2 style="margin-bottom: 5%;">选择我的学生</h2>
  <div class="row">
    <s:iterator value="selected_me" var="sm">
    <div class="col-md-3 ">
      <div class="panel card">
        <div class="panel-body">
          <div class="incard">学生姓名：<a href="Mystu_inf.action?stu_inf_id=${sm.id}&id_in=${id_in}">${sm.name}</a><br/></div>
          <div class="incard">个人简介：${sm.self_intro}<br/></div>
          <div class="incard"><form name="form3" method="post" action="Choose_stu">
            <input type="hidden"  name="teacher_id" value="${id_in}" />
            <input type="hidden"  name="student_id" value="${sm.id}" />
            <input type="submit"  value="选择TA" class="btninp" />
          </form></div>
          <div class="incard">
            <form name="form3" method="post" action="Tea_cancel_attention">
              <input type="hidden"  name="teacher_id" value="${id_in}" />
              <input type="hidden"  name="student_id" value="${sm.id}" />
              <input type="submit"  value="取关TA" class="btninp" />
            </form>
          </div>
        </div>
      </div>
    </div>
  </s:iterator>
</div>
</div>
</body>
</html>