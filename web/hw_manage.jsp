

<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="mybean.data.DataByPage_hw" %>
<%@ page import="com.sun.rowset.*" %>
<jsp:useBean id="dataBean" class="mybean.data.DataByPage_hw" scope="session"/>
<html class="no-js">
<head>
<meta charset="UTF-8" />
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
				
                                <li><a href="#" class="curr">查看作业</a></li>
                              
				
			</ul>
		</div>
         <div class='right'>
		<head>

    <title>查看作业</title>
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

/*ss_list*/
.ss_listadd{padding:0;border-top:1px solid #e7e7e7;}
.ss_listadd li{float:left; width:260px; height:39px;}
.ss_listadd li a{line-height:38px;color: #333; display:block; font-size: 14px; text-align:center; 
border-left:1px solid #e7e7e7;border-right:1px solid #e7e7e7;border-bottom:1px solid #e7e7e7;}
.ss_listadd_list li a.curr, .ss_listadd_list li a:hover {color: #FF6A5C;font-weight:bold;border-left:1px solid #fff;border-right:1px solid #FF6A5C;border-bottom:1px solid #FF6A5C;background:#FF6A5C}

.ss_ban{ width:100%;height:466px; overflow:hidden;}
        </style>
  	<table  class="myTable" id="testTbl" width="100%" frame="border" border="0" cellspacing="0" cellpadding="0" ><font color = "#4682B4">
  <tr>
      <td class="myTitle"><font color = "#9370D8">作业名称</font></td>
    <td class="myTitle"><font color = "#9370D8">开始日期</font></td>
    <td class="myTitle"><font color = "#9370D8">截止日期</font></td>
    <td class="myTitle"><font color = "#9370D8">是否自动批改</font></td>
    <td class="myTitle"><font color = "#9370D8">操作</font></td>
    <%-- <td><font color="#9370D8">添加到购物车</font></td>--%>
  </tr>
<jsp:setProperty name="dataBean" property="pageSize" param="pageSize"/>
<jsp:setProperty name="dataBean" property="currentPage" param="currentPage"/>
<%    
      CachedRowSetImpl rowSet=dataBean.getRowSet();
      if(rowSet==null) {
         out.print("没有任何查询信息，无法浏览");
         return;  
      }
      rowSet.last(); 
      int totalRecord=rowSet.getRow();
      out.println("全部记录数"+totalRecord); //全部记录数
      int pageSize=dataBean.getPageSize();  //每页显示的记录数
      int totalPages = dataBean.getTotalPages();
      if(totalRecord%pageSize==0)
           totalPages = totalRecord/pageSize;//总页数
      else
           totalPages = totalRecord/pageSize+1;
      dataBean.setPageSize(pageSize);
      dataBean.setTotalPages(totalPages);
      if(totalPages>=1) {
         if(dataBean.getCurrentPage()<1)
              dataBean.setCurrentPage(dataBean.getTotalPages());
         if(dataBean.getCurrentPage()>dataBean.getTotalPages())
              dataBean.setCurrentPage(1);
         int index=(dataBean.getCurrentPage()-1)*pageSize+1;
         rowSet.absolute(index);  //查询位置移动到currentPage页起始位置
         boolean boo=true;
         for(int i=1;i<=pageSize&&boo;i++) { 
            String hw_name=rowSet.getString(3);
            String start=rowSet.getString(4);
            String end=rowSet.getString(5);
            String auto=rowSet.getString(9);
            String hw = "("+hw_name+","+start+","+end+","+auto+")";//便于购物车计算价格,尾缀上"#价格值"
           hw = hw.replaceAll("\\p{Blank}","");
            //String button="<form  action='DataByPage_Servlet' method = 'post'>"+
                    // "<input type ='hidden' name='java' value= "+goods+">"+
                   //  "<input type ='submit'  value='放入购物车' ></form>";
            String detail="<form  action='hw_detail.jsp' method = 'post'>"+
                     "<input type ='hidden' name='xijie' value= "+hw_name+">"+
                     "<input type ='submit'  value='查看题目' ></form>";
            String del="<form  action='DelHWServlet' method = 'post'>"+
                     "<input type ='hidden' name='delete' value= "+hw_name+">"+
                     "<input type ='submit'  value='删除作业' ></form>";
            out.print("<tr>");
            out.print("<th>"+hw_name+"</th>");
            out.print("<th>"+start+"</th>");
            out.print("<th>"+end+"</th>");
            out.print("<th>"+auto+"</th>");
            out.print("<th>"+detail+""+del+"</th>");
           // out.print("<td>"+button+"</td>");
            out.print("</tr>");
            boo=rowSet.next();
         }
     }
%></table>
<BR>每页最多显示<jsp:getProperty name="dataBean" property="pageSize"/>条信息
 <BR>当前显示第<Font color=blue>
     <jsp:getProperty name="dataBean" property="currentPage"/>
   </Font>页,共有
   <Font color=blue><jsp:getProperty name="dataBean" property="totalPages"/>
   </Font>页。
<Table>
  <tr><td><FORM action="" method=post>
          <Input type=hidden name="currentPage" value=
         "<%=dataBean.getCurrentPage()-1 %>">
           <Input type=submit name="g" value="上一页"></FORM></td>
      <td><FORM action="" method=post>
          <Input type=hidden name="currentPage"
           value="<%=dataBean.getCurrentPage()+1 %>">
          <Input type=submit name="g" value="下一页"></FORM></td></tr>
 <tr><td> <FORM action="" method=post>
          每页显示<Input type=text name="pageSize" value =1 size=3>
          条记录<Input type=submit name="g" value="确定"></FORM></td>
      <td> <FORM action="" method=post>
           输入页码：<Input type=text name="currentPage" size=2 >
           <Input type=submit name="g" value="提交"></FORM></td></tr>
</Table>
          
  </body></div>
		<div class="clear"></div>
                <div class="left">
           <ul class="ss_listadd">
				<li><a href="add_hw.jsp" >添加作业</a></li>
                                
				
			</ul>
		</div>
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

