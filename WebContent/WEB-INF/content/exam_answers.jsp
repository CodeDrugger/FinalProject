<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
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
<div id="info">该学生暂未回答问卷T_T</div>
<input id="dbamount" type="hidden" value="${a.amount}">
<div id="content"></div>
<input type="button" value="返回" onclick="history.back();" class="subinp">
</body>
</html>
