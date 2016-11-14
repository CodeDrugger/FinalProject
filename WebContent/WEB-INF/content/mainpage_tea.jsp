<%@ page language="java" contentType="text/html; charset=utf8" import="java.sql.*"
pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/font-awesome.css">
    <style>
        body{
            font-family: 'microsoft yahei',Arial,sans-serif;
            background-image: url("images/1.png");
            padding-top: 70px;
        }
        .becenter{
            text-align: center}
        .mmm{
            margin-bottom: 5%;
            font-size: larger;
        }
    </style>
</head>
<body>
 <%
String name = "点此完善信息";
String xueyuan = "";
String[] reco_name = {"", "", "", "", ""};
String[] reco_id = {"", "", "", "", ""};
String[] reco_benke = {"", "", "", "", ""};
String[] reco_pic = {"", "", "", "", ""};
String id = (String)request.getAttribute("id");
int i = 0;
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
  			xueyuan = rs.getString("xueyuan");
  		}	
  	}
  	ResultSet rst = stmt.executeQuery("select * from stu_inf where state<>1 and wish_major='" + xueyuan + "' order by rate desc,score desc");
  	while (rst.next())
  	{
  		if (i < 5) {
            reco_name[i] = rst.getString("name");
            reco_id[i] = rst.getString("id");
            reco_benke[i] = rst.getString("benke_major");
            reco_pic[i] = rst.getString("picture_name");
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
            <a class="navbar-brand" href="./mainpage_tea.action">主页</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="./my_attention_stu?id_in=${id}">我关注的学生</a></li>
                <li><a href="./attention_me_stu?id_in=${id}">关注我的学生</a></li>
                <li><a href="./my_choose_stu?id_in=${id}">我选择的学生</a></li>
                <li><a href="./choose_me_stu?id_in=${id}">选择我的学生</a></li>
                <li><a href="./My_ques.action?id=${id}&q.id=${id}">我的问卷</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="./Show_tea.action?teac.id=${id }" data-toggle="tooltip" data-placement="left" title="查看个人资料"><%=name%></a></li>
                <li><a href="./loginpage.action">注销账户</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container becenter">
    <img src="images/4.jpg" height="150" width="200" style="margin-bottom: 2% ;border-radius: 5em">
    <form action="SearchTea" method="get" class="mmm">
        <input id="id_main" type="hidden" name="id" value="${id}" style="width:50%;height:50px">
        <input type="hidden" name="search.user" value="0" style="width:50%;height:50px">
        <input type="text" name="search.keyword" value="" style="width:50%;height:50px;padding-left: 5px">
        <input type="submit" value="给我搜" style="width:10%;height:50px">
    </form>
    
    <c:set var="id" value="${id }" scope="request"></c:set>
   
    推荐学生：
    <input id="number" type="hidden" value="<%=i%>">
    <table><tr id="reco"></tr></table>
</div>
<script type="text/javascript">
var reco_name = new Array();
var reco_id = new Array();
var reco_benke = new Array();
var reco_pic = new Array();
<%
for (int j = 0; j < 5; j++){
%>
reco_name[<%=j%>] = '<%=reco_name[j]%>';
reco_id[<%=j%>] = '<%=reco_id[j]%>';
reco_benke[<%=j%>] = '<%=reco_benke[j]%>';
reco_pic[<%=j%>] = '<%=reco_pic[j]%>';
<%}%>
window.onload=function(){
	var reco = document.getElementById("reco");
	var number = document.getElementById("number").value;
	var id_main = document.getElementById("id_main").value;
	for (var i = 1; i <= number; i++){
		var div = document.createElement("div");	
		var td = document.createElement("td");
		var div_img = document.createElement("div");
		var div_name = document.createElement("div");
		var div_benke = document.createElement("div");
		div_img.innerHTML=
		"<a href=\"./Show_tea_stu?id_in=" + id_main + "&stus.id=" + reco_id[i - 1] + "\">" + 
		"<img src=\"" + reco_pic[i - 1] +"\">" + "</a>";
		div_name.innerHTML=
		"<a href=\"./Show_tea_stu?id_in=" + id_main + "&stus.id=" + reco_id[i - 1] + "\">" + reco_name[i - 1] + "</a>";
		div_benke.innerHTML=reco_benke[i - 1];
		div.appendChild(div_img);
		div.appendChild(div_name);
		div.appendChild(div_benke);
		td.appendChild(div);
		reco.appendChild(td);		
	}	
}
</script>
</body>
</html>