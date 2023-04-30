package myservlet.control;

import java.sql.*;
import java.io.*;
import mybean.data.Bean_teacher;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;

public class Servlet_teacher_change extends HttpServlet {

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
        Bean_teacher Bean_teacher = new Bean_teacher();  //创建的Javabean模型
        request.setAttribute("Bean_teacher", Bean_teacher);
        String t_name = request.getParameter("t_name").trim();
        String xueyuan = request.getParameter("xueyuan").trim();
        String no = request.getParameter("T_no").trim();
        String leixin = request.getParameter("leixin").trim();
        String t_no = request.getParameter("t_no").trim();
       
        int T_no = Integer.parseInt(t_no);
         int No = Integer.parseInt(no);
        try {
           
            con = DriverManager.getConnection(uri, user, password);
            String Sql = "select Teacher_No from teacher";

            PreparedStatement psmt = con.prepareStatement(Sql);
            ResultSet rs = psmt.executeQuery();
           while (rs.next()) {
                int Teacher_No = rs.getInt("Teacher_No");
               if (T_no == Teacher_No&&No!=Teacher_No) {
                    backNews = "该教工号已存在";
                    Bean_teacher.setBackNews(backNews);
                  RequestDispatcher dispatcher =
                          request.getRequestDispatcher("Guanli_Tzhanghu.jsp");
                   dispatcher.forward(request, response);//转发
                }}

                String updateCondition = "UPDATE teacher set Teacher_No="+T_no+",Teacher_name='"+t_name+"',college='" + xueyuan + "',title='" + leixin + "' where Teacher_No="+No+"";
                sql = con.prepareStatement(updateCondition);
                int m = sql.executeUpdate();
                if (m == 0) {
                     backNews="莫名原因失败";
                Bean_teacher.setBackNews(backNews);
                   RequestDispatcher dispatcher =
                request.getRequestDispatcher("Guanli_Tzhanghu.jsp");
        dispatcher.forward(request, response);//转发
                }
              con.close();
            }
            
         catch (SQLException exp) {
        }
        backNews="修改成功";
        Bean_teacher.setBackNews(backNews);
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("Guanli_Tzhanghu.jsp");
        dispatcher.forward(request, response);//转发
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}