<%@ taglib uri="/struts-tags" prefix="s"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>更改学生信息</title></head>
  
  <body>
    <h1>学生信息</h1>
      <p>照片：
        <img src="${stuc.picture_name}" /></p>
      <form action="Upload" enctype="multipart/form-data" method="post">文件:
        <input type="file" name="image"></input>
        <input type="hidden" name="id" value="${stuc.id}"></input>
        <input type="submit" value="上传"/>${message}</form>
      <c:set var="sexmid" value="${stuc.sex}" scope="request"></c:set>
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
      
      <c:set var="wish" value="${stuc.wish_class}" scope="request"></c:set>
      <%
    	  String wishzhuan="";
      	  String wishxue="";
      	  String wishno="";
      	  String wish = (String)request.getAttribute("wish");
      	  if(wish.equals("专硕"))
      	  {
      		  wishzhuan="checked";
      		  wishxue="";
      		  wishno="";
      	  }
      	  else if(wish.equals("学硕"))
      	  {
      		  wishxue="checked";
      		  wishzhuan="";
      		  wishno="";
      	  }
      	  else
      	  {
      		  wishno="checked";
      		  wishxue="";
      		  wishzhuan="";
      	  }
      %>
      
      <c:set var="zhibo" value="${stuc.zhibo}" scope="request"></c:set>
      <%
    	  String yes="";
      	  String no="";
      	  String zhibo=(String)request.getAttribute("zhibo");
      	  if(zhibo.equals("是"))
      	  {
      		  yes="checked";
      		  no="";
      	  }
      	  else
      	  {
      		  yes="";
      		  no="checked";
      	  }
      %>
      
      <c:set var="benin" value="${stuc.benin_class}" scope="request"></c:set>
      <%
    	  String baoyan="";
      	  String kaoyan="";
      	  String benin=(String)request.getAttribute("benin");
      	  if(benin.equals("保研"))
      	  {
      		  baoyan="checked";
      		  kaoyan="";
      	  }
      	  else
      	  {
      		  baoyan="";
      		  kaoyan="checked";
      	  }
      %>
        <form id="form1" name="form1" method="post" action="Change_stu">
          <p>姓名：
            <input name="stuc.name" type="text" id="name_stu" value="${stuc.name}" /></p>
          <p>性别： 男
            <input name="stuc.sex" type="radio" id="sex_m" value="男" checked="<%=sex_man%>"/>女
            <input type="radio" name="stuc.sex" id="sex_f" value="女" checked="<%=sex_woman%>"/>
          </p>
          <p>年龄：
            <input name="stuc.age" type="text" id="age_stu" value="${stuc.age}" /></p>
          <p>本科学科：
            <input name="stuc.benke_major" type="text" id="name_stu4" value="${stuc.benke_major}" /></p>
          <p>报考硕士类别: 学硕
            <input name="stuc.wish_class" type="radio"  value="学硕" checked="<%=wishxue%>"/>专硕
            <input type="radio" name="stuc.wish_class"  value="专硕" checked="<%=wishzhuan%>"/>不确定
            <input type="radio" name="stuc.wish_class"  value="不确定" checked="<%=wishno%>"/></p>
          <p>入选方式：: 保研
            <input type="radio" name="stuc.bein_class" id="stuc.bein_class" value="保研" checked="<%=baoyan%>"/>考研
            <input type="radio" name="stuc.bein_class" id="stuc.bein_class" value="考研" checked="<%=kaoyan%>"/></p>
          <p>研究生意愿学科：
            <input name="stuc.wish_major" type="text" id="stuc.wish_major" value="${stuc.wish_major}" /></p>
          <p>是否有直博意愿： 是
            <input type="radio" name="stuc.zhibo" value="是" checked="<%=yes%>"/>否
            <input type="radio" name="stuc.zhibo" value="否" checked="<%=no%>"/></p>
          <p>本科学分绩：
            <input name="stuc.score" type="text" value="${stuc.score}" /></p>
          <p>个人荣誉：
            <input name="stuc.honor" type="text" value="${stuc.honor}" /></p>
          <p>个人简介：
            <input name="stuc.self_intro" type="text" value="${stuc.self_intro}" /></p>
          <p>电话：
            <input name="stuc.tel" type="text" value="${stuc.tel}" /></p>
          <p>email：
            <input name="stuc.email" type="text" value="${stuc.email}" /></p>
          <p>
            <input type="hidden" name="id" value="${stuc.id}" />
            <input type="hidden" name="stuc.id" value="${stuc.id}" />
            <input type="submit" value="提交" /></p>
        </form>
        <form name="form4" method="post" action="Return_stu_search">
          <input type="submit" value="返回"></input></form>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
  </body>

</html>