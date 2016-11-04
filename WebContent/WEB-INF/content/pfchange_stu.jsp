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
    <h1>学生信息</h1>
      <c:set var="visit" value="${visitfile}" scope="request"></c:set>
      <%String visitl =(String)request.getAttribute("visit");%>
      <p>${visitfile}</p>
      <p><%=visitl%></p>
      <p>照片：<img src=${visitfile}/></p>
      <p>照片：<img src="${visitfile}"/></p>
      <p>照片：<img src=<%=visitl%>/></p>
      <p>照片：<img src="<%=visitl%>"/></p>
      //<p>照片：<img src="photos/22/1.png"/></p>
      
      
    <form action="Upload" enctype="multipart/form-data" method="post">
            文件:<input type="file" name="image">
       <input type="submit" value="上传" /> ${message}
     </form>
	<c:set var="sexmid" value="${sex}" scope="request"></c:set>
     <%String sex =(String)request.getAttribute("sexmid");
	   String checkman;
	   String checkwoman;
	  if(sex.equals("man"))
	      {
			  checkman = "checked";
			  checkwoman = "";
		  }
	  else 
	  	  {
			  checkwoman = "checked";
			  checkman = "";
		  }
	 %>   
     
<form id="form1" name="form1" method="post" action="Change_stu">
      <p>姓名：
      <input name="stuc.name" type="text" id="name_stu" value="stuc.name" />
      </p>
      <p>
        性别：
        男<input name="stuc.sex" type="radio"  id="sex_m" value = "男" checked=<%=checkman%>/> 
        女 <input type="radio" name="stuc.sex" id="sex_f" value = "女" checked=<%=checkwoman%>/>
        <br />
      </p>
      <p>年龄：
        <input name="stuc.age" type="text" id="age_stu" value="stuc.age" />
</p>
  <p>本科学科：
    <input name="stuc.benke_major" type="text" id="name_stu4" value="stuc.benke_major"  />
</p>
  <p>报考硕士类别: 学硕<input name="stuc.wish_class" type="radio"  id="sex_m" value = "学硕"/> 
          专硕 <input type="radio" name="stuc.wish_class" id="sex_f" value = "专硕"/>
          不确定 <input type="radio" name="stuc.wish_class" id="sex_f" value = "不确定"/>
  </p>
      <p>入选方式：: 保研<input type="radio" name="stuc.bein_class"  id="stuc.bein_class" value = "保研"/> 
  			   考研 <input type="radio" name="stuc.bein_class" id="stuc.bein_class" value = "考研"/></p>
      <p>研究生意愿学科：
        <input name="stuc.wish_major" type="text" id="stuc.wish_major" value="stuc.wish_major" />
</p>
      <p>是否有直博意愿：
        是 <input type="radio" name="stuc.zhibo" value="是" />
        否 <input type="radio" name="stuc.zhibo" value="否" />
      </p>
      <p>本科学分绩：
        <input name="stuc.score" type="text" value="stuc.score"/>
      </p>
      <p>个人荣誉：
        <input name="stuc.honor" type="text" value="stuc.honor"/>
      </p>
      <p>个人简介：
        <input name="stuc.self_intro" type="text" value="stuc.self_intro" />
      </p>
  <p>电话：
    <input name="stuc.tel" type="text" value="stuc.tel"/>
      </p>
      <p>email：
        <input name="stuc.email" type="text" value="stuc.email"/>
      </p>
      <p>
        <input type="submit" value="提交"/>
      </p>
</form>
<form name="form4" method="post" action="Return_stu_search">
  <input type="submit"  value="返回">
</form>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>