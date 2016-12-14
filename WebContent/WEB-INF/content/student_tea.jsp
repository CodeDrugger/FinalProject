<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,domain.Teacher" errorPage="" %>
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
  ResultSet rs = stmt.executeQuery("select * from stu_inf where id='" + id + "'");
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
		<input type="hidden" name="userclass" value="2"/></form>
		<form name="form21" action="my_attention_tea" method="post">   
		<input type="hidden" name="id_in" value="${id}"/></form>
      <a class="item" href="javascript:document.form20.submit();"><i class="home icon"></i>主页</a>
      <a class="item" href="javascript:document.form21.submit();"><i class="grid layout icon"></i> 考研互选 </a>
      <div class="right item">
		<form name="form22" action="Show_stu" method="post">   
		<input type="hidden" name="stuc.id" value="${id}"/></form>
		<form name="form23" action="loginpage" method="post"></form>
		<form name="form24" action="message_stu" method="post">
        <input type="hidden" name="id" value="${id}"/></form>
      	<a class="item" href="javascript:document.form24.submit();"> <i class="message icon"></i>消息中心</a>
        <a class="item" href="javascript:document.form22.submit();"><i class="settings icon"></i><%=name%></a>
        <a class="item" href="javascript:document.form23.submit();"><i class="moon icon"></i>注销账户</a>
      </div>
</div>
    </div>
    <!--@java-->
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


    <!--the title of the page-->
    <h2 class="ui horizontal divider header">
        <i class="unhide icon"></i>导师信息
    </h2>
    <!--the mainpge content-->
    <div class="ui grid">
        <div class="row">
            <div class="five wide column"></div>
            <div class="two wide column">
                <div class="ui divided items">
                    <div class="item">
                        <div class="small image">
                            <img src="<%=teas.getPicture_name()%>">
                        </div>
                    </div>
                </div>
            </div>
            <div class="four wide column">
                <div class="ui piled segments">
                    <div class="ui segment" style="font-size:20px;">
                        姓名：
                        <%=teas.getName()%>
                    </div>
                    <div class="ui segment" style="font-size:20px;">
                        学校：
                        <%=teas.getCollege()%>
                    </div>
                    <div class="ui segment" style="font-size:20px;">
                        学院：
                        <%=teas.getXueyuan()%>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="five wide column"></div>
            <div class="two wide column">
                <div class="ui raised segments">
                    <div class="ui segment" style="font-size:20px;">
                        专业
                    </div>
                    <div class="ui segment" style="font-size:20px;">
                        研究方向
                    </div>
                    <div class="ui segment" style="font-size:20px;">
                        已招人数/招生人数
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
                        <%=teas.getMajor()%>
                    </div>
                    <div class="ui segment" style="font-size:20px;">
                        <%=teas.getResearch_field()%>
                    </div>
                    <div class="ui segment" style="font-size:20px;">
                        <%=teas.getIn_enrollment()%>/
                            <%=teas.getEnrollment()%>
                    </div>
                    <div class="ui segment" style="font-size:20px;">
                        <%=teas.getEmail()%>
                    </div>
                    <div class="ui segment" style="font-size:20px;">
                        <%=teas.getTel()%>
                    </div>
                    <div class="ui segment fixup" style="font-size:20px;">
                        <%=teas.getSelf_intro()%>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="seven wide column"></div>
            <div class="three wide column">
                <form name="form4" method="post" action="stu_attention_tea">
                        <input type="hidden" name="teas.name" value="<%=teas.getName()%>" />
                        <input type="hidden" name="teas.id" value="<%=teas.getId()%>" />
                        <input type="hidden" name="teas.attentioned_me" value="<%=teas.getAttentioned_me()%>" />
                        <input type="hidden" name="teas.rate" value="<%=teas.getRate()%>" />
                        <input type="hidden" name="stu_select.name" value="<%=stu_name%>" />
                        <input type="hidden" name="stu_select.id" value="<%=stu_id%>" />
                        <input type="hidden" name="id_in" value="<%=stu_id%>" />
                        <input type="hidden" name="stu_select.attentioned_tea" value="<%=stu_attentioned_tea%>" />
                        <input id="msg" type="hidden" value="<%=message%>" />
                        <button class="ui labeled inverted violet icon button" id="submit" type="submit" onclick="javascript:form.submit();">
                            <i class="red heart icon"></i>关注
                        </button>
                        </form>
            </div>
        </div>
    </div>
</body>

</html>
