package myservlet.control;

import mybean.data.Bean_xinxi;
import java.sql.*;
import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;

public class Servlet_xinxi extends HttpServlet {

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
        Bean_xinxi xinxiBean = new Bean_xinxi();  //创建的Javabean模型
        request.setAttribute("xinxiBean", xinxiBean);
        String Information_type = request.getParameter("leixin").trim();
        String Information_title = request.getParameter("biaoti").trim();
        String Information_content = request.getParameter("neirong").trim();
        if (Information_content == null) {
            Information_content = "";
        }
        if (Information_title == null) {
            Information_title = "";
        }
        String backNews = "";
        try {
            con = DriverManager.getConnection(uri, user, password);
            String insertCondition = "INSERT INTO Information(Information_type,Information_title,Information_content) VALUES (?,?,?)";
            sql = con.prepareStatement(insertCondition);
            sql.setString(1, handleString(Information_type));
            sql.setString(2, handleString(Information_title));
            sql.setString(3, handleString(Information_content));
            int m = sql.executeUpdate();

            if (m != 0) {
                backNews = "信息发布成功";
                xinxiBean.setBackNews(backNews);
                xinxiBean.setInformation_type(handleString(Information_type));
                xinxiBean.setInformation_title(handleString(Information_title));
                xinxiBean.setInformation_content(handleString(Information_content));

            } else {
                backNews = "莫名原因导致发布失败";
                xinxiBean.setBackNews(backNews);
            }
            con.close();
        } catch (SQLException exp) {
            backNews = "莫名原因导致发布失败" ;
            xinxiBean.setBackNews(backNews);
        }
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("Guanli_xinxi.jsp");
        dispatcher.forward(request, response);//转发
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
