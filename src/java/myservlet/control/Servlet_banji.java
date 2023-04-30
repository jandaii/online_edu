package myservlet.control;

import mybean.data.Bean_banji;
import java.sql.*;
import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;

public class Servlet_banji extends HttpServlet {

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
        Bean_banji Bean_banji = new Bean_banji();  //创建的Javabean模型
        request.setAttribute("Bean_banji", Bean_banji);
        String College = request.getParameter("xueyuan").trim();
        String Major = request.getParameter("zhuanye").trim();
        String Banjix = request.getParameter("banjix").trim();
        String college=handleString(College);
        String major=handleString(Major);
         String banjix=handleString(Banjix);
        if (college == null) {
            college = "";
        }
        if (major == null) {
            major = "";
        }
        if (banjix == null) {
            banjix = "";
        }
        String backNews = "";
        try {con = DriverManager.getConnection(uri, user, password);
                String Sql = "select * from class where college='"+college+"' and major='"+major+"' and Class_name='"+banjix+"'";
             PreparedStatement psmt = con.prepareStatement(Sql);
            ResultSet rs = psmt.executeQuery();
             while (rs.next()) {
              
                    backNews = "该班级已存在";
                    Bean_banji.setBackNews(backNews);
                    RequestDispatcher dispatcher =
                            request.getRequestDispatcher("Guanli_banji.jsp");
                    dispatcher.forward(request, response);//转发
               
            }
            
            String insertCondition = "INSERT INTO Class(college,major,Class_name) VALUES (?,?,?)";
            sql = con.prepareStatement(insertCondition);
           
            sql.setString(1, handleString(college));
            sql.setString(2, handleString(major));
            sql.setString(3, handleString(banjix));
            int m = sql.executeUpdate();

            if (m != 0) {
                backNews = "添加班级成功";
                Bean_banji.setBackNews(backNews);
                Bean_banji.setCollege(handleString(college));
                Bean_banji.setMajor(handleString(major));
                Bean_banji.setClass_name(handleString(banjix));

            } else {
                backNews = "莫名原因导致添加失败";
                Bean_banji.setBackNews(backNews);
            }
            con.close();
        } catch (SQLException exp) {
            backNews = "莫名原因导致添加失败" + exp;
            Bean_banji.setBackNews(backNews);
        }
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("Guanli_banji.jsp");
        dispatcher.forward(request, response);//转发
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
