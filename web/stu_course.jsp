<%@ page language="java" contentType="text/html" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="loginBean" class="mybean.data.L_Studentlogin" scope="session"/>
<jsp:useBean id="courBean" class="mybean.data.Course" scope="request"/>
<%@ page import="java.sql.*" %>
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
                                <li><a href="stu_course.jsp" class="curr">�ҵĿγ�</a>
                                <li><a href="stu_password.jsp">�������</a>
                                <li><a href="L_SExit">�˳��˺�</a>
			</ul>
		</div>
            <div class="right">
                <h3 class="a_tit">�ҵĿγ�</h3>
                <div align="center">
<% if(loginBean==null){
        response.sendRedirect("L_Slogin.jsp");//�ض��򵽵�¼ҳ��
    }
    else {
       boolean b =loginBean.getStudent_No()==null||
                  loginBean.getStudent_No().length()==0;

       if(b)
         response.sendRedirect("L_Slogin.jsp");//�ض��򵽵�¼ҳ��
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
           String cdn = "SELECT Course_id,Course_name,Course_time FROM Course where Course_id IN"
                   + "(SELECT Course_id FROM student_course where Student_No IN "
                   + "(SELECT Student_No FROM student where Student_No="+loginBean.getStudent_No()+"))"; //��ѯ���

          rs=sql.executeQuery(cdn);
          out.print("<table border=2>");
          out.print("<tr>");
            out.print("<th>"+"�γ̱��");
            out.print("<th>"+"�γ�����");
            out.print("<th>"+"�γ�ʱ��");
            out.print("<th width=100>"+"");
          out.print("</tr>");
          while(rs.next()){
              String Course_id=rs.getString(1);
              String Course_name=rs.getString(2);
              String Course_time=rs.getString(3);
              String button="<form  action='stu_homework.jsp' method = 'post'>"+
                     "<input type ='hidden' name='course_name' value=' "+Course_name+"'>"+
                  "<input type ='submit'  value='�������γ�'></form>";
            out.print("<tr>");
              out.print("<td >"+Course_id+"</td>");   
              out.print("<td >"+Course_name+"</td>"); 
              out.print("<td >"+Course_time+"</td>");
              out.print("<td>"+button+"</td>");
              out.print("</tr>") ; 
          }
      out.print("</table>");
          con.close();
    }
    catch(SQLException e){ 
          out.print(e);
    }
%> 
ע��<jsp:getProperty name ="courBean" property="backNews"/>        

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
