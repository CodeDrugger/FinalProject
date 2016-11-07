<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Insert title here</title>
<script src="js/advsearch_result_tea.js"></script>
</head>
<body>
<form action="AdvSearch_tea" method="post">
  本科专业：
  <select id="benke_xueyuan" onchange="selectBenkeMajor()">
    <option value="">-请选择-</option>
	<option value="控制科学与工程系">控制科学与工程系</option>
	<option value="航天工程与力学系">航天工程与力学系</option>
	<option value="电子科学与技术系">电子科学与技术系</option>
	<option value="机电工程学院">机电工程学院</option>
	<option value="材料科学与工程学院">材料科学与工程学院</option>
	<option value="能源科学与工程学院">能源科学与工程学院</option>
	<option value="自动化测试与控制系">自动化测试与控制系</option>
	<option value="电气工程系">电气工程系</option>
	<option value="物理系">物理系</option>
	<option value="数学系">数学系</option>
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
  <select id="benke_major" name="advsch.benke_major"></select>
  报考专业：
  <select id="wish_xueyuan" onchange="selectWishMajor()">
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
  <select id="wish_major" name="advsch.wish_major"></select>
  是否直博：
  <select name="advsch.zhibo">
    <option value="">-请选择-</option>
    <option value="直博">直博</option>
    <option value="非直博">非直博</option>
  </select>
  入选方式：
  <select name="advsch.bein_class">
    <option value="">-请选择-</option>
    <option value="保研">保研</option>
    <option value="考研">考研</option>
  </select>
  报考硕士类别：
  <select name="advsch.wish_class">
    <option value="">-请选择-</option>
    <option value="学硕">学硕</option>
    <option value="专硕">专硕</option>
  </select>
  学分绩范围：
  <select name="advsch.range">
    <option value="-1">-请选择-</option>
    <option value="0">大于</option>
    <option value="1">小于</option>
    <option value="2">等于</option>
  </select>
  <input id="input" type="text" name="advsch.score" value="请填写小于100的数" onclick="resetInput()">
  其他关键字：
  <input type="text" name="advsch.keyword">
  <input type="submit" value="给我搜">
</form>
<div>
  <s:iterator value="list" var="l" status="st">
    <div>
	   <h3><a href="">${l.name}</a></h3>
	   <div>
		 <p>姓名：${l.name}</p>
		 <p>性别：${l.sex}</p>
		 <p>本科专业：${l.benke_major}</p>
	   </div>
	 </div>
  </s:iterator>
</div>
</body>
</html>