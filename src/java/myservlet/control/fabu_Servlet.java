package myservlet.control;
import mybean.data.fb_bean;      //引入bean文件
import java.io.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.*;

public class fabu_Servlet extends HttpServlet {

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

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession(true);
//        request.setCharacterEncoding("gb2312");
        String uri = "jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work?user=work&password=swufework&useUnicode=true&characterEncoding=gb2312";
        String user = "work";
        String password = "swufework";
        Connection con;
        PreparedStatement sql;
        fb_bean qd_bean = new fb_bean();          //创建javabean对象
        request.setAttribute("qd_bean", qd_bean);
        String course_name = request.getParameter("course_name").trim();
        String course_time = request.getParameter("course_time").trim();
        String qd_time = request.getParameter("qd_time").trim();
        if (course_name == null) {
            course_name = "";
        }
        if (course_time == null) {
            course_time = "";
        }
        if (qd_time == null) {
            qd_time = "";
        }
        String news = "";
        try {
            con = DriverManager.getConnection(uri, user, password);
            String insertCondition = "INSERT INTO sign_in(course_name,course_time,qd_time) VALUES (?,?,?)";           //表的名字
            sql = con.prepareStatement(insertCondition);
            sql.setString(1, handleString(course_name));
            sql.setString(2, handleString(course_time));
            sql.setString(3, handleString(qd_time));
            int n = sql.executeUpdate();

            if (n != 0) {
                news = "签到发布成功";
                qd_bean.setNews(news);
                qd_bean.setCourse_name(course_name);
                qd_bean.setCourse_time(course_time);
                qd_bean.setQd_time(qd_time);

            } else {
                news = "签到发布失败";
                qd_bean.setNews(news);
            }
            con.close();
        } catch (SQLException exp) {
            news = "莫名原因导致添加失败" + exp;
            qd_bean.setNews(news);
        }
        RequestDispatcher dispatcher
                = request.getRequestDispatcher("fb_chenggong.jsp");
        dispatcher.forward(request, response);                    //转发
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
