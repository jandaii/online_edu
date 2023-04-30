package myservlet.control;

import mybean.data.Bean_teacher;
import java.sql.*;
import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;

public class Servlet_teacher_add extends HttpServlet {

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
       String uri="jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work?user=work&password=swufework&useUnicode=true&characterEncoding=gb2312";
        String user = "work";
        String password = "swufework";
        Connection con;
        PreparedStatement sql;
        Bean_teacher Bean_teacher = new Bean_teacher();  //创建的Javabean模型
        request.setAttribute("Bean_teacher", Bean_teacher);
        String college = request.getParameter("xueyuan").trim();
        String leixin = request.getParameter("leixin").trim();
        String t_name = request.getParameter("t_name").trim();
          String t_no = request.getParameter("t_no").trim();
        
        if (college == null) {
            college = "";
        }
        if (leixin == null) {
            leixin = "";
        }
        if (t_name == null) {
            t_name = "";
        }
         if (t_no == null) {
            t_no = "";
        }
        String backNews = "";
         int T_no=Integer.parseInt(t_no);
        try {
            con = DriverManager.getConnection(uri, user, password);
              String Sql = "select Teacher_NO from teacher";
            PreparedStatement psmt = con.prepareStatement(Sql);
            ResultSet rs = psmt.executeQuery();
               while (rs.next()) {
                     int Teacher_No = rs.getInt("Teacher_No");
                     if(T_no==Teacher_No){
                         backNews = "该教工号已存在";
                         Bean_teacher.setBackNews(backNews);
                          RequestDispatcher dispatcher =
                request.getRequestDispatcher("Guanli_Tzhanghu_add.jsp");
        dispatcher.forward(request, response);//转发
                     }
            String Sl = "select Class_id from class where college='"+college+"'";
            PreparedStatement Psmt = con.prepareStatement(Sl);
            ResultSet Ps = Psmt.executeQuery();
               while (!Ps.next()) {
                         backNews = "该学院不存在";
                         Bean_teacher.setBackNews(backNews);
                          RequestDispatcher dispatcher =
                request.getRequestDispatcher("Guanli_Tzhanghu_add.jsp");
        dispatcher.forward(request, response);//转发
                     }
               }
            String insertCondition = "INSERT INTO teacher(Teacher_NO,Teacher_name,Teacher_Password,college,title) VALUES (?,?,?,?,?)";
            sql = con.prepareStatement(insertCondition);
           
            sql.setInt(1,T_no);
            sql.setString(2, handleString(t_name));
            sql.setString(3,"123456");
            sql.setString(4,handleString(college));
            sql.setString(5,handleString(leixin));
            int m = sql.executeUpdate();

            if (m != 0) {
                backNews = "添加教师信息成功成功";
                

            } else {
                backNews = "莫名原因导致添加失败";
               
            }
            con.close();
        } catch (SQLException exp) {
            backNews = "莫名原因导致添加失败";
          
        }
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("Guanli_Tzhanghu_add.jsp");
        dispatcher.forward(request, response);//转发
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}