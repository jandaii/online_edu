<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
				<li id="m1" class="m"><a href="l_login.jsp" title="首页">首页</a></li>
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
			<ul class="s_list">
				<li><a href="l_about.jsp">系统简介</a></li>
				<li><a href="l_team.jsp">核心团队</a></li>
			</ul>
		</div>
		<div class="right">
                   
			<h1 class="a_tit">系统简介</h1>
			<p style="line-height:2.6em;font-size:16px;"></p>
                        <p><strong>一、后台管理子系统</strong></p>
                        <p>1.管理员建立、查询、修改、删除老师和学生帐户并输出信息；建立、查询、修改、删除班级并显示。</p>
                        <p>2.管理员设置、修改签到相关信息，显示平时作业成绩；发布与管理公共信息。</p>
                        <p>&nbsp;</p>
                        <p><strong>二、签到系统</strong></p>
                        <p>1. 学生登陆系统完成签到。</p>
                        <p>2. 系统根据学生登陆IP等信息判断签到是否正常，并统计显示签到人员。</p>
                        <p>&nbsp;</p>
                        <p><strong>三、上机作业发布子系统</strong></p>
                        <p>1.老师登录后出题，题目有选择题、判断、填空、问答和编程等类型，其中选择、填空、判断题这三种题型，老师录入题目的同时，还要录入正确答案，录入题目的过程中，老师随时可以按保存按钮保存，除了录入题目，还有录入该次作业的开始时间，结束时间；问答题和编程题老师可以录入参考答案要点。</p>
                        <p>2.学生登录后，查看作业的名称，在作业开始时间后查看题目内容，并开始答题。</p>
                        <p>3.学生须在作业截止时间以前提交，否则系统不再接受该同学提交的作业.</p>
                        <p>4.作业结束后，选择、填空、判断题这三种题型系统自动判分，并将成绩计入平时成绩；问答题可有由老师手动批改和自动批改。</p>
                        <p>5.老师登录系统后，可以查看本次作业人数，平均分，各分数人数分布，每道题目回答的正确率；得到作业情况分析。</p>
                        
		</div>
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
<script type="text/javascript">
jQuery(".focusBox").hover(function(){ jQuery(this).find(".prev,.next").stop(true,true).fadeTo("show",0.2) },function(){ jQuery(this).find(".prev,.next").fadeOut() });
jQuery(".focusBox").slide({ mainCell:".pic",effect:"fold", autoPlay:true, delayTime:600, trigger:"click"});//banner图
jQuery(".nav").slide({ type:"menu",  titCell:".m", targetCell:".sub", effect:"slideDown", delayTime:300, triggerTime:100,returnDefault:true  });//导航
</script>
</body>
</html>
