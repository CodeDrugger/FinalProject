<%@ page language="java" contentType="text/html; charset=utf8" import="java.sql.*"
    pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.css">
<link rel="stylesheet" href="css/font-awesome.css">
<title>查看问卷</title>
<style>
  body{
            font-family: 'microsoft yahei',Arial,sans-serif;
            background-image: url("images/1.png");
            padding-top: 70px;
        }
  .inputq {
    background: #fafdfe;
    height: 35px;
    width: 70%;
    line-height: 28px;
    border: 1px solid #9bc0dd;
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    margin-bottom: 10px;
    margin-left: 7%;
  }
.subinp{
  width: 125px;
  border-radius: 3em;
  border-style: outset;
  height: 30px;
  margin-right: 2%;
  outline:none;
  background-image: url("images/7.jpg");
}
textarea{
  resize: none;
  width: 100%;
  height: 120px;
}
</style>
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
<nav class="navbar navbar-default navopa navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="./MainPage.action?id=${id}&userclass=1">主页</a>
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
                <li><a href="./Show_tea.action?teac.id=${id }" data-toggle="tooltip" data-placement="left" title="查看个人资料"><%=name%>
                </a></li>
                <li><a href="./loginpage.action">注销账户</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
  <div class="row">
  <div class="col-md-6 col-md-offset-3">
  <div class="panel panel-default">
  <div class="panel-body">
  <div id="info">该学生暂未回答问卷T_T</div>
     <input id="dbamount" type="hidden" value="${a.amount}">
     <div id="content"></div>
     <input type="button" value="返回" onclick="history.back();" class="subinp" style="margin-left: 20%;">
  </div>
  </div>
    
  </div>
  </div>
</div>
</body>
</html>
