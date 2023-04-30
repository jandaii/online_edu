<%@ page language="java" contentType="text/html" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8" />
<title>西南财经大学上机作业管理系统</title>
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
            <a href="#" class="logo"><img src="images/logo.png"></a>
		<div class="nav">
			<ul>
				<li id="m1" class="m"><a href="http://www.swufe.edu.cn/" title="学校首页">学校首页</a></li>
					<li id="m2" class="m">
					<h3><a href="l_about.jsp">关于我们</a></h3>
					<ul class="sub">
					  <li class="xx">/</li>
					  <li><a href="l_about.jsp">系统简介</a></li>
					  <li class="xx">/</li>
					  <li><a href="l_team.jsp">核心团队</a></li>
					  <li class="xx"></li>
					</ul>
				</li>
				<li id="m3" class="m">
					<h3><a href="l_contact.jsp">联系我们</a></h3>
				</li>
				<li id="m4" class="m">
                                    <h3><a href="l_login.jsp">登录注册</a></h3>
                                <ul class="sub" >
					  <li class="xx">/</li>
					  <li><a href="L_Slogin.jsp">学生服务</a></li>
					  <li class="xx">/</li>
					  <li><a href="L_Tlogin.jsp">教师服务</a></li>
					  <li class="xx">/</li>
                                          <li><a href="L_Alogin.jsp">管理员服务</a></li>
					  <li class="xx"></li>
					</ul>
                                </li>
			</ul>
		</div>
    </div>

<div class="about_con">
    
	<div class="wrap">
            <div class="left">
			<div class="tit">登陆注册</div>
		</div>
            <div class="right">
                        <div class="jj_list">
				<div class="r_text">
					<h2><a href="L_Slogin.jsp">学生服务</a></h2>
				</div>
			</div>
			<div class="jj_list">
				<div class="r_text">
					<h2><a href="L_Tlogin.jsp">教师服务</a></h2>
				</div>
			</div>
			<div class="jj_list">
				<div class="r_text">
					<h2><a href="L_Alogin.jsp">管理员服务</a></h2>
				</div>
			</div>

		</div>
       
            </div>
		<div class="clear"></div>
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
<script type="text/javascript">
jQuery(".focusBox").hover(function(){ jQuery(this).find(".prev,.next").stop(true,true).fadeTo("show",0.2) },function(){ jQuery(this).find(".prev,.next").fadeOut() });
jQuery(".focusBox").slide({ mainCell:".pic",effect:"fold", autoPlay:true, delayTime:600, trigger:"click"});//banner图
jQuery(".nav").slide({ type:"menu",  titCell:".m", targetCell:".sub", effect:"slideDown", delayTime:300, triggerTime:100,returnDefault:true  });//导航
</script>
</body>
</html>
