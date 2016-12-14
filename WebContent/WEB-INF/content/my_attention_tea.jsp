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
  <title>my_attention_tea</title>
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
  Connection connect = DriverManager.getConnection("jdbc:mysql://115.28.67.141:3306/fpdb", "fp_user", "123456");
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
		<form name="form20" action="MainPage" method="post">   
		<input type="hidden" name="id" value="${id}"/>
		<input type="hidden" name="userclass" value="2"/></form>
		<form name="form21" action="my_attention_tea" method="post">   
		<input type="hidden" name="id_in" value="${id}"/></form>
      <a class="item" href="javascript:document.form20.submit();"><i class="home icon"></i>主页</a>
      <a class="item" href="javascript:document.form21.submit();"><i class="grid layout icon"></i> 考研互选 </a>
      <div class="right item">
		<form name="form22" action="Show_stu" method="post">   
		<input type="hidden" name="stuc.id" value="${id}"/></form>
		<form name="form23" action="loginpage" method="post"></form>
        <a class="item" href="javascript:document.form22.submit();"><i class="settings icon"></i><%=name%></a>
        <a class="item" href="javascript:document.form23.submit();"><i class="moon icon"></i>注销账户</a>
      </div>
</div>
</div>
<!-- divider-->
<h2 class="ui horizontal divider header">
  <i class="trophy icon"></i>
  关注的导师
</h2>
<!--the main content-->
<div class="ui grid">
  <div class="three wide column"></div>
  <div class="three wide column">
    <div class="ui large pointing vertical menu">
      <div class="ui item">
        <h2><i class="opencart icon"></i>关注</h2>
		
		<form name="form30" action="my_attention_tea" method="post">   
		<input type="hidden" name="id_in" value="${id}"/></form>
		
		<form name="form31" action="attention_me_tea" method="post">   
		<input type="hidden" name="id_in" value="${id}"/></form>
		
        <a class="active item" href="javascript:document.form30.submit();"><i class="attach icon"></i>我关注的</a>
        <a class="item" href="javascript:document.form31.submit();"><i class="attach icon"></i>关注我的</a>
      </div>
      <div class="item">
        <h2><i class="gg icon"></i>选择</h2>
		<form name="form32" action="my_choose_tea" method="post">   
		<input type="hidden" name="id_in" value="${id}"/></form>
		
		<form name="form33" action="choose_me_tea" method="post">   
		<input type="hidden" name="id_in" value="${id}"/></form>
		
        <a class="item" href="javascript:document.form32.submit();"><i class="attach icon"></i>我选择的</a>
        <a class="item" href="javascript:document.form33.submit();"><i class="attach icon"></i>选择我的</a>
      </div>
    </div>
  </div>
  <div class="six wide stretched column">
    <div class="ui segment">
      <div class="ui divided items">
      
        <s:iterator value="attention_tea" var="at">
        <div class="item">
          <div class="ui small image">
            <img src="${at.picture_name }">
          </div>
          <div class="content">
            <form name="gg8${at.id}" action="Mytea_inf" method="post">   
			<input type="hidden" name="tea_inf_id" value="${at.id}"/>
			<input type="hidden" name="id_in" value="${id_in}"/>
			</form>
			<a class="header" href="javascript:document.gg8${at.id}.submit();">${at.name}</a>
            <div class="meta">
              <span>个人简介</span>
            </div>
            <div class="description fixup">
              ${at.self_intro}
            </div>
            <div class="ui extra">
            <form name="formgjy" method="post" action="Stu_cancel_attention">
                  <input type="hidden"  name="student_id" value="${id_in}" />
                  <input type="hidden"  name="teacher_id" value="${at.id}" />
                  <button type = "submit" class="ui right floated  tiny primary button" onclick="javascript:form.submit();">
                      取关TA
                  <i class="right chevron icon"></i>
                </button>
                </form>
              <form name="form3" method="post" action="Choose_tea" class="ui form">
              <input type="hidden"  name="teacher_id" value="${at.id}" />
              <input type="hidden"  name="student_id" value="${id_in}" />
              <button type = "submit" class="ui right floated tiny primary button" onclick="javascript:form.submit();">
                  选择TA
              <i class="right chevron icon"></i>
              </button>
             </form>
             <form method="post" action="His_ques">
               <input type="hidden"  name="q.id" value="${at.id}" />
               <input type="hidden"  name="id" value="${id_in}" />
               <button type = "submit" class="ui right floated tiny primary button" onclick="javascript:form.submit();">
                   回答TA的问卷
               <i class="right chevron icon"></i>
               </button>
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
