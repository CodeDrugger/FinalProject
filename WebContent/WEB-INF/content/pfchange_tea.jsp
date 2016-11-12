<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            margin: 10px auto;
            padding: 5px;
            boder: 1px;
        }
        textarea{ resize:none; width:200px; height:200px;}
    </style>
</head>

<body>
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
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="./Show_stu.action?stus.id=${login.id }" data-toggle="tooltip" data-placement="left" title="查看个人资料">个人资料</a></li>
                    <li><a href="#">注销账户</a></li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<div class="container wrap">
    <div class="panel panel-default inner" style="width:70%">
        <div class="panel-heading">
            <h1 class="panel-title" style="font-size: larger" style="text-align: center">
                导师信息
            </h1>
        </div>
        <div class="panel-body">
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
                    <textarea name="teac.self_intro" value="${teac.self_intro}" class="inputgg" rowa=5></textarea>
                    <br /></p>
                <p>
                    <input type="hidden" name="id" value="${teac.id}" />
                    <input type="hidden" name="teac.id" value="${teac.id}" />
                    <input type="submit" value="提交" /></p>
            </form>
        </div>
    </div>
    <script type="text/javascript">
        function previewImage(file)
        {
            var MAXWIDTH  = 260;
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
    </script>
</body>

</html>