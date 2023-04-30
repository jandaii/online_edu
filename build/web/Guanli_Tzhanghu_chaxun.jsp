<%-- 
    Document   : zhanghao
    Created on : 2020-11-16, 19:00:47
    Author     : 123
--%>
<%@page import="java.util.*"%>
<%@page import="mybean.data.Bean_teacher"%>
<%@page import="java.sql.*"%>
<%@page import="myservlet.control.Servlet_teacher_chaxun"%>
<html class="no-js">
    <head>
        <jsp:useBean id="Bean_teacher" class="mybean.data.Bean_teacher" scope="request"/>
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
        <div class="header">
            <div class="wrap">
                <a href="#" class="logo"><img src="images/logo.png"/></a>
                <div class="nav">
                    <ul>
                        <li id="m1" class="m"><a href="Guanli_index.jsp" title="��ҳ">��ҳ</a></li>
                        <li id="m2" class="m">
                            <h3><a href="Guanli_zhanghao.jsp">�����˻�</a></h3>
                            <ul class="sub">
                                <li class="xx"></li>
                                <li><a href="Guanli_zhanghao.jsp">ѧ���˻�����</a></li>
                                <li class="xx">/</li>
                                <li><a href="Guanli_jiaoshiguanli.jsp">��ʦ�˻�����</a></li>
                                <li class="xx"></li>
                            </ul>
                        </li>
                        <li id="m3" class="m">
                            <h3><a href="Guanli_banji.jsp">����༶</a></h3>
                            <ul class="sub">
                                <li class="xx"></li>
                                <li><a href="Guanli_banji.jsp">�����༶</a></li>
                                <li class="xx">/</li>
                                <li><a href="Guanli_banjiguanli.jsp">��ѯ�༶</a></li>
                                <li class="xx">/</li>
                                <li><a href="Guanli_banjiguanli.jsp">�޸İ༶</a></li>
                                <li class="xx">/</li>
                                <li><a href="Guanli_banjiguanli.jsp">ɾ���༶</a></li>
                                <li class="xx"></li>
                            </ul>
                        </li>
                        <li id="m4" class="m"><h3><a href="Guanli_xinxi.jsp">������</a></h3>
                            <ul class="sub" >
                                <li class="xx"></li>
                                <li><a href="Guanli_xinxi.jsp">��������</a></li>
                                <li class="xx">/</li>
                                <li><a href="Servlet_gonggao">�޸Ĺ���</a></li>
                                <li class="xx">/</li>
                                <li><a href="Servlet_gonggao">ɾ������</a></li>
                                <li class="xx">/</li>
                                <li><a href="Servlet_gonggao">�鿴����</a></li>
                                <li class="xx"></li>
                            </ul></li>

                        <li id="5" class="m">
                            <h3><a href="Guanli_chengji.jsp">����ɼ�</a></h3>
                            <ul class="sub">
                                <li class="xx"></li>
                                <li><a href="Guanli_chengji.jsp">�ɼ�����</a></li>
                                <li class="xx">/</li>
                                <li><a href="Guanli_daochuS.jsp">�ɼ�����</a></li>
                                <li class="xx"></li>
                            </ul>

                        </li>
                        <li id="m6" class="m">
                            <h3><a href="Guanli_administrator.jsp">����Ա��Ϣ</a></h3>

                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="about_con">
            <div class="wrap">
                <div class="center">
                    <table border="1">
                        <tr>
                            <td>��ʦ����</td>
                            <td>ѧԺ</td>
                            <td>ְ��</td>
                            <td>�̹���</td>
                            <td>ɾ���˻�</td>
                            <td>�޸��˻�</td>
                        </tr>
                        <%
                            request.setCharacterEncoding("gb2312");
                            String teacher_college = request.getParameter("xueyuan").trim();
                            String teacher_title = request.getParameter("leixin").trim();
                            Servlet_teacher_chaxun cha = new Servlet_teacher_chaxun();
                            List<Bean_teacher> list = cha.chaxun(teacher_college, teacher_title);
                          
                            for (Bean_teacher tl : list) {
                                String detail = "<tr><td>" + tl.getTeacher_name() + "</td>"
                                        + "<td>" + tl.getCollege() + "</td>"
                                        + "<td>" + tl.getTitle() + "</td>"
                                        + "<td>" + tl.getTeacher_No() + "</td>"
                                        + "<td>" + "<form  action='Servlet_teacher_delete' method = 'post'>"
                                        + "<input type ='hidden' name='id' value= " + tl.getTeacher_No() + ">"
                                        + "<input type ='submit'  value='ɾ���˺�' >" + "</form></td>"
                                        + "<td>" + "<form  action='Guanli_Tzhanghu_change.jsp' method = 'post'>"
                                        + "<input type ='hidden' name='name' value= " + tl.getTeacher_name() + ">"
                                        + "<input type ='hidden' name='college' value= " + tl.getCollege() + ">"
                                        + "<input type ='hidden' name='Teacher_No' value= " + tl.getTeacher_No() + ">"
                                        + "<input type ='submit'  value='�޸��˺�' >" + "</form></td></tr>";

                                out.print(detail);
                            }%>
                   
                </Div></div></div><P>
        <form action="Guanli_Tzhanghu_add.jsp" method="post" name="addbanji">
            <tr><td><input type ='submit'  value='����˺�' ></td></tr> </table>
        </form>
        <div class="clear"></div></div>
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
