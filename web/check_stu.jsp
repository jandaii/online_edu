<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html;charset=GB2312"%>
<%@ page import="mybean.data.DataByPage_hw" %>
<%@ page import="com.sun.rowset.*" %>
<jsp:useBean id="dataBean" class="mybean.data.DataByPage_hw" scope="request"/>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
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

<body data-type="index">


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

                
                <li><a href="###" class="tpl-header-list-link"><span class="am-icon-sign-out tpl-header-list-ico-out-size"></span></a></li>
            </ul>
        </div>
    </header>







    <div class="tpl-page-container tpl-page-header-fixed">


        <div class="tpl-left-nav tpl-left-nav-hover">
            <div class="tpl-left-nav-title">
                Amaze UI �б�
            </div>
            <div class="tpl-left-nav-list">
                <ul class="tpl-left-nav-menu">
                    <li class="tpl-left-nav-item">
                        <a href="index.html" class="nav-link active">
                            <i class="am-icon-home"></i>
                            <span>��ҳ</span>
                        </a>
                    </li>
                    <li class="tpl-left-nav-item">
                        <a href="chart.html" class="nav-link tpl-left-nav-link-list">
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
                            <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right tpl-left-nav-more-ico-rotate"></i>
                        </a>
                        <ul class="tpl-left-nav-sub-menu" style="display: block;">
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
             <div class="caption font-green bold">
                        <span class="am-icon-code"></span> ����
                    </div>


       
                  
             

 
<%
      String t_id= request.getParameter("t_id");
      String s_no= request.getParameter("s_no");
      if(t_id==null||s_no==null){
           String a= (String)request.getAttribute("a");
            String[] arr = a.split(",");
           
           s_no= arr[0];
           t_id=arr[1];
      }
      int task_id = Integer.parseInt(t_id);   
      int student_no = Integer.parseInt(s_no);
%>
<input type ='hidden' name='hw_name' value="<%= task_id%>">
<%
      Connection con; 
     Statement sql; 
     ResultSet rs;
 String uri="jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work";
    try {  Class.forName("com.mysql.jdbc.Driver");
   }
   catch(Exception e){} 
 try{
           con=DriverManager.getConnection(uri,"work","swufework");
           sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                                                ResultSet.CONCUR_READ_ONLY);
           
          
            rs=sql.executeQuery("SELECT * FROM answer where Student_No='"+student_no+"' AND Task_id='"+task_id+"'");
       // ArrayList subject_id= new ArrayList();
        //ArrayList student_answer= new ArrayList();
        //ArrayList student_score= new ArrayList();
        //ArrayList auto= new ArrayList();
           while (rs.next()){
            
   int subject_id=rs.getInt(2);

    String student_answer=rs.getString(4);
    Float student_score=rs.getFloat(5);
    String auto=rs.getString(6);
       
        Statement sql2; 
       sql2=con.createStatement();

      String cdn2="SELECT * FROM subject where subject_id ='"+subject_id+"'";
     ResultSet rs2=sql2.executeQuery(cdn2);
       String Sb_name="";
       String Sb_cont="";
       String Sb_type="";
       String Sb_score="";
       String ans="";
     while(rs2.next()){
       Sb_name= rs2.getString(3);
       Sb_cont= rs2.getString(4);
       Sb_type= rs2.getString(5);
       Sb_score= rs2.getString(6);
       ans= rs2.getString(7);
if(Sb_type.equals("�����")||(Sb_type.equals("�ʴ���")&&auto.equals("��"))){
    String check="<form  action='check' method = 'post'>"+
                     "<input type ='hidden' name='st_no' value= "+s_no+">"+
                    "<input type ='hidden' name='sb_id' value= "+subject_id+">"+
            
                    "<input type ='number' name='check_score' >"+
                     "<input type ='submit'  value='�ύ' class='am-btn am-btn-default am-btn-xs am-text-secondary'></form>";
  out.print("<div class='tpl-content-scope'>");
            out.print("<div class='note note-info'>");
            out.print(" <h4>"+ Sb_type+":    "+Sb_name+" <span class='close' data-close='note'>");
            out.print("</span>");
            out.print("</h4>");
            out.print("<h4>"+Sb_cont+"    ("+Sb_score+"��)</h4>");
            out.print(" <p><span class='label label-danger'>ѧ����:</span>    "+student_answer);
            out.print("</p>");
            out.print("<p> </p>");
            out.print("<p>��ȷ��:   "+ans+"</p>");
             out.print("<p>ѧ���÷�:    "+student_score+"</p>");
             out.print("<p>�޸ķ���:    "+check+"</p>");
             out.print("</div>");  
    
}               
else{
  out.print("<div class='tpl-content-scope'>");
            out.print("<div class='note note-info'>");
            out.print(" <h4>"+ Sb_type+":    "+Sb_name+" <span class='close' data-close='note'>");
            out.print("</span>");
            out.print("</h4>");
            out.print("<h4>"+Sb_cont+"    ("+Sb_score+"��)</h4>");
            out.print(" <p><span class='label label-danger'>ѧ����:</span>    "+student_answer);
            out.print("</p>");
            out.print("<p> </p>");
            out.print("<p>��ȷ��:   "+ans+"</p>");
             out.print("<p>ѧ���÷�:    "+student_score+"</p>");
             out.print("</div>");
}               
               
               
               
            
            String del="<form  action='DelHWServlet' method = 'post'>"+
                     "<input type ='hidden' name='delete' value= "+subject_id+">"+
                     "<input type ='submit'  value='ɾ����ҵ' ></form>";
            //out.print("<tr>");
          
            //out.print("<th>"+detail+""+del+"</th>");
           // out.print("<td>"+button+"</td>");
            //out.print("</tr>");
            
           
     }
           }
 }catch(SQLException exp){
out.print(exp);
 }
        
           
     
  
%>

                  
                   
                    
               
            </div>

        </div>


    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/amazeui.min.js"></script>
    <script src="assets/js/iscroll.js"></script>
    <script src="assets/js/app.js"></script>
</body>

</html>