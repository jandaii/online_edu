<!DOCTYPE html>
<html class="no-js">
    <head>
        <%@ page contentType="text/html;charset=GB2312" %>
        <title>签到系统</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="css/reset.css" rel="stylesheet" />
        <link href="css/main.css" rel="stylesheet"/>
        <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script> 
        <script src="js/jquery.SuperSlide.2.1.1.js"></script>
    </head>
    <body style="background:#222">
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
        <div class="banner">
            <div class="focusBox">
                <ul class="pic">
                    <li style="background:url(images/b1.jpg) center top no-repeat;"><a href="#"></a></li>
                    <li style="background:url(images/b2.jpg) center top no-repeat;"><a href="#"></a></li>
                    <li style="background:url(images/b1.jpg) center top no-repeat;"><a href="#"></a></li>
                    <li style="background:url(images/b1.jpg) center top no-repeat;"><a href="#"></a></li>
                </ul>
                <a class="prev" href="javascript:void(0)"></a>
                <a class="next" href="javascript:void(0)"></a>
                <ul class="hd">
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>
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