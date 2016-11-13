<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/font-awesome.css">
    <title>更改导师信息</title>
    <script src="js/pfchange.js" charset="utf-8"></script>
    <style>
        #preview{width:260px;height:190px;border:0;overflow:hidden;}
        #imghead {filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);}
        body{
            font-family: 'microsoft yahei',Arial,sans-serif;
            background-image: url("images/1.png");
            padding-top: 70px;
        }
        .becenter{
            text-align: justify
        }
        .wrap {
            float: left; /* 自适应内容宽度 */
            position: relative;
            left: 50%;
        }
        .inner {
            position: relative;
            left: -50%;
            margin-left: auto;
            margin-right: auto;
        }
        .labelst{
            margin-right: 12%;
        }
        .inputgg{
           width: 50%;
            border-radius: 0.5rem;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            margin: 10px auto;
            padding: 5px;
            opacity:0.8;
        }
        textarea{ resize:none; width:200px; height:200px;}
    </style>
</head>

<body>

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
<div class="header">
    <nav class="navbar navbar-default navopa navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="mainpage_stu.html">主页</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="#">我关注的</a></li>
                    <li><a href="#">关注我的</a></li>
                    <li><a href="./My_ques.action?id=${teac.id}&q.id=${teac.id}">我的问卷</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="./Show_tea.action?teac.id=${teac.id}" data-toggle="tooltip" data-placement="left" title="查看个人资料"><%=name%></a></li>
                    <li><a href="#">注销账户</a></li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<div class="container wrap">
    <div class="panel panel-default inner" style="width:70%" style="text-align: center">
        <div class="panel-heading">
            <h1 class="panel-title" style="font-size: larger" >
                导师信息
            </h1>
        </div>
        <div class="panel-body" style="text-align: left">
            <form id="form1" name="form1" method="post" action="Change_tea" enctype="multipart/form-data">
                <div id="preview">
                    <img id="imghead" border=0 src="${teac.picture_name}"  width="120" height="180" />
                </div>
                <input type="file" onchange="previewImage(this)" name="image">
                <input type="hidden" name="id" value="${teac.id}">
                <p>
                    <label style="font-size: larger" class="labelst">姓名:</label>
                    <input type="text" name="teac.name" value="${teac.name}"class="inputgg">
                </p>
                <p>
                    <label style="font-size: larger;margin-right:7.5%"> 招生人数:</label>
                    <input type="text" name="teac.enrollment" value="${teac.enrollment }" class="inputgg">(已招人数：${teac.in_enrollment}*招生人数应大于目前已招人数)</p>
                <p>
                    <label style="font-size: larger" class="labelst"> 性别:</label>
                    <input id="sex" type="hidden" value="${teac.sex}"/>
                    男<input id="sex_nan" type="radio" name="teac.sex" id="sex_m" value="男"/>
                    女<input id="sex_nv" type="radio" name="teac.sex" id="sex_f" value="女"/>
                </p>
                <p>
                    <label style="font-size: larger" class="labelst"> 学校:</label>
                    <input type="text" name="teac.college" value="${teac.college}" class="inputgg"></p>
                <p>
                    <label style="font-size: larger" class="labelst"> 学院:</label>
                    <input type="text" name="teac.xueyuan" value="${teac.xueyuan}" class="inputgg"></p>
                <p>
                    <label style="font-size: larger" class="labelst"> 专业:</label>
                    <input type="text" name="teac.major" value="${teac.major}" class="inputgg"></p>
                <p>
                    <label style="font-size: larger;margin-right: 7.5%"> 研究方向:</label>
                    <input type="text" name="teac.research_field" value="${teac.research_field}" class="inputgg"></p>
                <p>
                    <label style="font-size: larger" class="labelst"> 电话:</label>
                    <input type="text" name="teac.tel" value="${teac.tel}" class="inputgg"></p>
                <p>
                    <label style="font-size: larger;margin-right: 10%;"> email:</label>
                    <input type="text" name="teac.email" value="${teac.email}" class="inputgg"></p>
                <p>
                    <label style="font-size: larger;margin-right: 7.5%;"> 个人简介:</label>
                    <textarea name="teac.self_intro" value="${teac.self_intro}" class="inputgg" rowa=5 style="vertical-align: top;"></textarea>
                    <br /></p>
                <p>
                    <input type="hidden" name="id" value="${teac.id}" />
                    <input type="hidden" name="teac.id" value="${teac.id}" />
                    <input type="submit" value="提交" /></p>
            </form>
        </div>
    </div>
</div>
    <script type="text/javascript">
        function previewImage(file)
        {
            var MAXWIDTH  = 120;
            var MAXHEIGHT = 180;
            var div = document.getElementById('preview');
            if (file.files && file.files[0])
            {
                div.innerHTML ='<img id=imghead>';
                var img = document.getElementById('imghead');
                img.onload = function(){
                    var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                    img.width  =  rect.width;
                    img.height =  rect.height;
//                 img.style.marginLeft = rect.left+'px';
                    img.style.marginTop = rect.top+'px';
                }
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
        function clacImgZoomParam( maxWidth, maxHeight, width, height ){
            var param = {top:0, left:0, width:width, height:height};
            if( width>maxWidth || height>maxHeight )
            {
                rateWidth = width / maxWidth;
                rateHeight = height / maxHeight;

                if( rateWidth > rateHeight )
                {
                    param.width =  maxWidth;
                    param.height = Math.round(height / rateWidth);
                }else
                {
                    param.width = Math.round(width / rateHeight);
                    param.height = maxHeight;
                }
            }

            param.left = Math.round((maxWidth - param.width) / 2);
            param.top = Math.round((maxHeight - param.height) / 2);
            return param;
        }
    function ResizeImages()
{
   var myimg,oldwidth,oldheight;
   var maxwidth=120;
   var maxheight=180
   var imgs = document.getElementById('preview').getElementsByTagName('img');   
   for(i=0;i<imgs.length;i++){
     myimg = imgs[i];

     if(myimg.width > myimg.height)
     {
         if(myimg.width > maxwidth)
         {
            oldwidth = myimg.width;
            myimg.height = myimg.height * (maxwidth/oldwidth);
            myimg.width = maxwidth;
         }
     }else{
         if(myimg.height > maxheight)
         {
            oldheight = myimg.height;
            myimg.width = myimg.width * (maxheight/oldheight);
            myimg.height = maxheight;
         }
     }
   }
}
ResizeImages();
    </script>
</body>

</html>