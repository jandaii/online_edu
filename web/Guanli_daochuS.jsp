<%-- 
    Document   : chengji
    Created on : 2020-11-16, 19:00:32
    Author     : 123
--%>
<!DOCTYPE html>
<html class="no-js">
    <<%@page import="java.sql.*"%>
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
        <%
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null, rs1 = null,rs2=null;
            String sql;
            int count;
            String drivername = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work?user=work&password=swufework&useUnicode=true&characterEncoding=gb2312";
            try {
                Class.forName(drivername);
                conn = DriverManager.getConnection(url, "work", "swufework");
                sql = "select distinct college,major from class";
                stmt = conn.prepareStatement(sql);
                rs = stmt.executeQuery();
                
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }

        %>
        <script language="javascript">

            var onecount;
            onecount = 0;
            subcat = new Array();
            <%
                count = 0;
                while (rs.next()) {
            %>
            subcat[<%=count%>] = new Array("<%=rs.getString("college")%>", "<%=rs.getString("major")%>");
            <%
                    count = count + 1;

                }
                rs.close();
                rs = null;
            %>
            onecount =<%=count%>;
            function changelocation(xueyuan) {
                document.myform.major.length = 0;
                var college = xueyuan;
                var i;
                document.myform.major.options[0] = new Option('==��ѡ��רҵ==', '');
                
                for (i = 0; i < onecount; i++) {
                    if (subcat[i][0] === college)
                    {
                  
                        document.myform.major.options[document.myform.major.length] = new Option(subcat[i][1]);



                    }
                }


            }
        </script>
         <%
           
           
           
          
            int Count;
            
            try {
               
                sql = "select distinct * from class order by Class_id asc";
                stmt = conn.prepareStatement(sql);
                rs1 = stmt.executeQuery();
                
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }

        %>
        <script language="javascript">

            var Onecount;
            Onecount = 0;
            Subcat = new Array();
            <%
                Count = 0;
                while (rs1.next()) {
            %>
            Subcat[<%=Count%>] = new Array("<%=rs1.getString("college")%>", "<%=rs1.getString("major")%>", "<%=rs1.getString("Class_name")%>");
                   <% Count = Count + 1;

                }
                rs1.close();
                rs1 = null;
            %>
            Onecount =<%=Count%>;
       
            function changelocation2(xueyuan, major)
            {
                document.myform.class.length = 0;
                var College = xueyuan;
                var Major = major;
                var j;
                document.myform.class.options[0] = new Option('====', '');
                for (j = 0; j < Onecount; j++)
                {
                    if (Subcat[j][0] === College, Subcat[j][1] === Major)
                    {
                        document.myform.class.options[document.myform.class.length] = new Option(Subcat[j][2]);
                    }
                }

            }
        </script>
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
       
            
                  <div class="banner">
            <div class="focusBox">
                <ul class="pic">
                    <li style="background:url(images/b1.jpg) center top no-repeat;"><a href="#"></a></li>
                    <li style="background:url(images/b1.jpg) center top no-repeat;"><a href="#"></a></li>
                     <li style="background:url(images/b1.jpg) center top no-repeat;"><a href="#"></a></li>
                </ul>
                <a class="prev" href="javascript:void(0)"></a>
                <a class="next" href="javascript:void(0)"></a>
                <ul class="hd">
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>
            </div>
        </div>
         <div class="about_con">
            <div class="wrap">
 <div align="center">
                     <form action="Guanli_chengji_daochu_detalis.jsp" method="post" name="myform">
                        <table><tr><td>
                                    <h3>��ѡ��ѧ������ѧԺ��
                                        <select name="xueyuan" onChange="changelocation(document.myform.xueyuan.options[document.myform.xueyuan.selectedIndex].value)" size="1" style= "height:30px;width:180px">
                                            <option selected>==��ѡ��ѧԺ==</option>
                                            <%
                                                sql = "select distinct college from class";
                                                stmt = conn.prepareStatement(sql);
                                                rs2 = stmt.executeQuery();
                                                while (rs2.next()) {
                                            %>
                                            <option value="<%=rs2.getString("college")%>"><%=rs2.getString("college")%></option>

                                            <% }


                                                rs2.close();
                                                rs2 = null;
                                                conn.close();
                                                conn = null;


                                            %></select><p></td></tr>

                                        <tr><td><h3>��ѡ��ѧ������רҵ��
                                                    <select name="major" onChange="changelocation2(document.myform.xueyuan.options[document.myform.xueyuan.selectedIndex].value, document.myform.major.options[document.myform.major.selectedIndex].value)" size="1" style= "height:30px;width:180px"><p></td></tr>

                                                        <tr><td><h3>��ѡ��ѧ���༶��
                                                                    <select name="class" size="1" style= "height:30px;width:180px">

                                                                    </select><P></td></tr>
                                                                    <tr><td> <input type="submit" value="��ѯѧ���ɼ�" ></td></tr></table>
                                                                    </form>
                </div> <div class="clear"></div></div></div>
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

