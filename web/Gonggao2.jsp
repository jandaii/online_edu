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
        <title>�ϻ���ҵ����ϵͳ</title>
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
                        <li><a href="Servlet_gonggao?a=2">֪ͨ����</a></li>
                        <li><a href="Servlet_gonggao2?a=2" class="curr">ѧУ����</a></li>
                        <li><a href="Servlet_gonggao3?a=2">ѧ������</a></li>
                        <li><a href="Servlet_gonggao4?a=2">ǰ�ض�̬</a></li>
                    </ul>
                </div>
                <div class="right">
			<h1 class="a_tit">��ѧУ���š�</h1>
                        <p style="line-height:2.6em;font-size:16px;">
                             <table align=center><tr><td>
                        <jsp:getProperty name="dataBean2"  property="backNews" /> 
                         <jsp:setProperty name="dataBean2" property="pageSize" param="pageSize"/>
<jsp:setProperty name="dataBean2" property="currentPage" param="currentPage"/>
<%    
      CachedRowSetImpl rowSet=dataBean2.getRowSet();
      if(rowSet==null) {
         out.print("û���κβ�ѯ��Ϣ���޷����");
         return;  
      }
      rowSet.last(); 
      int totalRecord=rowSet.getRow();
      //out.println("ȫ����¼��"+totalRecord); //ȫ����¼��
      int pageSize=dataBean2.getPageSize();  //ÿҳ��ʾ�ļ�¼��
      int totalPages = dataBean2.getTotalPages();
      if(totalRecord%pageSize==0)
           totalPages = totalRecord/pageSize;//��ҳ��
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
         rowSet.absolute(index);  //��ѯλ���ƶ���currentPageҳ��ʼλ��
         boolean boo=true;
         for(int i=1;i<=pageSize&&boo;i++) {     
              int id=rowSet.getInt(1);
            String title=rowSet.getString(3);
            String content=rowSet.getString(4);
            session.setAttribute("content",content); 
          String detail="<form  action='Gonggao_details.jsp' method = 'post'>"+
                      "<input type ='hidden' name='id' value= "+id+">"+
                     
                     "<input type ='hidden' name='title' value= "+title+">"+
                     "<input type ='hidden' name='type' value='ѧУ����'>"+
                     "<input type ='submit'  value="+title+" ></form>";
            out.print(detail);
            boo=rowSet.next();
         }
     }
%></td></tr>
                                 <tr><td>
 <BR>ÿҳ�����ʾ<jsp:getProperty name="dataBean2" property="pageSize"/>����Ϣ
 <BR>��ǰ��ʾ��<Font color=blue>
     <jsp:getProperty name="dataBean2" property="currentPage"/>
   </Font>ҳ,����
   <Font color=blue><jsp:getProperty name="dataBean2" property="totalPages"/>
   </Font>ҳ��
                                     </td></tr>
  <tr><td><FORM action="" method=post>
          <Input type=hidden name="currentPage" value=
         "<%=dataBean2.getCurrentPage()-1 %>">
           <Input type=submit name="g" value="��һҳ"></FORM></td>
      <td><FORM action="" method=post>
          <Input type=hidden name="currentPage"
           value="<%=dataBean2.getCurrentPage()+1 %>">
          <Input type=submit name="g" value="��һҳ"></FORM></td></tr>
 <tr><td> <FORM action="" method=post>
          ÿҳ��ʾ<Input type=text name="pageSize" value =1 size=3>
          ����¼<Input type=submit name="g" value="ȷ��"></FORM></td>
      <td> <FORM action="" method=post>
           ����ҳ�룺<Input type=text name="currentPage" size=2 >
           <Input type=submit name="g" value="�ύ"></FORM></td></tr>
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
				���ϲƾ���ѧ��Ʒ԰���绰��xxx-xxxxxxxx��E-mail:<a href="shixun@swufe.cn">shixun@swufe.cn</a><br/> 
				copyright ? 2020 ���ϲƾ���ѧ ��Ȩ���� ��ϵ�绰��xxx-xxxxxxxx
			</div>
			<div class="fr">��Ȩ�´ǣ�<a href="#">SWUFE����</a></div>
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
            jQuery(".focusBox").slide({mainCell: ".pic", effect: "fold", autoPlay: true, delayTime: 600, trigger: "click"});//bannerͼ
            jQuery(".nav").slide({type: "menu", titCell: ".m", targetCell: ".sub", effect: "slideDown", delayTime: 300, triggerTime: 100, returnDefault: true});//����
        </script>
    </body>
</html>

