<%@ page language="java" contentType="text/html" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="loginBean" class="mybean.data.L_Studentlogin" scope="session"/>
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
					  <li><a href="L_Slogin.jsp">�˳��˺�</a>
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
                                <li><a href="stu_name.jsp" title="������Ϣ" class="curr">������Ϣ</a>
                                <li><a href="stu_course.jsp">�ҵĿγ�</a>
                                <li><a href="stu_password.jsp">�������</a>
                                <li><a href="L_Slogin.jsp">�˳��˺�</a>
			</ul>
		</div>
            <div class="right">
                <h3 class="a_tit">������Ϣ</h3>
                        <div align="center">
<%  if(loginBean==null){
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
           String cdn = "SELECT Student_No,Student_name,college,major,Class_name FROM student,class where student.Class_id=class.Class_id AND Student_No='"+loginBean.getStudent_No()+"'";


          rs=sql.executeQuery(cdn);
          out.print("<table border=2>");
          out.print("<tr>");
            out.print("<th width=100 Student_No=title>"+"ѧ��");
            out.print("<th width=100 Student_name=title>"+"����");
            out.print("<th width=100 college=title>"+"ѧԺ����");
            out.print("<th width=100 major=title>"+"רҵ����");
            out.print("<th width=100 Class_name=title>"+"�༶����");
            //out.print("<th width=100>"+"");
          out.print("</tr>");
          while(rs.next()){
            out.print("<tr>");
              out.print("<td >"+rs.getString("Student_No")+"</td>"); 
              out.print("<td >"+rs.getString("Student_name")+"</td>");
              out.print("<td >"+rs.getString("college")+"</td>");
              out.print("<td >"+rs.getString("major")+"</td>"); 
              out.print("<td >"+rs.getString("Class_name")+"</td>");
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
