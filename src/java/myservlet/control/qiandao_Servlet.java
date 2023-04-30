package myservlet.control;

import mybean.data.qd_bean_stu;      //引入bean文件
import java.io.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.*;
import javax.servlet.http.*;

public class qiandao_Servlet extends HttpServlet {

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
        request.setCharacterEncoding("gb2312");
        String uri = "jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work?user=work&password=swufework&useUnicode=true&characterEncoding=gb2312";
        String user = "work";
        String password = "swufework";
        Connection con;
        PreparedStatement sql;
        String news = "";
        qd_bean_stu qd_bean_stu = new qd_bean_stu();                      //创建的Javabean模型
        request.setAttribute("qd_bean_stu", qd_bean_stu);
        String Sign_in_id = request.getParameter("Sign_in_id").trim();
        String Student_id = request.getParameter("Student_id").trim();
        String if_sign_in = request.getParameter("if_sign_in").trim();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

}
