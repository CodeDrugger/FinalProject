<%@ taglib uri="/struts-tags" prefix="s"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>更改学生信息</title>
</head>
<body>
    <h1>导师信息</h1>
      <c:set var="visit" value="${visitfile}" scope="request"></c:set>
      <%String visitl =(String)request.getAttribute("visit");%>
      <p>${visitfile}</p>
      <p><%=visitl%></p>
      <p>照片：<img src=${visitfile}/></p>
      <p>照片：<img src="${visitfile}"/></p>
      <p>照片：<img src=<%=visitl%>/></p>
<p>照片：<img src="<%=visitl%>"/></p>
<p>//</p>
<p>照片：<img src="photos/22/1.png"/></p>
    <form action="Upload" enctype="multipart/form-data" method="post">
            文件:<input type="file" name="image">
       <input type="submit" value="上传" /> ${message}
</form>
        
<form id="form1" name="form1" method="post" action="Change_tea">
  <p>姓名：
      <input type="text" name="teac.name" />
      </p>
      <p>
        性别：
        男<input type="radio" name="teac.sex"  id="sex_m" value = "男"/> 
        女 <input type="radio" name="teac.sex" id="sex_f" value = "女"/>
      </p>
      <p>学校：
        <input type="text" name="teac.college" />
</p>
      <p>学院：
        <input type="text" name="teac.xueyuan" />
</p>
      <p>专业：
        <input type="text" name="teac.major" />
      </p>
      <p>研究方向：
        <input type="text" name="teac.research_field" />
      </p>
      <p>个人简介：
        <input type="text" name="teac.self_intro" />
<br />
      </p>
  <p>电话：
    <input type="text" name="teac.tel"/>
  </p>
      <p>email：
        <input type="text" name="teac.email"/>
      </p>
      <p>
        <input type="submit" value="提交">
      </p>
</form>
<form name="form4" method="post" action="Return_tea">
  <input type="submit"  value="返回">
</form>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>