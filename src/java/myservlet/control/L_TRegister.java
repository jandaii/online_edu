package myservlet.control;

import mybean.data.L_Teacher;
import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class L_TRegister extends HttpServlet {
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
       L_Teacher userBean=new L_Teacher();  //创建的Javabean模型
      request.setAttribute("userBean",userBean);
      String Teacher_No=request.getParameter("Teacher_No").trim();
      String Teacher_name=request.getParameter("Teacher_name").trim();
      String Teacher_password=request.getParameter("Teacher_password").trim();
      String again_password=request.getParameter("again_password").trim();
      String college=request.getParameter("college").trim();
      String title=request.getParameter("title").trim();
      if(Teacher_No==null)
           Teacher_No=""; 
      if(Teacher_name==null)
           Teacher_name="";
      if(Teacher_password==null)
           Teacher_password="";
      if(college==null)
           college="";
      if(title==null)
           title="";
       int Teacher_no=Integer.parseInt(Teacher_No);
      if(!Teacher_password.equals(again_password)) { 
         userBean.setBackNews("两次密码不同，注册失败，");
         RequestDispatcher dispatcher= 
         request.getRequestDispatcher("L_Tzhuce.jsp");
         dispatcher.forward(request, response);//转发
         return;
      }
      boolean isLD=true;
      for(int i=0;i<Teacher_No.length();i++){
          char c=Teacher_No.charAt(i);
           if(!((c<='z'&&c>='a')||(c<='Z'&&c>='A')||(c<='9'&&c>='0'))) 
             isLD=false;
      } 
      boolean boo=Teacher_No.length()>0&&Teacher_password.length()>0&&isLD;
      String backNews="";
      try{   con=DriverManager.getConnection(uri);
             String insertCondition="INSERT INTO Teacher VALUES (?,?,?,?,?)";
             sql=con.prepareStatement(insertCondition);
             if(boo)
             { 
               sql.setInt(1,Teacher_no);
               sql.setString(2,handleString(Teacher_name));
               sql.setString(3,handleString(Teacher_password));
               sql.setString(4,handleString(college));
               sql.setString(5, handleString(title));
               
               int m=sql.executeUpdate();
               if(m!=0){
                  backNews="注册成功";
                  userBean.setBackNews(backNews);
                  userBean.setTeacher_No(Teacher_No);
                  userBean.setTeacher_name(Teacher_name);
                  userBean.setCollege(handleString(college));
                  userBean.setTitle(handleString (title));
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
      request.getRequestDispatcher("L_Tzhuce.jsp");
      dispatcher.forward(request, response);//转发
   }
   public  void  doGet(HttpServletRequest request,HttpServletResponse response)
                        throws ServletException,IOException {
      doPost(request,response);
   }

}
