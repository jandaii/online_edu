<%@ page language="java" contentType="text/html" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="loginBean2" class="mybean.data.L_Teacherlogin" scope="session"/>
<jsp:useBean id="courBean" class="mybean.data.Course" scope="request"/>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="gb2312" />
<title>作业提交系统（教师端）</title>
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
				<li id="m1" class="m"><a href="teachermain.jsp" title="首页">首页</a></li>
				<li id="m2" class="m">
                                   <h3><a href="add_hw.jsp">布置作业</a></h3>
					
					
				<li id="m3" class="m">
					<h3><a href="hw_manage.jsp">作业管理</a></h3>
					
				</li>
				
				<li id="m4" class="m">
					<h3><a href="hw_analyse.jsp">作业情况分析</a></h3>
					
				</li>
				 
				<li id="m5" class="m">
					<h3><a href="tea_name.jsp">个人信息</a></h3>
					<ul class="sub" >
					 
					  <li><a href="L_TExit">退出账号</a>
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
                                <li><a href="tea_name.jsp" title="基本信息">基本信息</a>
                                <li><a href="tea_course.jsp" class="curr">我的课程</a>
                                <li><a href="tea_password.jsp">密码管理</a>
                                    <li><a href="L_TExit">退出账号</a>
			</ul>
		</div>
            <div class="right">
               <h3 class="a_tit">我的课程</h3>
                <div align="center">
<% 
   if(loginBean2==null){
        response.sendRedirect("L_Tlogin.jsp");//重定向到登录页面
    }
    else {
       boolean b =loginBean2.getTeacher_No()==null||
                  loginBean2.getTeacher_No().length()==0;

       if(b)
         response.sendRedirect("L_Tlogin.jsp");//重定向到登录页面
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
           String cdn = "SELECT Course_id,Course_name,Course_time FROM course where Course_id IN"
                   + "(SELECT Course_id FROM teacher_course where Teacher_No IN "
                   + "(SELECT Teacher_No FROM teacher where Teacher_No="+loginBean2.getTeacher_No()+"))"; //查询语句

          rs=sql.executeQuery(cdn);
          out.print("<table border=2>");
          out.print("<tr>");
            out.print("<th>"+"课程编号");
            out.print("<th>"+"课程名称");
            out.print("<th>"+"课程时间");
            out.print("<th width=100>"+"");
          out.print("</tr>");
          while(rs.next()){
              String Course_id=rs.getString(1);
              String Course_name=rs.getString(2);
              String Course_time=rs.getString(3);
              String button="<form  action='T_courseHServlet' method = 'post'>"+
                     "<input type ='hidden' name='Coursename' value=' "+Course_name+"'>"+
                  "<input type ='submit'  value='点击进入课程'></form>";
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
注：<jsp:getProperty name ="courBean" property="backNews"/>   
                </div>
		</div>
            
	</div>
   <div class="clear"></div>
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
<!-- The Scripts -->
<script type="text/javascript">
jQuery(".focusBox").hover(function(){ jQuery(this).find(".prev,.next").stop(true,true).fadeTo("show",0.2) },function(){ jQuery(this).find(".prev,.next").fadeOut() });
jQuery(".focusBox").slide({ mainCell:".pic",effect:"fold", autoPlay:true, delayTime:600, trigger:"click"});//banner图
jQuery(".nav").slide({ type:"menu",  titCell:".m", targetCell:".sub", effect:"slideDown", delayTime:300, triggerTime:100,returnDefault:true  });//导航
</script>
</body>
</html>

