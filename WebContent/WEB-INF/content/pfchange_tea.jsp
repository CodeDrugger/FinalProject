<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
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
  <c:set var="id" value="${teac.id}" scope="request"></c:set>
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
    <!--sidebar on the top-->
    <div class="ui attached tiny stackable menu grey inverted">
      <div class="ui container">
        <a class="item" href="./MainPage.action?id=${id}&userclass=1"><i class="home icon"></i>主页</a>
        <a class="item" href="./my_attention_stu?id_in=${id}"><i class="grid layout icon"></i> 考研互选 </a>
        <a class="item" href="./My_ques.action?id=${id}&q.id=${id}"><i class="skyatlas icon"></i>我的问卷</a>
        <div class="right item">
          <a class="item" href="./Show_tea.action?teac.id=${id }" data-toggle="tooltip" data-placement="left" title="查看个人资料"><i class="settings icon"></i><%=name%></a>
          <a class="item" href="./loginpage.action"><i class="moon icon"></i>注销账户</a>
        </div>
      </div>
    </div>

    <!--the title of the page-->
    <h2 class="ui horizontal divider header">
        <i class="browser icon"></i>我的信息
    </h2>
    <!--the form of the information-->
    <!--the mainpge content-->
    <form class="ui form" id="form1" name="form1" method="post" action="Change_tea" enctype="multipart/form-data">
        <div class="ui grid">
            <div class="row">
                <div class="five wide column"></div>
                <div class="two wide column">
                    <div class="ui divided items">
                        <div class="item">
                            <div class="small image" id="preview">
                                <img src="${teac.picture_name}">
                            </div>
                        </div>
                        <div class="item">
                            <a href="javascript:;" class="file">修改头像
                                <input type="file" onchange="previewImage(this)" name="image">
                            </a>
                            <input type="hidden" name="id" value="${teac.id}">
                        </div>
                    </div>
                </div>
                <div class="four wide column">
                    <div class="ui piled segments">
                        <div class="ui segment" style="font-size:20px;">
                            姓名：
                            <div class="ui transparent input">
                                <input type="text" name="teac.name" value="${teac.name}">
                            </div>
                        </div>
                        <div class="ui segment" style="font-size:20px;">
                            性别：
                            <input id="sex" type="hidden" value="${teac.sex}" />男
                            <input id="sex_nan" type="radio" name="teac.sex" id="sex_m" value="男" /> 女
                            <input id="sex_nv" type="radio" name="teac.sex" id="sex_f" value="女" />
                        </div>
                        <div class="ui segment" style="font-size:20px;">
                            学校：
                            <div class="ui transparent input">
                                <input type="text" name="teac.college" value="${teac.college}">
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
                            学院
                        </div>
                        <div class="ui segment" style="font-size:20px;">
                            专业
                        </div>
                        <div class="ui segment" style="font-size:20px;">
                            研究方向
                        </div>
                        <div class="ui segment" style="font-size:20px;">
                            招生人数
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
                                <input type="text" name="teac.xueyuan" value="${teac.xueyuan}">
                            </div>
                        </div>
                        <div class="ui segment" style="font-size:20px;">
                          <div class="ui transparent input">
                              <input type="text" name="teac.major" value="${teac.major}">
                          </div>
                        </div>
                        <div class="ui segment" style="font-size:20px;">
                          <div class="ui transparent input">
                              <input type="text" name="teac.research_field" value="${teac.research_field}">
                          </div>
                        </div>
                        <div class="ui segment" style="font-size:20px;padding: 16px;">
                            <div class="ui transparent input">
                                <input type="text" name="teac.enrollment" value="${teac.enrollment }">
                                <label>(已招人数：${teac.in_enrollment}*招生人数应大于目前已招人数)</label>
                            </div>
                        </div>
                        <div class="ui segment" style="font-size:20px;padding: 16px;">
                            <div class="ui transparent input">
                                <input type="text" name="teac.tel" value="${teac.tel}">
                            </div>
                        </div>
                        <div class="ui segment" style="font-size:20px;padding: 16px;">
                            <div class="ui transparent input">
                                <input type="text" name="teac.email" value="${teac.email}">
                            </div>
                        </div>
                        <div class="ui segment" style="font-size:20px;">
                            <textarea name="teac.self_intro" rows=2>${teac.self_intro}</textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="ten wide column"></div>
                <div class="three wide column">
                  <input type="hidden" name="id" value="${teac.id}" />
                  <input type="hidden" name="teac.id" value="${teac.id}" />
                    <button class="ui labeled inverted violet icon button" type="submit" onclick="javascript:form.submit();">
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
