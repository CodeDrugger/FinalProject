<%@ taglib uri="/struts-tags" prefix="s"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>

<div class="container">
  <div class="content">
    <h1>我选择的导师    </h1>
    <table width = "300" border = "1">
      <tr>
	<th>导师姓名</th>
    <th>操作</th>
	</tr>
  	<s:iterator value = "select_tea" var = "st">
    <tr>
    <td><a href="Mytea_inf.action?tea_inf_id=${at.id}&id_in=${id_in}">${st.name}</a></td>
    <td><form name="form3" method="post" action="Stu_cancel_choose">
    	<input type="hidden"  name="teacher_id" value="${st.id}" />
        <input type="hidden"  name="student_id" value="${id_in}" />
  		<input type="submit"  value="取消选择"/>
		</form></td>
    </tr>
    </s:iterator>
  </table>
    <h2><!-- end .content --></h2>
  </div>
  <!-- end .container --></div>
</body>
</html>