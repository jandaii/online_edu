<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="mybean.data.homework_1" %>
<%@ page import="mybean.data.homework_11" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<jsp:useBean id="loginBean" class="mybean.data.L_Studentlogin" scope="session"/>
<jsp:useBean id="dataBean2" class="mybean.data.homework_11" scope="session"/>
<html class="no-js">
<head>
<meta charset="UTF-8" />
<title>��ҵ</title>
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
				<li id="m1" class="m"><a href="student.jsp" title="��ҳ">��ҳ</a></li>
                        </ul>
                        <ul>                     
                                <li id="m2" class="m"><h3><a href="stu_qiandao.jsp">ÿ��ǩ��</a></h3></li>		
			</ul>
                        <ul>                     
                                <li id="m2" class="m"><h3><a href="stu_homework.jsp?course_name=a">��ҵ</a></h3></li>		
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
                    <center><li><strong><font size="6" face="YouYuan">��ҵ</font></strong></li>
                    </center>
			<ul class="s_list">
                                <%
                                     request.setCharacterEncoding("gb2312");
      String task_id = request.getParameter("task_id").trim();
       String task_name = request.getParameter("task_name").trim();
       int taskid=Integer.parseInt(task_id);
                                %>
				<li><%=task_name%></a></li>
                                
			</ul>
		</div>
        </div>
</div>

        
      <style>      
            /*table*/
.myTable { margin: auto; height: 400px; width: 700px;  }  
.myTitle { background-color: #F2F3F5; }  
tr:hover { background:#F2F3F5; } 
th { font-size: 16px; font-weight: bold; }  
td { font-size: 14px; font-weight: bold }  
th,td { border: solid 1px #F2F3F5; text-align: center; }
     </style>   

  	 
    
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
    Connection con;
    Statement sql; 
    Statement sql2; 
    ResultSet rs;
    ResultSet rs2;
    int subjectid;
    try{  Class.forName("com.mysql.jdbc.Driver");
    }
    catch(Exception e){}
    try { String uri="jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work";
          String user="work";
          String password="swufework";
          con=DriverManager.getConnection(uri,user,password);
        
          sql2=con.createStatement();
         
          String cdn2="SELECT * FROM task";
        
          rs2=sql2.executeQuery(cdn2);
          
         
         
         
          
          
           while(rs2.next()){    
               String auto = rs2.getString("auto");
               out.print("<input type='hidden' name='auto' value="+auto+">");
             }   
          out.print("<form action='Handlehomework_11' method = 'post'>");
          out.print("<table class=myTable width=100% frame=border border=0 cellspacing=0 cellpadding=0>");
           out.print("<input type='hidden' name='taskid' value="+taskid+">");
              out.print("<input type='hidden' name='Student_no' value='"+loginBean.getStudent_No()+"'>");
           sql=con.createStatement();
            String cdn= "SELECT * FROM subject where task_id="+task_id+"";
              rs=sql.executeQuery(cdn);
         
            while(rs.next()){
               
                String Subject_type = rs.getString("Subject_type");   
          subjectid = rs.getInt("Subject_id");
          out.print("<input type='hidden'  name='Subject_type"+subjectid+"' value="+Subject_type+">");
          if(Subject_type.equals("ѡ����")){
            out.print("<tr>");
                           
              out.print("<td >"+rs.getString("Subject_name")+"</td>");
              out.print("<td >"+rs.getString("Subject_content")+"</td>");
              out.print("<td >"+"��ֵ��"+rs.getFloat("Subject_score")+"��"+"</td>");              
              out.print("</tr>") ; 
              
              out.print("<tr>"); 

            String A = "<input type ='radio' name='xuanze"+subjectid+"' value='A'>";
            String B = "<input type ='radio' name='xuanze"+subjectid+"' value='B'>";
            String C = "<input type ='radio' name='xuanze"+subjectid+"' value='C'>";
            String D = "<input type ='radio' name='xuanze"+subjectid+"' value='D'>";
            
            out.print("<td>"+A+"A."+rs.getString("A")+"</td>");
            out.print("<td>"+B+"B."+rs.getString("B")+"</td>");
            out.print("<td>"+C+"C."+rs.getString("C")+"</td>");
            out.print("<td>"+D+"D."+rs.getString("D")+"</td>");
            out.print("</tr>");
            }
            
            if(Subject_type.equals("�ʴ���")){
              out.print("<tr>");
                   
              out.print("<td >"+rs.getString("Subject_name")+"</td>");
              out.print("<td >"+rs.getString("Subject_content")+"</td>");
              out.print("<td >"+"��ֵ��"+rs.getFloat("Subject_score")+"��"+"</td>");              
              out.print("</tr>");
              
              String textarea = "<input type='textArea' name='wenda"+subjectid+"' rows='3' cols='4' >";
               out.print("<tr>");
               out.print("<td>"+"�ش�"+"</td>");
               out.print("<td>"+textarea+"<p><P><P></td>");
               out.print("</tr>") ;
            }
            
            if(Subject_type.equals("�����")){
              out.print("<tr>");
                          
              out.print("<td >"+rs.getString("Subject_name")+"</td>");
              out.print("<td >"+rs.getString("Subject_content")+"</td>");
              out.print("<td >"+"��ֵ��"+rs.getFloat("Subject_score")+"��"+"</td>");              
              out.print("</tr>");
              
              String textarea = "<input type='textArea' name='biancheng"+subjectid+"' rows='3' cols='4' >";
               out.print("<tr>");
               out.print("<td>"+"�ش�"+"</td>");
               out.print("<td>"+textarea+"<p><p><P></td>");
               out.print("</tr>") ;
            }
            
            if(Subject_type.equals("�ж���")){
                out.print("<tr>");
                   
              out.print("<td >"+rs.getString("Subject_name")+"</td>");
              out.print("<td >"+rs.getString("Subject_content")+"</td>");
              out.print("<td >"+"��ֵ��"+rs.getFloat("Subject_score")+"��"+"</td>");              
              out.print("</tr>") ; 
              
               out.print("<tr>");
            String yes = "<input type ='radio' name='radio"+subjectid+"' value='yes'>";
            String no = "<input type ='radio' name='radio"+subjectid+"' value='no'>";
            out.print("<td>"+yes+"��"+"</td>");
            out.print("<td>"+no+"��"+"</td>");
            out.print("</tr>");
            
            }
            
            if(Subject_type.equals("�����")){
                out.print("<tr>");
                 
              out.print("<td >"+rs.getString("Subject_name")+"</td>");
              out.print("<td >"+rs.getString("Subject_content")+"</td>");
              out.print("<td >"+"��ֵ��"+rs.getFloat("Subject_score")+"��"+"</td>");              
              out.print("</tr>") ; 
              
              String text = "<input type='text' name='text"+subjectid+"'>";
               out.print("<tr>");
               out.print("<td>"+"�ش�"+"</td>");
               out.print("<td>"+text+"</td>");
               out.print("</tr>") ;    
            }
           
          
          } 
            out.print("<tr>");
            String tijiao = "<input type='submit' name='tijiao' value='�ύ'>";
            out.println("<td>"+tijiao+"</td>");
            out.print("</tr>");
            
        out.print("</table>");
        out.print("</form>");
          con.close();
    }
    catch(Exception e){ 
          out.print(e);
    }
 %>   
  	
   <div align="center">
<p> ������
<jsp:getProperty name="dataBean2"  property="backNews" /> 

</div >
    
                
                
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
