<%@ page language="java" contentType="text/html; charset=utf8" import="java.sql.*"
pageEncoding="utf8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
  <!-- Standard Meta -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <!-- Site Properties -->
  <title>search_result</title>
  <link rel="stylesheet" type="text/css" href="css/semantic.css">
  <script src="js/jquery-3.1.1.min.js"></script>
  <script type="text/javascript" src="js/semantic.min.js"></script>
  <script src="js/adserch_reasult.js"></script>
  <style>
    body {
      font-family: "楷体";
    }
  </style>
</head>

<body>
  <!--@java-->
  <c:set var="id" value="${id}" scope="request"></c:set>
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
		<form name="form24" action="message_stu" method="post">
        <input type="hidden" name="id" value="${id}"/></form>
      	<a class="item" href="javascript:document.form24.submit();"> <i class="message icon"></i>消息中心</a>
        <a class="item" href="javascript:document.form22.submit();"><i class="settings icon"></i><%=name%></a>
        <a class="item" href="javascript:document.form23.submit();"><i class="moon icon"></i>注销账户</a>
      </div>
</div>
  </div>
  <h4 class="ui horizontal divider header">
    <i class="find icon"></i>
  </h4>
  <!--the mainpage content-->
  <div class="ui grid">
    <div class="row">
      <div class="three wide column"></div>
      <!--the search result-->
      <div class="eight wide column">
        <div class="ui divided items">
          <h2 class="ui center aligned icon header">
            Searchs result
          </h2>
          <s:iterator value="list" var="l" status="st">
          <div class="item">
            <div class="ui small image">
              <img src="./images/elyse.png">
            </div>
            <div class="content">
              <a class="header" href="./Show_stu_tea?id_in=<%=id%>&teas.id=${l.id}">${l.name}</a>
              <div class="meta">
                <span>学院：${l.xueyuan}</span>
                <span>研究方向：${l.research_field}</span>
              </div>
              <div class="description">
                ${l.self_intro}
              </div>
              <div class="ui extra">
                ${l.xueyuan}的教授
              </div>
            </div>
          </div>
          </s:iterator>
        </div>
      </div>
      <div class="column">
        <div class="ui vertical divider"></div>
      </div>
      <div class="three wide column">
        <h1 class="ui horizontal divider header">
          <i class="search icon"></i> 高级搜索
        </h1>
        <form class="ui form" action="AdvSearch_stu" method="post">
          <h3 class="ui dividing header">导师信息</h3>
          <div class="field">
            <label>导师所在学院</label>
            <select id="wish_xueyuan" name="advsch.xueyuan" onchange="selectWishMajor()" class="ui fluid search dropdown">
                <option value="">-请选择-</option>
                <option value="航天学院">航天学院</option>
                <option value="机电工程学院">机电工程学院</option>
                <option value="材料科学与工程学院">材料科学与工程学院</option>
                <option value="能源科学与工程学院">能源科学与工程学院</option>
                <option value="电气工程及自动化学院">电气工程及自动化学院</option>
                <option value="理学院">理学院</option>
                <option value="经济与管理学院">经济与管理学院</option>
                <option value="人文与社会科学学院">人文与社会科学学院</option>
                <option value="土木工程学院">土木工程学院</option>
                <option value="市政环境工程学院">市政环境工程学院</option>
                <option value="建筑学院">建筑学院</option>
                <option value="交通科学与工程学院">交通科学与工程学院</option>
                <option value="计算机科学与技术学院">计算机科学与技术学院</option>
                <option value="软件学院">软件学院</option>
                <option value="法学院">法学院</option>
                <option value="外国语学院">外国语学院</option>
                <option value="电子与信息工程学院">电子与信息工程学院</option>
                <option value="生命科学与技术学院">生命科学与技术学院</option>
                <option value="化工与化学学院">化工与化学学院</option>
                <option value="马克思主义学院">马克思主义学院</option>
                <option value="体育部">体育部</option>
            </select>
          </div>
          <div class="field">
            <label>导师专业</label>
            <select id="wish_major" name="advsch.major" class="ui fluid dropdown"></select>
          </div>
          <div class="field">
            <label>导师研究方向</label>
            <input id="input" type="text" name="advsch.research_filed" placeholder="请填写研究方向" onclick="resetInput()" style="font-family:楷体">
          </div>
          <div class="ui segment">
            <div class="field">
              <div class="ui toggle checkbox">
                <input type="checkbox" name="isfull" value="full">
                <label>是否包括招满的导师</label>
              </div>
            </div>
          </div>
          <div class="field">
            <label>其他</label>
            <input type="text" name="advsch.keyword" style="font-family:楷体">
          </div>
          <button class="ui button" tabindex="0" onclick="javascript:form.submit();">搜索</button>
        </form>
      </div>
    </div>
  </div>
</body>
<script>
  $('#wish_xueyuan')
  .dropdown()
  ;
</script>

</html>
