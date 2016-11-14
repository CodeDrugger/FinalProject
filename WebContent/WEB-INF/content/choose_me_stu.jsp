<%@ taglib uri="/struts-tags" prefix="s"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,domain.Student,domain.Teacher,java.util.List,java.util.ArrayList" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert title here</title>
</head>
<body>
<div class="container">
  <div class="content">
    <h2>选择我的学生</h2>
    <table width="300" border="1">
	<tr>
	<th>学生姓名</th>
	<th>个人简介</th>
    <th>操作</th>
    <th>操作</th>
	</tr>
  	<s:iterator value="selected_me" var="sm">
    <tr>
    <td><a href="Mystu_inf.action?stu_inf_id=${sm.id}&id_in=${id_in}">${sm.name}</a></td>
    <td>${sm.self_intro}</td>
    <td><form name="form3" method="post" action="Choose_stu">
    	<input type="hidden"  name="teacher_id" value="${id_in}" />
        <input type="hidden"  name="student_id" value="${sm.id}" />
  		<input type="submit"  value="选择该学生"/>
		</form></td>
    <td><form name="form3" method="post" action="Tea_cancel_attention">
    	<input type="hidden"  name="teacher_id" value="${id_in}" />
        <input type="hidden"  name="student_id" value="${sm.id}" />
  		<input type="submit"  value="取消关注"/>
		</form></td>
    </tr>
    </s:iterator>
    </table>
    <h2><!-- end .content --></h2>
  </div>
  <!-- end .container --></div>
</body>
</html>