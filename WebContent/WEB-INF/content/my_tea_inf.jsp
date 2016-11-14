<%@ taglib uri="/struts-tags" prefix="s"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,domain.Student,domain.Teacher,java.util.List,java.util.ArrayList" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>导师信息</title>
</head>
<body>
<h1>导师信息</h1>
      <p>照片：<img src="${tea_inf.picture_name}"  name="picture" width="32" height="32" id="picture" style="background-color: #999999" />
      </p>
      <p>已招人数/招生人数：${tea_inf.in_enrollment}/${tea_inf.enrollment}</p>
<p>姓名：${tea_inf.name}
</p>
      <p>
        性别： ${tea_inf.sex}
        <br />
      </p>
  <p>学校：${tea_inf.college}
</p>
<p>学院: ${tea_inf.xueyuan}
</p>
<p>专业：: ${tea_inf.major}</p>
<p>研究方向：${tea_inf.research_field}
</p>
<p>个人简介：${tea_inf.self_intro}
</p>
<p>电话：${tea_inf.tel}
</p>
      <p>email：${tea_inf.email}
</p>
<form action="Mystu" method="get">
<input type="hidden" name="id_in" value="${student_id}"/>
<input type="submit" value="返回"/>
</form>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>