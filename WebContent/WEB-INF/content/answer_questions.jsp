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
	<script type="text/javascript">
		var array = [];
		<c:forEach items="${q.questions}" var="u">
		array.push(${u})
		</c:forEach> 
	</script>
</head>
<body>
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
							<input type="button" value="返回" onclick="history.back();">
							<input id="submit" type="submit" value="提交">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script src="js/his_questions.js"></script>
</body>
</html>