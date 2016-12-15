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
String wish_xueyuan = "";
String[] reco_name = {"", "", "", "", ""};
String[] reco_id = {"", "", "", "", ""};
String[] reco_field = {"", "", "", "", ""};
String[] reco_pic = {"", "", "", "", ""};
String id = (String) request.getAttribute("id");
int i = 0;
try {
    Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
    e.printStackTrace();
}
try {
    Connection connect = DriverManager.getConnection("jdbc:mysql://115.28.67.141:3306/fpdb", "fp_user", "123456");
    Statement stmt = connect.createStatement();
    ResultSet rs = stmt.executeQuery("select * from stu_inf where id='" + id + "'");
    if (rs.next()) {
        if (rs.getString("name") != null && rs.getString("name").length() > 0) {
            name = rs.getString("name");
            wish_xueyuan = rs.getString("wish_xueyuan");
        }
    }
    ResultSet rst = stmt.executeQuery("select * from tea_inf where enrollment-in_enrollment>0 and "
       + "xueyuan='" + wish_xueyuan + "' order by rate desc");
    while (rst.next()) {
        if (i < 5) {
            reco_name[i] = rst.getString("name");
            reco_id[i] = rst.getString("id");
            reco_field[i] = rst.getString("research_field");
            reco_pic[i] = rst.getString("picture_name");
            i++;
        } else
            break;
    }
    
    ResultSet rs2=stmt.executeQuery("select * from messagecenter where id='" + id + "'");
    String before=null;
    if(rs2.next())
    {
    	before=rs2.getString("message");
    }
    //初始化
    if(!before.equals("@@"))
    {
    	if(before.split("@@").length==2)
    	{
    		if(before.charAt(before.length()-1)!='@')
    			before=before+"@@";
    			
    	}
    		
    	else if(before.split("@@").length==3)
    		before="@@"+before.split("@@")[2];
    	stmt.executeUpdate("update messagecenter set message='"+before+"' where id='"+id+"'");	
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
		<input type="hidden" name="id" value="${id}"/></form>
      <a class="item" href="javascript:document.form20.submit();"><i class="home icon"></i>主页</a>
      <a class="item" href="javascript:document.form21.submit();"><i class="grid layout icon"></i>考研互选 </a>
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

<!--the big search-->
<form action="SearchStu" method="post">
  <input id="id_main" type="hidden" name="id" value="${id}">
  <input type="hidden" name="search.user" value="1">
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
<div class="ui container">
  <h4 class="ui horizontal divider header"><i class="tag icon"></i>Recommend</h4>
  <div class="ui raised very padded container">
    <input id="number" type="hidden" value="<%=i%>">
  	<div class="ui four doubling cards" id="reco">

    </div>
  </div>
</div>
</body>

<script type="text/javascript">
var reco_name = new Array();
var reco_id = new Array();
var reco_field = new Array();
var reco_pic = new Array();
<%
for (int j = 0; j < 5; j++){
%>
reco_name[<%=j%>] = '<%=reco_name[j]%>';
reco_id[<%=j%>] = '<%=reco_id[j]%>';
reco_field[<%=j%>] = '<%=reco_field[j]%>';
reco_pic[<%=j%>] = '<%=reco_pic[j]%>';
<%}%>
window.onload=function(){
	var reco = document.getElementById("reco");
	var number = document.getElementById("number").value;
	var id_main = document.getElementById("id_main").value;
	//var rpg1 = document.getElementById("rpg1");
	//var rpg2 = document.getElementById("rpg2");
	//rpg1.value = id_main;
	
  if(number)
	for (var i = 1; i <= number; i++){
		var div_card = document.createElement("div");
    div_card.className="card";
    var form0 = document.createElement("form");
    form0.name = "jb" + i;
    form0.action = "Show_stu_tea";
    form0.method = "post";
    var input1 = document.createElement("input");
    var input2 = document.createElement("input");
    input1.type = "hidden";
    input1.name = "id";
    input1.value = id_main;
    input2.type = "hidden";
    input2.name = "teas.id";
    input2.value = reco_id[i - 1];
    form0.appendChild(input1);
    form0.appendChild(input2);
    div_card.appendChild(form0);
		var div_img = document.createElement("div");
    div_img.className = "image";
    div_img.innerHTML="<a href=\"javascript:document.jb"+i+".submit();\">" +
	"<img style=\"width:100%;\" src=\"" + reco_pic[i-1] + "\">" + "</a>";
    var div_content = document.createElement("div");
    div_content.className = "content";
    
    div_content.innerHTML="<a class=\" header\" href=\"javascript:document.jb"+i+".submit();\">"+ reco_name[i-1] +"</a>"+
    "<div class=\"description\">" + reco_field[i-1] +"</div>";
    div_card.appendChild(div_img);
    div_card.appendChild(div_content);
		reco.appendChild(div_card);
		//rpg2.value = reco_id[i - 1];
	}
}
</script>

</html>
