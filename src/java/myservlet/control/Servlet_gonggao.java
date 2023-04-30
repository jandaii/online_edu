package myservlet.control;
import mybean.data.Bean_xinxibypage;
import com.sun.rowset.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class Servlet_gonggao extends HttpServlet{
   CachedRowSetImpl rowSet=null;
   public void init(ServletConfig config) throws ServletException{
      super.init(config);
      try {  Class.forName("com.mysql.jdbc.Driver");
      }
      catch(Exception e){} 
   }
   public void doPost(HttpServletRequest request,HttpServletResponse response) 
                        throws ServletException,IOException{
      request.setCharacterEncoding("UTF-8");
      HttpSession session=request.getSession(true); 
       String a = request.getParameter("a").trim();
      Connection con=null; 
      Bean_xinxibypage dataBean=null;
      try{ 
           dataBean=(Bean_xinxibypage)session.getAttribute("dataBean");
           if(dataBean==null){
              dataBean=new Bean_xinxibypage();  //创建Javabean对象
              session.setAttribute("dataBean",dataBean);
           }
      }
      catch(Exception exp){
           dataBean=new Bean_xinxibypage();  
           session.setAttribute("dataBean",dataBean);
      } 
     String uri="jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work?user=work&password=swufework&useUnicode=true&characterEncoding=gb2312";
        String user = "work";
        String password = "swufework";
      try{ 
           con=DriverManager.getConnection(uri,user,password);
           Statement sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                                                ResultSet.CONCUR_READ_ONLY);
           ResultSet rs=sql.executeQuery("SELECT * FROM Information where Information_type ='通知公告'");
           rowSet=new CachedRowSetImpl();   //创建行集对象
           rowSet.populate(rs);
           dataBean.setRowSet(rowSet);      //行集数据存储在dataBean中  
           con.close();                     //关闭连接
      }
      catch(SQLException exp){
           String backNews="莫名原因导致失败"+exp;
             dataBean.setBackNews(backNews); }
   if(a.equals("1")){
   RequestDispatcher dispatcher= 
      request.getRequestDispatcher("Guanli_gonggao.jsp");
      dispatcher.forward(request, response);}
  if(a.equals("2")){
   RequestDispatcher dispatcher= 
      request.getRequestDispatcher("Gonggao.jsp");
      dispatcher.forward(request, response);}
   
   }
   public void doGet(HttpServletRequest request,
              HttpServletResponse response) 
                        throws ServletException,IOException{
       doPost(request,response);
   }
}
