package myservlet.control;
import mybean.data.*;
import java.sql.*;
import java.io.*;
import java.text.*;
import java.util.Calendar;
import javax.servlet.*;
import javax.servlet.http.*;

public class HandleAddHw extends HttpServlet{
     public void init(ServletConfig config) throws ServletException { 
      super.init(config);
      try {  Class.forName("com.mysql.jdbc.Driver");
      }
      catch(Exception e){} 
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
      Connection con; 
     PreparedStatement  sql; 

      AddHw userBean=new AddHw();  //创建的Javabean模型
      request.setAttribute("userBean",userBean);
      String hw_name=request.getParameter("hw_name").trim();
      
      String begin_date=request.getParameter("begin_date").trim();
      String finish_date=request.getParameter("finish_date").trim();
      String select=request.getParameter("select").trim();
       String kecheng=request.getParameter("kecheng").trim();
        String teacherno=request.getParameter("Teacher_no").trim();
       int course_id=Integer.parseInt(kecheng);
        int Teacherno=Integer.parseInt(teacherno);
      int hw_no=0;
      
      if(hw_name==null)
           hw_name="";
      if(begin_date==null)
           begin_date="";
       if(finish_date==null)
           finish_date="";
      if(select==null)
           select="";
        


    
      
   
      boolean boo=hw_name.length()>0&&begin_date.length()>0&&finish_date.length()>0&&select.length()>0;
      String backNews="";
      try{   con=DriverManager.getConnection(uri);
             String insertCondition="INSERT INTO task VALUES (?,?,?,?,?,?,?,?,?,?)";
             sql=con.prepareStatement(insertCondition);
             if(boo)
             { 
               sql.setInt(1,0); 
               sql.setInt(2,Teacherno);
               sql.setString(3,handleString(hw_name));
               sql.setString(4,handleString(begin_date));
               sql.setString(5,handleString(finish_date));
               sql.setFloat(6,0);
               sql.setFloat(7,0);
               sql.setFloat(8,0 );
               sql.setString(9,handleString(select));
               sql.setInt(10,course_id);
               int m=sql.executeUpdate();
              
              if(m!=0){
                  backNews="添加成功";
                  userBean.setBackNews(backNews);
                  userBean.setHw_name(handleString(hw_name));
                 // userBean.setHw_no(hw_no);
                  userBean.setBegin_date(handleString(begin_date));
                  userBean.setFinish_date(handleString(finish_date));
                  userBean.setSelect(handleString(select));
                   
               }
               
    
            }
             else {
                 backNews="信息填写不完整或有非法字符";
                 userBean.setBackNews(backNews);  
             }
             con.close();
      }
      catch(SQLException exp){
            System.out.print(exp);
             backNews=exp+"作业名已被使用，请您更换名字";
             userBean.setBackNews(backNews); 
      }
     
      
              request.setAttribute("hw_name", hw_name);
//重定向界面“importData” 项目请求配置path 路径
         RequestDispatcher dispatcher= 
      request.getRequestDispatcher("ques_option.jsp");
      dispatcher.forward(request, response);}
     
    }//转发

