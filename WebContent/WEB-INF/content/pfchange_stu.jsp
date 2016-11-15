<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" pageEncoding="utf-8" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/font-awesome.css">
    <title>更改学生信息</title>
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
    <script src="js/pfchange.js" charset="utf-8"></script>
    <style>
        #preview{width:260px;height:190px;border:0;overflow:hidden;}
        #imghead {filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);}
        body{
            font-family: 'microsoft yahei',Arial,sans-serif;
            background-image: url("images/1.png");
            padding-top: 70px;
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
            <h1 class="panel-title" style="font-size: larger">
                学生信息
            </h1>
        </div>
        <div class="panel-body" style="text-align: left">
            
            <form id="form1" name="form1" method="post" action="Change_stu" enctype="multipart/form-data">
                <div id="preview">
                <img id="imghead" border=0 src="${stuc.picture_name}" width="120" height="180" />
            </div>
            <input type="file" onchange="previewImage(this)" name="image">
            <input type="hidden" name="id" value="${stuc.id}">
                <p>
                    <label style="font-size: larger" class="labelst">姓名:</label>
                    <input name="stuc.name" type="text" id="name_stu" value="${stuc.name}" class="inputgg">
                </p>
                <p>
                    <label style="font-size: larger" class="labelst">性别:</label>
                    <input id="sex" type="hidden" value="${stuc.sex}"/>
                    男<input id="sex_nan" type="radio" name="stuc.sex" id="sex_m" value="男" />
                    女<input id="sex_nv" type="radio" name="stuc.sex" id="sex_f" value="女" />
                </p>
                <p>
                    <label style="font-size: larger" class="labelst">年龄:</label>
                    <input name="stuc.age" type="text" id="age_stu" value="${stuc.age}" class="inputgg"/>
                </p>
                <p>
                    <label style="font-size: larger;margin-right: 7.5%;">本科专业:</label>
                    <input name="stuc.benke_major" type="text" id="name_stu4" value="${stuc.benke_major}" class="inputgg"/></p>
                <p>
                    <label style="font-size: larger;margin-right: 3.5%;">报考硕士类别:</label>
                    <input id="wish_class" type="hidden" value="${stuc.wish_class}"/>
                    学硕<input id="wish_class_xueshuo" name="stuc.wish_class" type="radio"  value="学硕"/>
                    专硕<input id="wish_class_zhuanshuo" type="radio" name="stuc.wish_class"  value="专硕"/>
                    不确定<input id="wish_class_buqueding" type="radio" name="stuc.wish_class"  value="不确定"/></p>
                <p>
                    <label style="font-size: larger;margin-right: 7.5%;">入选方式:</label>
                    <input id="bein_class" type="hidden" value="${stuc.bein_class}"/>
                    保研<input id="bein_class_baoyan" type="radio" name="stuc.bein_class" id="stuc.bein_class" value="保研" />
                    考研<input id="bein_class_kaoyan" type="radio" name="stuc.bein_class" id="stuc.bein_class" value="考研" /></p>
                    <p>
                    <label style="font-size: larger;margin-right: 1.5%;">报考学院:</label>
                    <input name="stuc.wish_xueyuan" type="text" id="stuc.wish_xueyuan" value="${stuc.wish_xueyuan}" class="inputgg"/></p>
                <p>
                    <label style="font-size: larger;margin-right: 1.5%;">报考专业:</label>
                    <input name="stuc.wish_major" type="text" id="stuc.wish_major" value="${stuc.wish_major}" class="inputgg"/></p>
                <p>
                    <label style="font-size: larger;margin-right: 1.5%;">是否有直博意愿:</label>
                    <input id="zhibo" type="hidden" value="${stuc.zhibo}"/>
                    是<input id="zhibo_shi" type="radio" name="stuc.zhibo" value="是" />
                    否<input id="zhibo_fou" type="radio" name="stuc.zhibo" value="否" /></p>
                <p>
                    <label style="font-size: larger;margin-right: 5.5%;">本科学分绩:</label>
                    <input name="stuc.score" type="text" value="${stuc.score}" class="inputgg"/></p>
                <p>
                    <label style="font-size: larger;margin-right: 7.5%;">个人荣誉:</label>
                    <input name="stuc.honor" type="text" value="${stuc.honor}" class="inputgg"/></p>
                <p>
                    <label style="font-size: larger;margin-right: 12%;">电话:</label>
                    <input name="stuc.tel" type="text" value="${stuc.tel}" class="inputgg"/></p>
                <p>
                    <label style="font-size: larger;margin-right: 10%;">email:</label>
                    <input name="stuc.email" type="text" value="${stuc.email}" class="inputgg"/></p>
                <p>
                    <label style="font-size: larger;margin-right: 7.5%; margintop :0px;">个人简介:</label>
                    <textarea name="stuc.self_intro" value="${stuc.self_intro}" class="inputgg" rows=5 style="vertical-align: top;"></textarea>
                </p>
                <p>
                    <input type="hidden" name="id" value="${stuc.id}" />
                    <input type="hidden" name="stuc.id" value="${stuc.id}" />
                    <input type="submit" value="提交" /></p>
                    <input type="button" value="返回" onclick="history.back();">
            </form>
        </div>
    </div>
      </div>
    </div>

</div>
</body>

</html>