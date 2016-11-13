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
                    <nav class="navbar navbar-default navopa navbar-inverse navbar-fixed-top" role="navigation">
                        <div class="container-fluid">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
                                <a class="navbar-brand" href="mainpage_stu.html">主页</a>
                            </div>
                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul class="nav navbar-nav">
                                    <li><a href="#">我关注的</a></li>
                                    <li><a href="#">关注我的</a></li>
                                </ul>
                                <ul class="nav navbar-nav navbar-right">
                                    <li>
                                        <a href="./Show_stu.action?stus.id=${id }" data-toggle="tooltip" data-placement="left"
                                            title="查看个人资料">
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
                            <div class="ggo">
                                <h3><a href="./Show_stu_tea?id_in=<%=id%>&teas.id=${l.id}">${l.name}</a></h3>
                                <div>
                                    <span>姓名：${l.name}</span>
                                    <span>学院：${l.xueyuan}</span>
                                    <span>研究方向：${l.research_field}</span>
                                </div>
                                <div>
                                    <p>&nbsp;&nbsp;&nbsp;&nbsp;${l.self_intro}</p>
                                </div>
                            </div>
                        </s:iterator>
                    </div>
                    <div class="container tempright">
                        <div class="panel panel-default">
                            <div class="panel-heading" style="font-size: larger">高级搜索</div>
                        </div>
                        <div class="panel-body">
                            <form action="AdvSearch_stu" method="post" style="margin-left: 20%">
                                <div class="leng">导师所在学院：</div>
                                <select id="wish_xueyuan" name="advsch.xueyuan" onchange="selectWishMajor()" class="shortselect">
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
            </select><br/><br/>
                                <div class="leng>">导师专业：</div>
                                <select id="wish_major" name="advsch.major" class="shortselect"></select><br/><br/>
                                <div class="leng">导师研究方向：</div>
                                <input id="input" type="text" name="advsch.research_filed" value="请填写研究方向" onclick="resetInput()" class="inputq"><br/><br/>
                                <span class="leng">是否包括已招满的导师：</span>
                                <input type="checkbox" value="full"><br/><br/>
                                <div class="leng">其他关键字：</div>
                                <input type="text" name="advsch.keyword" class="inputq"><br/><br/>
                                <input type="submit" value="搜索" style="width: 14%">
                            </form>
                        </div>
                    </div>
            </body>

            </html>