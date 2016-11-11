<%@ taglib uri="/struts-tags" prefix="s"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>更改导师信息</title>
    <script src="js/pfchange.js" charset="utf-8"></script>
    </head>
  
  <body>
    <h1>导师信息</h1>
      <p>照片：
        <img src="${teac.picture_name}" /></p>
      <form action="Upload_tea" enctype="multipart/form-data" method="post">文件:
        <input type="file" name="image"></input>
        <input type="hidden" name="id" value="${teac.id}"></input>
        <input type="submit" value="上传"/>${message}</form>
        
      <c:set var="sexmid" value="${teac.sex}" scope="request"></c:set>

      
      <form id="form1" name="form1" method="post" action="Change_tea">
        <p>姓名：
          <input type="text" name="teac.name" value="${teac.name}"/></p>
        <p>招生人数：
          <input type="text" name="teac.enrollment" value="${teac.enrollment }"/>已招人数：${teac.in_enrollment}*招生人数应大于目前已招人数</p>
        <p>性别： 男
          <input id="sex" type="hidden" value="${teac.sex}"/>
          <input id="sex_nan" type="radio" name="teac.sex" id="sex_m" value="男"/>女
          <input id="sex_nv" type="radio" name="teac.sex" id="sex_f" value="女"/></p>
        <p>学校：
          <input type="text" name="teac.college" value="${teac.college}"/></p>
        <p>学院：
          <input type="text" name="teac.xueyuan" value="${teac.xueyuan}"/></p>
        <p>专业：
          <input type="text" name="teac.major" value="${teac.major}"/></p>
        <p>研究方向：
          <input type="text" name="teac.research_field" value="${teac.research_field}"/></p>
        <p>个人简介：
          <input type="text" name="teac.self_intro" value="${teac.self_intro}"/>
          <br /></p>
        <p>电话：
          <input type="text" name="teac.tel" value="${teac.tel}"/></p>
        <p>email：
          <input type="text" name="teac.email" value="${teac.email}"/></p>
        <p>
          <input type="hidden" name="id" value="${teac.id}" />
          <input type="hidden" name="teac.id" value="${teac.id}" />
          <input type="submit" value="提交" /></p>
      </form>
  </body>

</html>