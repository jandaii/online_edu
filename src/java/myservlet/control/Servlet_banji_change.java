package myservlet.control;

import java.sql.*;
import java.io.*;
import mybean.data.Bean_banji;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;

public class Servlet_banji_change extends HttpServlet {

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public String handleString(String s) {
        try {
            byte bb[] = s.getBytes("iso-8859-1");
            s = new String(bb);
        } catch (Exception ee) {
        }
        return s;
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("gb2312");
        String uri = "jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work?user=work&password=swufework&useUnicode=true&characterEncoding=gb2312";
        String user = "work";
        String password = "swufework";
        Connection con;
        PreparedStatement sql;
        String backNews = "";
         try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
        }
        Bean_banji Bean_banji = new Bean_banji();  //创建的Javabean模型
        request.setAttribute("Bean_banji", Bean_banji);
        String college = request.getParameter("college").trim();
        String major = request.getParameter("major").trim();
        String Class_name = request.getParameter("Class_name").trim();
        String Class_id = request.getParameter("Class_id").trim();
      
       
        int C_no = Integer.parseInt(Class_id);
         
        try {
           
            con = DriverManager.getConnection(uri, user, password);
       
                String updateCondition = "UPDATE class set college='"+college+"',major='" + major + "',Class_name='" + Class_name + "' where Class_id="+C_no+"";
                sql = con.prepareStatement(updateCondition);
                int m = sql.executeUpdate();
                if (m == 0) {
                   RequestDispatcher dispatcher =
                request.getRequestDispatcher("Guanli_banjiguanli.jsp");
        dispatcher.forward(request, response);//转发
                }
              con.close();
            }
            
         catch (SQLException exp) {
        }
        Bean_banji.setBackNews(backNews);
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("Guanli_banjiguanli.jsp");
        dispatcher.forward(request, response);//转发
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
