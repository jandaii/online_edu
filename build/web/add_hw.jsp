
<%@page contentType="text/html;charset=GB2312"%>
<jsp:useBean id="userBean" class="mybean.data.AddHw" scope="request"/>
<html class="no-js" mlns="http://www.w3.org/1999/xhtml">
<head>
  <jsp:useBean id="loginBean2" class="mybean.data.L_Teacherlogin" scope="session"/>
    <%@ page import="java.sql.*" %>
<meta charset="GB2312" />
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
<body >

<div class="header">
	<div class="wrap">
		<a href="#" class="logo"><img src="images/logo.png"/></a>
		<div class="nav">
			<ul>
				<li id="m1" class="m"><a href="teachermain.jsp" title="��ҳ">��ҳ</a></li>
				<li id="m2" class="m">
                                    <h3><a href="add_hw.jsp">������ҵ</a></h3>
					
					</ul>
				</li>
				<li id="m3" class="m">
					<h3><a href="Query_hwServlet">��ҵ����</a></h3>
					
				</li>
				
				<li id="m4" class="m">
					<h3><a href="AnalyseServlet">��ҵ�������</a></h3>
					
				</li>
				 
					
			
				<li id="m5" class="m">
					<h3><a href="tea_name.jsp">������Ϣ</a></h3>
					<ul class="sub" >
					
					  <li><a href="L_TExit">�˳��˺�</a>
                                          <li class="xx"></li>
			</ul>
		</div>
	</div>
</div>
  
<div class="about_con">
	<div class="wrap">
		<div class="left">
			<ul class="s_list">
				<li><a href="#" class="curr">��ҵ����</a></li>
                                
				
			</ul>
		</div>
         <div class='right'>
		<head>

    <title>�����Ŀ</title>
  </head>
  <body>
     <style>
            
            /*table*/
.myTable { margin: auto; height: 200px; width: auto;  }  
.myTitle { background-color: #F2F3F5; }  
tr:hover { background:#F2F3F5; } 
th { font-size: 16px; font-weight: bold; }  
td { font-size: 14px; font-weight: bold }  
th,td { border: solid 1px #F2F3F5; text-align: center; }
        </style> 
  	<form action="AddHwServlet" method="post">
<table class="myTable" width="100%" frame="border" border="0" cellspacing="0" cellpadding="0">
    <tr><td class="myTitle" width="90" align="right">
                        <h3>��ѡ��γ̣�
                            <select name="kecheng" size="1" style= "height:30px;width:180px">
                                <%if(loginBean2==null){
        response.sendRedirect("L_Tlogin.jsp");//�ض��򵽵�¼ҳ��
    }
    else {
       boolean b =loginBean2.getTeacher_No()==null||
                  loginBean2.getTeacher_No().length()==0;

       if(b)
         response.sendRedirect("L_Tlogin.jsp");//�ض��򵽵�¼ҳ��
    }try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                    } catch (Exception e) {
                                    }
                                    String uri = "jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work?user=work&password=swufework&useUnicode=true&characterEncoding=gb2312";
                                    String user = "work";
                                    String password = "swufework";
                                    Connection con = DriverManager.getConnection(uri,user,password);
                                    Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                                            ResultSet.CONCUR_READ_ONLY);
                                    String a=loginBean2.getTeacher_No();
                                    int A=Integer.parseInt(a);
                                    ResultSet rs = sql.executeQuery("SELECT distinct * FROM course,teacher_course where teacher_No="+A+" and teacher_course.Course_id=course.Course_id");

                                %><%
                                    while (rs.next()) {
                                        String detail = "<option value='" + rs.getString("course_id") + "'>"
                                                + rs.getString("course_name") + "</option>\n";
                                        out.print(detail);
                                %>

                        
                                <%}
                                    con.close();
                                %>
                            </select></td></tr>
                                  <input type="hidden" name="Teacher_no" value=<%=A%>>

 <tr>
  <td class="myTitle" width="90" align="right">��ҵ���ƣ�</td>
  <td width="320"><input type="text" name="hw_name"></td>  
 </tr>
 <tr>
  <td class="myTitle" align="right">��ʼʱ�䣺</td>
  <td> <input type="datetime-local" id="startDate" name="begin_date"/></td>
 </tr>
 
 <tr>
  <td class="myTitle" align="right">����ʱ�䣺</td>
  <td> <input type="datetime-local" id="startDate" name="finish_date"/></td>
 </tr>
 
 <tr>
  <td class="myTitle" align="right">�Ƿ��Զ������ʴ��⣺</td>
  <td><select name="select">
     <option value="��">��</option>
      <option value="��">��</option>
     
  </select></td>
 </tr>
 <tr>
     <td colspan="2" align="center"> <input type="submit"name="submit"value="�����Ŀ" style=" cursor:hand; width:84px; height:28px; background-color:#717984; font-weight:bold; color:white; pading:0px; border:0px">
   &nbsp; <input type="submit"name="submit2"value="ȡ��" style="cursor:hand; width:84px; height:28px;  background-color:#717984; font-weight:bold; color:white; pading:0px; border:0px"></td>
 </tr>
</table>
</form>
         <div align="center">
<p> ������
<jsp:getProperty name="userBean"  property="backNews" /> 

</div >
  </body></div>
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
<!-- The Scripts -->
<script type="text/javascript">
jQuery(".focusBox").hover(function(){ jQuery(this).find(".prev,.next").stop(true,true).fadeTo("show",0.2) },function(){ jQuery(this).find(".prev,.next").fadeOut() });
jQuery(".focusBox").slide({ mainCell:".pic",effect:"fold", autoPlay:true, delayTime:600, trigger:"click"});//bannerͼ
jQuery(".nav").slide({ type:"menu",  titCell:".m", targetCell:".sub", effect:"slideDown", delayTime:300, triggerTime:100,returnDefault:true  });//����
</script>
</body>
</html>

