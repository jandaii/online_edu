<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="mybean.data.answer" %>
<%@ page import="java.sql.*" %>
<%@ page import ="java.util.*" %>
<jsp:useBean id="loginBean" class="mybean.data.L_Studentlogin" scope="session"/>
<jsp:useBean id="courBean" class="mybean.data.Course" scope="request"/>
<%@ page import="java.sql.*" %>
<html class="no-js">
<head>
<meta charset="UTF-8" />
<title>作业答案解析</title>
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
</div><div class="about_con">
	<div class="wrap">
         <% if(loginBean==null){
        response.sendRedirect("L_Slogin.jsp");//重定向到登录页面
    }
    else {
       boolean b =loginBean.getStudent_No()==null||
                  loginBean.getStudent_No().length()==0;

       if(b)
         response.sendRedirect("L_Slogin.jsp");//重定向到登录页面
    }
         request.setCharacterEncoding("gb2312");
      String task_id = request.getParameter("task_id").trim();
      int Task_id=Integer.parseInt(task_id);
      
    Connection con;
    Statement sql; 
    ResultSet rs1;
%> 

        
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
  
    
   
    try{  Class.forName("com.mysql.jdbc.Driver");
    }
    catch(Exception e){}
    try { String uri="jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work";
          String user="work";
          String password="swufework";
          con=DriverManager.getConnection(uri,user,password);
          sql=con.createStatement();
          String cdn=
         "SELECT * FROM subject,task where subject.Task_id="+Task_id+" and subject.task_id=task.task_id";
          rs1=sql.executeQuery(cdn);
          String timu;
         
          out.print("<table class=myTable width=100% frame=border border=0 cellspacing=0 cellpadding=0>");
          
             
           out.print("<tr>");
            out.print("<td>"+"作业"+"</td>");
            out.print("<td>"+"题号"+"</td>");
            out.print("<td>"+"题目"+"</td>");
            out.print("<td>"+"参考答案"+"</td>");
           out.print("</tr>");
            
           while(rs1.next()){
            out.print("<tr>");            
              out.print("<td >"+rs1.getString("task_name")+"</td>");
              out.print("<td >"+rs1.getString("subject_name")+"</td>");
               if(rs1.getString("subject_type").equals("选择题")){
          timu=rs1.getString("subject_content")+"<P>"+"A"+rs1.getString("A")+"<P>"+"B"+rs1.getString("B")+"<P>"+"C"+rs1.getString("C")+"<P>"+"D"+rs1.getString("D");
          }
          else{
          timu=rs1.getString("subject_content");
    }
              
              out.print("<td >"+timu+"</td>");   
              out.print("<td >"+rs1.getString("answer")+"</td>");   
            out.print("</tr>") ; 
          }   
         
        out.print("</table>");
          con.close();
    }
    catch(Exception e){ 
          out.print(e);
    }
 %>   
  	</form>  
       
        </div></div>  
                
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
