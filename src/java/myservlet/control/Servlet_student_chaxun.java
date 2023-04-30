/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package myservlet.control;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import mybean.data.Bean_student;

public class Servlet_student_chaxun{
       public String handleString(String s) {
        try {
            byte bb[] = s.getBytes("iso-8859-1");
            s = new String(bb);
        } catch (Exception ee) {
        }
        return s;
    }
    public List<Bean_student> chaxun(String x,String y,String z) {
      
        List<Bean_student> list = new ArrayList<Bean_student>();
        Connection con = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
        }

        try {
            String uri = "jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work?user=work&password=swufework&useUnicode=true&characterEncoding=gb2312";
            String user = "work";
            String password = "swufework";
            con = DriverManager.getConnection(uri, user, password);
           
             String sql = "select * from student,class where college='"+x+"' and major='"+y+"' and Class_name='"+z+"' and student.Class_id=class.Class_id";
            psmt = con.prepareStatement(sql);
            rs = psmt.executeQuery();

            while (rs.next()) {
                String Student_name = rs.getString("Student_name");
                String Class_name = rs.getString("Class_name");
                String college = rs.getString("college");
                String major = rs.getString("major");
                int Student_No = rs.getInt("Student_No");
                Bean_student tl = new Bean_student(Student_name, college, major, Class_name,Student_No);
                list.add(tl);
            }

        } catch (SQLException e) {
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (psmt != null) {
                    psmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
            }
        }
        return list;
    }
}