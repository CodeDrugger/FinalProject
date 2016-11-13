<%@ taglib uri="/struts-tags" prefix="s"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
  <div class="content">
    <h2>关注我的学生</h2>
    <table width = "300" border = "1">
	<tr>
	<th>学生姓名</th>
    <th>操作</th>
	</tr>
  	<s:iterator value = "attention_me" var = "am">
    <tr>
    <td><a href="Mystu_inf.action?stu_inf_id=${at.id}&id_in=${id_in}">${am.name}</a></td>
    <td><form name="form4" method="post" action="Attention_stu">
    	<input type="hidden"  name="teacher_id" value="${id_in}" />
        <input type="hidden"  name="student_id" value="${am.id}" />
    	<input type="submit"  value="关注该学生"/>
    </form></td>
    </tr>
    </s:iterator>
    </table>
    
  <!-- end .content --></div>
  <!-- end .container --></div>
</body>
</html>