<%@page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*" %>
<%@ page import="mybean.data.DataByPage_hw" %>
<%@ page import="com.sun.rowset.*" %>
<jsp:useBean id="hwBean" class="mybean.data.NewHwname" scope="session"/>
<html class="no-js">
<head>
<meta charset="UTF-8" />
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

    <title>��ҵ����</title>
  </head>
  <body>
  
      <style>
            
            /*table*/
.myTable { margin: auto; height: 200px; width: 100%;  }  
.myTitle { background-color: #F2F3F5; }  
tr:hover { background:#F2F3F5; } 
th { font-size: 16px; font-weight: bold; }  
td { font-size: 14px; font-weight: bold }  
th,td { border: solid 1px #F2F3F5; text-align: center; }
        </style>
    
        <%
         
            
            String hw_name="";
            if(request.getParameter("xijie")==null){
            //hw_name =(String)request.getAttribute("hw_name");
            hw_name=hwBean.getHw_name();
            byte bb[]=hw_name.getBytes("iso-8859-1");
            hw_name=new String(bb);
            }
            else{
            
           hw_name = request.getParameter("xijie"); 
            byte bb[]=hw_name.getBytes("iso-8859-1");
            hw_name=new String(bb);
            }
          
             
   //out.print("<th>��Ʒ���"+numberID);
   //if(numberID==null) {
    //   out.print("û�в�Ʒ��ţ��޷��鿴ϸ��");
    //   return;
   //} 
   Connection con;
   Statement sql; 
   ResultSet rs;
   try {  Class.forName("com.mysql.jdbc.Driver");
   }
   catch(Exception e){} 
  String uri="jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work";
      try{ 
           con=DriverManager.getConnection(uri,"work","swufework");
     sql=con.createStatement();
     String cdn="SELECT * FROM subject where Task_name = '"+hw_name+"'";
     rs=sql.executeQuery(cdn);
     
     out.print(hw_name);
     out.print("<table  class='myTable' id='testTbl' width='100% 'frame='border' border='0' cellspacing='0' cellpadding='0 '>");
     out.print("<font color = '#4682B4'>");
     out.print("<tr>");
     out.print("<th color = '#4682B4'>��Ŀ����");
     out.print("<th color = '#4682B4'>��Ŀ����");
     out.print("<th color = '#4682B4'>��Ŀ����");
     out.print("<th color = '#4682B4'>��Ŀ����");
     out.print("<th color = '#4682B4'>��Ŀ��");
    // out.print("<th><font color=blue>���빺�ﳵ</font>");
     out.print("</TR>");
     //String picture="bg.jpg";
     String detailMess="";
     while(rs.next()){
       String subject_name=rs.getString(3);
       String subject_content=rs.getString(4);
       String subject_type =rs.getString(5);
       String subject_score=rs.getString(6);
       String subject_answer=rs.getString(7);
       //detailMess=rs.getString(4);
       //picture=rs.getString(5); 
      String all=subject_name+","+hw_name;
       String goods =
       "("+subject_name+","+subject_content+","+subject_type+","+subject_score+","+subject_answer+")";//���ڹ��ﳵ����۸�,β׺��"#�۸�ֵ"
        goods = goods.replaceAll("\\p{Blank}","");
      
          String del="<form  action='Delques' method = 'post'>"+
                     "<input type ='hidden' name='delete2' value= "+all+">"+
                     "<input type ='submit'  value='ɾ����ҵ' ></form>";
        out.print("<tr>");
        out.print("<td>"+subject_name+"</td>");
        out.print("<td>"+subject_content+"</td>");
        out.print("<td>"+subject_type+"</td>");
        out.print("<td>"+subject_score+"</td>");
        out.print("<td>"+subject_answer+"</td>");
         out.print("<th>"+del+"</th>");
        out.print("</tr>");
     } 
     out.print("</table>");
    // out.print("��Ʒ����:<br>");
    // out.println("<div align=center>"+detailMess+"<div>");
     //String pic ="<img src='image/"+picture+"' width=260 height=200 ></img>";
     //out.print(pic); //��ƬͼƬ
     con.close();
  }
  catch(SQLException exp){}
%>
 <div align="center">
<p> ������
<jsp:getProperty name="hwBean"  property="hw_name" /> 

</div >
  </body></div>
		<div class="clear"></div>
                 <div class="left">
           <ul class="ss_listadd">
				<form  action='ques_option.jsp' method = 'post'>
                     <input type ='hidden' name='hw_name' value= "<%=hw_name%>">
                     <input type ='submit'  value='�����Ŀ' ></form>
                                
				
			</ul>
		</div>
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