/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package myservlet.control;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import mybean.data.Bean_chengji;

public class Servlet_chengji_daochu{
       public String handleString(String s) {
        try {
            byte bb[] = s.getBytes("iso-8859-1");
            s = new String(bb);
        } catch (Exception ee) {
        }
        return s;
    }
    public List<Bean_chengji> chaxun(String x,String y,String z) {
      
        List<Bean_chengji> list = new ArrayList<Bean_chengji>();
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
           
            String sql = "select * from student,course,allscore,class where college='"+x+"' and major='"+y+"' and Class_name='"+z+"' and student.Student_No=allscore.Student_No and course.Course_id=allscore.Course_id and student.Class_id=class.Class_id";
            psmt = con.prepareStatement(sql);
            rs = psmt.executeQuery();

            while (rs.next()) {
               
                String college = rs.getString("college");
                String major = rs.getString("major");
                String Class_name = rs.getString("Class_name");
                String Student_name = rs.getString("Student_name");
                String Course_name = rs.getString("Course_name");
                int Student_No=rs.getInt("Student_no");
                float all_score=rs.getFloat("all_score");
                Bean_chengji tl = new Bean_chengji(college, major, Class_name, Student_name,Course_name,all_score,Student_No);
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
