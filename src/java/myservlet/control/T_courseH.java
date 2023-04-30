
package myservlet.control;
import mybean.data.*;
import java.util.*;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class T_courseH extends HttpServlet {

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception e) {
        }
    }

    public String handleString(String s) {
        try {
            byte bb[] = s.getBytes("iso-8859-1");
            s = new String(bb);
        } catch (Exception ee) {
        }
        return s;
    }
    
   private T_courseH() {
        super();
        // TODO Auto-generated constructor stub
    } 
   public  void  doPost(HttpServletRequest request,HttpServletResponse response) 
                        throws ServletException,IOException {
         String Course_name1 = request.getParameter("Coursename").trim();
        String Course_name= handleString(Course_name1);
        Course courBean = new Course();  //创建的Javabean模型
        request.setAttribute("courBean",courBean );
        courBean.setBackNews(Course_name);
             
                if(Course_name.equals("数学")){
                    RequestDispatcher dispatcher=request.getRequestDispatcher("course1.jsp");//转发
                    dispatcher.forward(request,response);
                }
                else if(Course_name.equals("英语")){
                    RequestDispatcher dispatcher=request.getRequestDispatcher("course2.jsp");//转发
                    dispatcher.forward(request,response);
                }
                else if(Course_name.equals("语文")){
                    RequestDispatcher dispatcher=request.getRequestDispatcher("course1.jsp");//转发
                    dispatcher.forward(request,response);
                }
                else if(Course_name.equals("政治")){
                    RequestDispatcher dispatcher=request.getRequestDispatcher("course2.jsp");//转发
                    dispatcher.forward(request,response);
                }

        RequestDispatcher dispatcher=request.getRequestDispatcher("tea_course.jsp");//转发
            dispatcher.forward(request,response);
    }
   
   public  void  doGet(HttpServletRequest request,HttpServletResponse response)
                        throws ServletException,IOException {
      doPost(request,response);
   }
}
