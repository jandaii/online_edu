<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html class="no-js" mlns="http://www.w3.org/1999/xhtml">
    <head>
    <jsp:useBean id="fb_bean" class="mybean.fb_bean" scope="request"/>
        <meta charset="UTF-8" />
        <title>上机作业管理系统</title>
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
                        <li id="m3" class="m"><a href="qd_chaxun.jsp" title="签到情况查询">签到情况查询</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="about_con">
            <div class="wrap">
                <div class="left">
                    <ul class="s_list">
                        <li><a href="#" class="curr">发布签到</a></li>
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
                        <title>hhh</title>
                    </head>
                    <body>
                    <center>
                        <form style="float: left;"action="fabu" method="post" name = form>
                            <table class="myTable" width="100%" frame="border" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="myTitle1" width="90" align="center">课程名称：            <!--第一行第一列-->
                                    <td width="320"> <input type=text name="course_name"></td>                       <!-- 第一行第二列-->
                                    <!--320是课程名称和方框之间的距离-->
                                </tr>
                                <tr>
                                    <td class="myTitle2" align="center">上课时间：</td>
                                    <td> <input type=text name="course_time"></td>
                                </tr>
                                <tr>
                                    <td class="myTitle3" align="center">设置签到持续时长：<br> （以分钟为单位）</td>
                                    <td> <input type=text name="qd_time"></td>
                                </tr>  
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <input type="submit"name="submit"value="确认发布" style=" cursor:hand; width:84px; height:28px; background-color:#717984; font-weight:bold; color:white; pading:0px; border:0px">
                                        </form>
                                        <form action="qd_fabu.jsp" method="post" name = form>
                                            <input type="submit"name="cancel"value="取消" style="cursor:hand; width:84px; height:28px;  background-color:#717984; font-weight:bold; color:white; pading:0px; border:0px">
                                        </form>
                                    </td> 
                                </tr>
                            </table>
                            <jsp:getProperty name="fb_bean" property="news" /> 
                        </form>
                    </body></div>
                <div class="clear"></div>
            </div>
        </div>
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