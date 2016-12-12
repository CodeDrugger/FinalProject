<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
  <div class="ui grid">
    <div class="row">
      <div class="six wide column"></div>
      <div class="three wide column">
        <h1><i class="hourglass half icon"></i>${message}</h1>
      </div>
    </div>
  </div>
<!--  <form id="form" method="get">
<input id="msg" type="hidden" value="${message}">
<input id="input" type="hidden">
<input id="input2" type="hidden">
<input type="submit" value="返回">
</form>-->
</body>
</html>
