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
      <p>照片：<img src="" alt="" name="picture" width="120" height="32" id="picture" style="background-color: #999999" />
      </p>
      <p>姓名：${sts.name}
      </p>
      <p>
        性别： ${stu.sex}
        <br />
      </p>
      <p>年龄：${stu.age}
</p>
  <p>本科学科：${stu.benke_major}
</p>
  <p>报考硕士类别: ${stu.wish_class}
  </p>
  <p>入选方式：: ${stu.bein_class}</p>
  <p>研究生意愿学科：${stu.wish_major}</p>
      <p>是否有直博意愿：${stu.zhibo}
      </p>
      <p>本科学分绩：${stu.score}
  </p>
      <p>个人荣誉：${stu.honor}
  </p>
      <p>个人简介：${stu.self_intro}
  </p>
  <p>电话：${stu.tel}
</p>
<p>email：${stu.email}
</p>
<form name="form3" method="post" action="Mystu">
  <input type="hidden"  name="id_in" value="${id_in}" />
  <input type="submit"  value="返回"/>
</form>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>