<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,domain.Student,domain.Teacher,java.util.List,java.util.ArrayList" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
  <!-- Standard Meta -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

  <!-- Site Properties -->
  <title>choose_me_stu</title>
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
    <a class="active item" href="./My_ques.action?id=${id}&q.id=${id}"><i class="skyatlas icon"></i>我的问卷</a>
    <div class="right item">
      <a class="item" href="./Show_tea.action?teac.id=${id }" data-toggle="tooltip" data-placement="left" title="查看个人资料"><i class="settings icon"></i><%=name%></a>
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
        <a class="item" href="./my_attention_stu?id_in=${id}"><i class="attach icon"></i>我关注的</a>
        <a class="item" href="./attention_me_stu?id_in=${id}"><i class="attach icon"></i>关注我的</a>
      </div>
      <div class="item">
        <h2><i class="gg icon"></i>选择</h2>
        <a class="item" href="./my_choose_stu?id_in=${id}"><i class="attach icon"></i>我选择的</a>
        <a class="item" href="./choose_me_stu?id_in=${id}"><i class="attach icon"></i>选择我的</a>
      </div>
    </div>
  </div>
  <div class="six wide stretched column">
    <div class="ui segment">
      <div class="ui divided items">
        <s:iterator value="selected_me" var="sm">
          <div class="item">
            <div class="ui small image">
              <img src="./images/elyse.png">
            </div>
            <div class="content">
              <a class="header" href="Mystu_inf.action?stu_inf_id=${sm.id}&id_in=${id_in}">${sm.name}</a>
              <div class="meta">
                <span>个人简介</span>
              </div>
              <div class="description fixup">
                ${sm.self_intro}
              </div>
              <div class="ui extra">
                <form name="form3" method="post" action="Choose_stu">
                  <input type="hidden"  name="teacher_id" value="${id_in}" />
                  <input type="hidden"  name="student_id" value="${sm.id}" />
                  <button class="ui right floated grey button" onclick="javascript:form.submit();">
                      选择TA
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
