<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=GB2312" %>
<%@page import="org.jfree.chart.ChartUtilities"%>
<%@page import="org.jfree.chart.ChartFactory"%>
<%@page import="org.jfree.chart.JFreeChart"%>
<%@page import="org.jfree.chart.labels.StandardPieSectionLabelGenerator"%>
<%@page import="org.jfree.chart.plot.PiePlot"%>
<%@page import="org.jfree.chart.title.TextTitle"%>
<%@page import="org.jfree.data.general.DefaultPieDataset"%>
<%@page import="org.jfree.chart.ChartRenderingInfo"%>
<%@page import="org.jfree.chart.entity.StandardEntityCollection"%>
<%@page import="org.jfree.chart.servlet.ServletUtilities"%>
<%@page import="java.awt.Color"%>
<%@page import="java.awt.Font"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.io.FileOutputStream"%>

<!doctype html>
<html>

<head>
    <meta charset="gb2312">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Amaze UI Admin index Examples</title>
    <meta name="description" content="����һ�� index ҳ��">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="assets/css/admin.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <script src="assets/js/echarts.min.js"></script>
</head>

<body data-type="chart">


    <header class="am-topbar am-topbar-inverse admin-header">
        <div class="am-topbar-brand">
            <a href="javascript:;" class="tpl-logo">
                <img src="assets/img/logo.png" alt="">
            </a>
        </div>
        <div class="am-icon-list tpl-header-nav-hover-ico am-fl am-margin-right">

        </div>

        <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">�����л�</span> <span class="am-icon-bars"></span></button>

        <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

            <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list tpl-header-list">
                <li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
                    <a class="am-dropdown-toggle tpl-header-list-link" href="javascript:;">
                        <span class="am-icon-bell-o"></span> ���� <span class="am-badge tpl-badge-success am-round">5</span></span>
                    </a>
                    <ul class="am-dropdown-content tpl-dropdown-content">
                        <li class="tpl-dropdown-content-external">
                            <h3>���� <span class="tpl-color-success">5</span> ������</h3><a href="###">ȫ��</a></li>
                        <li class="tpl-dropdown-list-bdbc"><a href="#" class="tpl-dropdown-list-fl"><span class="am-icon-btn am-icon-plus tpl-dropdown-ico-btn-size tpl-badge-success"></span> ��Ԥ��ģ�顿�ƶ��� �鿴ʱ �ֻ������Կ����ء�</a>
                            <span class="tpl-dropdown-list-fr">3Сʱǰ</span>
                        </li>
                        <li class="tpl-dropdown-list-bdbc"><a href="#" class="tpl-dropdown-list-fl"><span class="am-icon-btn am-icon-check tpl-dropdown-ico-btn-size tpl-badge-danger"></span> �ƶ��ˣ��������±߾ദ��</a>
                            <span class="tpl-dropdown-list-fr">15����ǰ</span>
                        </li>
                        <li class="tpl-dropdown-list-bdbc"><a href="#" class="tpl-dropdown-list-fl"><span class="am-icon-btn am-icon-bell-o tpl-dropdown-ico-btn-size tpl-badge-warning"></span> ׷��ͳ�ƴ���</a>
                            <span class="tpl-dropdown-list-fr">2��ǰ</span>
                        </li>
                    </ul>
                </li>
                <li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
                    <a class="am-dropdown-toggle tpl-header-list-link" href="javascript:;">
                        <span class="am-icon-comment-o"></span> ��Ϣ <span class="am-badge tpl-badge-danger am-round">9</span></span>
                    </a>
                    <ul class="am-dropdown-content tpl-dropdown-content">
                        <li class="tpl-dropdown-content-external">
                            <h3>���� <span class="tpl-color-danger">9</span> ������Ϣ</h3><a href="###">ȫ��</a></li>
                        <li>
                            <a href="#" class="tpl-dropdown-content-message">
                                <span class="tpl-dropdown-content-photo">
                      <img src="assets/img/user02.png" alt=""> </span>
                                <span class="tpl-dropdown-content-subject">
                      <span class="tpl-dropdown-content-from"> ����С�� </span>
                                <span class="tpl-dropdown-content-time">10����ǰ </span>
                                </span>
                                <span class="tpl-dropdown-content-font"> Amaze UI �ĵ����������� GitHub ����������������һЩ�������Դ��Amaze UI �ĳɳ������벻���û���֧�֡� </span>
                            </a>
                            <a href="#" class="tpl-dropdown-content-message">
                                <span class="tpl-dropdown-content-photo">
                      <img src="assets/img/user03.png" alt=""> </span>
                                <span class="tpl-dropdown-content-subject">
                      <span class="tpl-dropdown-content-from"> Steam </span>
                                <span class="tpl-dropdown-content-time">18����ǰ</span>
                                </span>
                                <span class="tpl-dropdown-content-font"> Ϊ������׼ȷ�Ĵ��������������⣬ �������ڷ���ʱ������ʾ������������⡣ </span>
                            </a>
                        </li>

                    </ul>
                </li>
                <li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
                    <a class="am-dropdown-toggle tpl-header-list-link" href="javascript:;">
                        <span class="am-icon-calendar"></span> ���� <span class="am-badge tpl-badge-primary am-round">4</span></span>
                    </a>
                    <ul class="am-dropdown-content tpl-dropdown-content">
                        <li class="tpl-dropdown-content-external">
                            <h3>���� <span class="tpl-color-primary">4</span> ���������</h3><a href="###">ȫ��</a></li>
                        <li>
                            <a href="javascript:;" class="tpl-dropdown-content-progress">
                                <span class="task">
                        <span class="desc">Amaze UI �û����� v1.2 </span>
                                <span class="percent">45%</span>
                                </span>
                                <span class="progress">
                        <div class="am-progress tpl-progress am-progress-striped"><div class="am-progress-bar am-progress-bar-success" style="width:45%"></div></div>
                    </span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:;" class="tpl-dropdown-content-progress">
                                <span class="task">
                        <span class="desc">��������ҳ </span>
                                <span class="percent">30%</span>
                                </span>
                                <span class="progress">
                       <div class="am-progress tpl-progress am-progress-striped"><div class="am-progress-bar am-progress-bar-secondary" style="width:30%"></div></div>
                    </span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:;" class="tpl-dropdown-content-progress">
                                <span class="task">
                        <span class="desc">�������� </span>
                                <span class="percent">60%</span>
                                </span>
                                <span class="progress">
                        <div class="am-progress tpl-progress am-progress-striped"><div class="am-progress-bar am-progress-bar-warning" style="width:60%"></div></div>
                    </span>
                            </a>
                        </li>

                    </ul>
                </li>
                <li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen" class="tpl-header-list-link"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">����ȫ��</span></a></li>

                <li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
                    <a class="am-dropdown-toggle tpl-header-list-link" href="javascript:;">
                        <span class="tpl-header-list-user-nick">����С��</span><span class="tpl-header-list-user-ico"> <img src="assets/img/user01.png"></span>
                    </a>
                    <ul class="am-dropdown-content">
                        <li><a href="#"><span class="am-icon-bell-o"></span> ����</a></li>
                        <li><a href="#"><span class="am-icon-cog"></span> ����</a></li>
                        <li><a href="#"><span class="am-icon-power-off"></span> �˳�</a></li>
                    </ul>
                </li>
                <li><a href="###" class="tpl-header-list-link"><span class="am-icon-sign-out tpl-header-list-ico-out-size"></span></a></li>
            </ul>
        </div>
    </header>







    <div class="tpl-page-container tpl-page-header-fixed">

        <div class="tpl-left-nav tpl-left-nav-hover">
            <div class="tpl-left-nav-title">
                ��֪��дɶ
            </div>
            <div class="tpl-left-nav-list">
                <ul class="tpl-left-nav-menu">
                    <li class="tpl-left-nav-item">
                        <a href="index.html" class="nav-link">
                            <i class="am-icon-home"></i>
                            <span>��ҳ</span>
                        </a>
                    </li>
                    <li class="tpl-left-nav-item">
                        <a href="chart.html" class="nav-link tpl-left-nav-link-list active">
                            <i class="am-icon-bar-chart"></i>
                            <span>���ݱ�</span>
                            <i class="tpl-left-nav-content tpl-badge-danger">
               12
             </i>
                        </a>
                    </li>

                    <li class="tpl-left-nav-item">
                        <a href="javascript:;" class="nav-link tpl-left-nav-link-list">
                            <i class="am-icon-table"></i>
                            <span>���</span>
                            <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                        </a>
                        <ul class="tpl-left-nav-sub-menu">
                            <li>
                                <a href="table-font-list.html">
                                    <i class="am-icon-angle-right"></i>
                                    <span>���ֱ��</span>
                                    <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                                </a>

                                <a href="table-images-list.html">
                                    <i class="am-icon-angle-right"></i>
                                    <span>ͼƬ���</span>
                                    <i class="tpl-left-nav-content tpl-badge-success">
               18
             </i>

                                    <a href="form-news.html">
                                        <i class="am-icon-angle-right"></i>
                                        <span>��Ϣ�б�</span>
                                        <i class="tpl-left-nav-content tpl-badge-primary">
               5
             </i>


                                        <a href="form-news-list.html">
                                            <i class="am-icon-angle-right"></i>
                                            <span>�����б�</span>

                                        </a>
                            </li>
                        </ul>
                    </li>

                    <li class="tpl-left-nav-item">
                        <a href="javascript:;" class="nav-link tpl-left-nav-link-list">
                            <i class="am-icon-wpforms"></i>
                            <span>��</span>
                            <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                        </a>
                        <ul class="tpl-left-nav-sub-menu">
                            <li>
                                <a href="form-amazeui.html">
                                    <i class="am-icon-angle-right"></i>
                                    <span>Amaze UI ��</span>
                                    <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                                </a>

                                <a href="form-line.html">
                                    <i class="am-icon-angle-right"></i>
                                    <span>������</span>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li class="tpl-left-nav-item">
                        <a href="login.html" class="nav-link tpl-left-nav-link-list">
                            <i class="am-icon-key"></i>
                            <span>��¼</span>

                        </a>
                    </li>
                </ul>
            </div>
        </div>





        <div class="tpl-content-wrapper">
            <div class="tpl-content-page-title">
                ��ҵ����������
            </div>
            

            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-code"></span> ��������ռ��
                    </div>
             

                </div>
                <div class="tpl-block">
                  
                    <%
  String task_name="";
  /********��������**********/
 int youxiu=1;
 int lianghao=2;
 int zhongdeng=1;
 int jige=0;
 int bujige=0;
  Float p1=0f;
  Float p2=0f;
  Float p3=0f;
  Float p4=0f;
  Float Sum=0f;
  int T_id=0;
   try {  Class.forName("com.mysql.jdbc.Driver");
      }
      catch(Exception e){} 
   
  Connection con=null; 
 String uri="jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work";
  
 try{
           con=DriverManager.getConnection(uri,"work","swufework");
           Statement sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                                                ResultSet.CONCUR_READ_ONLY);
           
          
           
           
              

     //��get()�������ص���Object����

       Sum=100f;
       //T_id=(int)t_id.get(0);
       p1=90f;
        p2=80f;
       p3=70f;
       p4=60f;
       int C_id=1;
     //����ط���course_id���޸�   
         ResultSet rs3=sql.executeQuery("SELECT COUNT(Student_No) From "
                   + "allscore where Course_id='"+C_id+"'AND all_score>='"+p1+"'");
        
         while (rs3.next()){
          youxiu=rs3.getInt(1);
        } 
         ResultSet rs4=sql.executeQuery("SELECT COUNT(Student_No) From "
                   + "allscore where Course_id='"+C_id+"'AND all_score>='"+p2+"'AND all_score<'"+p1+"'");
         while (rs4.next()){
         lianghao=rs4.getInt(1);
        } 
         ResultSet rs5=sql.executeQuery("SELECT COUNT(Student_No) From "
                   + "allscore where  Course_id='"+C_id+"' AND all_score>='"+p3+"'AND all_score<'"+p2+"'");
         while (rs5.next()){
         zhongdeng=rs5.getInt(1);
        } 
         ResultSet rs6=sql.executeQuery("SELECT COUNT(Student_No) From "
                   + " allscore where  Course_id='"+C_id+"' AND all_score>='"+p4+"'AND all_score<'"+p3+"'");
         while (rs6.next()){
         jige=rs6.getInt(1);
        } 
          ResultSet rs7=sql.executeQuery("SELECT COUNT(Student_No) From "
                   + "allscore where  Course_id='"+C_id+"' AND  all_score<'"+p4+"'");
         while (rs7.next()){
          bujige=rs7.getInt(1);
        } 

        
}   catch(SQLException exp){
out.print(exp);
}
 DecimalFormat df=new DecimalFormat("0.00");
  p1=Float.parseFloat(df.format(p1));
  p2=Float.parseFloat(df.format(p2));
  p3=Float.parseFloat(df.format(p3));
  p4=Float.parseFloat(df.format(p4));
  int[] value = { youxiu,lianghao,zhongdeng,jige,bujige};
  String[] keys = { "����(������"+p1+")", "����("+p2+"�ܷ�����"+p1+")", "�е�("+p3+"�ܷ�����"+p2+")","����("+p4+"�ܷ�����"+p3+")","������(������"+p4+")" };
  //String chartTitle = "�ȼ��ֲ�ͼ";
  int width = 470;
  int height = 350;
  /*****************/


  DefaultPieDataset dataset = new DefaultPieDataset();
  for (int i = 0; i < value.length; i++) {
    dataset.setValue(keys[i], value[i]);
  }


  JFreeChart chart =ChartFactory.createPieChart3D("",dataset,false,false,false);

  

  chart.setTextAntiAlias(false);
  PiePlot piePlot=(PiePlot)chart.getPlot();
  piePlot.setBackgroundPaint(null);//����ɫ


  PiePlot plot = (PiePlot) chart.getPlot();
  // ͼƬ����ʾ�ٷֱ�:Ĭ�Ϸ�ʽ
   
  
  
            plot.setSectionPaint("����(������"+p1+")", Color.decode("#C1FFC1"));  
            plot.setSectionPaint("����("+p2+"�ܷ�����"+p1+")", Color.decode("#BCD2EE"));  
            plot.setSectionPaint("�е�("+p3+"�ܷ�����"+p2+")", Color.decode("#FAFAD2"));  
            plot.setSectionPaint("����("+p4+"�ܷ�����"+p3+")", Color.decode("#FFC1C1")); 
            plot.setSectionPaint("������(������"+p4+")", Color.decode("#DEDEDE")); 
           
  // ָ����ͼ�����ߵ���ɫ
  plot.setBaseSectionOutlinePaint(Color.white);
  plot.setBaseSectionPaint(Color.white);
  plot.setBackgroundPaint(Color.white);
  plot.setLabelBackgroundPaint(Color.white);
  // ����������ʱ����Ϣ
  plot.setNoDataMessage("��ҵδ����");



  // ͼƬ����ʾ�ٷֱ�:�Զ��巽ʽ��{0} ��ʾѡ� {1} ��ʾ��ֵ�� {2} ��ʾ��ռ���� ,С�������λ
  plot.setLabelGenerator(new StandardPieSectionLabelGenerator("{0} {1}  ({2})", NumberFormat
     .getNumberInstance(), new DecimalFormat("0.00%")));
  // ͼ����ʾ�ٷֱ�:�Զ��巽ʽ�� {0} ��ʾѡ� {1} ��ʾ��ֵ�� {2} ��ʾ��ռ����
  plot.setLegendLabelGenerator(new StandardPieSectionLabelGenerator("{0}={1}({2})"));


  //ͼƬ˵����ʾ��ʽ
  plot.setLabelFont(new Font("����", Font.TRUETYPE_FONT,12));
  plot.setLabelPaint(Color.decode("#7AC5CD"));
  plot.setLabelLinkPaint(Color.decode("#7AC5CD"));
  plot.setLabelOutlinePaint(Color.white);
  plot.setLabelShadowPaint(Color.white);
  plot.setShadowPaint(Color.white);
 // plot.setLabelFont(new Font("����", 0, 14));   


  // ָ��ͼƬ��͸����(0.0-1.0)
  plot.setForegroundAlpha(0.5f);
  // ָ����ʾ�ı�ͼ��Բ��(true)����Բ��(false)
  plot.setCircular(true, false);
  plot.setIgnoreNullValues(false);


  // ���õ�һ�� ����section �Ŀ�ʼλ�ã�Ĭ����12���ӷ���
  plot.setStartAngle(45);




  ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());


  String filename = ServletUtilities.saveChartAsPNG(chart, width, height, info, session);


  String graphURL = request.getContextPath() + "/servlet/DisplayChart?filename=" + filename;




%>
 <img src="<%=graphURL%>" width="800" height="400">
 
<input type ='hidden' name='hw_name' value="<%= task_name%>">
<input type ='hidden' name='sum' value="<%= Sum%>">
<input type ='hidden' name='p' value="<%= p1%>">                   
<input type ='hidden' name='youxiu' value="<%= T_id%>">                       



                    </div>
                          <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-code"></span> �������ҵѧ��
                    </div>
                    <div class="tpl-portlet-input tpl-fz-ml">
                        <div class="portlet-input input-small input-inline">
                          
                        </div>
                    </div>


                </div>
                <div class="tpl-block">
                    <div class="am-g">
                        <div class="am-u-sm-12 am-u-md-6">
                            <div class="am-btn-toolbar">
                                
                            </div>
                        </div>
                       
            
                    </div>
                    <div class="am-g">
                        <div class="am-u-sm-12">
                              <form class="am-form">
                             <%
  

   Statement sql; 
   ResultSet rs;
   try {  Class.forName("com.mysql.jdbc.Driver");
   }
   catch(Exception e){} 
  
      try{ 
           con=DriverManager.getConnection(uri,"work","swufework");
     sql=con.createStatement();
     String cdn="SELECT * FROM onescore where Task_id in (select Task_id from task where Task_name='"+task_name+"')";
     rs=sql.executeQuery(cdn);
     
   
     out.print(" <table class='am-table am-table-striped am-table-hover table-main'>");
     out.print("<thead>");
     out.print("<tr>");
     out.print("<th class='table-author am-hide-sm-only'>ѧ��</th>");
     out.print("<th class='table-title'>��ҵ����</th>");
     out.print("<th class='table-type'>�Ƿ�����������</th>");
     out.print(" <th class='table-author am-hide-sm-only'>����</th>");
 
  
     out.print("</tr>");
     out.print("</thead>");%>
     
     <tbody>
                                        <tr>
                                           
                                            <td></td>
                                            <td></td>
                                            <td class="am-hide-sm-only"></td>
                                            <td class="am-hide-sm-only"></td>
                                            <td>
                                             
                                                        
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
     
     <%
     //String picture="bg.jpg";
     String detailMess="";
     while(rs.next()){
      int student_no=rs.getInt(1);
      int task_id=rs.getInt(2);
      String zhuguan  =rs.getString(4);
      Float one_score=rs.getFloat(3);
       Statement sql2; 
       sql2=con.createStatement();

      String cdn2="SELECT Student_name FROM student where Student_No ='"+student_no+"'";
     ResultSet rs3333=sql2.executeQuery(cdn2);
       String Student_name="";
       
     while(rs3333.next()){
       Student_name= rs3333.getString(1);
     }
       //detailMess=rs.getString(4);
       //picture=rs.getString(5); 
      //String all=subject_name+","+hw_name;
       //String goods =
      // "("+subject_name+","+subject_content+","+subject_type+","+subject_score+","+subject_answer+")";//���ڹ��ﳵ����۸�,β׺��"#�۸�ֵ"
       //  goods = goods.replaceAll("\\p{Blank}","");
        String button="<form  action='check_stu.jsp' method = 'post'>"+
                      "<input type ='hidden' name='t_id' value= "+task_id+">"+
                      "<input type ='hidden' name='s_no' value= "+student_no+">"+
                      "<input type ='submit'  value='����/�鿴����' class='am-btn am-btn-default am-btn-xs am-text-secondary'></form>";
      //  String del="<form  action='Delques' method = 'post'>"+
                     // "<input type ='hidden' name='delete2' value= "+all+">"+
                     //"<input type ='submit'  value='ɾ����ҵ' ></form>";
      
        out.print("<tr>");
        out.print("<td>"+Student_name+"</td>");
        out.print("<td>"+task_name+"</td>");
        out.print("<td>"+zhuguan+"</td>");
        out.print("<td>"+one_score+"</td>");
        out.print("<td>");
        out.print("<div class='am-btn-toolbar'>");
        out.print("<div class='am-btn-group am-btn-group-xsr'>");
       out.print(button);
        out.print("</div>");
         out.print("</div>");
        out.print("</td>");
        out.print("</tr>");
     } 
     out.print("</table>");
  
     con.close();
  }
  catch(SQLException exp){}
%>
<div class="am-cf">

                                    
                                </div>
                                <hr>

                            </form>
                        </div>

                    </div>

                </div>
                <div class="tpl-alert"></div>
            </div>                 

                    
          

            </div>










        </div>

    </div>


    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/amazeui.min.js"></script>
    <script src="assets/js/app.js"></script>
</body>

</html>
