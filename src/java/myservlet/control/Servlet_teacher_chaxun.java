/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package myservlet.control;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import mybean.data.Bean_teacher;

public class Servlet_teacher_chaxun{
       public String handleString(String s) {
        try {
            byte bb[] = s.getBytes("iso-8859-1");
            s = new String(bb);
        } catch (Exception ee) {
        }
        return s;
    }
    public List<Bean_teacher> chaxun(String x,String y) {
      
        List<Bean_teacher> list = new ArrayList<Bean_teacher>();
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
           
            String sql = "select * from teacher where college='"+x+"' and title='"+y+"'";
            psmt = con.prepareStatement(sql);
            rs = psmt.executeQuery();

            while (rs.next()) {
                String Teacher_name = rs.getString("Teacher_name");
                String college = rs.getString("college");
                String title = rs.getString("title");
                int Teacher_No = rs.getInt("Teacher_No");
                Bean_teacher tl = new Bean_teacher(Teacher_name, college, title, Teacher_No);
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