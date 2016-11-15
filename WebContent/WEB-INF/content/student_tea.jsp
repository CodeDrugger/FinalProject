<%@ taglib uri="/struts-tags" prefix="s"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,domain.Teacher" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>导师信息</title>
<script src="js/attention.js"></script>
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
</head>

<body>

<%
 String name = "点此完善信息";
 String wish_major = "";
 String[] reco_name = {"", "", "", "", ""};
 String[] reco_id = {"", "", "", "", ""};
 String id = (String) request.getAttribute("id");
 try {
     Class.forName("com.mysql.jdbc.Driver");
 } catch (ClassNotFoundException e) {
     e.printStackTrace();
 }
 try {
     Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb", "fp_user", "123456");
     Statement stmt = connect.createStatement();
     ResultSet rs = stmt.executeQuery("select * from stu_inf where id='" + id + "'");
     if (rs.next()) {
         if (rs.getString("name") != null && rs.getString("name").length() > 0) {
             name = rs.getString("name");
             wish_major = rs.getString("wish_major");
         }
     }
     ResultSet rst = stmt.executeQuery("select * from tea_inf where major='" + wish_major + "' order by rate desc");
     int i = 0;
     while (rst.next()) {
         if (i < 5) {
             reco_name[i] = rst.getString("name");
             reco_id[i] = rst.getString("id");
             i++;
         } else
             break;
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
            <a class="navbar-brand" href="./mainpage_stu.action">主页</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="./my_attention_tea?id_in=${id}">我关注的导师</a></li>
                <li><a href="./attention_me_tea?id_in=${id}">关注我的导师</a></li>
                <li><a href="./my_choose_tea?id_in=${id}">我选择的导师</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="./Show_stu.action?stuc.id=${id }" data-toggle="tooltip" data-placement="left" title="查看个人资料"><%=name%></a></li>
                <li><a href="./loginpage.action">注销账户</a></li>
            </ul>
        </div>
    </div>
</nav>

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
          teas.setRate(rst.getString("rate"));
      }
    rst2 = stmt.executeQuery("select * from stu_inf where id='"+id_in+"'");
    while(rst2.next())
      {
          stu_name = rst2.getString("name");
          stu_id = rst2.getString(("id"));
          stu_attentioned_tea = rst2.getString("attentioned_tea");
      }
    if (stu_attentioned_tea != null && teas.getName() != null)
    {
        if(stu_attentioned_tea.contains(teas.getName()+" "+teas.getId()))
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
                    <h1>导师信息</h1>
                </div>
                <div class="panel-body">
                    <div class="bigfont">照片<span class="info"><img src="<%=teas.getPicture_name()%>"  name="picture" width="120" height="180" id="picture" style="background-color: #999999" /></span>
                    </div>
                    <div class="bigfont">
                        姓名<span Class="info"><%=teas.getName()%>
                    </span>
                </div>
                <div class="bigfont">
                    学校<span Class="info"><%=teas.getCollege()%>
                </span>
            </div>
            <div class="bigfont">
                学院<span Class="info"><%=teas.getXueyuan()%>
            </span>
        </div>
        <div class="bigfont">
            专业<span Class="info"><%=teas.getMajor()%>
        </span>
    </div>
    <div class="bigfont">
        研究方向<span Class="info" style="margin-left: 16%"><%=teas.getResearch_field()%>
    </span>
</div>
<div class="bigfont">
    已招人数/招生人数<span Class="info" style="margin-left: 8%"><%=teas.getIn_enrollment()%>/<%=teas.getEnrollment()%>
</span>
</div>
<div class="bigfont">
    email<span Class="info" style="margin-left: 19%"><%=teas.getEmail()%>
</span>
</div>
<div class="bigfont">
    电话<span Class="info"><%=teas.getTel()%>
</span>
</div>
<div class="bigfont">
    个人简介<span Class="info" style="margin-left: 16%">
    <textarea disabled="disabled" rows=5 style="vertical-align: top;"><%=teas.getSelf_intro()%></textarea>
</span>
</div>
<form name="form4" method="post" action="stu_attention_tea">
  <p>
    <input type="hidden"  name="teas.name" value="<%=teas.getName()%>"  />
    <input type="hidden"  name="teas.id" value="<%=teas.getId()%>"  />
    <input type="hidden"  name="teas.attentioned_me" value="<%=teas.getAttentioned_me()%>" />
    <input type="hidden"  name="teas.rate" value="<%=teas.getRate()%>"  />
    <input type="hidden"  name="stu_select.name" value="<%=stu_name%>"  />
    <input type="hidden"  name="stu_select.id" value="<%=stu_id%>"  />
    <input type="hidden"  name="id_in" value="<%=stu_id%>"/>
    <input type="hidden"  name="stu_select.attentioned_tea" value="<%=stu_attentioned_tea%>"  />
    <input id="msg" type="hidden"  value="<%=message%>"/>
    <input type="button" value="返回" onclick="history.back();" style="margin-left: 40%">
    <input id="submit" type="submit"  value="关注" style="margin-left: 5%;">
  </p>
  
</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>