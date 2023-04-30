package myservlet.control;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import mybean.data.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class L_SpasswordH extends HttpServlet {

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

    private L_SpasswordH() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection con;
        Statement sql;
        HttpSession session = request.getSession(true);
        L_Spassword updateBean = new L_Spassword(); //创建的Javabean模型
        request.setAttribute("updateBean", updateBean);
        String Student_No = request.getParameter("Student_No").trim();
        int student_no=Integer.parseInt(Student_No);
        String Student_password = request.getParameter("Student_password").trim();
        String newStudent_password = request.getParameter("newStudent_password").trim();
        String againnewStudent_password = request.getParameter("againnewStudent_password").trim();
        String uri = "jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work?user=work&password=swufework&characterEncoding=gb2312";
        String backNews = "";
       
        try {
            con = DriverManager.getConnection(uri);
            String condition = "select Student_password from student where Student_No = '" + student_no + "'";
            sql = con.createStatement();
            ResultSet rs = sql.executeQuery(condition);   
            ArrayList student_pass = new ArrayList();
            while(rs.next()) {
                student_pass.add(rs.getString(1));
            }
                String Student_pass=(String)student_pass.get(0);
                if (Student_pass.equals(Student_password)) {

                    if (newStudent_password.equals(againnewStudent_password)) {
                        backNews = "密码修改成功！";
                        updateBean.setBackNews(backNews);
                        try {
                            String UpdateCondition="UPDATE student set Student_password='"+newStudent_password+"' where Student_No='"+student_no+"'";
                           int j=sql.executeUpdate(UpdateCondition);
                         
                            con.close();
                        } catch (Exception e) {
                            
                        }
                    } else {
                        backNews = "两次输入密码不一致！";
                        updateBean.setBackNews(backNews);
                        request.setAttribute("backNews", backNews);
                        request.getRequestDispatcher("stu_password.jsp").forward(request, response);
                    }
                   
                      request.getRequestDispatcher("stu_password.jsp").forward(request, response);
                }
            
        } catch (Exception e) {
            e.printStackTrace();
             backNews = "e";
                        updateBean.setBackNews(backNews);
        }

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

}
