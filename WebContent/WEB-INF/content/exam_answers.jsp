<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>查看问卷</title>
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
<input type="button" value="返回" onclick="history.back();">
</body>
</html>