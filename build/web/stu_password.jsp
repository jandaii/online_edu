<%@ page language="java" contentType="text/html" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="updateBean" class="mybean.data.L_Spassword" scope="session"/>
<jsp:useBean id="loginBean" class="mybean.data.L_Studentlogin" scope="session"/>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="gb2312" />
<title>�������ģ�ѧ���ˣ�</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/reset.css" rel="stylesheet" />
<link href="css/main.css" rel="stylesheet"/>
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script> 
<script src="js/jquery.SuperSlide.2.1.1.js"></script>
</head>
<body >
<div class="header">
	<div class="wrap">
		<a href="#" class="logo"><img src="images/logo.png"/></a>
		<div class="nav">
			<ul>
				<li id="m1" class="m"><a href="student.jsp" title="��ҳ">��ҳ</a>
                        </ul>
                        <ul>                     
                                <li id="m2" class="m"><h3><a href="stu_qiandao.jsp">ÿ��ǩ��</a></h3>	
			</ul>
                        <ul>                     
                                <li id="m2" class="m"><h3><a href="stu_homework.jsp?course_name=a">��ҵ</a></h3>		
			</ul>
	                <ul>               
                                <li id="m3" class="m"><h3><a href="stu_answer.jsp?course_name=a">�𰸽���</a></h3>
		        </ul>		
		        <ul>		
				<li id="m5" class="m"><h3><a href="stu_name.jsp">��������</a></h3>
                                    <ul class="sub" >
					  <li class="xx">/</li>
					  <li><a href="L_SExit">�˳��˺�</a>
                                          <li class="xx"></li>
					</ul>
			</ul>
		</div>
	</div>
</div>

<div class="about_con">
	<div class="wrap">
            <div class="left">
			<ul class="s_list">
                                <li><a href="stu_name.jsp" title="������Ϣ">������Ϣ</a>
                                <li><a href="stu_course.jsp">�ҵĿγ�</a>
                                <li><a href="stu_password.jsp" class="curr">�������</a>
                                    <li><a href="L_SExit">�˳��˺�</a>
			</ul>
		</div>
            <div class="right">
		<center>
                    <h3 class="a_tit">�������</h3>
    <%
        if(loginBean==null){
        response.sendRedirect("L_Slogin.jsp");//�ض��򵽵�¼ҳ��
    }
    else {
       boolean b =loginBean.getStudent_No()==null||
                  loginBean.getStudent_No().length()==0;

       if(b)
         response.sendRedirect("L_Slogin.jsp");//�ض��򵽵�¼ҳ��
    }
       
    %>

	<form action = "L_SpasswordHServlet" method = "post" >
  	<table  margin="auto" height="auto" width="auto" >
  	  <tr>
 		<th>��������룺</th>
 		<td><input type="text" name="Student_password"  maxlength = "15" ></td>
                <td><font color = "#006000"><h5>���������룬������15���ַ���</h5></td>

 	  </tr>
 	  <tr>
 		<th>���������룺</th>
 		<td><input type="text" name="newStudent_password"  maxlength = "15" ></td>
                <td><font color = "#006000"><h5>�����������룬������15���ַ���</h5></td>

 	  </tr>
 	  <tr>
 		<th>ȷ�������룺</th>
 		<td><input type="text" name="againnewStudent_password"  maxlength = "15" ></td>
                <input type="hidden" name="Student_No" value="<%=loginBean.getStudent_No()%>"></td>

                <td><font color = "#006000"><h5>��ȷ�������룬������15���ַ���</h5></td>
 	  </tr>

 <tr>
 		<td colspan = "2" align = "center">
 		  <input type="submit" value="ȷ��">   
 		  <input type="reset" value="ȡ��">
 		</td>
	  </tr>
 <tr>
     <td>
         <h4><a href="L_Slogin.jsp">������¼</a></h4>
     </td>
 </tr>
        </table>
    </form>
    </center>
<div align="center">
<p> �޸ķ�����
<jsp:getProperty name="updateBean"  property="backNews" /> 
</div >

					
		</div>
       
            </div>
		<div class="clear"></div>
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
<!-- The Scripts -->
<script type="text/javascript">
jQuery(".focusBox").hover(function(){ jQuery(this).find(".prev,.next").stop(true,true).fadeTo("show",0.2) },function(){ jQuery(this).find(".prev,.next").fadeOut() });
jQuery(".focusBox").slide({ mainCell:".pic",effect:"fold", autoPlay:true, delayTime:600, trigger:"click"});//bannerͼ
jQuery(".nav").slide({ type:"menu",  titCell:".m", targetCell:".sub", effect:"slideDown", delayTime:300, triggerTime:100,returnDefault:true  });//����
</script>
</body>


</html>
