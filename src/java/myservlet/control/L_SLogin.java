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

public class L_SLogin extends HttpServlet {
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
      String Student_No=request.getParameter("Student_No").trim(),
      Student_password=request.getParameter("Student_password").trim();
      Student_No=handleString(Student_No);
      Student_password=handleString(Student_password);
      if(Student_No.equals("")&&Student_password.equals("")){
          String backNews="请输入账号密码";
           L_Studentlogin loginBean=null;
           HttpSession session=request.getSession(true);
           loginBean=(L_Studentlogin)session.getAttribute("loginBean");
           loginBean.setBackNews(backNews);
           RequestDispatcher dispatcher=request.getRequestDispatcher("L_Slogin.jsp");//转发
                    dispatcher.forward(request,response);
      }
      String uri="jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work?user=work&password=swufework&characterEncoding=gb2312" ;
        int Student_no=Integer.parseInt(Student_No);
      try{ 
           con=DriverManager.getConnection(uri);
           String condition="select * from Student where Student_No = "+Student_no+ " and Student_password ='"+Student_password+"'";
           
           sql=con.createStatement();  
           if(!Student_No.equals("")&&!Student_password.equals("")){
              ResultSet rs=sql.executeQuery(condition);
              boolean m=rs.next();
              if(m==true){ 
                  success(request,response,Student_No,Student_password);
                   rs.first();
                    RequestDispatcher dispatcher=request.getRequestDispatcher("student.jsp");//转发
                    dispatcher.forward(request,response);
              }
              else{
                  String backNews="您输入的学号不存在，或密码不匹配";
                  fail(request,response,Student_No,backNews); 
                  RequestDispatcher dispatcher=
                  request.getRequestDispatcher("L_Slogin.jsp");//转发
                  dispatcher.forward(request,response);
              }
           }
           
           con.close();
      }
      catch(SQLException exp){
          String backNews=""+exp;
          fail(request,response,Student_No,backNews);
      }
    }
   public  void  doGet(HttpServletRequest request,HttpServletResponse response) 
                        throws ServletException,IOException{
      doPost(request,response);
   }
   public void success(HttpServletRequest request,HttpServletResponse response
                      ,String Student_No,String Student_password) {
      L_Studentlogin loginBean=null;
      HttpSession session=request.getSession(true);
      try{  loginBean=(L_Studentlogin)session.getAttribute("loginBean");
            if(loginBean==null){
               loginBean=new L_Studentlogin();  //创建新的数据模型 
               session.setAttribute("loginBean",loginBean);
               loginBean=(L_Studentlogin)session.getAttribute("loginBean");
            }
            String name =loginBean.getStudent_No();
            if(name.equals(Student_No)) {
               loginBean.setBackNews(Student_No+"已经登录了");
               loginBean.setStudent_No(Student_No);
            }
            else {  //数据模型存储新的登录用户
                loginBean.setBackNews(Student_No+"登录成功");
                loginBean.setStudent_No(Student_No);
            }
      }
      catch(Exception ee){
            loginBean=new L_Studentlogin();  
            session.setAttribute("loginBean",loginBean);
            loginBean.setBackNews(Student_No+"登录成功");
            loginBean.setStudent_No(Student_No);
      }
   }
public void fail(HttpServletRequest request,HttpServletResponse response
                      ,String Student_No,String backNews) {
      L_Studentlogin loginBean=null;
      HttpSession session=request.getSession(true);
      try{  loginBean=(L_Studentlogin)session.getAttribute("loginBean");
            if(loginBean==null){
               loginBean=new L_Studentlogin();  //创建新的数据模型 
               session.setAttribute("loginBean",loginBean);
               loginBean=(L_Studentlogin)session.getAttribute("loginBean");
            }
            loginBean.setBackNews(backNews);             
      }
      catch(Exception ee){
            loginBean=new L_Studentlogin();  
            session.setAttribute("loginBean",loginBean);
            loginBean.setBackNews("登录失败");
      }
   }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
