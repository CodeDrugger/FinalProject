<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,domain.Student,domain.Teacher,java.util.List,java.util.ArrayList" errorPage="" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
  <!-- Standard Meta -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

  <!-- Site Properties -->
  <title>mainpage_stu</title>
  <link rel="stylesheet" type="text/css" href="css/semantic.css">

  <script src="js/jquery-3.1.1.min.js"></script>
  <script type="text/javascript" src="js/semantic.min.js"></script>
  <style>
      body {
          font-family: "楷体";
      }

      .fixup {
          word-wrap: break-word;
          word-break: break-all;
          overflow: hidden;
      }
  </style>

</head>
<body>
  <!--@java-->
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
<!--sidebar on the top-->
<div class="ui attached tiny stackable menu grey inverted">
  <div class="ui container">
    <a class="item" href="./MainPage.action?id=${id}&userclass=2"><i class="home icon"></i>主页</a>
    <a class="active item" href="./my_attention_tea?id_in=${id}"><i class="grid layout icon"></i> 考研互选 </a>
    <div class="right item">
      <a class="item" href="./Show_stu.action?stuc.id=${id }"><i class="settings icon"></i><%=name%></a>
      <a class="item" href="./loginpage.action"><i class="moon icon"></i>注销账户</a>
    </div>
  </div>
</div>
<!-- divider-->
<h2 class="ui horizontal divider header">
  <i class="trophy icon"></i>
  关注与选择
</h2>
<!--the main content-->
<div class="ui grid">
  <div class="three wide column"></div>
  <div class="three wide column">
    <div class="ui massive pointing vertical menu">
      <div class="ui item">
        <h2><i class="opencart icon"></i>关注</h2>
        <a class="item" href="./my_attention_tea?id_in=${id}"><i class="attach icon"></i>我关注的</a>
        <a class="active item" href="./attention_me_tea?id_in=${id}"><i class="attach icon"></i>关注我的</a>
      </div>
      <div class="item">
        <h2><i class="gg icon"></i>选择</h2>
        <a class="item" href="./my_choose_tea?id_in=${id}"><i class="attach icon"></i>我选择的</a>
      </div>
    </div>
  </div>
  <div class="six wide stretched column">
    <div class="ui segment">
      <div class="ui divided items">
        <s:iterator value="attention_me" var="am">
        <div class="item">
          <div class="ui small image">
            <img src="./images/elyse.png">
          </div>
          <div class="content">
            <a class="header" href="Mytea_inf.action?tea_inf_id=${am.id}&id_in=${id_in}">${am.name}</a>
            <div class="meta">
              <span>个人简介</span>
            </div>
            <div class="description fixup">
              ${am.self_intro}
            </div>
            <div class="ui extra">
              <form name="form4" method="post" action="Attention_tea">
              <input type="hidden"  name="teacher_id" value="${am.id}" />
              <input type="hidden"  name="student_id" value="${id_in}" />
              <button type = "submit" class="ui right floated primary button" onclick="javascript:form.submit();">
                  关注TA
              <i class="right chevron icon"></i>
             </form>
            </div>
          </div>
        </div>
        </s:iterator>
      </div>
    </div>
    </div>
  </div>
</div>

</body>

</html>
