<%@ page language="java" contentType="text/html" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="userBean" class="mybean.data.L_Teacher" scope="request"/>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="gb2312" />
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
				<li id="m1" class="m"><a href="index.jsp" title="首页">首页</a></li>
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
				<li><a href="L_Tlogin.jsp">教师登录</a></li>
				<li><a href="L_Tzhuce.jsp" class="curr">教师注册</a></li>
			</ul>
		</div>
		<div class="right">
			<h1 class="a_tit">教师注册系统</h1>
			<div class="r_text">

    <center>
	<form action = "L_TRegisterServlet" method = "post">
  	<table  margin="center" height="auto" width="auto" >
          <tr>
		<th>学工号：</th>
		<td><input type="text" name="Teacher_No" maxlength = "10" ></td>
                <td><font color = "#006000"><h5>请输入学工号，不超过10个字符。</h5></td> 
 	  </tr>
  	  <tr>
		<th>姓  名：</th>
		<td><input type="text" name="Teacher_name" maxlength = "10"></td>
                <td><font color = "#006000"><h5>请输入姓名，不超过10个字符。</h5></td>
 	  </tr>
 	  <tr>
 		<th>输入密码：</th>
 		<td><input type="text" name="Teacher_password" maxlength = "15"></td>
                <td><font color = "#006000"><h5>请输入密码，不超过15个字符。</h5></td>
 	  </tr>
 	  <tr>
 		<th>确认密码：</th>
 		<td><input type="text" name="again_password" maxlength = "15"></td>
                <td><font color = "#006000"><h5>请确认输入密码，不超过15个字符。</h5></td>
 	  </tr>
           <tr>
 		<th>学院名称：</th>
 		<td><input type="text" name="college" maxlength = "15"></td>
                <td><font color = "#006000"><h5>请输入学院名称，不超过15个字符。</h5></td>
 	  </tr>
           <tr>
 		<th>职  称：</th>
 		<td><input type="text" name="title" maxlength = "15"></td>
                <td><font color = "#006000"><h5>请输入职称，不超过15个字符。</h5></td>
 	  </tr>
	 
          <tr>
 		<td colspan = "2" align = "center">
 		  <input type="submit" value="注  册">   
 		  <input type="reset" value="取  消">
 		</td>
	  </tr>
 <tr>
     <td>
         <h5><a href="L_Tlogin.jsp">立即登录</a></h5>
     </td>
 </tr>
        </table>
    </form>
    </center>
<div align="center">
<p> 注册反馈：
<jsp:getProperty name="userBean"  property="backNews" /> 
</div >
	</div>
       
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
<script type="text/javascript">
jQuery(".focusBox").hover(function(){ jQuery(this).find(".prev,.next").stop(true,true).fadeTo("show",0.2) },function(){ jQuery(this).find(".prev,.next").fadeOut() });
jQuery(".focusBox").slide({ mainCell:".pic",effect:"fold", autoPlay:true, delayTime:600, trigger:"click"});//banner图
jQuery(".nav").slide({ type:"menu",  titCell:".m", targetCell:".sub", effect:"slideDown", delayTime:300, triggerTime:100,returnDefault:true  });//导航
</script>
</body>
</html>
