package myservlet.control;
import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import mybean.data.homework_11;
import java.sql.*;
import java.io.*;
import java.text.*;
import java.util.ArrayList;
import java.util.Calendar;
import javax.servlet.*;
import javax.servlet.http.*;

public class Handlehomework_11 extends HttpServlet {

    public void init(ServletConfig config) throws ServletException{
      super.init(config);
      try {  Class.forName("com.mysql.jdbc.Driver");
      }
      catch(Exception e){} 
   }
    

     public  void  doGet(HttpServletRequest request,HttpServletResponse response)
                        throws ServletException,IOException {
      doPost(request,response);
   }
    public String handleString(String s)
   {   try{ byte bb[]=s.getBytes("iso-8859-1");
            s=new String(bb);
       }
       catch(Exception ee){} 
       return s;  
   } 
    public  void  doPost(HttpServletRequest request,HttpServletResponse response) 
                        throws ServletException,IOException {
      String uri="jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work?user=work&password=swufework&useUnicode=true&characterEncoding=gb2312" ;
       Connection con,con2;
       PreparedStatement sql;
       Statement sql2;
       ResultSet rs2 = null;
       String backNews="";
      
       homework_11 dataBean2=new homework_11();  //创建Javabean对象
      request.setAttribute("dataBean2",dataBean2);
       String task_id=request.getParameter("taskid");
        String auto=request.getParameter("auto");
        int Task_id=Integer.parseInt(task_id);
         ArrayList subject_id = new ArrayList();
        String student_no=request.getParameter("Student_no");
        int Student_no=Integer.parseInt(student_no);
      try{
              con2=DriverManager.getConnection(uri);
              sql2=con2.createStatement();
              rs2=sql2.executeQuery("SELECT Subject_id From subject where task_id="+Task_id+"");
                while(rs2.next()){
                    subject_id.add(rs2.getInt("Subject_id"));
                }
          }
          catch(Exception exp){
              dataBean2.setBackNews(exp+backNews);
          }
      
     
     
      try{         
    con=DriverManager.getConnection(uri);
      String insertCondition=("INSERT INTO answer VALUES (?,?,?,?,?,?)");
       sql=con.prepareStatement(insertCondition);
    for(int i = 0; i < subject_id.size(); i++) { 
         int a=(Integer)subject_id.get(i);
         String A=String.valueOf(a);
          String Subject_type=request.getParameter("Subject_type"+A);
         
         if(Subject_type.equals("选择题")){
             String xuanze=request.getParameter("xuanze"+A);
              sql.setInt(1,Student_no);
              sql.setInt(2,a);
              sql.setInt(3,Task_id);
              sql.setString(4,handleString(xuanze));
              sql.setFloat(5,0F);     
              sql.setString(6,handleString(auto));
         }
         else if(Subject_type.equals("问答题")){
              String wenda=request.getParameter("wenda"+A);
              sql.setInt(1,Student_no);
              sql.setInt(2,a);
              sql.setInt(3,Task_id);
              sql.setString(4,handleString(wenda));
              sql.setFloat(5,0F);     
              sql.setString(6,handleString(auto));
         
         }
         else  if(Subject_type.equals("编程题")){
              String biancheng=request.getParameter("biancheng"+A);
              sql.setInt(1,Student_no);
              sql.setInt(2,a);
              sql.setInt(3,Task_id);
              sql.setString(4,handleString(biancheng));
              sql.setFloat(5,0F);
              sql.setString(6,handleString(auto));

         }
         else if(Subject_type.equals("判断题")){
              String panduan=request.getParameter("panduan"+A);
              sql.setInt(1,Student_no);
              sql.setInt(2,a);
              sql.setInt(3,Task_id);
              sql.setString(4,handleString(panduan));
              sql.setFloat(5,0F); 
              sql.setString(6,handleString(auto));
         }
         if(Subject_type.equals("填空题")){
              String text=request.getParameter("text"+A);
              sql.setInt(1,Student_no);
              sql.setInt(2,a);
              sql.setInt(3,Task_id);
              sql.setString(4,handleString(text));
              sql.setFloat(5,0F); 
              sql.setString(6,handleString(auto));
         }
         else{
         }
           
       }   
             con.close();
           
   }
      catch(Exception exp){
          dataBean2.setBackNews(exp+backNews);
      }
    RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
              dispatcher.forward(request, response);//转发
      }
             

}