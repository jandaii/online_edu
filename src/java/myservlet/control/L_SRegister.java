package myservlet.control;

import java.io.IOException;
import java.sql.*;
import mybean.data.*;
import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author dell
 */
public class L_SRegister extends HttpServlet {
 public void init(ServletConfig config) throws ServletException { 
      super.init(config);
      try {  Class.forName("com.mysql.jdbc.Driver");
      }
      catch(Exception e){} 
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

        String uri="jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work?user=work&password=swufework&characterEncoding=gb2312" ;

      Connection con; 
      PreparedStatement sql; 
      L_Student userBean=new L_Student();  //创建的Javabean模型
      request.setAttribute("userBean",userBean);
      String Student_No=request.getParameter("Student_No").trim();
      String Student_name=request.getParameter("Student_name").trim();
      String Student_password=request.getParameter("Student_password").trim();
      String again_password=request.getParameter("again_password").trim();
      String Class_id=request.getParameter("Class_id").trim();
      
      if(Student_No==null)
          Student_No="";
      if(Student_name==null)
           Student_name="";
      if(Student_password==null)
           Student_password="";
       if(again_password==null)
           again_password="";
        if(Class_id==null)
           Class_id="";
      int class_id= Integer.parseInt(Class_id);
      int Student_no=Integer.parseInt(Student_No);
      if(!Student_password.equals(again_password)) { 
         userBean.setBackNews("两次密码不同，注册失败，");
         RequestDispatcher dispatcher= 
         request.getRequestDispatcher("L_Szhuce.jsp");
         dispatcher.forward(request, response);//转发
         return;
      }
      boolean isLD=true;
      for(int i=0;i<Student_No.length();i++){
          char c=Student_No.charAt(i);
           if(!((c<='z'&&c>='a')||(c<='Z'&&c>='A')||(c<='9'&&c>='0'))) 
             isLD=false;
      } 
      boolean boo=Student_No.length()>0&&Student_password.length()>0&&isLD;
      String backNews="";
      try{   con=DriverManager.getConnection(uri);
             String insertCondition="INSERT INTO Student VALUES (?,?,?,?)";
             sql=con.prepareStatement(insertCondition);
             if(boo)
             { 
               sql.setInt(1,Student_no);
               sql.setString(2,handleString(Student_name));
               sql.setString(3,handleString(Student_password));
               sql.setInt(4,class_id);
               
               int m=sql.executeUpdate();
               if(m!=0){
                  backNews="注册成功";
                  userBean.setBackNews(backNews);
                  userBean.setStudent_No(handleString(Student_No));
                  userBean.setStudent_name(Student_name);
                  userBean.setClass_id(handleString(Class_id));
               }
             }
             else {
                 backNews="信息填写不完整或名字中有非法字符";
                 userBean.setBackNews(backNews);  
             }
             con.close();
      }
      catch(SQLException exp){
             backNews=exp+"该名已被使用，请更换名字";
             userBean.setBackNews(backNews); 
      }
      RequestDispatcher dispatcher= 
      request.getRequestDispatcher("L_Szhuce.jsp");
      dispatcher.forward(request, response);//转发
   }
   public  void  doGet(HttpServletRequest request,HttpServletResponse response)
                        throws ServletException,IOException {
      doPost(request,response);
   }

}
