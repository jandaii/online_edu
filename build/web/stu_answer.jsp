<%@ page import="mybean.data.homeworktime" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=GB2312" %>
<html class="no-js">
<head>
    <%@ page import="java.sql.*" %>
    <jsp:useBean id="loginBean" class="mybean.data.L_Studentlogin" scope="session"/>
<jsp:useBean id="courBean" class="mybean.data.Course" scope="session"/>
<meta charset="UTF-8" />
<title>我是你亲爱的作业啊</title>
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
				<li id="m1" class="m"><a href="student.jsp" title="首页">首页</a></li>
                        </ul>
                        <ul>                     
                                <li id="m2" class="m"><h3><a href="stu_qiandao.jsp">每日签到</a></h3></li>		
			</ul>
                        <ul>                     
                                <li id="m2" class="m"><h3><a href="stu_homework.jsp?course_name=a">作业</a></h3></li>		
			</ul>
	                <ul>               
                                <li id="m3" class="m"><h3><a href="stu_answer.jsp?course_name=a">答案解析</a></h3>
		        </ul>		
		        <ul>		
				<li id="m5" class="m"><h3><a href="stu_name.jsp">个人中心</a></h3>
                                    <ul class="sub" >
					  <li class="xx">/</li>
					  <li><a href="L_Slogin.jsp">退出账号</a>
                                          <li class="xx"></li>
					</ul>
			</ul>
		</div>
    </div>
</div>
  
<div class="about_con">
	<div class="wrap">
		<div class="left">
                    <center><li><strong><font size="6" face="YouYuan">科目</font></strong></li>
                    </center>
                    <% if(loginBean==null){
        response.sendRedirect("L_Slogin.jsp");//重定向到登录页面
    }
    else {
       boolean b =loginBean.getStudent_No()==null||
                  loginBean.getStudent_No().length()==0;

       if(b)
         response.sendRedirect("L_Slogin.jsp");//重定向到登录页面
    }
                   
  
 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
 java.util.Date currentTime = new java.util.Date();//得到当前系统时间 
 String str_date1 = formatter.format(currentTime);
   
    Connection con=null;
    Statement ql; 
    ResultSet rs;
    request.setCharacterEncoding("gb2312");
      String course_name = request.getParameter("course_name").trim();
     
      
    try{  Class.forName("com.mysql.jdbc.Driver");
    }
    catch(Exception e){}
    try {       
        String uri="jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work?"
            + "user=work&password=swufework&characterEncoding=gb2312" ;

          con=DriverManager.getConnection(uri);
          ql=con.createStatement();
           String cdn = "SELECT Course_id,Course_name,Course_time FROM Course where Course_id IN"
                   + "(SELECT Course_id FROM student_course where Student_No IN "
                   + "(SELECT Student_No FROM student where Student_No="+loginBean.getStudent_No()+"))"; //查询语句

          rs=ql.executeQuery(cdn);
        %><ul class="s_list">
                    <%
          while(rs.next()){
           
              String Course_name=rs.getString(2);
              %><li><a href="stu_answer.jsp?course_name=<%=Course_name%>"><%=Course_name%></a></li>
              <%
             
          }
       
      out.print("</table>");
          
    }
    catch(SQLException e){ 
          out.print(e);
    }
%> 
           	
		</div>
        </div>
</div>

 <form action="${pageContext.request.contextPath }/AddQuestionServlet" method="post">
  	<input type="hidden" name="formId" value="${formId }">
        
      <style>      
            /*table*/
.myTable { margin: auto; height: 400px; width: 700px;  }  
.myTitle { background-color: #F2F3F5; }  
tr:hover { background:#F2F3F5; } 
th { font-size: 16px; font-weight: bold; }  
td { font-size: 14px; font-weight: bold }  
th,td { border: solid 1px #F2F3F5; text-align: center; }
     </style>   
        
  	  
        
        
        <table class="myTable">
            <center><li><strong><font size="6" face="YouYuan">您的作业</font></strong></li>
                    </center>
            <%
    if(!course_name.equals("a")){
      
      
    ResultSet rs1;
     PreparedStatement psmt;
 
    try {       
         String Sql = "select * from task,course where course_name='"+course_name+"' and task.Course_id=course.Course_id";
            psmt = con.prepareStatement(Sql);
            rs1 = psmt.executeQuery();
            if(!rs1.next()){
        %><ul class="s_list">  
              <tr><td>这是已截至作业</td></tr>
               <tr><td></td></tr>
           <%}
          while(rs1.next()){
           int task_id=rs1.getInt("Task_id");
              String task_name=rs1.getString("Task_name");
              Timestamp Task_start = rs1.getTimestamp("Task_start");
              Timestamp Task_end = rs1.getTimestamp("Task_end"); 
           SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String dateStart = sdf.format(Task_start);
             String dateEnd = sdf.format(Task_end);
            
       if(dateEnd.compareTo(str_date1)<0){
              %>
            <tr>
                <td><li><a href="stu_answer_details.jsp?task_id=<%=task_id%>&task_name=<%=task_name%>"><%=task_name%></a></li></td></tr>
              <%
       }
       else{
             
       }
          }
      out.print("</table>");
          con.close();
    }
    catch(SQLException e){ 
          out.print(e);
    }}
else{%>
           
              <tr><td>请选择课程</td></tr>
               <tr><td></td></tr>
            <%
}
%> 
            
  	</table>
     
  	</form>  
        
        
                
                
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
jQuery(".focusBox").hover(function(){ jQuery(this).find(".prev,.next").stop(true,true).fadeTo("show",0.2) },function(){ jQuery(this).find(".prev,.next").fadeOut() });
jQuery(".focusBox").slide({ mainCell:".pic",effect:"fold", autoPlay:true, delayTime:600, trigger:"click"});//banner图
jQuery(".nav").slide({ type:"menu",  titCell:".m", targetCell:".sub", effect:"slideDown", delayTime:300, triggerTime:100,returnDefault:true  });//导航
</script>
</body>


</html>
