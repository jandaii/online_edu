package myservlet.control;
import java.sql.*;
import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;
public class Servlet_gonggao_change extends HttpServlet {
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
        String Information_id = request.getParameter("id").trim();
       String Information_type = request.getParameter("leixin").trim();
        String Information_title = request.getParameter("biaoti").trim();
        String Information_content = request.getParameter("neirong").trim();
       
        try {
            con = DriverManager.getConnection(uri, user, password);
            String updateCondition = "UPDATE Information set Information_type='"+Information_type+"',Information_title='"+Information_title+"',Information_content='"+Information_content+"' where Information_id="+Information_id+"";
            sql = con.prepareStatement(updateCondition);
            int m = sql.executeUpdate();
            if(m!=0){
                  if(Information_type.equals("通知公告")){
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("Servlet_gonggao");
        dispatcher.forward(request, response);//转发
        }
        if(Information_type.equals("学校新闻")){
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("Servlet_gonggao2");
        dispatcher.forward(request, response);//转发
        }
        if(Information_type.equals("学术讲座")){
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("Servlet_gonggao3");
        dispatcher.forward(request, response);//转发
        }
        if(Information_type.equals("前沿动态")){
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("Servlet_gonggao4");
        dispatcher.forward(request, response);//转发
        }
            }
            con.close();
        } catch (SQLException exp) {
           
        }
       
   }
   public  void  doGet(HttpServletRequest request,HttpServletResponse response)
                        throws ServletException,IOException {
      doPost(request,response);
   }
}