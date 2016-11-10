<%@ taglib uri="/struts-tags" prefix="s"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>更改导师信息</title></head>
  
  <body>
    <h1>导师信息</h1>
      <p>照片：
        <img src="${teac.picture_name}" /></p>
      <form action="Upload_tea" enctype="multipart/form-data" method="post">文件:
        <input type="file" name="image"></input>
        <input type="hidden" name="id" value="${teac.id}"></input>
        <input type="submit" value="上传"/>${message}</form>
        
      <c:set var="sexmid" value="${teac.sex}" scope="request"></c:set>
      <%
      String sex_man="";
      String sex_woman="";
      String sexmid = (String)request.getAttribute("sexmid");
      if (sexmid.equals("男"))
      {
    	  sex_man = "checked";
    	  sex_woman = "";
      }
      else
    	  sex_woman = "checked";
      	  sex_man = "";
    	  
      %>
      
      <form id="form1" name="form1" method="post" action="Change_tea">
        <p>姓名：
          <input type="text" name="teac.name" value="${teac.name}"/></p>
        <p>招生人数：
          <input type="text" name="teac.enrollment" value=/>*招生人数应大于目前已招人数</p>
        <p>性别： 男
          <input type="radio" name="teac.sex" id="sex_m" value="男" checked="<%=sex_man%>"/>女
          <input type="radio" name="teac.sex" id="sex_f" value="女" checked="<%=sex_woman%>"/></p>
        <p>学校：
          <input type="text" name="teac.college" /></p>
        <p>学院：
          <input type="text" name="teac.xueyuan" /></p>
        <p>专业：
          <input type="text" name="teac.major" /></p>
        <p>研究方向：
          <input type="text" name="teac.research_field" /></p>
        <p>个人简介：
          <input type="text" name="teac.self_intro" />
          <br /></p>
        <p>电话：
          <input type="text" name="teac.tel" /></p>
        <p>email：
          <input type="text" name="teac.email" /></p>
        <p>
          <input type="hidden" name="id" value="${teac.id}" />
          <input type="hidden" name="teac.id" value="${teac.id}" />
          <input type="submit" value="提交" /></p>
      </form>
      <form name="form4" method="post" action="Return_tea_search">
        <input type="submit" value="返回" /></form>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
  </body>

</html>