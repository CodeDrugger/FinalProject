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
    <h2>我选择的学生</h2>
    <table width = "216" border = "1">
	<tr>
	<th width="206">学生姓名</th>
	</tr>
  	<s:iterator value = "select_stu" var = "st">
    <tr>
    <td><a href="Mystu_inf.action?stu_inf_id=${at.id}&id_in=${id_in}">${st.name}</a></td>
    </tr>
    </s:iterator>
    </table>

  <!-- end .content --></div>
  <!-- end .container --></div>
</body>
</html>