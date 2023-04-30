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

public class L_ALogin extends HttpServlet {
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
      String Administer_No=request.getParameter("Administer_No").trim(),
      Administer_password=request.getParameter("Administer_password").trim();
      Administer_No=handleString(Administer_No);
      Administer_password=handleString(Administer_password);
      int Administer_no=Integer.parseInt(Administer_No);
      String uri="jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work?user=work&password=swufework&characterEncoding=gb2312" ;

      boolean boo=(Administer_No.length()>0)&&(Administer_password.length()>0);  
      try{ 
           con=DriverManager.getConnection(uri);
           String condition="select * from Administer where Administer_No = "+Administer_no+ " and Administer_password ='"+Administer_password+"'";
           
           sql=con.createStatement();  
           if(boo){
              ResultSet rs=sql.executeQuery(condition);
              boolean m=rs.next();
              if(m==true){ 
                  success(request,response,Administer_No,Administer_password);
                   rs.first();
                    RequestDispatcher dispatcher=request.getRequestDispatcher("Guanli_index.jsp");//转发
                    dispatcher.forward(request,response);
              }
              else{
                  String backNews="您输入的用户名不存在，或密码不匹配";
                  fail(request,response,Administer_No,backNews); 
                  RequestDispatcher dispatcher=
                  request.getRequestDispatcher("L_Alogin.jsp");//转发
                  dispatcher.forward(request,response);
              }
           }
           else{
                 String backNews="请输入用户名和密码";
                 fail(request,response,Administer_No,backNews);
                 RequestDispatcher dispatcher=
                  request.getRequestDispatcher("L_Alogin.jsp");//转发
                  dispatcher.forward(request,response);
           }
           con.close();
      }
      catch(SQLException exp){
          String backNews=""+exp;
          fail(request,response,Administer_No,backNews);
      }
    }
   public  void  doGet(HttpServletRequest request,HttpServletResponse response) 
                        throws ServletException,IOException{
      doPost(request,response);
   }
   public void success(HttpServletRequest request,HttpServletResponse response
                      ,String Administer_No,String Student_password) {
      L_Administerlogin loginBean=null;
      HttpSession session=request.getSession(true);
      try{  loginBean=(L_Administerlogin)session.getAttribute("loginBean");
            if(loginBean==null){
               loginBean=new L_Administerlogin();  //创建新的数据模型 
               session.setAttribute("loginBean",loginBean);
               loginBean=(L_Administerlogin)session.getAttribute("loginBean");
            }
            String name =loginBean.getAdminister_No();
            if(name.equals(Administer_No)) {
               loginBean.setBackNews(Administer_No+"已经登录了");
               loginBean.setAdminister_No(Administer_No);
            }
            else {  //数据模型存储新的登录用户
                loginBean.setBackNews(Administer_No+"登录成功");
                loginBean.setAdminister_No(Administer_No);
            }
      }
      catch(Exception ee){
            loginBean=new L_Administerlogin();  
            session.setAttribute("loginBean",loginBean);
            loginBean.setBackNews(Administer_No+"登录成功");
            loginBean.setAdminister_No(Administer_No);
      }
   }
public void fail(HttpServletRequest request,HttpServletResponse response
                      ,String Administer_No,String backNews) {
      L_Administerlogin loginBean=null;
      HttpSession session=request.getSession(true);
      try{  loginBean=(L_Administerlogin)session.getAttribute("loginBean");
            if(loginBean==null){
               loginBean=new L_Administerlogin();  //创建新的数据模型 
               session.setAttribute("loginBean",loginBean);
               loginBean=(L_Administerlogin)session.getAttribute("loginBean");
            }
            loginBean.setBackNews(backNews);             
      }
      catch(Exception ee){
            loginBean=new L_Administerlogin();  
            session.setAttribute("loginBean",loginBean);
            loginBean.setBackNews("登录失败");
      }
   }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
