<%-- 
    Document   : gonggao
    Created on : 2020-11-17, 10:24:59
    Author     : 123
--%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<html class="no-js">
    <head>
        <jsp:useBean id="dataBean2" class="mybean.data.Bean_xinxibypage2" scope="session"/>
        <%@ page contentType="text/html;charset=GB2312" %>
        <title>上机作业管理系统</title>
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
       
        <div class="about_con">
            <div class="wrap">
                <div class="left">
                    <ul class="s_list">
                        <li><a href="Servlet_gonggao?a=2">通知公告</a></li>
                        <li><a href="Servlet_gonggao2?a=2" class="curr">学校新闻</a></li>
                        <li><a href="Servlet_gonggao3?a=2">学术讲座</a></li>
                        <li><a href="Servlet_gonggao4?a=2">前沿动态</a></li>
                    </ul>
                </div>
                <div class="right">
			<h1 class="a_tit">【学校新闻】</h1>
                        <p style="line-height:2.6em;font-size:16px;">
                             <table align=center><tr><td>
                        <jsp:getProperty name="dataBean2"  property="backNews" /> 
                         <jsp:setProperty name="dataBean2" property="pageSize" param="pageSize"/>
<jsp:setProperty name="dataBean2" property="currentPage" param="currentPage"/>
<%    
      CachedRowSetImpl rowSet=dataBean2.getRowSet();
      if(rowSet==null) {
         out.print("没有任何查询信息，无法浏览");
         return;  
      }
      rowSet.last(); 
      int totalRecord=rowSet.getRow();
      //out.println("全部记录数"+totalRecord); //全部记录数
      int pageSize=dataBean2.getPageSize();  //每页显示的记录数
      int totalPages = dataBean2.getTotalPages();
      if(totalRecord%pageSize==0)
           totalPages = totalRecord/pageSize;//总页数
      else
           totalPages = totalRecord/pageSize+1;
      dataBean2.setPageSize(pageSize);
      dataBean2.setTotalPages(totalPages);
      if(totalPages>=1) {
         if(dataBean2.getCurrentPage()<1)
              dataBean2.setCurrentPage(dataBean2.getTotalPages());
         if(dataBean2.getCurrentPage()>dataBean2.getTotalPages())
              dataBean2.setCurrentPage(1);
         int index=(dataBean2.getCurrentPage()-1)*pageSize+1;
         rowSet.absolute(index);  //查询位置移动到currentPage页起始位置
         boolean boo=true;
         for(int i=1;i<=pageSize&&boo;i++) {     
              int id=rowSet.getInt(1);
            String title=rowSet.getString(3);
            String content=rowSet.getString(4);
            session.setAttribute("content",content); 
          String detail="<form  action='Gonggao_details.jsp' method = 'post'>"+
                      "<input type ='hidden' name='id' value= "+id+">"+
                     
                     "<input type ='hidden' name='title' value= "+title+">"+
                     "<input type ='hidden' name='type' value='学校新闻'>"+
                     "<input type ='submit'  value="+title+" ></form>";
            out.print(detail);
            boo=rowSet.next();
         }
     }
%></td></tr>
                                 <tr><td>
 <BR>每页最多显示<jsp:getProperty name="dataBean2" property="pageSize"/>条信息
 <BR>当前显示第<Font color=blue>
     <jsp:getProperty name="dataBean2" property="currentPage"/>
   </Font>页,共有
   <Font color=blue><jsp:getProperty name="dataBean2" property="totalPages"/>
   </Font>页。
                                     </td></tr>
  <tr><td><FORM action="" method=post>
          <Input type=hidden name="currentPage" value=
         "<%=dataBean2.getCurrentPage()-1 %>">
           <Input type=submit name="g" value="上一页"></FORM></td>
      <td><FORM action="" method=post>
          <Input type=hidden name="currentPage"
           value="<%=dataBean2.getCurrentPage()+1 %>">
          <Input type=submit name="g" value="下一页"></FORM></td></tr>
 <tr><td> <FORM action="" method=post>
          每页显示<Input type=text name="pageSize" value =1 size=3>
          条记录<Input type=submit name="g" value="确定"></FORM></td>
      <td> <FORM action="" method=post>
           输入页码：<Input type=text name="currentPage" size=2 >
           <Input type=submit name="g" value="提交"></FORM></td></tr>
</Table>
</Center>
		</div>
               
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
            jQuery(".focusBox").hover(function() {
                jQuery(this).find(".prev,.next").stop(true, true).fadeTo("show", 0.2)
            }, function() {
                jQuery(this).find(".prev,.next").fadeOut()
            });
            jQuery(".focusBox").slide({mainCell: ".pic", effect: "fold", autoPlay: true, delayTime: 600, trigger: "click"});//banner图
            jQuery(".nav").slide({type: "menu", titCell: ".m", targetCell: ".sub", effect: "slideDown", delayTime: 300, triggerTime: 100, returnDefault: true});//导航
        </script>
    </body>
</html>

