package myservlet.control;
import java.sql.*;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;
public class UpdateAna extends HttpServlet {
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
       
       
        try {
            con = DriverManager.getConnection(uri, user, password);
            String Task_name="第85次作业";
        int count=2;
       
         String UpdateCondition="UPDATE task set count='"+count+"' where Task_name="+Task_name+"";
          
            sql = con.prepareStatement(UpdateCondition);
            int m = sql.executeUpdate();
            if(m!=0){
                  response.sendRedirect("hw_analyse.jsp");
            }
            con.close();
        } catch (SQLException exp) {
           System.out.print(exp);
        }
       
   }
   public  void  doGet(HttpServletRequest request,HttpServletResponse response)
                        throws ServletException,IOException {
      doPost(request,response);
   }
}
