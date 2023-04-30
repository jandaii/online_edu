package myservlet.control;

import mybean.data.Bean_student;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Servlet_student_add extends HttpServlet {

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

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uri = "jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work?user=work&password=swufework&useUnicode=true&characterEncoding=gb2312";
        String user = "work";
        String password = "swufework";
        int class_id = 1;
        Connection con;
        PreparedStatement sql;
        Bean_student Bean_student = new Bean_student();  //创建的Javabean模型
        request.setAttribute("Bean_student", Bean_student);
        String Student_name = request.getParameter("s_name").trim();
        String college = request.getParameter("college").trim();
        String major = request.getParameter("major").trim();
        String Class_name = request.getParameter("Class_name").trim();
        String s_no = request.getParameter("s_no").trim();
        if (Student_name
                == null) {
            Student_name = "";
        }
        if (college
                == null) {
            college = "";
        }
        if (major
                == null) {
            major = "";
        }

        if (Class_name
                == null) {
            Class_name = "";
        }
        if (s_no
                == null) {
            s_no = "";
        }
        String backNews = "";
        int S_no = Integer.parseInt(s_no);


        try {
            con = DriverManager.getConnection(uri, user, password);
            String Sql = "select Student_No from student";
            PreparedStatement psmt = con.prepareStatement(Sql);
            ResultSet rs = psmt.executeQuery();
            while (rs.next()) {
                int Student_No = rs.getInt("Student_No");
                if (S_no == Student_No) {
                    backNews = "该学号已存在";
                    Bean_student.setBackNews(backNews);
                    RequestDispatcher dispatcher =
                            request.getRequestDispatcher("Guanli_Szhanghu_add.jsp");
                    dispatcher.forward(request, response);//转发
                }
            }
            String SQl = "select Class_id from class where college='" + college + "' and major='" + major + "' and Class_name='" + Class_name + "' ";
            PreparedStatement Psmt = con.prepareStatement(SQl);
            ResultSet Rs = Psmt.executeQuery();
            while (Rs.next()) {
                class_id = Rs.getInt("Class_id");
            }
            String insertCondition = "INSERT INTO student VALUES (?,?,?,?)";
            sql = con.prepareStatement(insertCondition);

            sql.setInt(1, S_no);
            sql.setString(2, handleString(Student_name));
            sql.setString(3, "123456");
            sql.setInt(4, class_id);

            int m = sql.executeUpdate();

            if (m != 0) {
                backNews = "添加学生信息成功成功";


            } else {
                backNews = "莫名原因导致添加失败";

            }
            con.close();
        } catch (SQLException exp) {
            backNews = "莫名原因导致添加失败";

        }
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("Guanli_Szhanghu_add.jsp");

        dispatcher.forward(request, response);//转发
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}