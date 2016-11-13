<%@ taglib uri="/struts-tags" prefix="s"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,domain.Teacher" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>导师信息</title>
</head>

<body>
<c:set var="id_in" value="${id_in}" scope="request"></c:set>
<c:set var="teas_id" value="${teas.id}" scope="request"></c:set>
<%
Teacher teas=new Teacher();
String id_in=null;
Connection con = null;
Statement stmt = null;
ResultSet rst = null;
ResultSet rst2 = null;
String stu_name=null;
String stu_id=null;
String stu_attentioned_tea=null;
teas.setId((String) request.getAttribute("teas_id"));
id_in=(String) request.getAttribute("id_in");
String message="0";
try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
try{   
	  //con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb", "root", "daidai");
	  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb","fp_user","123456");
    stmt=con.createStatement();   
    rst = stmt.executeQuery("select * from tea_inf where id='"+teas.getId()+"'");
  	  while(rst.next())
  	  {
  		  teas.setEnrollment(rst.getString("enrollment"));
  		  teas.setIn_enrollment(rst.getString("in_enrollment"));
  		  teas.setName(rst.getString("name"));
  		  teas.setSex(rst.getString("sex"));
  		  teas.setId(rst.getString("id"));
  		  teas.setPicture_name(rst.getString("picture_name"));
  		  teas.setSelf_intro(rst.getString("self_intro"));
  		  teas.setResearch_field(rst.getString("research_field"));
  		  teas.setCollege(rst.getString("college"));
  		  teas.setXueyuan(rst.getString("xueyuan"));
  		  teas.setMajor(rst.getString("major"));
  		  teas.setTel(rst.getString("tel"));
  		  teas.setEmail(rst.getString("email"));
  		  teas.setAttentioned_me(rst.getString("attentioned_me"));
  	  }
    rst2 = stmt.executeQuery("select * from stu_inf where id='"+id_in+"'");
    while(rst2.next())
	  {
		  stu_name = rst2.getString("name");
		  stu_id = rst2.getString(("id"));
		  stu_attentioned_tea = rst2.getString("attentioned_tea");
	  }
    if(stu_attentioned_tea.contains(teas.getName()+" "+teas.getId()))
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
<h1>导师信息</h1>
      <p>照片：<img src="<%=teas.getPicture_name()%>" />
      </p>
      <p>已招人数/招生人数：<%=teas.getIn_enrollment()%>/<%=teas.getEnrollment()%></p>
<p>姓名：<%=teas.getName()%>
</p>
      <p>
        性别： <%=teas.getSex()%>
        <br />
      </p>
  <p>学校：<%=teas.getCollege()%>
</p>
<p>学院: <%=teas.getXueyuan()%>
</p>
<p>专业：: <%=teas.getMajor()%></p>
<p>研究方向：<%=teas.getResearch_field()%>
</p>
<p>个人简介：<%=teas.getSelf_intro()%>
</p>
<p>电话：<%=teas.getTel()%>
</p>
      <p>email：<%=teas.getEmail()%>
</p>
<form name="form4" method="post" action="stu_attention_tea">
  <p>
  	<input type="hidden"  name="teas.name" value="<%=teas.getName()%>"  />
    <input type="hidden"  name="teas.id" value="<%=teas.getId()%>"  />
    <input type="hidden"  name="teas.attentioned_me" value="<%=teas.getAttentioned_me()%>" />
    <input type="hidden"  name="stu_select.name" value="<%=stu_name%>"  />
    <input type="hidden"  name="stu_select.id" value="<%=stu_id%>"  />
    <input type="hidden"  name="stu_select.attentioned_tea" value="<%=stu_attentioned_tea%>"  />
    <input id="msg" type="hidden"  value="<%=message%>"/>
    <input type="submit"  value="关注该导师"/>
  </p>
</form>
<form name="form3" method="post" action="Return_stu_search">
  <input type="submit"  value="返回"/>
</form>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>