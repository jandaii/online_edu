package myservlet.control;
import mybean.data.*;
import com.sun.rowset.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class SelectHw_no extends HttpServlet{
   public void init(ServletConfig config) throws ServletException{
      super.init(config);
      try {  Class.forName("com.mysql.jdbc.Driver");
      }
      catch(Exception e){} 
   }
   public void doPost(HttpServletRequest request,HttpServletResponse response) 
                        throws ServletException,IOException{
      request.setCharacterEncoding("gb2312");
      
     String hw_name=(String) request.getSession().getAttribute("hw_name");
      if(hw_name == null){
          hw_name = "";
         
     
      Connection con=null; 
      
  
    
      String uri="jdbc:mysql://127.0.0.1/Food";
      try{ 
           con=DriverManager.getConnection(uri,"root","root");
           Statement sql=con.createStatement();
           String str="select Task_id FROM task where Task_name= '\"+hw_name+ \"'";
           ResultSet rs=sql.executeQuery(str);
        int hw_no = rs.getInt(0);
           con.close();   
           //关闭连接
            HttpSession session=request.getSession(true); 
           session.setAttribute("hw_no", hw_no);
 RequestDispatcher dispatcher=request.getRequestDispatcher("ques_option.jsp");
                   dispatcher.forward(request,response);
                 }
           
      
      catch(SQLException exp){ 
          
          response.sendRedirect("ques_option.jsp");}
      response.sendRedirect("ques_option.jsp");//重定向到byPageShow.jsp
   } 
   }
   public void doGet(HttpServletRequest request,
              HttpServletResponse response) 
                        throws ServletException,IOException{
       doPost(request,response);
   }
}