<%-- 
    Document   : xinxi
    Created on : 2020-11-16, 19:01:50
    Author     : 123
--%>
<!DOCTYPE html>
<html class="no-js">
    <head>
        
        <%@ page contentType="text/html;charset=GB2312" %>
        <title>�ϻ���ҵ����ϵͳ</title>
        <jsp:useBean id="Bean_teacher" class="mybean.data.Bean_teacher" scope="request"/>
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

        <div class="s_ban" style="background:url(images/gltd.jpg) center top repeat"></div>
        <div class="wrap">
            <div align="center" >
                <h1>�޸Ľ�ʦ�˻���Ϣ</h1>
           
                <form action="Servlet_teacher_change" method="post" name="xnxi">

                    <%request.setCharacterEncoding("gb2312");
                        String name = request.getParameter("name").trim();
                        String Teacher_No = request.getParameter("Teacher_No").trim();
                        String college = request.getParameter("college").trim();
                    %>
                    <table><tr><td><h3>���޸Ľ�ʦ���ƣ�
                                    <input type="text" name="t_name" value=<%=name%> id="file_input" /> <p></td></tr>
                                    <tr><td><h3>���޸Ľ�ʦ����ѧԺ��
                                                <input type="text" name="xueyuan" value=<%=college%> id="file_inut" /> <p></td></tr>
                                                <tr><td><h3>���޸Ľ�ʦְ�ƣ�
                                                            <select name="leixin" size="1" style= "height:30px;width:180px">
                                                                <OPTION value="����">����    </OPTION>
                                                                <OPTION value="������">������    </OPTION>
                                                                <OPTION value="��ʦ">��ʦ    </OPTION>
                                                            </SELECT><p></td></tr>
                                                            <tr><td><h3>���޸Ľ�ʦ�̹��ţ�
                                                                           <input type="hidden" name="T_no" value=<%=Teacher_No%> id="file_iut" />
                                                                        <input type="text" name="t_no" value=<%=Teacher_No%> id="file_iut" /> <p></td></tr>

                                                                        <tr><td><input type="submit" value="�޸Ľ�ʦ�˻�" >
                                                                            </td></tr></table> </form><jsp:getProperty name="Bean_teacher"  property="backNews" /> </div>


                                                                        </div></DIV></div>
                                                                        <p> 

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