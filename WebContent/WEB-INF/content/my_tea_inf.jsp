<%@ taglib uri="/struts-tags" prefix="s"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,domain.Student,domain.Teacher,java.util.List,java.util.ArrayList" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
        <title>导师信息</title>
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
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h1>导师信息</h1>
                </div>
                <div class="panel-body">
                    <div class="bigfont">照片<span class="info"><img src="${tea_inf.picture_name}"  name="picture" width="120" height="180" id="picture" style="background-color: #999999" /></span>
                    </div>
                    <div class="bigfont">
                        姓名<span Class="info">${tea_inf.name}
                    </span>
                </div>
                <div class="bigfont">
                    学校<span Class="info">${tea_inf.college}
                </span>
            </div>
            <div class="bigfont">
                学院<span Class="info">${tea_inf.xueyuan}
            </span>
        </div>
        <div class="bigfont">
            专业<span Class="info">${tea_inf.major}
        </span>
    </div>
    <div class="bigfont">
        研究方向<span Class="info" style="margin-left: 16%">${tea_inf.research_field}
    </span>
</div>
<div class="bigfont">
    已招人数/招生人数<span Class="info" style="margin-left: 8%">${tea_inf.in_enrollment}/${tea_inf.enrollment}
</span>
</div>
<div class="bigfont">
    email<span Class="info" style="margin-left: 19%">${tea_inf.email}
</span>
</div>
<div class="bigfont">
    电话<span Class="info">${tea_inf.tel}
</span>
</div>
<div class="bigfont">
    个人简介<span Class="info" style="margin-left: 16%"><textarea disabled="disabled" rows=5 style="vertical-align: top;">${tea_inf.self_intro}</textarea>
</span>
</div>
<form action="Mytea" method="get"><input type="hidden" name="id_in" value="${teacher_id}"/>
    <input type="submit" value="返回" style="margin-left: 40%"></form>
</div>
</div>
</div>
</div>
</div>
</body>

</html>
