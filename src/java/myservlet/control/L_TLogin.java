package myservlet.control;
import mybean.data.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class L_TLogin extends HttpServlet {
 public void init(ServletConfig config) throws ServletException{
      super.init(config);
      try{ 
           Class.forName("com.mysql.jdbc.Driver");
      }
      catch(Exception e){} 
   }
   public String handleString(String s){
      try{  byte bb[]=s.getBytes("iso-8859-1");
            s=new String(bb);
      }
      catch(Exception ee){} 
      return s;  
   }
   public void doPost(HttpServletRequest request,HttpServletResponse response) 
                        throws ServletException,IOException{
      Connection con; 
      Statement sql; 
      String Teacher_No=request.getParameter("Teacher_No").trim(),
      Teacher_password=request.getParameter("Teacher_password").trim();
      Teacher_No=handleString(Teacher_No);
      Teacher_password=handleString(Teacher_password);
      if(Teacher_No.equals("")&&Teacher_password.equals("")){
          String backNews="请输入账号密码";
          
           L_Teacherlogin loginBean2=null;
           HttpSession session=request.getSession(true);
           loginBean2=(L_Teacherlogin)session.getAttribute("loginBean2");
           loginBean2.setBackNews(backNews);
           RequestDispatcher dispatcher=request.getRequestDispatcher("L_Tlogin.jsp");//转发
                    dispatcher.forward(request,response);
      }
      String uri="jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work?user=work&password=swufework&useUnicode=true&characterEncoding=gb2312" ;
      int Teacher_no=Integer.parseInt(Teacher_No);
      try{ 
           con=DriverManager.getConnection(uri);
           String condition="select * from Teacher where Teacher_No = "+Teacher_no+ " and Teacher_password ='"+Teacher_password+"'";
           
           sql=con.createStatement();  
           if(!Teacher_No.equals("")&&!Teacher_password.equals("")){
              ResultSet rs=sql.executeQuery(condition);
              boolean m=rs.next();
              if(m==true){ 
                  success(request,response,Teacher_No,Teacher_password);
                   rs.first();
                    RequestDispatcher dispatcher=request.getRequestDispatcher("teachermain.jsp");//转发
                    dispatcher.forward(request,response);
              }else{
                  String backNews="您输入的账号不存在，或密码不匹配";
                  fail(request,response,Teacher_No,backNews); 
                  RequestDispatcher dispatcher=
                  request.getRequestDispatcher("L_Tlogin.jsp");//转发
                  dispatcher.forward(request,response);
              }
           }
           con.close();
      }
      catch(SQLException exp){
          String backNews=""+exp;
          fail(request,response,Teacher_No,backNews);
      }
    }
   public  void  doGet(HttpServletRequest request,HttpServletResponse response) 
                        throws ServletException,IOException{
      doPost(request,response);
   }
   public void success(HttpServletRequest request,HttpServletResponse response
                      ,String Teacher_No,String Student_password) {
      L_Teacherlogin loginBean2=null;
      HttpSession session=request.getSession(true);
      try{  loginBean2=(L_Teacherlogin)session.getAttribute("loginBean2");
            if(loginBean2==null){
               loginBean2=new L_Teacherlogin();  //创建新的数据模型 
               session.setAttribute("loginBean2",loginBean2);
               loginBean2=(L_Teacherlogin)session.getAttribute("loginBean2");
            }
            String name =loginBean2.getTeacher_No();
            if(name.equals(Teacher_No)) {
               loginBean2.setBackNews(Teacher_No+"已经登录了");
               loginBean2.setTeacher_No(Teacher_No);
            }
            else {  //数据模型存储新的登录用户
                loginBean2.setBackNews(Teacher_No+"登录成功");
                loginBean2.setTeacher_No(Teacher_No);
            }
      }
      catch(Exception ee){
            loginBean2=new L_Teacherlogin();  
            session.setAttribute("loginBean2",loginBean2);
            loginBean2.setBackNews(Teacher_No+"登录成功");
            loginBean2.setTeacher_No(Teacher_No);
      }
   }
public void fail(HttpServletRequest request,HttpServletResponse response
                      ,String Teacher_No,String backNews) {
      L_Teacherlogin loginBean2=null;
      HttpSession session=request.getSession(true);
      try{  loginBean2=(L_Teacherlogin)session.getAttribute("loginBean2");
            if(loginBean2==null){
               loginBean2=new L_Teacherlogin();  //创建新的数据模型 
               session.setAttribute("loginBean2",loginBean2);
               loginBean2=(L_Teacherlogin)session.getAttribute("loginBean2");
            }
            loginBean2.setBackNews(backNews);             
      }
      catch(Exception ee){
            loginBean2=new L_Teacherlogin();  
            session.setAttribute("loginBean2",loginBean2);
            loginBean2.setBackNews("登录失败");
      }
   }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
