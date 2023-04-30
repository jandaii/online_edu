package myservlet.control;
import java.sql.*;
import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;
import mybean.data.Bean_banji;
public class Servlet_banji_delete extends HttpServlet {
   public void init(ServletConfig config) throws ServletException { 
      super.init(config);
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
      String uri="jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work?user=work&password=swufework&useUnicode=true&characterEncoding=gb2312";
        String user = "work";
        String password = "swufework";
        Connection con;
        PreparedStatement sql;
        Bean_banji Bean_banji = new Bean_banji();  //创建的Javabean模型
        request.setAttribute("Bean_banji", Bean_banji);
        String id = request.getParameter("id").trim();
        int ID=Integer.parseInt(id);
       
        try {
            con = DriverManager.getConnection(uri, user, password);
            String deleteCondition = "DELETE FROM  Class where Class_id="+ID+"";
            sql = con.prepareStatement(deleteCondition);
            int m = sql.executeUpdate();
            if(m==0){    
            }
          
            con.close();
        } catch (SQLException exp) {
           
        }
          RequestDispatcher dispatcher =
                request.getRequestDispatcher("Guanli_banjiguanli.jsp");
        dispatcher.forward(request, response);//转发
       
   }
   public  void  doGet(HttpServletRequest request,HttpServletResponse response)
                        throws ServletException,IOException {
      doPost(request,response);
   }
}