<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="mybean.fb_bean" %>
<%@page import="myservlet.fb_chaxun_Servlet" %>
<%@page import="java.sql.*"%>
<html class="no-js" mlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta charset="UTF-8" />
        <title>发布签到</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="css/reset.css" rel="stylesheet" />
        <link href="css/main.css" rel="stylesheet"/>
        <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script> 
        <script src="js/jquery.SuperSlide.2.1.1.js"></script>
        <script type="text/javascript" src="js/time.js">
        </script>
    </head> 
    <body >
        <div class="header">
            <div class="wrap">
                <a href="#" class="logo"><img src="images/logo.png"/></a>
                <div class="nav">
                    <ul>
                        <li id="m1" class="m"><a href="qd_shouye.jsp" title="首页">首页</a></li>
                        <li id="m2" class="m"><a href="qd_fabu.jsp" title="发布签到">发布签到</a></li>
                        <li id="m3" class="m"><a href="fb_chaxun.jsp" title="发布签到">发布签到查询</a></li>
                        <li id="m4" class="m"><a href="qd_chaxun.jsp" title="签到情况查询">学生签到查询</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="about_con">
            <div class="wrap">
                <div class="left">
                    <ul class="s_list">
                        <li><a href="#" class="curr">签到发布情况</a></li>
                    </ul>
                </div>
                <div class='right'>
                    <head>
                        <style>

                            /*table*/
                            .myTable { margin: auto; height: 200px; width: auto;  }  
                            .myTitle { background-color: #F2F3F5; }  
                            tr:hover { background:#F2F3F5; } 
                            th { font-size: 16px; font-weight: bold; }  
                            td { font-size: 14px; font-weight: bold }  
                            th,td { border: solid 1px #F2F3F5; text-align: center; }
                        </style>
                        <title>确认发布</title>
                    </head>
                    <body>
                    <center>
                        <%
                            request.setCharacterEncoding("gb2312");
                            fb_chaxun_Servlet cha = new fb_chaxun_Servlet();
                            List<fb_bean> list = cha.chaxun();
                          
                            for (fb_bean s : list) {
                                String detail = "<tr><td>" + s.getCourse_name()+ "</td>"
                                        + "<td>" + s.getCourse_time()+ "</td>"
                                        + "<td>" + s.getQd_time() + "</td>"
                                        + "<td>" + "<form  action='fabu_chaxun' method = 'post'>"
                                        + "<input type ='hidden' name='course_name' value= " + s.getCourse_name()+ ">"
                                        + "<input type ='hidden' name='course_name' value= " + s.getCourse_time()+ ">"
                                        + "<input type ='hidden' name='qd_time' value= " + s.getQd_time()+ ">"
                                        + "</form></td></tr>";
                                out.print(detail);
                            }%>
 <div class="footer">
	<div class="wrap">
		<div class="f_pad">
			<div class="fl">
				西南财经大学人品园　电话：xxx-xxxxxxxx　E-mail:<a href="shixun@swufe.cn">shixun@swufe.cn</a><br/> 
				copyright © 2020 西南财经大学 版权所有 联系电话：xxx-xxxxxxxx
			</div>
			<div class="fr">版权致辞：<a href="#">SWUFE网络</a></div>
		</div>
	</div>
</div>
        <!-- The Scripts -->
        <script type="text/javascript">
            jQuery(".focusBox").hover(function () {
                jQuery(this).find(".prev,.next").stop(true, true).fadeTo("show", 0.2)
            }, function () {
                jQuery(this).find(".prev,.next").fadeOut()
            });
            jQuery(".focusBox").slide({mainCell: ".pic", effect: "fold", autoPlay: true, delayTime: 600, trigger: "click"});//banner图
            jQuery(".nav").slide({type: "menu", titCell: ".m", targetCell: ".sub", effect: "slideDown", delayTime: 300, triggerTime: 100, returnDefault: true});//导航
        </script>
    </body>
</form>
</html>