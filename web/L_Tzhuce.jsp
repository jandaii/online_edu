<%@ page language="java" contentType="text/html" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="userBean" class="mybean.data.L_Teacher" scope="request"/>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="gb2312" />
<title>���ϲƾ���ѧ�ϻ���ҵ����ϵͳ</title>
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
				<li id="m1" class="m"><a href="index.jsp" title="��ҳ">��ҳ</a></li>
					<li id="m2" class="m">
					<h3><a href="l_about.jsp">��������</a></h3>
					<ul class="sub">
					  <li class="xx">/</li>
					  <li><a href="l_about.jsp">ϵͳ���</a></li>
					  <li class="xx">/</li>
					  <li><a href="l_team.jsp">�����Ŷ�</a></li>
					  <li class="xx"></li>
					</ul>
				</li>
				<li id="m3" class="m">
					<h3><a href="l_contact.jsp">��ϵ����</a></h3>
				</li>
				<li id="m4" class="m">
                                    <h3><a href="l_login.jsp">��¼ע��</a></h3>
                                <ul class="sub" >
					  <li class="xx">/</li>
					  <li><a href="L_Slogin.jsp">ѧ������</a></li>
					  <li class="xx">/</li>
					  <li><a href="L_Tlogin.jsp">��ʦ����</a></li>
					  <li class="xx">/</li>
                                          <li><a href="L_Alogin.jsp">����Ա����</a></li>
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
				<li><a href="L_Tlogin.jsp">��ʦ��¼</a></li>
				<li><a href="L_Tzhuce.jsp" class="curr">��ʦע��</a></li>
			</ul>
		</div>
		<div class="right">
			<h1 class="a_tit">��ʦע��ϵͳ</h1>
			<div class="r_text">

    <center>
	<form action = "L_TRegisterServlet" method = "post">
  	<table  margin="center" height="auto" width="auto" >
          <tr>
		<th>ѧ���ţ�</th>
		<td><input type="text" name="Teacher_No" maxlength = "10" ></td>
                <td><font color = "#006000"><h5>������ѧ���ţ�������10���ַ���</h5></td> 
 	  </tr>
  	  <tr>
		<th>��  ����</th>
		<td><input type="text" name="Teacher_name" maxlength = "10"></td>
                <td><font color = "#006000"><h5>������������������10���ַ���</h5></td>
 	  </tr>
 	  <tr>
 		<th>�������룺</th>
 		<td><input type="text" name="Teacher_password" maxlength = "15"></td>
                <td><font color = "#006000"><h5>���������룬������15���ַ���</h5></td>
 	  </tr>
 	  <tr>
 		<th>ȷ�����룺</th>
 		<td><input type="text" name="again_password" maxlength = "15"></td>
                <td><font color = "#006000"><h5>��ȷ���������룬������15���ַ���</h5></td>
 	  </tr>
           <tr>
 		<th>ѧԺ���ƣ�</th>
 		<td><input type="text" name="college" maxlength = "15"></td>
                <td><font color = "#006000"><h5>������ѧԺ���ƣ�������15���ַ���</h5></td>
 	  </tr>
           <tr>
 		<th>ְ  �ƣ�</th>
 		<td><input type="text" name="title" maxlength = "15"></td>
                <td><font color = "#006000"><h5>������ְ�ƣ�������15���ַ���</h5></td>
 	  </tr>
	 
          <tr>
 		<td colspan = "2" align = "center">
 		  <input type="submit" value="ע  ��">   
 		  <input type="reset" value="ȡ  ��">
 		</td>
	  </tr>
 <tr>
     <td>
         <h5><a href="L_Tlogin.jsp">������¼</a></h5>
     </td>
 </tr>
        </table>
    </form>
    </center>
<div align="center">
<p> ע�ᷴ����
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
				���ϲƾ���ѧ��Ʒ԰���绰��xxx-xxxxxxxx��E-mail:<a href="shixun@swufe.cn">shixun@swufe.cn</a><br/> 
				copyright ? 2020 ���ϲƾ���ѧ ��Ȩ���� ��ϵ�绰��xxx-xxxxxxxx
			</div>
			<div class="fr">��Ȩ�´ǣ�<a href="#">SWUFE����</a></div>
		</div>
	</div>
</div>
<script type="text/javascript">
jQuery(".focusBox").hover(function(){ jQuery(this).find(".prev,.next").stop(true,true).fadeTo("show",0.2) },function(){ jQuery(this).find(".prev,.next").fadeOut() });
jQuery(".focusBox").slide({ mainCell:".pic",effect:"fold", autoPlay:true, delayTime:600, trigger:"click"});//bannerͼ
jQuery(".nav").slide({ type:"menu",  titCell:".m", targetCell:".sub", effect:"slideDown", delayTime:300, triggerTime:100,returnDefault:true  });//����
</script>
</body>
</html>
