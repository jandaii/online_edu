<%-- 
    Document   : xinxi
    Created on : 2020-11-16, 19:01:50
    Author     : 123
--%>
<!DOCTYPE html>
<html class="no-js">
    <head>
        
        <%@ page contentType="text/html;charset=GB2312" %>
        <title>上机作业管理系统</title>
        <jsp:useBean id="Bean_teacher" class="mybean.data.Bean_teacher" scope="request"/>
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

        <div class="s_ban" style="background:url(images/gltd.jpg) center top repeat"></div>
        <div class="wrap">
            <div align="center" >
                <h1>修改学生账户信息</h1>
           
                <form action="Servlet_student_change" method="post" name="xnxi">

                    <%request.setCharacterEncoding("gb2312");
                        String name = request.getParameter("name").trim();
                        String id = request.getParameter("id").trim();
                        String college = request.getParameter("college").trim();
                         String major = request.getParameter("major").trim();
                          String class_name = request.getParameter("class").trim();
                    %>
                   
                        <table><tr><td><h3>请修改学生名称：
                                        <input type="text" name="s_name" value=<%=name%> id="file_input" /> <p></td></tr>
                                        <tr><td><h3>请修改学生所属学院：
                                                    <input type="text" name="xueyuan" value=<%=college%> id="file_inut" /> <p></td></tr>
                                                      <tr><td><h3>请修改学生所属专业：
                                                    <input type="text" name="major" value=<%=major%>  id="file_inut" /> <p></td></tr>
                                                         <tr><td><h3>请修改学生所属班级：
                                                    <input type="text" name="class" value=<%=class_name%>  id="file_inut" /> <p></td></tr>
                                                        <tr><td><h3>请修改学生学号：
                                                            
                                                                           <input type="hidden" name="S_no" value=<%=id%> id="file_iut" />
                                                                        <input type="text" name="s_no" value=<%=id%> id="file_iut" /> <p></td></tr>

                                                                        <tr><td><input type="submit" value="修改学生账户" >
                                                                            </td></tr></table> </form><jsp:getProperty name="Bean_teacher"  property="backNews" /> </div>


                                                                        </div></DIV></div>
                                                                        <p> 

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