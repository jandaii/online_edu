<%-- 
    Document   : gonggao
    Created on : 2020-11-17, 10:24:59
    Author     : 123
--%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<html class="no-js">
    <head>
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

           <div class="about_con">
            <div class="wrap">
                <div class="left">
                    <ul class="s_list">
                        <li><a href="Servlet_gonggao?a=2">通知公告</a></li>
                        <li><a href="Servlet_gonggao2?a=2">学校新闻</a></li>
                        <li><a href="Servlet_gonggao3?a=2">学术讲座</a></li>
                        <li><a href="Servlet_gonggao4?a=2">前沿动态</a></li>
                    </ul>
                </div>
       
                <%

                    request.setCharacterEncoding("gb2312");
                    String type = request.getParameter("type").trim();
                    String id = request.getParameter("id").trim();
                    String title = request.getParameter("title").trim();
                    String Content = (String)session.getAttribute("content");
                     String content=Content.replace("/r/n", "<br/>").replace("/x20", "&nbsp;"); 
                %>
                <div class="right">
                    <center>
                        <h1 class="a_tit">【 <%=type%> 】</h1>
                        <p>
                        <h3>  <%=title%></h3><p>
                        <h5> <div align="center"><TEXTAREA name="neirong" rows="20" cols="80" readonly><%=content%></TEXTAREA></h5>
                    </center>
                </div>
                
                <div class="clear"></div>
            </div>
        </div>
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