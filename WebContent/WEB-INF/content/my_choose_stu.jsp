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
  <style>
    body{
      font-family: 'microsoft yahei',Arial,sans-serif;
      background-image: url("images/1.png");
      padding-top: 70px;
    }
      .card{
          background-image: url("images/3.jpg");
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
  <title>我的选择</title>
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
                <li><a href="./my_attention_stu?id_in=${id}">我关注的学生</a></li>
                <li><a href="./attention_me_stu?id_in=${id}">关注我的学生</a></li>
                <li><a href="./my_choose_stu?id_in=${id}">我选择的学生</a></li>
                <li><a href="./choose_me_stu?id_in=${id}">选择我的学生</a></li>
                <li><a href="./My_ques.action?id=${id}&q.id=${id}">我的问卷</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="./Show_tea.action?teac.id=${id }" data-toggle="tooltip" data-placement="left" title="查看个人资料"><%=name%></a></li>
                <li><a href="./loginpage.action">注销账户</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
  <h2 style="margin-bottom: 5%;">我选择的学生</h2>
  <div class="row">
    <s:iterator value="select_stu" var="st">
    <div class="col-md-3 ">
      <div class="panel card">
        <div class="panel-body">
          <div class="incard">学生姓名：<a href="Mystu_inf.action?stu_inf_id=${st.id}&id_in=${id_in}">${st.name}</a></div>
          <div class="incard">个人简介：${st.self_intro}</div>
        </div>
      </div>
    </div>
  </s:iterator>
</div>
</div>
  </body>
  </html>