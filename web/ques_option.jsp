
<%@page contentType="text/html;charset=GB2312"%>
<jsp:useBean id="userBean2" class="mybean.data.Addwork" scope="session"/>

<html class="no-js">
<head>
<meta charset="GB2312" />
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
<body >
  
<div class="header">
	<div class="wrap">
		<a href="#" class="logo"><img src="images/logo.png"/></a>
		<div class="nav">
			<ul>
				<li id="m1" class="m"><a href="teachermain.jsp" title="首页">首页</a></li>
				<li id="m2" class="m">
                                    <h3><a href="add_hw.jsp">布置作业</a></h3>
					
					</ul>
				</li>
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
		</div>
	</div>
</div>
  
<div class="about_con">
	<div class="wrap">
		<div class="left">
			<ul class="s_list">
				<li><a href="#" class="curr">选择题</a></li>
                                <li><a href="ques_space.jsp" >填空题</a></li>
                                <li><a href="ques_judge.jsp">判断题</a></li>
                                <li><a href="ques_ans.jsp">问答题</a></li>
                                <li><a href="ques_prog.jsp">编程题</a></li>
				
			</ul>
		</div>
         <div class='right'>
		<head>

    <title>添加题目</title>
  </head>
  <body>
      <%  
          String a=userBean2.getHw_name();
          if(request.getParameter("hw_name")!=null){
              a=request.getParameter("hw_name");
              byte bb[]=a.getBytes("iso-8859-1");
            a=new String(bb);
           userBean2.setHw_name(a);
          }else{
         try{
               
              a=(String)request.getAttribute( "hw_name");
             
            byte bb[]=a.getBytes("iso-8859-1");
            a=new String(bb);
             userBean2.setHw_name(a);
          }
      catch(Exception exp){
               a=userBean2.getHw_name();
   
      }}
      %>
  	<form action="AddworkServlet" method="post">
  	<input type="hidden" name="quesType" value="选择题">
        <input type="hidden" name="hw_name" value="<%=a%>">
        <style>
            
            /*table*/
.myTable { margin: auto; height: 400px; width: 700px;  }  
.myTitle { background-color: #F2F3F5; }  
tr:hover { background:#F2F3F5; } 
th { font-size: 16px; font-weight: bold; }  
td { font-size: 14px; font-weight: bold }  
th,td { border: solid 1px #F2F3F5; text-align: center; }
        </style>
      
  	<table class="myTable" width="100%" frame="border" border="0" cellspacing="0" cellpadding="0">
            <tr>
  			<td> </td>
  			<td>
                            <input type="reset" value="清空全部" style="cursor:hand; width:84px; height:28px; background-color:#717984; font-weight:bold; color:white; pading:0px; border:0px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
  				<input type="submit" name="submit" value="保存题目" style="cursor:hand; width:84px; height:28px; background-color:#717984; font-weight:bold; color:white; pading:0px; border:0px">
  			</td>
  		</tr>
  		<tr>
  			<td class="myTitle">题目名称</td>
  			<td><input type="text" name="quesname" ></td>
  		</tr>
  		<tr>
  			<td class="myTitle">题目分值</td>
  			<td><input type="number" name="quesscore" ></td>
  		</tr>
  		<tr>
  			<td class="myTitle">题目内容</td>
  			<td><textarea rows="4" cols="70" name="quescontent"></textarea></td>
  		</tr>
  		<tr>
  			<td class="myTitle">题目答案</td>
  			<td><textarea rows="4" cols="70" name="quesanswer"></textarea></td>
  		</tr>
  		<tr>
                    <td class="myTitle">选项1</td>
  			<td><input type="text" name="other1" ></td>
  		</tr>
  		<tr>
  			<td class="myTitle">选项2</td>
  			<td><input type="text" name="other2" ></td>
  		</tr>
  		<tr>
  			<td class="myTitle">选项3</td>
  			<td><input type="text" name="other3" ></td>
  		</tr>
  		<tr>
  			<td class="myTitle">选项4</td>
  			<td><input type="text" name="other4" ></td>
  		</tr>
  		
  	</table>
  	</form>
                
                     <div align="center">
<p> 反馈：
<jsp:getProperty name="userBean2"  property="backNews" /> 



</div >
  </body></div>
		<div class="clear"></div>
	</div>
              
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

