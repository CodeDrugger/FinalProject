<%@ page language="java" contentType="text/html; charset=utf8"
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
	<title>回答问卷</title>
	<style>
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
    width: 80%;
    height: 120px;
  }
	</style>
	<script type="text/javascript">
		var array = [];
		<c:forEach items="${q.questions}" var="u">
		array.push("${u}")
		</c:forEach> 
	</script>
</head>
<body>
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
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="panel">
					<div class="panel-body">
						<div id="info"><h2>该导师暂无问卷T_T</h2></div>
						<form action="Answer_ques" method="post">
							<div id="content"></div>
							<input id="dbamount" type="hidden" value="${q.amount}">
							<input type="hidden" name="a.id_tea" value="${q.id}">
							<input type="hidden" name="a.id_stu" value="${id}">
							<input type="button" value="返回" onclick="history.back();" class="subinp">
							<input id="submit" type="submit" value="提交" class="subinp">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="js/his_questions.js"></script>
</body>
</html>
