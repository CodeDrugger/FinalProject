<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" pageEncoding="utf-8" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <!-- Standard Meta -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <!-- Site Properties -->
    <title>my_info</title>
    <link rel="stylesheet" type="text/css" href="css/semantic.css">
    <script src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/semantic.min.js"></script>
    <script src="js/adserch_reasult.js"></script>
    <script src="js/pfchange.js"></script>
    <style>
        body {
            font-family: "楷体";
        }

        .fixup {
            word-wrap: break-word;
            word-break: break-all;
            overflow: hidden;
        }

        .file {
            position: relative;
            display: inline-block;
            background: #D0EEFF;
            border: 1px solid #99D3F5;
            border-radius: 4px;
            padding: 4px 12px;
            overflow: hidden;
            color: #1E88C7;
            text-decoration: none;
            text-indent: 0;
            line-height: 20px;
        }

        .file input {
            position: absolute;
            font-size: 100px;
            right: 0;
            top: 0;
            opacity: 0;
        }

        .file:hover {
            background: #AADFFD;
            border-color: #78C3F3;
            color: #004974;
            text-decoration: none;
        }
    </style>
</head>

<body>
  <!--@java-->
  <c:set var="id" value="${stuc.id}" scope="request"></c:set>
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
        <a class="item" href="javascript:document.form22.submit();"><i class="settings icon"></i><%=name%></a>
        <a class="item" href="javascript:document.form23.submit();"><i class="moon icon"></i>注销账户</a>
      </div>
</div>
    </div>
    <!--the title of the page-->
    <h2 class="ui horizontal divider header">
        <i class="browser icon"></i>我的信息
    </h2>
    <!--the form of the information-->
    <!--the mainpge content-->
    <form class="ui form" id="form1" name="form1" method="post" action="Change_stu" enctype="multipart/form-data">
        <div class="ui grid">
            <div class="row">
                <div class="five wide column"></div>
                <div class="two wide column">
                    <div class="ui divided items">
                        <div class="item">
                            <div class="small image" id="preview">
                                <img src="./images/helen.jpg">
                            </div>
                        </div>
                        <div class="item">
                            <a href="javascript:;" class="file">修改头像
                                <input type="file" onchange="previewImage(this)" name="image">
                            </a>
                            <input type="hidden" name="id" value="${stuc.id}">
                        </div>
                    </div>
                </div>
                <div class="four wide column">
                    <div class="ui piled segments">
                        <div class="ui segment" style="font-size:20px;">
                            姓名：
                            <div class="ui transparent input">
                                <input name="stuc.name" type="text" id="name_stu" value="${stuc.name}">
                            </div>
                        </div>
                        <div class="ui segment" style="font-size:20px;">
                            性别：
                            <input id="sex" type="hidden" value="${stuc.sex}" />男
                            <input id="sex_nan" type="radio" name="stuc.sex" id="sex_m" value="男" /> 女
                            <input id="sex_nv" type="radio" name="stuc.sex" id="sex_f" value="女" />
                        </div>
                        <div class="ui segment" style="font-size:20px;">
                            年龄：
                            <div class="ui transparent input">
                                <input name="stuc.age" type="text" id="age_stu" value="${stuc.age}">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="five wide column"></div>
                <div class="two wide column">
                    <div class="ui raised segments">
                        <div class="ui segment" style="font-size:20px;">
                            本科专业
                        </div>
                        <div class="ui segment" style="font-size:20px;">
                            报考硕士类别
                        </div>
                        <div class="ui segment" style="font-size:20px;">
                            入选方式
                        </div>
                        <div class="ui segment" style="font-size:20px;">
                            报考学院
                        </div>
                        <div class="ui segment" style="font-size:20px;">
                            报考专业
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
                            电话
                        </div>
                        <div class="ui segment" style="font-size:20px;">
                            email
                        </div>
                        <div class="ui segment" style="font-size:20px;">
                            个人简介
                        </div>
                    </div>
                </div>
                <div class="four wide stretched column">
                    <div class="ui piled segments">
                        <div class="ui segment" style="font-size:20px; padding: 17px;">
                            <div class="ui transparent input">
                                <input name="stuc.benke_major" type="text" id="name_stu4" value="${stuc.benke_major}">
                            </div>
                        </div>
                        <div class="ui segment" style="font-size:20px;">
                            <input id="wish_class" type="hidden" value="${stuc.wish_class}" /> 学硕
                            <input id="wish_class_xueshuo" name="stuc.wish_class" type="radio" value="学硕" /> 专硕
                            <input id="wish_class_zhuanshuo" type="radio" name="stuc.wish_class" value="专硕" /> 不确定
                            <input id="wish_class_buqueding" type="radio" name="stuc.wish_class" value="不确定">
                        </div>
                        <div class="ui segment" style="font-size:20px;">
                            <input id="bein_class" type="hidden" value="${stuc.bein_class}" /> 保研
                            <input id="bein_class_baoyan" type="radio" name="stuc.bein_class" id="stuc.bein_class" value="保研" />                            考研
                            <input id="bein_class_kaoyan" type="radio" name="stuc.bein_class" id="stuc.bein_class" value="考研">
                        </div>
                        <div class="ui segment" style="font-size:20px;padding: 16px;">
                            <div class="ui transparent input">
                                <input name="stuc.wish_xueyuan" type="text" id="stuc.wish_xueyuan" value="${stuc.wish_xueyuan}">
                            </div>
                        </div>
                        <div class="ui segment" style="font-size:20px;padding: 16px;">
                            <div class="ui transparent input">
                                <input name="stuc.wish_major" type="text" id="stuc.wish_major" value="${stuc.wish_major}">
                            </div>
                        </div>
                        <div class="ui segment fixup" style="font-size:20px;">
                            <input id="zhibo" type="hidden" value="${stuc.zhibo}" /> 是
                            <input id="zhibo_shi" type="radio" name="stuc.zhibo" value="是" /> 否
                            <input id="zhibo_fou" type="radio" name="stuc.zhibo" value="否" />
                        </div>
                        <div class="ui segment" style="font-size:20px;padding: 17px;">
                            <div class="ui transparent input">
                                <input name="stuc.score" type="text" value="${stuc.score}">
                            </div>
                        </div>
                        <div class="ui segment" style="font-size:20px;padding: 16px;">
                            <div class="ui transparent input">
                                <input name="stuc.honor" type="text" value="${stuc.honor}">
                            </div>
                        </div>
                        <div class="ui segment" style="font-size:20px;padding: 17px;">
                            <div class="ui transparent input">
                                <input name="stuc.tel" type="text" value="${stuc.tel}">
                            </div>
                        </div>
                        <div class="ui segment" style="font-size:20px;padding: 16px;">
                            <div class="ui transparent input">
                                <input name="stuc.email" type="text" value="${stuc.email}">
                            </div>
                        </div>
                        <div class="ui segment" style="font-size:20px;">
                            <textarea name="stuc.self_intro" rows=2>${stuc.self_intro}</textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="ten wide column"></div>
                <div class="three wide column">
                    <input type="hidden" name="id" value="${stuc.id}" />
                    <input type="hidden" name="stuc.id" value="${stuc.id}" />
                    <button class="ui labeled inverted violet icon button" type="submit">
                            <i class="level up icon"></i>提交
                    </button>
                </div>
            </div>
        </div>
    </form>
</body>
<script>
    function previewImage(file)
    {
        var MAXWIDTH  = 120;
        var MAXHEIGHT = 180;
        var div = document.getElementById('preview');
        if (file.files && file.files[0])
        {
            div.innerHTML ='<img id=imghead>';
            var img = document.getElementById('imghead');
            var reader = new FileReader();
            reader.onload = function(evt){img.src = evt.target.result;}
            reader.readAsDataURL(file.files[0]);
        }
        else //兼容IE
        {
            var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
            file.select();
            var src = document.selection.createRange().text;
            div.innerHTML = '<img id=imghead>';
            var img = document.getElementById('imghead');
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
            div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
        }
    }
</script>

</html>
