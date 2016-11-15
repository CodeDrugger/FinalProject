<%@ page language="java" contentType="text/html; charset=utf8" import="java.sql.*"
    pageEncoding="utf8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <link rel="stylesheet" href="css/bootstrap.css">
                <link rel="stylesheet" href="css/bootstrap-theme.css">
                <link rel="stylesheet" href="css/font-awesome.css">
                <script src="js/advsearch_result_tea.js"></script>
                <style>
                    body {
                        font-family: 'microsoft yahei', Arial, sans-serif;
                        background-image: url("images/1.png");
                        padding-top: 70px;
                    }
                    
                    .navopa {
                        opacity: .9;
                    }
                    
                    .disaa {
                        text-align: center;
                    }
                    
                    .tempright {
                        position: fixed;
                        width: 30%;
                        right: 0px;
                    }
                    
                    .templeft {
                        margin-left: 10%;
                        position: absolute;
                        width: 50%;
                        left: 0px;
                    }
                    
                    .tempcenter {
                        position: absolute;
                        margin-left: 60%;
                        width: 5%;
                    }
                    
                    .shortselect {
                        background: #fafdfe;
                        height: 28px;
                        width: 180px;
                        line-height: 28px;
                        border: 1px solid #9bc0dd;
                        -moz-border-radius: 2px;
                        -webkit-border-radius: 2px;
                        border-radius: 2px;
                    }
                    
                    .inputq {
                        background: #fafdfe;
                        height: 28px;
                        width: 180px;
                        line-height: 28px;
                        border: 1px solid #9bc0dd;
                        -moz-border-radius: 2px;
                        -webkit-border-radius: 2px;
                        border-radius: 2px;
                    }
                    
                    .leng {
                        height: auto;
                        width: auto;
                        font-size: larger;
                    }
                    
                    .ggo {
                        margin-bottom: 7%;
                    }
                </style>
                <title>搜索结果</title>
                <script src="js/advsearch_result_tea.js"></script>
            </head>

            <body>
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
                    <nav class="navbar navbar-default navopa navbar-inverse navbar-fixed-top" role="navigation">
                        <div class="container-fluid">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
                                <a class="navbar-brand" href="./MainPage.action?id=${id}&userclass=1">主页</a>
                            </div>
                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul class="nav navbar-nav">
                                    <li><a href="./my_attention_stu?id_in=${id}">我关注的学生</a></li>
					                <li><a href="./attention_me_stu?id_in=${id}">关注我的学生</a></li>
					                <li><a href="./my_choose_stu?id_in=${id}">我选择的学生</a></li>
					                <li><a href="./choose_me_stu?id_in=${id}">选择我的学生</a></li>
					                <li><a href="./My_ques.action?id=${id}&q.id=${id}">我的问卷</a></li>
                                </ul>
                                <ul class="nav navbar-nav navbar-right">
                                    <li>
                                        <a href="./Show_tea.action?teac.id=${id }" data-toggle="tooltip" data-placement="left" title="查看个人资料">
                                            <%=name%>
                                        </a>
                                    </li>
                                    <li><a href="#">注销账户</a></li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                    <div class="container templeft">
                        <s:iterator value="list" var="l" status="st">
                            <div>
                                <h3><a href="./Show_tea_stu.action?id_in=<%=id%>&stus.id=${l.id}">${l.name}</a></h3>
                                <div>
                                    <span>姓名：${l.name}</span>
                                    <span>性别：${l.sex}</span>
                                    <span>本科专业：${l.benke_major}</span>
                                </div>
                                <p>&nbsp;&nbsp;&nbsp;&nbsp;${l.self_intro}</p>
                            </div>
                        </s:iterator>
                    </div>
                    <div class="container tempright">
                        <div class="panel panel-default">
                            <div class="panel-heading" style="font-size: larger">高级搜索</div>
                        </div>
                        <div class="panel-body">
                            <form action="AdvSearch_tea" method="post" style="margin-left: 20%">
                                <div class="leng">本科学院：</div>
                                <select id="benke_xueyuan" onchange="selectBenkeMajor()" class="shortselect">
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
  								<div class="leng">本科专业：</div>
  								<select id="benke_major" name="advsch.benke_major" class="shortselect"></select>
                                <div class="leng">报考学院：</div>
                                <select id="wish_xueyuan" name="advsch.wish_xueyuan" onchange="selectWishMajor()" class="shortselect">
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
  								<div class="leng">报考专业：</div>
                                <select id="wish_major" name="advsch.wish_major"class="shortselect"></select>
                                <div class="leng">是否直博：</div>
                                <select name="advsch.zhibo" class="shortselect">
    <option value="">-请选择-</option>
    <option value="直博">直博</option>
    <option value="非直博">非直博</option>
  </select>
                                <div class="leng">入选方式：</div>
                                <select name="advsch.bein_class" class="shortselect">
    <option value="">-请选择-</option>
    <option value="保研">保研</option>
    <option value="考研">考研</option>
  </select>
                                <div class="leng">报考硕士类别：</div>
                                <select name="advsch.wish_class" class="shortselect">
    <option value="">-请选择-</option>
    <option value="学硕">学硕</option>
    <option value="专硕">专硕</option>
  </select>
                                <div class="leng">学分绩范围：</div>
                                <select name="advsch.range" class="shortselect">
    <option value="-1">-请选择-</option>
    <option value="0">大于</option>
    <option value="1">小于</option>
    <option value="2">等于</option>
  </select>
                                <span><input id="input" type="text" name="advsch.score" value="请填写小于100的数" onclick="resetInput()" class="inputq"> </span> 
                                <div class="leng">其他关键字</div>
                                <input type="text" name="advsch.keyword">
                                <input type="submit" value="给我搜">
                            </form>
                        </div>
                    </div>
            </body>

            </html>