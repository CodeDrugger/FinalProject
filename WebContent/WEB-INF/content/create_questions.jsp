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
    <script src="js/my_questions.js"></script>
    <style>
      body {
        font-family: "楷体";
      }
    </style>
  </head>

  <body>
    <!--@java-->
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
    <!--sidebar on the top-->
    <div class="ui attached tiny stackable menu grey inverted">
      <div class="ui container">
        <a class="item" href="./MainPage.action?id=${id}&userclass=1"><i class="home icon"></i>主页</a>
        <a class="item" href="./my_attention_stu?id_in=${id}"><i class="grid layout icon"></i> 考研互选 </a>
        <a class="item" href="./My_ques.action?id=${id}&q.id=${id}"><i class="skyatlas icon"></i>我的问卷</a>
        <div class="right item">
          <a class="item" href="./Show_tea.action?teac.id=${id }" data-toggle="tooltip" data-placement="left" title="查看个人资料"><i class="settings icon"></i><%=name%></a>
          <a class="item" href="./loginpage.action"><i class="moon icon"></i>注销账户</a>
        </div>
      </div>
    </div>
    <!---the introduce-->
    <h2 class="ui horizontal divider header"><i class="tag icon"></i>问些问题？</h2>
    <!--the questions content-->
    <form action="Create_ques" method="post" class="ui form">
      <input id="dbamount" type="hidden" value="${q.amount}">
      <input type="hidden" name="id" value="${id}">
      <input type="hidden" name="q.id" value="${id}">
      <div class="ui grid">
        <div class="row">
          <div class="four wide column"> </div>
          <div class="eight wide column">
            <div class="ui piled segments" id="content">

            </div>
          </div>
        </div>
        <div class="row">
          <div class="six wide column">
          </div>
          <div class="four wide column">
            <button class="ui labeled inverted violet icon button" onclick="newLine()">
                    <i class="plus icon"></i>新增
            </button>
            <button class="ui labeled inverted violet icon button" onclick="removeLine()">
                    <i class="remove icon"></i>删除
            </button>
            <button class="ui labeled inverted violet icon button" onclick="javascript:form.submit();">
                    <i class="upload icon"></i>提交
            </button>
          </div>
        </div>
      </div>
    </form>
  </body>

</html>
