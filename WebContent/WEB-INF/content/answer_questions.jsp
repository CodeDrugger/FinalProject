<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Insert title here</title>
<script type="text/javascript">
var array = [];
<c:forEach items="${q.questions}" var="u">
	array.push(${u})
</c:forEach> 
</script>
<script src="js/his_questions.js"></script>
</head>
<body>
<div id="info"><h2>该导师暂无问卷T_T</h2></div>
<form action="Answer_ques" method="post">
  <div id="content"></div>
  <input id="dbamount" type="hidden" value="${q.amount}">
  <input type="hidden" name="a.id_tea" value="${q.id}">
  <input type="hidden" name="a.id_stu" value="${id}">
  <input type="button" value="返回" onclick="history.back();">
  <input id="submit" type="submit" value="提交">
</form>
</body>
</html>