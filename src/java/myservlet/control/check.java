package myservlet.control;
import java.sql.*;
import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
public class check extends HttpServlet {
   public void init(ServletConfig config) throws ServletException { 
      super.init(config);
   }
   public String handleString(String s)
   {   try{ byte bb[]=s.getBytes("iso-8859-1");
            s=new String(bb);
       }
       catch(Exception ee){} 
       return s;  
   }
   public  void  doPost(HttpServletRequest request,HttpServletResponse response) 
                        throws ServletException,IOException {
      request.setCharacterEncoding("gb2312");
      String uri="jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work?user=work&password=swufework&useUnicode=true&characterEncoding=gb2312";
        String user = "work";
        String password = "swufework";
         Connection con=null; 
         Statement sql;
   
           
    
      String Sb_id= request.getParameter("sb_id");
      String sc= request.getParameter("check_score");
      String St_no= request.getParameter("st_no");
      int sb_id = Integer.parseInt(Sb_id);   
      int st_no = Integer.parseInt(St_no);
      int tk_id=0;
      Float score=Float.parseFloat(sc);
        try {
            con = DriverManager.getConnection(uri, user, password);
sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                   ResultSet.CONCUR_READ_ONLY);

       
      String UpdateCondition="UPDATE answer set student_score='"+score+"' where Student_No='"+st_no+"'AND Subject_id='"+sb_id+"'";
            int j=sql.executeUpdate(UpdateCondition); 
   ResultSet rs;
   rs=sql.executeQuery("SELECT Task_id FROM answer where Student_No='"+st_no+"' AND Subject_id='"+sb_id+"'");
      while(rs.next()){
          tk_id=rs.getInt(1);
      }
      String already="已批改";
           String UpdateCondition2="UPDATE onescore set check='"+already+"' where Student_No='"+st_no+"'AND Task_id='"+tk_id+"'";
            int o=sql.executeUpdate(UpdateCondition2); 
            con.close();
        } catch (SQLException exp) {
           System.out.print(exp);
        }
        String a = st_no+","+tk_id;
    request.setAttribute("a", a);
        
//重定向界面“importData” 项目请求配置path 路径
         RequestDispatcher dispatcher= 
      request.getRequestDispatcher("check_stu.jsp");
      dispatcher.forward(request, response);
     }
       
   }
  
