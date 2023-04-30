package myservlet.control;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import mybean.data.Bean_student;
public class Servlet_student_delete extends HttpServlet {
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
        String id = request.getParameter("id").trim();
        int ID=Integer.parseInt(id);
       
        try {
            con = DriverManager.getConnection(uri, user, password);
            String deleteCondition = "DELETE FROM  student where Student_No="+ID+"";
            sql = con.prepareStatement(deleteCondition);
            int m = sql.executeUpdate();
            if(m!=0){
                  Bean_student Bean_student = new Bean_student();  //创建的Javabean模型
        request.setAttribute("Bean_student", Bean_student);
        String backnews="删除成功";
        Bean_student.setBackNews(backnews);
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("Guanli_Szhanghu.jsp");
        dispatcher.forward(request, response);//转发
         
        
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