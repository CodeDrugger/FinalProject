<%@ taglib uri="/struts-tags" prefix="s"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>导师信息</title>
</head>
<body>
<h1>导师信息</h1>
      <p>照片：<img src=${visitfilel}  name="picture" width="32" height="32" id="picture" style="background-color: #999999" />
      </p>
      <p>已招人数/招生人数：${teas.in_enrollment}/${teas.enrollment}</p>
<p>姓名：${teas.name}
</p>
      <p>
        性别： ${teas.sex}
        <br />
      </p>
  <p>学校：${teas.college}
</p>
<p>学院: ${teas.xueyuan}
</p>
<p>专业：: ${teas.major}</p>
<p>研究方向：${teas.research_field}
</p>
<p>个人简介：${teas.zhibo}
</p>
<p>电话：${teas.tel}
</p>
      <p>email：${teas.email}
</p>
<form name="form3" method="post" action="Mytea">
  <input type="hidden"  name="id_in" value="${id_in}" />
  <input type="submit"  value="返回"/>
</form>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>