<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Insert title here</title>
<script src="js/questions.js"></script>
</head>
<body>

<form action="Create_ques" method="post">
  <div id="content">
    <div id="block1">
        问题1：<input type="text" name="q.questions">
    </div>
  </div>
  <input type="button" value="新增" onclick="newLine()">
  <input id="amount" type="hidden" name="q.amount">
  <input type="submit" value="提交">
</form>   

</body>
</html>