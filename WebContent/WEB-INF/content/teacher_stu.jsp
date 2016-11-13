<%@ taglib uri="/struts-tags" prefix="s"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,domain.Student" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生信息</title>
</head>

<body>
<c:set var="id_in" value="${id_in}" scope="request"></c:set>
<c:set var="stus_id" value="${stus.id}" scope="request"></c:set>
<%
Student stus = new Student();
String message="0";
String tea_name=null;
String tea_id=null;
String tea_attentioned_stu=null;
Connection con = null;
Statement stmt = null;
ResultSet rst = null;
ResultSet rst2 = null;
String id_in=null;
String stus_id=null;
stus.setId((String) request.getAttribute("stus_id"));
id_in=(String) request.getAttribute("id_in");
try { 
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
try{   
	  //con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb", "root", "daidai");
	  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb","fp_user","123456");
    stmt=con.createStatement();   
    rst = stmt.executeQuery("select * from stu_inf where id='"+stus.getId()+"'");
  	  while(rst.next())
  	  {
  		  stus.setId(rst.getString("id"));
  		  stus.setName(rst.getString("name"));
  		  stus.setSex(rst.getString("sex"));
  		  stus.setAge(rst.getString("age"));
  		  stus.setBenke_major(rst.getString("benke_major"));
  		  stus.setWish_major(rst.getString("wish_major"));
  		  stus.setZhibo(rst.getString("zhibo"));
  		  stus.setWish_class(rst.getString("wish_class"));
  		  stus.setBein_class(rst.getString("bein_class"));
  		  stus.setScore(rst.getString("score"));
  		  stus.setHonor(rst.getString("honor"));
  		  stus.setSelf_intro(rst.getString("self_intro"));
  		  stus.setTel(rst.getString("tel"));
  		  stus.setEmail(rst.getString("email"));
  		  stus.setAttentioned_me(rst.getString("attentioned_me"));
  	  }
   rst2 = stmt.executeQuery("select * from tea_inf where id='"+id_in+"'");
   while(rst2.next())
	  {
		  tea_name = rst2.getString("name");
		  tea_id = rst2.getString(("id"));
		  tea_attentioned_stu = rst2.getString("attentioned_stu");
	  }
   if(tea_attentioned_stu.contains(stus.getName()+" "+stus.getId()))
   {
 	  message="1";
	}

  	  

  }catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
  }finally{
      try{
      	if(stmt!=null)
      		stmt.close();
      	if(con!=null)           
              con.close();
      	
          } catch (SQLException e) {
              // TODO Auto-generated catch block
              e.printStackTrace();
          }   
      }
%>
    <h1>学生信息</h1>
      <p>照片：<img src="<%=stus.getPicture_name()%>" />
      </p>
      <p>姓名：<%=stus.getName()%>
      </p>
      <p>
        性别： <%=stus.getSex()%>
        <br />
      </p>
      <p>年龄：<%=stus.getAge()%>
</p>
  <p>本科学科：<%=stus.getBenke_major()%>
</p>
  <p>报考硕士类别: <%=stus.getWish_class()%>
  </p>
  <p>入选方式：: <%=stus.getBein_class()%></p>
  <p>研究生意愿学科：<%=stus.getWish_major()%></p>
      <p>是否有直博意愿：<%=stus.getZhibo()%>
      </p>
      <p>本科学分绩：<%=stus.getScore()%>
  </p>
      <p>个人荣誉：<%=stus.getHonor()%>
  </p>
      <p>个人简介：<%=stus.getSelf_intro()%>
  </p>
  <p>电话：<%=stus.getTel()%>
</p>
<p>email：<%=stus.getEmail()%>
</p>
<form id="form1" name="form1" method="post" action="tea_attention_stu">
  <p>
    <input type="submit" value="关注该学生" />
   	<input type="hidden"  name="stus.name" value="<%=stus.getName()%>"  />
    <input type="hidden"  name="stus.id" value="<%=stus.getId()%>"  />
    <input type="hidden"  name="stus.attentioned_me" value="<%=stus.getAttentioned_me()%>" />
    <input type="hidden"  name="tea_select.name" value="<%=tea_name%>"  />
    <input type="hidden"  name="tea_select.id" value="<%=tea_id%>"  />
    <input type="hidden"  name="tea_select.attentioned_stu" value="<%=tea_attentioned_stu%>"  />
  </p>
</form>
<form name="form3" method="post" action="Return_stu_search">
  <input type="submit"  value="返回"/>
</form>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>