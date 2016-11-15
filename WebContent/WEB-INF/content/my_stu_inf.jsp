    <%@ taglib uri="/struts-tags" prefix="s"%>
    <%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
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
        <title>学生信息</title>
    </head>

    <body>
        <%
String name = "点此完善信息";
String major = "";
String id = (String)request.getAttribute("id");
try {
    Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
    e.printStackTrace();
}
try {
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb","fp_user","123456");
    Statement stmt = connect.createStatement();
    ResultSet rs = stmt.executeQuery("select * from tea_inf where id='"+ id + "'");
    if (rs.next())
    {
        if (rs.getString("name") != null && rs.getString("name").length() > 0)
        {
            name = rs.getString("name");
            major = rs.getString("major");
        }   
    }
    ResultSet rst = stmt.executeQuery("select * from stu_inf where wish_major='" + major + "' order by rate desc,score desc");
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
            <a class="navbar-brand" href="./mainpage_tea.action">主页</a>
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
                <li><a href="./Show_tea.action?teac.id=${id }" data-toggle="tooltip" data-placement="left" title="查看个人资料"><%=name%></a></li>
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
                            <h1>学生信息</h1>
                        </div>
                        <div class="panel-body">
                            <div class="bigfont">照片<span class="info"><img src="" alt="" name="picture" width="120" height="180" id="picture" style="background-color: #999999"/></span>
                            </div>
                            <div class="bigfont">
                                姓名<span class="info">${ stu.name }
                            </span>
                        </div>
                        <div class="bigfont">
                            性别<span class="info">${ stu.sex }
                        </span>
                    </div>
                    <div class="bigfont">
                        年龄<span class="info">${ stu.age }
                    </span>
                </div>
                <div class="bigfont">
                    本科学科<span class="info" style="margin-left: 16%">${ stu.benke_major }
                </span>
            </div>
            <div class="bigfont">
                报考硕士类别<span class="info" style="margin-left: 12%">${ stu.wish_class }
            </span>
        </div>
        <div class="bigfont">
            入选方式<span class="info" style="margin-left: 16%;">${ stu.bein_class }
        </span>
    </div>
    <div class="bigfont">
        报考学院<span class="info" style="margin-left: 10%;">${ stu.wish_xueyuan }
    </span></div>
    <div class="bigfont">
        报考专业<span class="info" style="margin-left: 10%;">${ stu.wish_major }
    </span>
</div>
<div class="bigfont">
    是否有直博意愿<span class="info" style="margin-left: 10%;">${ stu.zhibo }
</span>
</div>
<div class="bigfont">
    本科学分绩<span class="info" style="margin-left: 14%">${ stu.score }
</span>
</div>
<div class="bigfont">
    个人荣誉<span class="info" style="margin-left: 16%;">${ stu.honor }
</span>
</div>
<div class="bigfont">
    email<span class="info" style="margin-left: 19%">${ stu.email }
</span>
</div>
<div class="bigfont">
    电话<span class="info">${ stu.tel }
</span>
</div>
<div class="bigfont">
    个人简介<span Class="info" style="margin-left: 16%"><textarea disabled="disabled" rows=5 style="vertical-align: top;">${ stu.self_intro }</textarea>
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
