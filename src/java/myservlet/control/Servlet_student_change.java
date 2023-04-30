package myservlet.control;

import java.sql.*;
import java.io.*;
import mybean.data.Bean_student;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;

public class Servlet_student_change extends HttpServlet {

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
        int class_id = 1;
        Connection con;
        PreparedStatement sql;
        String backNews = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
        }
        Bean_student Bean_student = new Bean_student();  //创建的Javabean模型
        request.setAttribute("Bean_student", Bean_student);
        String s_name = request.getParameter("s_name").trim();
        String college = request.getParameter("xueyuan").trim();
        String no = request.getParameter("S_no").trim();
        String major = request.getParameter("major").trim();
        String class_name = request.getParameter("class").trim();
        String s_no = request.getParameter("s_no").trim();

        int S_no = Integer.parseInt(s_no);
        int No = Integer.parseInt(no);
        try {

            con = DriverManager.getConnection(uri, user, password);
            String Sql = "select Student_No from student";

            PreparedStatement psmt = con.prepareStatement(Sql);
            ResultSet rs = psmt.executeQuery();
            while (rs.next()) {
                int Student_No = rs.getInt("Student_No");
                if (S_no == Student_No && No != Student_No) {
                    backNews = "该教工号已存在";
                    Bean_student.setBackNews(backNews);
                    RequestDispatcher dispatcher =
                            request.getRequestDispatcher("index.jsp");
                    dispatcher.forward(request, response);//转发
                }
            }
            String SQl = "select Class_id from class where college='" + college + "' and major='" + major + "' and Class_name='" + class_name + "' ";
            PreparedStatement Psmt = con.prepareStatement(SQl);
            ResultSet Rs = Psmt.executeQuery();
            while (Rs.next()) {
                class_id = Rs.getInt("Class_id");
            }
            String updateCondition = "UPDATE student set Student_No="+S_no+ ",Student_name='" + s_name + "',Class_id=" + class_id + " where Student_No="+No+"";
            sql = con.prepareStatement(updateCondition);
            int m = sql.executeUpdate();
            if (m == 0) {
                backNews="莫名原因失败";
                Bean_student.setBackNews(backNews);
                RequestDispatcher dispatcher =
                        request.getRequestDispatcher("Guanli_Szhanghu.jsp");
                dispatcher.forward(request, response);//转发
            }
            con.close();
        } catch (SQLException exp) {
        }
        backNews="修改成功";
        Bean_student.setBackNews(backNews);
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("Guanli_Szhanghu.jsp");
        dispatcher.forward(request, response);//转发
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}