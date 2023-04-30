package myservlet.control;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import mybean.data.*;
import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class L_TpasswordH extends HttpServlet {
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

    private L_TpasswordH() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection con;
        Statement sql;
        HttpSession session = request.getSession(true);
        L_Tpassword updateBean2 = new L_Tpassword(); //创建的Javabean模型
        request.setAttribute("updateBean2", updateBean2);
        String Teacher_No = request.getParameter("Teacher_No").trim();
        int teacher_no=Integer.parseInt(Teacher_No);
        String Teacher_password = request.getParameter("Teacher_password").trim();
        String newTeacher_password = request.getParameter("newTeacher_password").trim();
        String againnewTeacher_password = request.getParameter("againnewTeacher_password").trim();
        String uri = "jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work?user=work&password=swufework&characterEncoding=gb2312";
        String backNews = "";
       
        try {
            con = DriverManager.getConnection(uri);
            String condition = "select Teacher_password from teacher where Teacher_No = '" + teacher_no + "'";
            sql = con.createStatement();
            ResultSet rs = sql.executeQuery(condition);   
            ArrayList teacher_pass = new ArrayList();
            while(rs.next()) {
                teacher_pass.add(rs.getString(1));
            }
                String Teacher_pass=(String)teacher_pass.get(0);
                if (Teacher_pass.equals(Teacher_password)) {

                    if (newTeacher_password.equals(againnewTeacher_password)) {
                        backNews = "密码修改成功！";
                        updateBean2.setBackNews(backNews);
                        try {
                            String UpdateCondition="UPDATE teacher set Teacher_password='"+newTeacher_password+"' where Teacher_No='"+teacher_no+"'";
                           int j=sql.executeUpdate(UpdateCondition);
                         
                            con.close();
                        } catch (Exception e) {
                            
                        }
                    } else {
                        backNews = "两次输入密码不一致！";
                        updateBean2.setBackNews(backNews);
                        request.setAttribute("backNews", backNews);
                        request.getRequestDispatcher("tea_password.jsp").forward(request, response);
                    }
                   
                      request.getRequestDispatcher("tea_password.jsp").forward(request, response);
                }
            
        } catch (Exception e) {
            e.printStackTrace();
             backNews = "e";
                        updateBean2.setBackNews(backNews);
        }

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

}
