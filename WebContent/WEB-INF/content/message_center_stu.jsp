<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,domain.Student,domain.Teacher,java.util.List,java.util.ArrayList" errorPage="" %>

<html>
    <head>
        <!-- Standard Meta -->
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
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
                        <a class="item" href="javascript:document.form20.submit();">
                            <i class="home icon"></i>主页</a>
                        <a class="item" href="javascript:document.form21.submit();">
                            <i class="grid layout icon"></i>
                            考研互选
                        </a>
                        <div class="right item">
                            <form name="form22" action="Show_stu" method="post">
                                <input type="hidden" name="stuc.id" value="${id}"/></form>
                            <form name="form23" action="loginpage" method="post"></form>
                            <form name="form24" action="message_stu" method="post">
                                <input type="hidden" name="id" value="${id}"/></form>
                            <a class="item" href="javascript:document.form24.submit();">
                                <i class="message icon"></i>消息中心</a>
                            <a class="item" href="javascript:document.form22.submit();">
                                <i class="settings icon"></i><%=name%></a>
                            <a class="item" href="javascript:document.form23.submit();">
                                <i class="moon icon"></i>注销账户</a>
                        </div>
                    </div>
                </div>

                <s:iterator value="show" var="s">
                    <div class="ui grid">
                        <div class="row">
                            <div class="five wide column"></div>
                            <div class="four wide column">
                                <div class="ui success message">
                                    <i class="close icon"></i>
                                    <div class="header">
                                        <form name="form40" action="Mytea_inf" method="post">
                                            <input type="hidden" name="tea_inf_id" value="${s.id}"/>
                                            <input type="hidden" name="id_in" value="${id_in}"/>
                                        </form>
                                        <a class="header" href="javascript:document.form40.submit();">${s.name}</a>
                                    </div>
                                    <ul class="list">
                                        <li>${s.message}</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </s:iterator>
            </body>
            <script>
                $('.message .close').on('click', function () {
                    $(this).closest('.message').transition('fade');
                });
            </script>
        </html>
