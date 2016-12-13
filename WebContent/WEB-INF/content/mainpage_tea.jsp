<%@ page language="java" contentType="text/html; charset=utf8" import="java.sql.*"
pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
  <!-- Standard Meta -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

  <!-- Site Properties -->
  <title>mainpage_stu</title>
  <link rel="stylesheet" type="text/css" href="css/semantic.css">

  <script src="js/jquery-3.1.1.min.js"></script>
  <script type="text/javascript" src="js/semantic.min.js"></script>

</head>
<body>
<!--@java-->
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
   ResultSet rst = stmt.executeQuery("select * from stu_inf where wish_xueyuan='" + xueyuan + "' order by rate desc,score desc");
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

<!--the big search-->
<form action="SearchTea" method="get">
  <input id="id_main" type="hidden" name="id" value="${id}">
  <input type="hidden" name="search.user" value="0">
  <div class="ui container">
    <div class="ui center aligned basic segment">
      <div class="ui left icon action input massive">
        <i class="search icon"></i>
        <input type="text" name="search.keyword" placeholder="搜点什么?">
        <button class="ui blue submit button" onclick="javascript:form.submit();">Search</button>
      </div>
    </div>
  </div>
</form>

<!-- the Recommend-->
<c:set var="id" value="${id }" scope="request"></c:set>
<div calss="ui container">
  <h4 class="ui horizontal divider header"><i class="tag icon"></i>Recommend</h4>
  <div class="ui raised very padded container">
    <input id="number" type="hidden" value="<%=i%>">
  	<div class="ui link cards" id="reco">

    </div>
  </div>
</div>
</body>
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
  if(number)
	for (var i = 1; i <= number; i++){
		var div_card = document.createElement("div");
    div_card.className="card";
		var div_img = document.createElement("div");
    div_img.className = "image";
    div_img.innerHTML="<img src=\"" + reco_pic[i-1] + "\">"
    var div_content = document.createElement("div");
    div_content.className = "content";
    div_content.innerHTML="<a class=\" header\" href=\" ./Show_tea_stu?id_in= " + id_main +"&stus.id="+reco_id[i-1] + "\"></a>"+
    "<div class=\"description\">" + reco_benke[i-1] +"</div>";
    div_card.appendChild(div_img);
    div_card.appendChild(div_content);
		reco.appendChild(div_card);
	}
}
</script>

</html>
