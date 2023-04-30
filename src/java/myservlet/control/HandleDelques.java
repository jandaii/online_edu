package myservlet.control;
import mybean.data.*;
import java.util.*;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.*;
import javax.servlet.http.*;
public class HandleDelques extends HttpServlet {
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
      request.setCharacterEncoding("gb2312");
     
      //Login loginBean=null;
     // HttpSession session=request.getSession(true);
     String uri="jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work?user=work&password=swufework&useUnicode=true&characterEncoding=gb2312" ;
      
      Connection con; 
      NewHwname hwBean=new NewHwname();  //创建的Javabean模型
      request.setAttribute("hwBean",hwBean);
     // try{  //loginBean=(Login)session.getAttribute("loginBean");
            //boolean b =loginBean.getLogname()==null||
            //loginBean.getLogname().length()==0;
           // if(b)
           ////   response.sendRedirect("login.jsp");//重定向到登录页面
          //  LinkedList<String> car = loginBean.getCar();
            //car.remove(delete);
      //}
      //catch(Exception exp){
       //    response.sendRedirect("login.jsp");//重定向到登录页面
      //}
     // RequestDispatcher dispatcher= 
     // request.getRequestDispatcher("lookShoppingCar.jsp");
      //dispatcher.forward(request, response);//转发 
       try{   con=DriverManager.getConnection(uri);
            Statement sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                                                ResultSet.CONCUR_READ_ONLY);
             String del = request.getParameter("delete2");
             String[] arr = del.split(",");
            String hw_name=arr[1];
            String delete=arr[0];
            String str="delete from subject where Subject_name= '"+delete+ "'";

            int i=sql.executeUpdate(str);
              
            if(i!=0){
                
                hwBean.setHw_name("第85次作业");
            }
            
      
          //request.setAttribute("hw_name",handleString(hw_name));
              response.sendRedirect("hw_detail.jsp");


      }
      catch(SQLException exp){
       response.sendRedirect("hw_detail.jsp");
      }
     
      
      
   }
   public  void  doGet(HttpServletRequest request,HttpServletResponse response)
                        throws ServletException,IOException {
      doPost(request,response);
   }
}
