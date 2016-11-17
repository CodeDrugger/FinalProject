<%@ taglib uri="/struts-tags" prefix="s"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,domain.Student" errorPage="" %>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.css">
<link rel="stylesheet" href="css/font-awesome.css">
<style>
  body {
    font-family: 'microsoft yahei', Arial, sans-serif;
    background-image: url("images/1.png");
    padding-top: 70px;
  }

  .info {
    margin-left: 20%;
  }
  .bigfont {
    margin-bottom: 3%;
  }

textarea{
          width: 50%;
            border: none;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            margin: 10px auto;
            padding: 0px;
            background: #ffffff;
  }
</style>
<title>学生信息</title>
<script src="js/attention.js"></script>
</head>

<body>

<c:set var="id" value="${id_in}" scope="request"></c:set>
	<%
	String id = (String)request.getAttribute("id");
	String name = "点此完善信息";
	try {
	    Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
	    e.printStackTrace();
	}
	try {
	    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb", "fp_user", "123456");
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
<nav class="navbar navbar-default navopa navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="./MainPage.action?id=${id_in}&userclass=1">主页</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="./my_attention_stu?id_in=${id_in}">我关注的学生</a></li>
                <li><a href="./attention_me_stu?id_in=${id_in}">关注我的学生</a></li>
                <li><a href="./my_choose_stu?id_in=${id_in}">我选择的学生</a></li>
                <li><a href="./choose_me_stu?id_in=${id_in}">选择我的学生</a></li>
                <li><a href="./My_ques.action?id=${id_in}&q.id=${id_in}">我的问卷</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="./Show_tea.action?teac.id=${id_in}" data-toggle="tooltip" data-placement="left" title="查看个人资料"><%=name%></a></li>
                <li><a href="./loginpage.action">注销账户</a></li>
            </ul>
        </div>
    </div>
</nav>

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
  		  stus.setRate(rst.getString("rate"));
  		  stus.setWish_xueyuan(rst.getString("wish_xueyuan"));
  		  stus.setPicture_name(rst.getString("picture_name"));
  	  }
   rst2 = stmt.executeQuery("select * from tea_inf where id='"+id_in+"'");
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

<div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h1>学生信息</h1>
                        </div>
                        <div class="panel-body">
                            <div class="bigfont">照片<span class="info"><img src="<%=stus.getPicture_name()%>"  name="picture" width="120" height="180" id="picture" style="background-color: #999999"/></span>
                            </div>
                            <div class="bigfont">
                                姓名<span Class="info"><%=stus.getName()%>
                            </span>
                        </div>
                        <div class="bigfont">
                            性别<span Class="info"><%=stus.getSex()%>
                        </span>
                    </div>
                    <div class="bigfont">
                        年龄<span Class="info"><%=stus.getAge()%>
                    </span>
                </div>
                <div class="bigfont">
                    本科学科<span Class="info" style="margin-left: 16%"><%=stus.getBenke_major()%>
                </span>
            </div>
            <div class="bigfont">
                报考硕士类别<span Class="info" style="margin-left: 12%"><%=stus.getWish_class()%>
            </span>
        </div>
        <div class="bigfont">
            入选方式<span Class="info" style="margin-left: 16%;"><%=stus.getBein_class()%>
        </span>
    </div>
    <div class="bigfont">
        研究生意愿学科<span Class="info" style="margin-left: 10%;"><%=stus.getWish_major()%>
    </span>
</div>
<div class="bigfont">
    是否有直博意愿<span Class="info" style="margin-left: 10%;"><%=stus.getZhibo()%>
</span>
</div>
<div class="bigfont">
    本科学分绩<span Class="info" style="margin-left: 14%"><%=stus.getScore()%>
</span>
</div>
<div class="bigfont">
    个人荣誉<span Class="info" style="margin-left: 16%;"><%=stus.getHonor()%>
</span>
</div>
<div class="bigfont">
    email<span Class="info" style="margin-left: 19%"><%=stus.getEmail()%>
</span>
</div>
<div class="bigfont">
    电话<span Class="info"><%=stus.getTel()%>
</span>
</div>
<div class="bigfont">
    个人简介<span Class="info" style="margin-left: 16%"><textarea disabled="disabled" rows=5 style="vertical-align: top;"><%=stus.getSelf_intro()%></textarea>
</span>
</div>
<form id="form1" name="form1" method="post" action="tea_attention_stu">
  <p>
    <input id="submit" type="submit" value="关注" style="margin-left: 40%"/>
    <input type="hidden"  name="stus.name" value="<%=stus.getName()%>"  />
    <input type="hidden"  name="stus.id" value="<%=stus.getId()%>"  />
    <input type="hidden"  name="stus.rate" value="<%=stus.getRate()%>"  />
    <input type="hidden"  name="stus.attentioned_me" value="<%=stus.getAttentioned_me()%>" />
    <input type="hidden"  name="tea_select.name" value="<%=tea_name%>"  />
    <input type="hidden"  name="tea_select.id" value="<%=tea_id%>"  />
    <input type="hidden"  name="id_in" value="<%=tea_id%>"/>
    <input type="hidden"  name="tea_select.attentioned_stu" value="<%=tea_attentioned_stu%>"/>
    <input type="button" value="返回" onclick="history.back();" style="margin-left: 5%">
    <input id="msg" type="hidden"  value="<%=message%>" />
  </p>
</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>