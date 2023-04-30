package myservlet.control;
import mybean.data.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HandleAddwork_ans extends HttpServlet{
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
     String uri="jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work?user=work&password=swufework&useUnicode=true&characterEncoding=gb2312" ;
      Connection con; 
      PreparedStatement sql; 
      Addwork_ans userBean3=new Addwork_ans();  //创建的Javabean模型
      request.setAttribute("userBean3",userBean3);
      String quesType=request.getParameter("quesType").trim();
      String hw_name=request.getParameter("hw_name").trim();
      String quesname=request.getParameter("quesname").trim();
      String quesscore=request.getParameter("quesscore").trim();
      String quescontent=request.getParameter("quescontent").trim();
      String quesanswer=request.getParameter("quesanswer2");

   
	if(hw_name==null)
           hw_name="";	
      if(quesscore==null)
           quesscore="";
      if(quesname==null)
           quesname="";
       if(quescontent==null)
           quescontent="";
        if(quesanswer==null)
           quesanswer="";
        
      
      
      boolean isLD=true;
      for(int i=0;i<quesscore.length();i++){
          char c=quesscore.charAt(i);
           if(!(c<='9'&&c>='0')) 
             isLD=false;
      } 
      boolean boo=quesscore.length()>0&&quesname.length()>0&&quescontent.length()>0&&isLD;
      String backNews="";
      try{   con=DriverManager.getConnection(uri);
             String insertCondition="INSERT INTO subject VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
             sql=con.prepareStatement(insertCondition);
             if(boo)
             { 
               sql.setInt(1,0); 
               sql.setString(2,handleString(hw_name));
               sql.setString(3,handleString(quesname));
               sql.setString(4,handleString(quescontent));
               sql.setString(5,handleString(quesType));
               sql.setString(6,handleString(quesscore));
               sql.setString(7,handleString(quesanswer));
               sql.setString(8, "");
               sql.setString(9,"");
               sql.setString(10, "");
               sql.setString(11, "");
               sql.setInt(12,0);
               int m=sql.executeUpdate();
               if(m!=0){
                  backNews="添加成功";
                  userBean3.setBackNews(backNews);
                  userBean3.setHw_name(hw_name);
                  userBean3.setQuesname(quesname);
                  userBean3.setQuescontent(handleString(quescontent));
                  userBean3.setQuesType(handleString(quesType));
                  userBean3.setQuesscore(handleString(quesscore));
                   userBean3.setQuesanswer(handleString(quesanswer));
               }
            }
             else {
                 backNews="信息填写不完整或有非法字符";
                 userBean3.setBackNews(backNews);  
             }
             con.close();
      }
      catch(SQLException exp){
            System.out.print(exp);
             backNews=exp+"题目名已被使用，请您更换名字";
             userBean3.setBackNews(backNews); 
      }
     
      RequestDispatcher dispatcher= 
      request.getRequestDispatcher("ques_space.jsp");
      dispatcher.forward(request, response);}//转发

}