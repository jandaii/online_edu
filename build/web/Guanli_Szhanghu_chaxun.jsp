<%-- 
    Document   : zhanghao
    Created on : 2020-11-16, 19:00:47
    Author     : 123
--%>
<%@page import="java.util.*"%>
<%@page import="mybean.data.Bean_student"%>
<%@page import="java.sql.*"%>
<%@page import="myservlet.control.Servlet_student_chaxun"%>
<html class="no-js">
    <head>
        <jsp:useBean id="Bean_teacher" class="mybean.data.Bean_teacher" scope="request"/>
        <%@ page contentType="text/html;charset=GB2312" %>
        <title>上机作业管理系统</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="css/reset.css" rel="stylesheet" />
        <link href="css/main.css" rel="stylesheet"/>
        <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script> 
        <script src="js/jquery.SuperSlide.2.1.1.js"></script>
    </head>
    <body>
        <div class="header">
            <div class="wrap">
                <a href="#" class="logo"><img src="images/logo.png"/></a>
                <div class="nav">
                    <ul>
                        <li id="m1" class="m"><a href="Guanli_index.jsp" title="首页">首页</a></li>
                        <li id="m2" class="m">
                            <h3><a href="Guanli_zhanghao.jsp">管理账户</a></h3>
                            <ul class="sub">
                                <li class="xx"></li>
                                <li><a href="Guanli_zhanghao.jsp">学生账户管理</a></li>
                                <li class="xx">/</li>
                                <li><a href="Guanli_jiaoshiguanli.jsp">教师账户管理</a></li>
                                <li class="xx"></li>
                            </ul>
                        </li>
                        <li id="m3" class="m">
                            <h3><a href="Guanli_banji.jsp">管理班级</a></h3>
                            <ul class="sub">
                                <li class="xx"></li>
                                <li><a href="Guanli_banji.jsp">建立班级</a></li>
                                <li class="xx">/</li>
                                <li><a href="Guanli_banjiguanli.jsp">查询班级</a></li>
                                <li class="xx">/</li>
                                <li><a href="Guanli_banjiguanli.jsp">修改班级</a></li>
                                <li class="xx">/</li>
                                <li><a href="Guanli_banjiguanli.jsp">删除班级</a></li>
                                <li class="xx"></li>
                            </ul>
                        </li>
                        <li id="m4" class="m"><h3><a href="Guanli_xinxi.jsp">管理公告</a></h3>
                            <ul class="sub" >
                                <li class="xx"></li>
                                <li><a href="Guanli_xinxi.jsp">发布公告</a></li>
                                <li class="xx">/</li>
                                <li><a href="Servlet_gonggao">修改公告</a></li>
                                <li class="xx">/</li>
                                <li><a href="Servlet_gonggao">删除公告</a></li>
                                <li class="xx">/</li>
                                <li><a href="Servlet_gonggao">查看公告</a></li>
                                <li class="xx"></li>
                            </ul></li>

                        <li id="5" class="m">
                            <h3><a href="Guanli_chengji.jsp">管理成绩</a></h3>
                            <ul class="sub">
                                <li class="xx"></li>
                                <li><a href="Guanli_chengji.jsp">成绩导入</a></li>
                                <li class="xx">/</li>
                                <li><a href="Guanli_daochuS.jsp">成绩导出</a></li>
                                <li class="xx"></li>
                            </ul>

                        </li>
                        <li id="m6" class="m">
                            <h3><a href="Guanli_administrator.jsp">管理员信息</a></h3>

                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="about_con">
            <div class="wrap">
                <div class="center">
                    <table border="1">
                        <tr>
                            <td>学生姓名</td>
                            <td>学号</td>
                            <td>学院</td>
                            <td>专业</td>
                              <td>班级</td>
                            <td>删除账户</td>
                            <td>修改账户</td>
                        </tr>
                        <%
                            request.setCharacterEncoding("gb2312");
                            String college = request.getParameter("xueyuan").trim();
                            String major = request.getParameter("major").trim();
                            String Class_name = request.getParameter("class").trim();
                       
                            Servlet_student_chaxun cha = new Servlet_student_chaxun();
                            if(college==null){
                                college="";
                            }
                            if(major==null){
                                major="";
                            }
                            if(Class_name==null){
                                Class_name="";
                            }
                            List<Bean_student> list = cha.chaxun(college, major,Class_name);
                       
                            for (Bean_student tl : list) {
                                String detail = "<tr><td>" + tl.getStudent_name()+ "</td>"
                                        + "<td>" + tl.getStudent_No()+ "</td>"
                                        + "<td>" + tl.getCollege()+ "</td>"
                                        + "<td>" + tl.getmajor()+ "</td>"
                                         + "<td>" + tl.getClass_name()+ "</td>"
                                        + "<td>" + "<form  action='Servlet_student_delete' method = 'post'>"
                                        + "<input type ='hidden' name='id' value= " + tl.getStudent_No()+ ">"
                                        + "<input type ='submit'  value='删除账号' >" + "</form></td>"
                                        + "<td>" + "<form  action='Guanli_Szhanghu_change.jsp' method = 'post'>"
                                        + "<input type ='hidden' name='name' value= " + tl.getStudent_name()+ ">"
                                        + "<input type ='hidden' name='college' value= " + tl.getCollege() + ">"
                                        + "<input type ='hidden' name='major' value= " + tl.getmajor()+ ">"
                                         + "<input type ='hidden' name='class' value= " + tl.getClass_name()+ ">"
                                         + "<input type ='hidden' name='id' value= " + tl.getStudent_No()+ ">"
                                        + "<input type ='submit'  value='修改账号' >" + "</form></td></tr>";

                                out.print(detail);
                            }%>
                   
                </Div></div></div><P>
        <form action="Guanli_Szhanghu_add.jsp" method="post" name="addbanji">
            <input type ='hidden' name='college' value=<%=college%>>
            <input type ='hidden' name='major' value=<%=major%>>
            <input type ='hidden' name='Class_name' value=<%=Class_name%>>
            <tr><td><input type ='submit'  value='添加账号' ></td></tr> </table>
        </form>
        <div class="clear"></div></div>
    <div class="footer">
	<div class="wrap">
		<div class="f_pad">
			<div class="fl">
				西南财经大学人品园　电话：xxx-xxxxxxxx　E-mail:<a href="shixun@swufe.cn">shixun@swufe.cn</a><br/> 
				copyright ? 2020 西南财经大学 版权所有 联系电话：xxx-xxxxxxxx
			</div>
			<div class="fr">版权致辞：<a href="#">SWUFE网络</a></div>
		</div>
	</div>
</div>
    <!-- The Scripts -->
    <script type="text/javascript">
        jQuery(".focusBox").hover(function() {
            jQuery(this).find(".prev,.next").stop(true, true).fadeTo("show", 0.2)
        }, function() {
            jQuery(this).find(".prev,.next").fadeOut()
        });
        jQuery(".focusBox").slide({mainCell: ".pic", effect: "fold", autoPlay: true, delayTime: 600, trigger: "click"});//banner图
        jQuery(".nav").slide({type: "menu", titCell: ".m", targetCell: ".sub", effect: "slideDown", delayTime: 300, triggerTime: 100, returnDefault: true});//导航
    </script>
</body>
</html>