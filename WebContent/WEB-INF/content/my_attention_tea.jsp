<%@ taglib uri="/struts-tags" prefix="s"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,domain.Student,domain.Teacher,java.util.List,java.util.ArrayList" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>
<body>
<div class="container">
  <div class="content">
    <h1>我关注的导师    </h1>
    <table width="300" border="1">
      <tr>
	<th>导师姓名</th>
	<th>个人简介</th>
    <th>操作</th>
    <th>操作</th>
	</tr>
  	<s:iterator value="attention_tea" var="at">
    <tr>
    <td><a href="Mytea_inf.action?tea_inf_id=${at.id}&id_in=${id_in}">${at.name}</a></td>
    <td>${at.self_intro}</td>
    <td><form name="form3" method="post" action="Choose_tea">
    	<input type="hidden"  name="teacher_id" value="${at.id}" />
        <input type="hidden"  name="student_id" value="${id_in}" />
  		<input type="submit"  value="选择该导师"/>
		</form></td>
    <td><form name="form3" method="post" action="Stu_cancel_attention">
    	<input type="hidden"  name="teacher_id" value="${at.id}" />
        <input type="hidden"  name="student_id" value="${id_in}" />
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