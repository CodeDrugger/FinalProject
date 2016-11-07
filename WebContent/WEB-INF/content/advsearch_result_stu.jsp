<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Insert title here</title>
<script src="js/advsearch_result_tea.js"></script>
</head>
<body>
<form action="AdvSearch_stu" method="post">
  导师所在学院：
  <select id="wish_xueyuan" name="advsch.xueyuan" onchange="selectWishMajor()">
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
  导师专业：
  <select id="wish_major" name="advsch.major"></select>
  导师研究方向：
  <input id="input" type="text" name="advsch.research_filed" value="请填写研究方向" onclick="resetInput()">
  是否包括已招满的导师：
  <input type="checkbox" value="full">
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
		 <p>学院：${l.xueyuan}</p>
		 <p>研究方向：${l.research_filed}</p>
	   </div>
	 </div>
  </s:iterator>
</div>
</body>
</html>