<%@ taglib uri="/struts-tags" prefix="s"%> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生信息</title>
</head>

<body>
<p> ${message} </p>
<form name="form3" method="post" action="My_tea">
  <input type="hidden"  name="id_in" value="${id_in}" />
  <input type="submit"  value="返回"/>
</form>
<p>&nbsp;</p>
</body>
</html>