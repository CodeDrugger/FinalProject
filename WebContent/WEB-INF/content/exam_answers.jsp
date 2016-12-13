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
  <title>mainpage_stu</title>
  <link rel="stylesheet" type="text/css" href="css/semantic.css">

  <script src="js/jquery-3.1.1.min.js"></script>
  <script type="text/javascript" src="js/semantic.min.js"></script>
  <script type="text/javascript">
  	var ques = [];
  	var ans = [];
  	<c:forEach items="${a.questions}" var="u">
  	ques.push("${u}")
  	</c:forEach> 
  	<c:forEach items="${a.answers}" var="u">
  	ans.push("${u}")
  	</c:forEach> 
  </script>
  <script src="js/exam_ans.js"></script>
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


<!-- the Recommend-->
<!---the introduce-->
<h2 class="ui horizontal divider header"><i class="tag icon">回答问卷</i></h2>
<h1 id = info>该学生暂未回答问卷T_T</h1>
<!--the questions content-->
  <div class="ui grid">
    <div class="row">
      <div class="four wide column"> </div>
      <div class="eight wide column">
        <input id="dbamount" type="hidden" value="${a.amount}">
        <div class="ui piled segments" id="content">

        </div>
      </div>
    </div>
    <div class="row">
      <div class="seven wide column">
      </div>
      <div class="four wide column">
        <button class="ui labeled inverted violet icon button" onclick="history.back();">
                <i class="chevron left icon"></i>返回
        </button>

      </div>
    </div>
  </div>
</body>

</html>
