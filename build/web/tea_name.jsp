<%@ page language="java" contentType="text/html" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="loginBean2" class="mybean.data.L_Teacherlogin" scope="session"/>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="gb2312" />
<title>��ҵ�ύϵͳ����ʦ�ˣ�</title>
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
				<li id="m1" class="m"><a href="teachermain.jsp" title="��ҳ">��ҳ</a></li>
				<li id="m2" class="m">
                                   <h3><a href="add_hw.jsp">������ҵ</a></h3>
					
					
				<li id="m3" class="m">
					<h3><a href="hw_manage.jsp">��ҵ����</a></h3>
					
				</li>
				
				<li id="m4" class="m">
					<h3><a href="hw_analyse.jsp">��ҵ�������</a></h3>
					
				</li>
				 
				<li id="m5" class="m">
					<h3><a href="tea_name.jsp">������Ϣ</a></h3>
					<ul class="sub" >
					 
					  <li><a href="L_TExit">�˳��˺�</a>
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
                                <li><a href="tea_name.jsp" title="������Ϣ" class="curr">������Ϣ</a>
                                <li><a href="tea_course.jsp">�ҵĿγ�</a>
                                <li><a href="tea_password.jsp">�������</a>
                                    <li><a href="L_TExit">�˳��˺�</a>
			</ul>
		</div>
            <div class="right">
                <h3 class="a_tit">������Ϣ</h3>
                        <div align="center">
<%  
    if(loginBean2==null){
        response.sendRedirect("L_Tlogin.jsp");//�ض��򵽵�¼ҳ��
    }
    else {
       boolean b =loginBean2.getTeacher_No()==null||
                  loginBean2.getTeacher_No().length()==0;

       if(b)
         response.sendRedirect("L_Tlogin.jsp");//�ض��򵽵�¼ҳ��
    }
    Connection con;
    Statement sql; 
    ResultSet rs;
    try{  Class.forName("com.mysql.jdbc.Driver");
    }
    catch(Exception e){}
    try {       
        String uri="jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work?"
            + "user=work&password=swufework&characterEncoding=gb2312" ;

          con=DriverManager.getConnection(uri);
          sql=con.createStatement();
           String cdn = "SELECT Teacher_No,Teacher_name,college,title FROM teacher where Teacher_No='"+loginBean2.getTeacher_No()+"'";


          rs=sql.executeQuery(cdn);
          out.print("<table border=2>");
          out.print("<tr>");
            out.print("<th width=100>"+"ѧ����");
            out.print("<th width=100>"+"����");
            out.print("<th width=100>"+"ѧԺ����");
            out.print("<th width=100>"+"ְ��");
            //out.print("<th width=100>"+"");
          out.print("</tr>");
          while(rs.next()){
            out.print("<tr>");
              out.print("<td >"+rs.getString(1)+"</td>"); 
              out.print("<td >"+rs.getString(2)+"</td>");
              out.print("<td >"+rs.getString(3)+"</td>");
              out.print("<td >"+rs.getString(4)+"</td>"); 
              out.print("</tr>") ; 
          }
      out.print("</table>");
          con.close();
    }
    catch(SQLException e){ 
          out.print(e);
    }
       
%> 

                        </div>

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

