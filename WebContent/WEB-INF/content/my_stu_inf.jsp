<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,domain.Student" errorPage="" %>
<!DOCTYPE html>
<html>

<head>
    <!-- Standard Meta -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <!-- Site Properties -->
    <title>search_result</title>
    <link rel="stylesheet" type="text/css" href="css/semantic.css">
    <script src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/semantic.min.js"></script>
    <script src="js/adserch_reasult.js"></script>
    <style>
        body {
            font-family: "楷体";
        }

        .fixup {
            word-wrap: break-word;
            word-break: break-all;
            overflow: hidden;
        }
    </style>
</head>

<body>
  <!--@java-->
  <c:set var="id" value="${id}" scope="request"></c:set>
  	<%
  	String id = (String)request.getAttribute("id");
  	String name = "点此完善信息";
  	try {
  	    Class.forName("com.mysql.jdbc.Driver");
  	} catch (ClassNotFoundException e) {
  	    e.printStackTrace();
  	}
  	try {
  	    Connection connect = DriverManager.getConnection("jdbc:mysql://115.28.67.141:3306/fpdb", "fp_user", "123456");
  	    Statement stmt = connect.createStatement();
  	    ResultSet rs = stmt.executeQuery("select * from tea_inf where id='" + id + "'");
  	    if (rs.next()) {
  	        if (rs.getString("name") != null && rs.getString("name").length() > 0) {
  	        	name = rs.getString("name");
  	        }
  	    }
  	    connect.close();
  	} catch (SQLException e) {
  	    e.printStackTrace();
  	}
  	%>
    <!--sidebar on the top-->
    <div class="ui attached tiny stackable menu grey inverted">
      <div class="ui container">
	   <form name="form20" action="MainPage" method="post">   
	   <input type="hidden" name="id" value="${id}"/>
	   <input type="hidden" name="userclass" value="1"/>
	   </form>
	   
	   <form name="form21" action="my_attention_stu" method="post">   
		<input type="hidden" name="id" value="${id}"/></form>
		
		<form name="form22" action="My_ques.action" method="post">   
		<input type="hidden" name="id" value="${id}"/>
		<input type="hidden" name="q.id" value="${id}"/>
		</form>
		
      <a class="item" href="javascript:document.form20.submit();"><i class="home icon"></i>主页</a>
      <a class="item" href="javascript:document.form21.submit();"><i class="grid layout icon"></i> 考研互选 </a>
      <a class="item" href="javascript:document.form22.submit();"><i class="skyatlas icon"></i>我的问卷</a>
      <div class="right item">
		<form name="form23" action="Show_tea" method="post">   
		<input type="hidden" name="teac.id" value="${id}"/></form>
		
		<form name="form24" action="loginpage" method="post"></form>
		<form name="form25" action="message_tea" method="post">
        <input type="hidden" name="id" value="${id}"/></form>
      	<a class="item" href="javascript:document.form25.submit();"> <i class="message icon"></i>消息中心</a>
        <a class="item" href="javascript:document.form23.submit();" data-toggle="tooltip" data-placement="left" title="查看个人资料"><i class="settings icon"></i><%=name%></a>
        <a class="item" href="javascript:document.form24.submit();"><i class="moon icon"></i>注销账户</a>
      </div>
</div>
    </div>
    <!--the title of the page-->
    <h2 class="ui horizontal divider header">
        <i class="unhide icon"></i>学生信息
    </h2>
    <!--@java-->
    <c:set var="id" value="${id}" scope="request"></c:set>
    <c:set var="stus_id" value="${stu_inf_id}" scope="request"></c:set>
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
    String id=null;
    String stus_id=null;
    stus.setId((String) request.getAttribute("stus_id"));
    id=(String) request.getAttribute("id");
    try {
        Class.forName("com.mysql.jdbc.Driver");
      } catch (ClassNotFoundException e) {
        e.printStackTrace();
      }
    try{
        //con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb", "root", "daidai");
        con = DriverManager.getConnection("jdbc:mysql://115.28.67.141:3306/fpdb","fp_user","123456");
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
      		  stus.setRate(rst.getString("rate"));
      		  stus.setWish_xueyuan(rst.getString("wish_xueyuan"));
      		  stus.setPicture_name(rst.getString("picture_name"));
      	  }
       rst2 = stmt.executeQuery("select * from tea_inf where id='"+id+"'");
       while(rst2.next())
        {
          tea_name = rst2.getString("name");
          tea_id = rst2.getString(("id"));
          tea_attentioned_stu = rst2.getString("attentioned_stu");
        }
       if (tea_attentioned_stu != null && stus.getName() != null)
       {
         if(tea_attentioned_stu.contains(stus.getName()+" "+stus.getId()))
         {
          message="1";
        }
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



    <!--the mainpge content-->
    <div class="ui grid">
        <div class="row">
            <div class="five wide column"></div>
            <div class="two wide column">
                <div class="ui divided items">
                    <div class="item">
                        <div class="small image">
                            <img src="<%=stus.getPicture_name()%>">
                        </div>
                    </div>
                </div>
            </div>
            <div class="four wide column">
                <div class="ui piled segments">
                    <div class="ui segment" style="font-size:20px;">
                        姓名：
                        <%=stus.getName()%>
                    </div>
                    <div class="ui segment" style="font-size:20px;">
                        性别：
                        <%=stus.getSex()%>
                    </div>
                    <div class="ui segment" style="font-size:20px;">
                        年龄：
                      <%=stus.getAge()%>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="five wide column"></div>
            <div class="two wide column">
                <div class="ui raised segments">
                  <div class="ui segment" style="font-size:20px;">
                      本科学科
                  </div>
                  <div class="ui segment" style="font-size:20px;">
                      报考硕士类别
                  </div>
                  <div class="ui segment" style="font-size:20px;">
                      研究生意愿学科
                  </div>
                    <div class="ui segment" style="font-size:20px;">
                        入选方式
                    </div>
                    <div class="ui segment" style="font-size:20px;">
                        是否有直博意愿
                    </div>
                    <div class="ui segment" style="font-size:20px;">
                        本科学分绩
                    </div>
                    <div class="ui segment" style="font-size:20px;">
                        个人荣誉
                    </div>
                    <div class="ui segment" style="font-size:20px;">
                        email
                    </div>
                    <div class="ui segment" style="font-size:20px;">
                        电话
                    </div>
                    <div class="ui segment" style="font-size:20px;">
                        个人简介
                    </div>
                </div>
            </div>
            <div class="four wide column">
                <div class="ui piled segments">
                    <div class="ui segment" style="font-size:20px;">
                        <%=stus.getBenke_major()%>
                    </div>
                    <div class="ui segment" style="font-size:20px;">
                        <%=stus.getWish_class()%>
                    </div>
                    <div class="ui segment" style="font-size:20px;">
                        <%=stus.getWish_major()%>
                    </div>
                    <div class="ui segment" style="font-size:20px;">
                        <%=stus.getBein_class()%>
                    </div>
                    <div class="ui segment" style="font-size:20px;">
                        <%=stus.getZhibo()%>
                    </div>
                    <div class="ui segment" style="font-size:20px;">
                        <%=stus.getScore()%>
                    </div>
                    <div class="ui segment" style="font-size:20px;">
                        <%=stus.getHonor()%>
                    </div>
                    <div class="ui segment" style="font-size:20px;">
                        <%=stus.getEmail()%>
                    </div>
                    <div class="ui segment" style="font-size:20px;">
                        <%=stus.getTel()%>
                    </div>
                    <div class="ui segment fixup" style="font-size:20px;">
                        <%=stus.getSelf_intro()%>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="seven wide column"></div>
            <div class="three wide column">
                <form name="form4" method="post" action="stu_attention_tea">
                  <input type="hidden"  name="stus.name" value="<%=stus.getName()%>"  />
                  <input type="hidden"  name="stus.id" value="<%=stus.getId()%>"  />
                  <input type="hidden"  name="stus.rate" value="<%=stus.getRate()%>"  />
                  <input type="hidden"  name="stus.email" value="<%=stus.getEmail()%>"  />
                  <input type="hidden"  name="stus.attentioned_me" value="<%=stus.getAttentioned_me()%>" />
                  <input type="hidden"  name="tea_select.name" value="<%=tea_name%>"  />
                  <input type="hidden"  name="tea_select.id" value="<%=tea_id%>"  />
                  <input type="hidden"  name="id" value="<%=tea_id%>"/>
                  <input type="hidden"  name="tea_select.attentioned_stu" value="<%=tea_attentioned_stu%>"/>
                        <input id="msg" type="hidden" value="<%=message%>" />
                        <button class="ui labeled inverted violet icon button" onclick="history.back();">
                            <i class="reply icon"></i>返回
                        </button>
                        </form>
            </div>
        </div>
    </div>
</body>

</html>
