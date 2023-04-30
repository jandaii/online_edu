package myservlet.control;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import mybean.data.fb_bean;

public class fb_chaxun_Servlet{
       public String handleString(String s) {
        try {
            byte bb[] = s.getBytes("iso-8859-1");
            s = new String(bb);
        } catch (Exception ee) {
        }
        return s;
    }
    public List<fb_bean> chaxun() {
      
        List<fb_bean> list = new ArrayList<fb_bean>();
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
            String sql = "select * from sign_in";
            psmt = con.prepareStatement(sql);
            rs = psmt.executeQuery();

            while (rs.next()) {
                String course_name = rs.getString("course_name");
                String course_time = rs.getString("course_time");
                String qd_time = rs.getString("qd_time");
                fb_bean s = new fb_bean(course_name, course_time, qd_time);
                list.add(s);
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