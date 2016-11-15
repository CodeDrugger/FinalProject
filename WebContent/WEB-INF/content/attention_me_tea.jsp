<%@ taglib uri="/struts-tags" prefix="s"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,domain.Student,domain.Teacher,java.util.List,java.util.ArrayList" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.css">
<link rel="stylesheet" href="css/font-awesome.css">
<script src="js/advsearch_result_tea.js"></script>
<title>关注我的</title>
<style>
    body {
      font-family: 'microsoft yahei', Arial, sans-serif;
      background-image: url("images/1.png");
      padding-top: 70px;
    }
    .card{
      background-image: url("images/2.jpg"); 
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
<%
 String name = "点此完善信息";
 String wish_major = "";
 String[] reco_name = {"", "", "", "", ""};
 String[] reco_id = {"", "", "", "", ""};
 String id = (String) request.getAttribute("id");
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
             wish_major = rs.getString("wish_major");
         }
     }
     ResultSet rst = stmt.executeQuery("select * from tea_inf where major='" + wish_major + "' order by rate desc");
     int i = 0;
     while (rst.next()) {
         if (i < 5) {
             reco_name[i] = rst.getString("name");
             reco_id[i] = rst.getString("id");
             i++;
         } else
             break;
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
            <a class="navbar-brand" href="./mainpage_stu.action">主页</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="./my_attention_tea?id_in=${id}">我关注的导师</a></li>
                <li><a href="./attention_me_tea?id_in=${id}">关注我的导师</a></li>
                <li><a href="./my_choose_tea?id_in=${id}">我选择的导师</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="./Show_stu.action?stuc.id=${id }" data-toggle="tooltip" data-placement="left" title="查看个人资料"><%=name%></a></li>
                <li><a href="./loginpage.action">注销账户</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <h2 style="margin-bottom: 5%;">关注我的导师</h2>
    <div class="row">
      <s:iterator value="attention_me" var="am">
        <div class="col-md-3 ">
            <div class="panel card">
              <div class="panel-body">
                <div class="incard">导师姓名：<a href="Mytea_inf.action?tea_inf_id=${am.id}&id_in=${id_in}">${am.name}</a><br/></div>
                <div class="incard">个人简介：${am.self_intro}<br/></div>
                <div class="incard"><form name="form4" method="post" action="Attention_tea">
                  <input type="hidden"  name="teacher_id" value="${am.in}" />
                  <input type="hidden"  name="student_id" value="${id_in}" />
                  <input type="submit"  value="关注TA" class="btninp" />
                </form></div>
              </div>
            </div>
        </div>
      </s:iterator>
    </div>
  </div>
</body>
</html>