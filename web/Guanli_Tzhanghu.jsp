<%-- 
    Document   : zhanghao
    Created on : 2020-11-16, 19:00:47
    Author     : 123
--%>
<%@page import="java.sql.*"%>
<html class="no-js">
    <head>
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
        <div class="s_ban" style="background:url(images/gltd.jpg) center top no-repeat"></div>
        <div class="about_con">
            <div class="wrap">
                <div class="left">
                    <ul class="s_list">
                        <li><a href="Guanli_zhanghao.jsp">ѧ���˻�����</a></li>
                        <li><a href="Guanli_jiaoshiguanli.jsp" class="curr">��ʦ�˻�����</a></li>
                    </ul>
                </div>
                <div align="center">
                    <form action="Guanli_Tzhanghu_chaxun.jsp" method="post" name="addbanji">
                        <table><tr><td>
                        <h3>��ѡ���ʦ����ѧԺ��
                            <select name="xueyuan" size="1" style= "height:30px;width:180px">
                                <% try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                    } catch (Exception e) {
                                    }
                                    String uri = "jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work?user=work&password=swufework&useUnicode=true&characterEncoding=gb2312";
                                    String user = "work";
                                    String password = "swufework";
                                    Connection con = DriverManager.getConnection(uri,user,password);
                                    Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                                            ResultSet.CONCUR_READ_ONLY);
                                    ResultSet rs = sql.executeQuery("SELECT distinct college FROM teacher");

                                %><%
                                    while (rs.next()) {
                                        String detail = "<option value='" + rs.getString("college") + "'>"
                                                + rs.getString("college") + "</option>\n";
                                        out.print(detail);
                                %>


                                <%}
                                    con.close();
                                %>
                            </select><p></td></tr>
                            <tr><td><h3>��ѡ���ʦְ�ƣ�
                                <select name="leixin" size="1" style= "height:30px;width:180px">
                                    <OPTION value="����">����    </OPTION>
                                    <OPTION value="������">������    </OPTION>
                                    <OPTION value="��ʦ">��ʦ    </OPTION>
                                </SELECT><p></td></tr>


                                <tr><td><input type="submit" value="��ѯ��ʦ�˻�" ></td></tr></table>
                                    </form>
                             <jsp:getProperty name="Bean_teacher"  property="backNews" /> 
                            </div> <div class="clear"></div></div>
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
