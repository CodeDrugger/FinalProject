<%@ taglib uri="/struts-tags" prefix="s"%> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生信息</title>
</head>

<body>

    <h1>学生信息</h1>
      <p>照片：<img src="${stus.picture_name}" />
      </p>
      <p>姓名：${stus.name}
      </p>
      <p>
        性别： ${stu.sex}
        <br />
      </p>
      <p>年龄：${stus.age}
</p>
  <p>本科学科：${stus.benke_major}
</p>
  <p>报考硕士类别: ${stus.wish_class}
  </p>
  <p>入选方式：: ${stus.bein_class}</p>
  <p>研究生意愿学科：${stus.wish_major}</p>
      <p>是否有直博意愿：${stus.zhibo}
      </p>
      <p>本科学分绩：${stus.score}
  </p>
      <p>个人荣誉：${stus.honor}
  </p>
      <p>个人简介：${stus.self_intro}
  </p>
  <p>电话：${stus.tel}
</p>
<p>email：${stus.email}
</p>
<form id="form1" name="form1" method="post" action="Attention_stu">
  <p>
    <input type="submit" value="关注该学生" />
   	<input type="hidden"  name="stus.name" value="${stus.name}"  />
    <input type="hidden"  name="stus.id" value="${stus.id}"  />
    <input type="hidden"  name="stus.attentioned_me" value="${stus.attentioned_me}" />
    <input type="hidden"  name="tea_select.name" value="${tea_name}"  />
    <input type="hidden"  name="tea_select.id" value="${tea_id}"  />
    <input type="hidden"  name="tea_select.attentioned_stu" value="${tea_attentioned_stu}"  />
  </p>
</form>
<form name="form3" method="post" action="Return_stu_search">
  <input type="submit"  value="返回"/>
</form>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>