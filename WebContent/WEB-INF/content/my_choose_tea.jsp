<%@ taglib uri="/struts-tags" prefix="s"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,domain.Student,domain.Teacher,java.util.List,java.util.ArrayList" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
<title>我选择的导师</title>
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
ResultSet rs = stmt.executeQuery("select * from stu_inf where id='" + id + "'");
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
            <a class="navbar-brand" href="./MainPage.action?id=${id_in}&userclass=2">主页</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="./my_attention_tea?id_in=${id_in}">我关注的导师</a></li>
                <li><a href="./attention_me_tea?id_in=${id_in}">关注我的导师</a></li>
                <li><a href="./my_choose_tea?id_in=${id_in}">我选择的导师</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="./Show_stu.action?stuc.id=${id_in}" data-toggle="tooltip" data-placement="left" title="查看个人资料"><%=name%></a></li>
                <li><a href="./loginpage.action">注销账户</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
  <h2 style="margin-bottom: 5%;">我选择的导师</h2>
  <div class="row">
    <s:iterator value="select_tea" var="st">
    <div class="col-md-3 ">
      <div class="panel card">
        <div class="panel-body">
          <div class="incard">导师姓名：<a href="Mytea_inf.action?tea_inf_id=${st.id}&id_in=${id_in}">${st.name}</a></div>
          <div class="incard">个人简介：${st.self_intro}</div>
          <div class="incard">
            <form name="form3" method="post" action="Stu_cancel_choose">
              <input type="hidden"  name="teacher_id" value="${st.id}" />
              <input type="hidden"  name="student_id" value="${id_in}" />
              <input type="submit"  value="取消选择" class="btninp" />
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