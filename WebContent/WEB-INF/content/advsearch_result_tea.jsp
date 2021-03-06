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
              <a class="header" href="./Show_tea_stu.action?id_in=<%=id%>&stus.id=${l.id}">${l.name}</a>
              <div class="meta">
                <span>性别：${l.sex}</span>
                <span>本科专业：${l.benke_major}</span>
              </div>
              <div class="description">
                ${l.self_intro}
              </div>
              <div class="ui extra">
                Additional Detail
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
        <form class="ui form" action="AdvSearch_tea" method="post">
          <h3 class="ui dividing header">学生信息</h3>
          <div class="field">
            <label>本科学院</label>
            <select id="benke_xueyuan" onchange="selectBenkeMajor()" class="ui fluid search dropdown">
              <option value="">-请选择-</option>
              <option value="航天学院">航天学院</option>
              <option value="电子科学与技术系">电子科学与技术系</option>
              <option value="机电工程学院">机电工程学院</option>
              <option value="材料科学与工程学院">材料科学与工程学院</option>
              <option value="能源科学与工程学院">能源科学与工程学院</option>
              <option value="自动化测试与控制系">自动化测试与控制系</option>
              <option value="电气工程及自动化学院">电气工程系</option>
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
            </select>
          </div>
          <div class="field">
            <label>本科专业</label>
            <select id="benke_major" name="advsch.benke_major" class="ui fluid dropdown"></select>
          </div>
          <div class="field">
            <label>报考学院</label>
            <select id="wish_xueyuan" name="advsch.wish_xueyuan" onchange="selectWishMajor()" class="ui fluid dropdown">
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
            <label>报考专业</label>
            <select id="wish_major" name="advsch.wish_major" class="ui fluid dropdown"></select>
          </div>
          <div class="field">
            <label>是否直博</label>
            <select name="advsch.zhibo" class="shortselect" class="ui fluid dropdown">
              <option value="">-请选择-</option>
              <option value="是">直博</option>
              <option value="否">非直博</option>
            </select>
          </div>
          <div class="field">
            <label>入选方式</label>
            <select name="advsch.bein_class" class="ui fluid dropdown">
              <option value="">-请选择-</option>
              <option value="保研">保研</option>
              <option value="考研">考研</option>
            </select>
          </div>
          <div class="field">
            <label>报考硕士类别</label>
            <select name="advsch.wish_class" class="ui fluid dropdown">
              <option value="">-请选择-</option>
              <option value="学硕">学硕</option>
              <option value="专硕">专硕</option>
            </select>
          </div>
          <div class="field">
            <label>学分绩范围</label>
            <select name="advsch.range" class="ui fluid dropdown">
              <option value="-1">-请选择-</option>
              <option value="0">大于</option>
              <option value="1">小于</option>
              <option value="2">等于</option>
            </select>
            <input id="input" type="text" name="advsch.score" onclick="resetInput()" style="font-family:楷体">
          </div>
          <div class="field">
            <label>其他</label>
            <input type="text" name="advsch.keyword" style="font-family:楷体">
          </div>
          <div class="ui button" tabindex="0" onclick="javascript:form.submit();">搜索</div>
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
