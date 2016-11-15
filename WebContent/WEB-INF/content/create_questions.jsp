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
  <title>修改我的问卷</title>
  <script type="text/javascript">
    var array = [];
    <c:forEach items="${q.questions}" var="u">
    array.push("${u}")
  </c:forEach> 
</script>
<script src="js/my_questions.js"></script>
<style>
  body {
    font-family: 'microsoft yahei', Arial, sans-serif;
    background-image: url("images/1.png");
    padding-top: 70px;
  }
  .inputq {
    background: #fafdfe;
    height: 28px;
    width: 180px;
    line-height: 28px;
    border: 1px solid #9bc0dd;
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    margin-bottom: 10px;
    margin-left: 7%;
  }
</style>
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
        <a class="navbar-brand" href="./mainpage_tea.action">主页</a>
      </div>
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
          <li>
            <a href="#">我关注的</a>
          </li>
          <li>
            <a href="#">关注我的</a>
          </li>
          <li>
            <a href="./My_ques.action?id=${id}&q.id=${id}">我的问卷</a>
          </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li>
            <a href="./Show_tea.action?teac.id=${id }" data-toggle="tooltip" data-placement="left" title="查看个人资料">
              <%=name%>
            </a>
          </li>
          <li>
            <a href="./loginpage.action">注销账户</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="container">
    <div class="row">
      <div class="col-md-8 col-md-offset-2">
      <div class="panel">
        <div class="panel-body">
          <form action="Create_ques" method="post">
          <div id="content"></div>
          <input type="hidden" name="id" value="${id}">
          <input type="hidden" name="q.id" value="${id}">
          <input id="dbamount" type="hidden" value="${q.amount}">
          <input type="button" value="新增" onclick="newLine()">
          <input type="button" value="删除" onclick="removeLine()">
          <input id="amounttodb" type="hidden" name="q.amount">
          <input type="submit" value="提交">
        </form>  
        </div>
      </div>
      </div>
    </div>
  </div>
</body>
</html>