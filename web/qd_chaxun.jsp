<%@page import="java.util.*"%>
<%@page import="mybean.data.qd_bean_stu" %>
<%@page import="myservlet.control." %>
<%@page import="java.sql.*"%>

<html class="no-js">
    <head>
        
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
                                <li><a href="Guanli_chengji.jsp">�ɼ�����</a></li>
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
        <div class="s_ban" style="background:url(images/gltd.jpg) center top no-repeat"></div>
        <div class="about_con">
            <div class="wrap">
                <div class="left">
                    <ul class="s_list">
                        <li><a href="Guanli_banji.jsp" >�����༶</a></li>
                        <li><a href="Guanli_banjiguanli.jsp" class="curr">��ѯ�༶</a></li>
                        <li><a href="Guanli_banjiguanli.jsp" class="curr">�޸İ༶</a></li>
                        <li><a href="Guanli_banjiguanli.jsp" class="curr">ɾ���༶</a></li>
                    </ul>
                </div>
             
                <div class="right">
                    <table border="1">
                        <tr>
                           
                            <td>ѧԺ</td>
                            <td>רҵ</td>
                            <td>�༶</td>
                            <td>ɾ���༶</td>
                            <td>�޸İ༶</td>
                        </tr>
                        <%
                            request.setCharacterEncoding("gb2312");
                            Servlet_banji_chaxun cha = new Servlet_banji_chaxun();
                            List<Bean_banji> list = cha.chaxun();
                          
                            for (Bean_banji tl : list) {
                                String detail = "<tr><td>" + tl.getCollege()+ "</td>"
                                        + "<td>" + tl.getMajor()+ "</td>"
                                        + "<td>" + tl.getClass_name()+ "</td>"
                                       
                                        + "<td>" + "<form  action='Servlet_banji_delete' method = 'post'>"
                                        + "<input type ='hidden' name='id' value= " + tl.getClass_id()+ ">"
                                        + "<input type ='submit'  value='ɾ���༶' >" + "</form></td>"
                                        + "<td>" + "<form  action='Guanli_banji_change.jsp' method = 'post'>"
                                        + "<input type ='hidden' name='major' value= " + tl.getMajor()+ ">"
                                        + "<input type ='hidden' name='college' value= " + tl.getCollege() + ">"
                                        + "<input type ='hidden' name='Class_name' value= " + tl.getClass_name()+ ">"
                                         + "<input type ='hidden' name='id' value= " + tl.getClass_id()+ ">"
                                        + "<input type ='submit'  value='�޸İ༶' >" + "</form></td></tr>";

                                out.print(detail);
                            }%>
                   
                </div><P>
       </table><P>
      
        </form></div>
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
