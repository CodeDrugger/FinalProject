<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<script src="js/questions.js"></script>
</head>
<body>

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

</body>
</html>