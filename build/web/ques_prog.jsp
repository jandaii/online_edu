
<%@page contentType="text/html;charset=GB2312"%>
<jsp:useBean id="userBean6" class="mybean.data.Addwork_prog" scope="session"/>
<jsp:useBean id="userBean2" class="mybean.data.Addwork" scope="session"/>
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
				<li><a href="ques_option.jsp" >ѡ����</a></li>
                                <li><a href="ques_space.jsp" >�����</a></li>
                                <li><a href="ques_judge.jsp" >�ж���</a></li>
                                <li><a href="ques_ans.jsp">�ʴ���</a></li>
                                <li><a href="#" class="curr">�����</a></li>
				
			</ul>
		</div>
         <div class='right'>
		<head>

    <title>�����Ŀ</title>
  </head>
  <body>
      <%  
          String a=userBean2.getHw_name();
         try{
               
              a=(String)request.getAttribute( "hw_name");
             
            byte bb[]=a.getBytes("iso-8859-1");
            a=new String(bb);
             userBean2.setHw_name(a);
          }
      catch(Exception exp){
               a=userBean2.getHw_name();
   
      }
      %>
      <style>
            
            /*table*/
.myTable { margin: auto; height: 200px; width: 100%;  }  
.myTitle { background-color: #F2F3F5; }  
tr:hover { background:#F2F3F5; } 
th { font-size: 16px; font-weight: bold; }  
td { font-size: 14px; font-weight: bold }  
th,td { border: solid 1px #F2F3F5; text-align: center; }
        </style>
  	<form action="Addwork_progServlet" method="post">
  	<input type="hidden" name="quesType" value="�����">
          <input type="hidden" name="hw_name" value="<%=a%>">
  	<table class="myTable" id="testTbl" width="100%" frame="border" border="0" cellspacing="0" cellpadding="0">
            <tr>
  			<td> </td>
  			<td>
  				<input type="reset" value="���ȫ��" style="cursor:hand; width:84px; height:28px; background-color:#717984; font-weight:bold; color:white; pading:0px; border:0px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
  				<input type="submit" name="submit" value="������Ŀ" style="cursor:hand; width:84px; height:28px; background-color:#717984; font-weight:bold; color:white; pading:0px; border:0px">
  			</td>
  		</tr>
  		<tr>
  			<td class="myTitle">��Ŀ����</td>
  			<td><input type="text" name="quesname" ></td>
  		</tr>
  		<tr>
  			<td class="myTitle">��Ŀ��ֵ</td>
  			<td><input type="number" name="quesscore" ></td>
  		</tr>
  		<tr>
  			<td class="myTitle">��Ŀ����</td>
  			<td><textarea rows="4" cols="70" name="quescontent"></textarea></td>
  		</tr>
  		<tr>
  			<td class="myTitle">��Ҫ��</td>
  			<td><textarea rows="4" cols="70" name="quesanswer"></textarea></td>
  		</tr>
  		
  		
  		
  			
  		
  	</table>
  	</form>
                <div align="center">
<p> ������
<jsp:getProperty name="userBean6"  property="backNews" /> 

</div >
  </body></div>
		<div class="clear"></div>
	</div>
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

