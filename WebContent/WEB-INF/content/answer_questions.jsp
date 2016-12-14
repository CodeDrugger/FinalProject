<%@ page language="java" contentType="text/html; charset=utf8" import="java.sql.*"
pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

  <head>
    <!-- Standard Meta -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <!-- Site Properties -->
    <title>question</title>
    <link rel="stylesheet" type="text/css" href="css/semantic.css">
    <script src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/semantic.min.js"></script>
    <script src="js/his_questions.js"></script>
    <style>
      body {
        font-family: "楷体";
      }
    </style>
    <script type="text/javascript">
  		var array = [];
		var ans = [];
		<c:forEach items="${q.questions}" var="u">
		array.push("${u}")
		</c:forEach> 
		<c:forEach items="${a.answers}" var="u">
		ans.push("${u}")
		</c:forEach> 

  	</script>
  </head>

  <body>
    <c:set var="id" value="${id}" scope="request"></c:set>
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
      <a class="item" href="javascript:document.form10.submit();"><i class="home icon"></i>主页</a>
      <a class="item" href="javascript:document.form10.submit();"><i class="grid layout icon"></i> 考研互选 </a>
      <div class="right item">
		<form name="form22" action="Show_stu" method="post">   
		<input type="hidden" name="stuc.id" value="${id}"/></form>
		<form name="form23" action="loginpage" method="post"></form>
		<form name="form25" action="message_stu" method="post">
        <input type="hidden" name="id" value="${id}"/></form>
      	<a class="item" href="javascript:document.form25.submit();"> <i class="message icon"></i>消息中心</a>
        <a class="item" href="javascript:document.form10.submit();"><i class="settings icon"></i><%=name%></a>
        <a class="item" href="javascript:document.form10.submit();"><i class="moon icon"></i>注销账户</a>
      </div>
</div>
    </div>

    <!---the introduce-->
    <h2 class="ui horizontal divider header"><i class="tag icon">回答问卷</i></h2>
    <h1 id = info>该导师暂无问卷T_T</h1>
    <!--the questions content-->
    <form action="Answer_ques" method="post" class="ui form">
      <div class="ui grid">
        <div class="row">
          <div class="four wide column"> </div>
          <div class="eight wide column">
            <div class="ui piled segments" id="content">

            </div>
          </div>
        </div>
        <div class="row">
          <div class="seven wide column">
          </div>
          <div class="four wide column">
            <input id="dbamount" type="hidden" name="a.amount" value="${q.amount}">
            <input type="hidden" name="a.id_tea" value="${q.id}">
            <input type="hidden" name="a.id_stu" value="${id}">
            <input type="hidden" name="id" value="${id}">
            <button class="ui labeled inverted violet icon button" onclick="history.back();">
                    <i class="chevron left icon"></i>返回
            </button>
            <button id="submit" class="ui labeled inverted violet icon button" onclick="javascript:form.submit();">
                    <i class="upload icon"></i>提交
            </button>
          </div>
        </div>
      </div>

    </form>
  </body>

</html>
