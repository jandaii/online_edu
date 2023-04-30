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
    <meta name="description" content="这是一个 index 页面">
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

        <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

        <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

            <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list tpl-header-list">
                <li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
                    <a class="am-dropdown-toggle tpl-header-list-link" href="javascript:;">
                        <span class="am-icon-bell-o"></span> 提醒 <span class="am-badge tpl-badge-success am-round">5</span></span>
                    </a>
                    <ul class="am-dropdown-content tpl-dropdown-content">
                        <li class="tpl-dropdown-content-external">
                            <h3>你有 <span class="tpl-color-success">5</span> 条提醒</h3><a href="###">全部</a></li>
                        <li class="tpl-dropdown-list-bdbc"><a href="#" class="tpl-dropdown-list-fl"><span class="am-icon-btn am-icon-plus tpl-dropdown-ico-btn-size tpl-badge-success"></span> 【预览模块】移动端 查看时 手机、电脑框隐藏。</a>
                            <span class="tpl-dropdown-list-fr">3小时前</span>
                        </li>
                        <li class="tpl-dropdown-list-bdbc"><a href="#" class="tpl-dropdown-list-fl"><span class="am-icon-btn am-icon-check tpl-dropdown-ico-btn-size tpl-badge-danger"></span> 移动端，导航条下边距处理</a>
                            <span class="tpl-dropdown-list-fr">15分钟前</span>
                        </li>
                        <li class="tpl-dropdown-list-bdbc"><a href="#" class="tpl-dropdown-list-fl"><span class="am-icon-btn am-icon-bell-o tpl-dropdown-ico-btn-size tpl-badge-warning"></span> 追加统计代码</a>
                            <span class="tpl-dropdown-list-fr">2天前</span>
                        </li>
                    </ul>
                </li>
                <li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
                    <a class="am-dropdown-toggle tpl-header-list-link" href="javascript:;">
                        <span class="am-icon-comment-o"></span> 消息 <span class="am-badge tpl-badge-danger am-round">9</span></span>
                    </a>
                    <ul class="am-dropdown-content tpl-dropdown-content">
                        <li class="tpl-dropdown-content-external">
                            <h3>你有 <span class="tpl-color-danger">9</span> 条新消息</h3><a href="###">全部</a></li>
                        <li>
                            <a href="#" class="tpl-dropdown-content-message">
                                <span class="tpl-dropdown-content-photo">
                      <img src="assets/img/user02.png" alt=""> </span>
                                <span class="tpl-dropdown-content-subject">
                      <span class="tpl-dropdown-content-from"> 禁言小张 </span>
                                <span class="tpl-dropdown-content-time">10分钟前 </span>
                                </span>
                                <span class="tpl-dropdown-content-font"> Amaze UI 的诞生，依托于 GitHub 及其他技术社区上一些优秀的资源；Amaze UI 的成长，则离不开用户的支持。 </span>
                            </a>
                            <a href="#" class="tpl-dropdown-content-message">
                                <span class="tpl-dropdown-content-photo">
                      <img src="assets/img/user03.png" alt=""> </span>
                                <span class="tpl-dropdown-content-subject">
                      <span class="tpl-dropdown-content-from"> Steam </span>
                                <span class="tpl-dropdown-content-time">18分钟前</span>
                                </span>
                                <span class="tpl-dropdown-content-font"> 为了能最准确的传达所描述的问题， 建议你在反馈时附上演示，方便我们理解。 </span>
                            </a>
                        </li>

                    </ul>
                </li>
                <li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
                    <a class="am-dropdown-toggle tpl-header-list-link" href="javascript:;">
                        <span class="am-icon-calendar"></span> 进度 <span class="am-badge tpl-badge-primary am-round">4</span></span>
                    </a>
                    <ul class="am-dropdown-content tpl-dropdown-content">
                        <li class="tpl-dropdown-content-external">
                            <h3>你有 <span class="tpl-color-primary">4</span> 个任务进度</h3><a href="###">全部</a></li>
                        <li>
                            <a href="javascript:;" class="tpl-dropdown-content-progress">
                                <span class="task">
                        <span class="desc">Amaze UI 用户中心 v1.2 </span>
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
                        <span class="desc">新闻内容页 </span>
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
                        <span class="desc">管理中心 </span>
                                <span class="percent">60%</span>
                                </span>
                                <span class="progress">
                        <div class="am-progress tpl-progress am-progress-striped"><div class="am-progress-bar am-progress-bar-warning" style="width:60%"></div></div>
                    </span>
                            </a>
                        </li>

                    </ul>
                </li>
                <li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen" class="tpl-header-list-link"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>

                <li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
                    <a class="am-dropdown-toggle tpl-header-list-link" href="javascript:;">
                        <span class="tpl-header-list-user-nick">禁言小张</span><span class="tpl-header-list-user-ico"> <img src="assets/img/user01.png"></span>
                    </a>
                    <ul class="am-dropdown-content">
                        <li><a href="#"><span class="am-icon-bell-o"></span> 资料</a></li>
                        <li><a href="#"><span class="am-icon-cog"></span> 设置</a></li>
                        <li><a href="#"><span class="am-icon-power-off"></span> 退出</a></li>
                    </ul>
                </li>
                <li><a href="###" class="tpl-header-list-link"><span class="am-icon-sign-out tpl-header-list-ico-out-size"></span></a></li>
            </ul>
        </div>
    </header>







    <div class="tpl-page-container tpl-page-header-fixed">

        <div class="tpl-left-nav tpl-left-nav-hover">
            <div class="tpl-left-nav-title">
                不知道写啥
            </div>
            <div class="tpl-left-nav-list">
                <ul class="tpl-left-nav-menu">
                    <li class="tpl-left-nav-item">
                        <a href="index.html" class="nav-link">
                            <i class="am-icon-home"></i>
                            <span>首页</span>
                        </a>
                    </li>
                    <li class="tpl-left-nav-item">
                        <a href="chart.html" class="nav-link tpl-left-nav-link-list active">
                            <i class="am-icon-bar-chart"></i>
                            <span>数据表</span>
                            <i class="tpl-left-nav-content tpl-badge-danger">
               12
             </i>
                        </a>
                    </li>

                    <li class="tpl-left-nav-item">
                        <a href="javascript:;" class="nav-link tpl-left-nav-link-list">
                            <i class="am-icon-table"></i>
                            <span>表格</span>
                            <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                        </a>
                        <ul class="tpl-left-nav-sub-menu">
                            <li>
                                <a href="table-font-list.html">
                                    <i class="am-icon-angle-right"></i>
                                    <span>文字表格</span>
                                    <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                                </a>

                                <a href="table-images-list.html">
                                    <i class="am-icon-angle-right"></i>
                                    <span>图片表格</span>
                                    <i class="tpl-left-nav-content tpl-badge-success">
               18
             </i>

                                    <a href="form-news.html">
                                        <i class="am-icon-angle-right"></i>
                                        <span>消息列表</span>
                                        <i class="tpl-left-nav-content tpl-badge-primary">
               5
             </i>


                                        <a href="form-news-list.html">
                                            <i class="am-icon-angle-right"></i>
                                            <span>文字列表</span>

                                        </a>
                            </li>
                        </ul>
                    </li>

                    <li class="tpl-left-nav-item">
                        <a href="javascript:;" class="nav-link tpl-left-nav-link-list">
                            <i class="am-icon-wpforms"></i>
                            <span>表单</span>
                            <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                        </a>
                        <ul class="tpl-left-nav-sub-menu">
                            <li>
                                <a href="form-amazeui.html">
                                    <i class="am-icon-angle-right"></i>
                                    <span>Amaze UI 表单</span>
                                    <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                                </a>

                                <a href="form-line.html">
                                    <i class="am-icon-angle-right"></i>
                                    <span>线条表单</span>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li class="tpl-left-nav-item">
                        <a href="login.html" class="nav-link tpl-left-nav-link-list">
                            <i class="am-icon-key"></i>
                            <span>登录</span>

                        </a>
                    </li>
                </ul>
            </div>
        </div>





        <div class="tpl-content-wrapper">
            <div class="tpl-content-page-title">
                作业完成情况详情
            </div>
            

            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-code"></span> 各分数段占比
                    </div>
             

                </div>
                <div class="tpl-block">
                  
                    <%
  String task_name="";
  /********基础数据**********/
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
           
          
           
           
              

     //用get()方法返回的是Object类型

       Sum=100f;
       //T_id=(int)t_id.get(0);
       p1=90f;
        p2=80f;
       p3=70f;
       p4=60f;
       int C_id=1;
     //这个地方的course_id待修改   
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
  String[] keys = { "优秀(分数≥"+p1+")", "良好("+p2+"≤分数＜"+p1+")", "中等("+p3+"≤分数＜"+p2+")","及格("+p4+"≤分数＜"+p3+")","不及格(分数＜"+p4+")" };
  //String chartTitle = "等级分布图";
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
  piePlot.setBackgroundPaint(null);//背景色


  PiePlot plot = (PiePlot) chart.getPlot();
  // 图片中显示百分比:默认方式
   
  
  
            plot.setSectionPaint("优秀(分数≥"+p1+")", Color.decode("#C1FFC1"));  
            plot.setSectionPaint("良好("+p2+"≤分数＜"+p1+")", Color.decode("#BCD2EE"));  
            plot.setSectionPaint("中等("+p3+"≤分数＜"+p2+")", Color.decode("#FAFAD2"));  
            plot.setSectionPaint("及格("+p4+"≤分数＜"+p3+")", Color.decode("#FFC1C1")); 
            plot.setSectionPaint("不及格(分数＜"+p4+")", Color.decode("#DEDEDE")); 
           
  // 指定饼图轮廓线的颜色
  plot.setBaseSectionOutlinePaint(Color.white);
  plot.setBaseSectionPaint(Color.white);
  plot.setBackgroundPaint(Color.white);
  plot.setLabelBackgroundPaint(Color.white);
  // 设置无数据时的信息
  plot.setNoDataMessage("作业未批改");



  // 图片中显示百分比:自定义方式，{0} 表示选项， {1} 表示数值， {2} 表示所占比例 ,小数点后两位
  plot.setLabelGenerator(new StandardPieSectionLabelGenerator("{0} {1}  ({2})", NumberFormat
     .getNumberInstance(), new DecimalFormat("0.00%")));
  // 图例显示百分比:自定义方式， {0} 表示选项， {1} 表示数值， {2} 表示所占比例
  plot.setLegendLabelGenerator(new StandardPieSectionLabelGenerator("{0}={1}({2})"));


  //图片说明显示格式
  plot.setLabelFont(new Font("宋体", Font.TRUETYPE_FONT,12));
  plot.setLabelPaint(Color.decode("#7AC5CD"));
  plot.setLabelLinkPaint(Color.decode("#7AC5CD"));
  plot.setLabelOutlinePaint(Color.white);
  plot.setLabelShadowPaint(Color.white);
  plot.setShadowPaint(Color.white);
 // plot.setLabelFont(new Font("宋体", 0, 14));   


  // 指定图片的透明度(0.0-1.0)
  plot.setForegroundAlpha(0.5f);
  // 指定显示的饼图上圆形(true)还椭圆形(false)
  plot.setCircular(true, false);
  plot.setIgnoreNullValues(false);


  // 设置第一个 饼块section 的开始位置，默认是12点钟方向
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
                        <span class="am-icon-code"></span> 已完成作业学生
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
     out.print("<th class='table-author am-hide-sm-only'>学生</th>");
     out.print("<th class='table-title'>作业名称</th>");
     out.print("<th class='table-type'>是否批改主观题</th>");
     out.print(" <th class='table-author am-hide-sm-only'>分数</th>");
 
  
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
      // "("+subject_name+","+subject_content+","+subject_type+","+subject_score+","+subject_answer+")";//便于购物车计算价格,尾缀上"#价格值"
       //  goods = goods.replaceAll("\\p{Blank}","");
        String button="<form  action='check_stu.jsp' method = 'post'>"+
                      "<input type ='hidden' name='t_id' value= "+task_id+">"+
                      "<input type ='hidden' name='s_no' value= "+student_no+">"+
                      "<input type ='submit'  value='批改/查看详情' class='am-btn am-btn-default am-btn-xs am-text-secondary'></form>";
      //  String del="<form  action='Delques' method = 'post'>"+
                     // "<input type ='hidden' name='delete2' value= "+all+">"+
                     //"<input type ='submit'  value='删除作业' ></form>";
      
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
