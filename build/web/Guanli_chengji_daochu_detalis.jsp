<%-- 
    Document   : zhanghao
    Created on : 2020-11-16, 19:00:47
    Author     : 123
--%>
<%@page import="java.util.*"%>
<%@page import="mybean.data.Bean_chengji"%>
<%@page import="java.sql.*"%>
<%@page import="myservlet.control.Servlet_chengji_daochu"%>
<html class="no-js">
    <head><script type="text/javascript" src="jquery-1.10.2.min.js"></script>
        <jsp:useBean id="Bean_teacher" class="mybean.data.Bean_teacher" scope="application"/>
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
                            <h3><a href="Guanli_banji.jsp">�����༶</a></h3>
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
                        <li id="m4" class="m"><h3><a href="Guanli_xinxi.jsp">��������</a></h3>
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
                            <h3><a href="Guanli_chengji.jsp">�����ɼ�</a></h3>
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
                    <center>
                        <table border="1">
                            <tr>
                                <td>ѧ������</td>
                                <td>ѧ��ѧ��</td>
                                <td>ѧԺ</td>
                                <td>רҵ</td>
                                <td>�༶</td>                         
                                <td>��Ŀ</td> 
                                <td>�ܷ�</td>

                            </tr>
                            <%
                                request.setCharacterEncoding("gb2312");
                                String student_college = request.getParameter("xueyuan").trim();
                                String student_major = request.getParameter("major").trim();
                                String student_banji = request.getParameter("class").trim();
                                Servlet_chengji_daochu cha = new Servlet_chengji_daochu();
                                List<Bean_chengji> list = cha.chaxun(student_college, student_major, student_banji);
                                session.setAttribute("list", list);
                                for (Bean_chengji tl : list) {
                                    String detail = "<tr><td>" + tl.getStudent_name() + "</td>"
                                            + "<td>" + tl.getStudent_no() + "</td>"
                                            + "<td>" + tl.getCollege() + "</td>"
                                            + "<td>" + tl.getMajor() + "</td>"
                                            + "<td>" + tl.getClass_name() + "</td>"
                                            + "<td>" + tl.getCourse_name() + "</td>" 
                                            + "<td>" + tl.getAll_score()+ "</td></tr>";

                                    out.print(detail);
                                }%>
                        </table>
                </Div></div></div><P>
        <form action="toexcel" method="post" name="addbanji">
                <input type="hidden" name="name" value="<%=student_college + student_major + student_banji%>"/>
                <input type="submit" value="�����ɼ�"/>
        </form>
        <div class="clear"></div>
    </center>
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