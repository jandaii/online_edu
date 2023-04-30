package myservlet.control;
import mybean.data.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HandleAddwork extends HttpServlet{
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
        
        String quesType="";
      
     String uri="jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work?user=work&password=swufework&useUnicode=true&characterEncoding=gb2312" ;
      
      Connection con; 
      PreparedStatement sql;
     try{con=DriverManager.getConnection(uri);
      //String condition="select Task_id from task where Task_name = '"+hw_name+"' ";
             
      Addwork userBean2=new Addwork();  //创建的Javabean模型
      request.setAttribute("userBean2",userBean2);
      quesType=request.getParameter("quesType").trim();
       String hw_name=request.getParameter("hw_name").trim();
      String quesname=request.getParameter("quesname").trim();
      String quesscore=request.getParameter("quesscore").trim();
      String quescontent=request.getParameter("quescontent").trim();
      String quesanswer=request.getParameter("quesanswer").trim();
    
    
   
      String other1=request.getParameter("other1").trim();
      String other2=request.getParameter("other2").trim();
      String other3=request.getParameter("other3").trim();
      String other4=request.getParameter("other4").trim();
      
      if(quesscore==null)
           quesscore="";
        if(hw_name==null)
           hw_name="";
      if(quesname==null)
           quesname="";
       if(quescontent==null)
           quescontent="";
      if(quesanswer==null)
           quesanswer="";
        if(other1==null)
           other1="";
          if(other2==null)
           other2="";
            if(other3==null)
           other3="";
             if(other4==null)
           other4="";
      
      if(quesType.equals("选择题")&&(other1.equals("")||other2.equals("")||other3.equals("")||other4.equals(""))) { 
         userBean2.setBackNews("选择题未添加完选项");
         RequestDispatcher dispatcher= 
         request.getRequestDispatcher("ques_option.jsp");
         dispatcher.forward(request, response);//转发
         return;
      }
      boolean isLD=true;
      for(int i=0;i<quesscore.length();i++){
          char c=quesscore.charAt(i);
           if(!(c<='9'&&c>='0')) 
             isLD=false;
      } 
      boolean boo=quesscore.length()>0&&quesname.length()>0&&quescontent.length()>0&&quesanswer.length()>0&&isLD;
      String backNews="";
      try{   
          
          con=DriverManager.getConnection(uri);
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
               sql.setString(8, handleString(other1));
               sql.setString(9, handleString(other2));
               sql.setString(10, handleString(other3));
               sql.setString(11, handleString(other4));
               sql.setInt(12,0);
               int m=sql.executeUpdate();
               if(m!=0){
                  backNews="添加成功";
                  userBean2.setBackNews(backNews);
                  userBean2.setHw_name(hw_name);
                  userBean2.setQuesname(quesname);
                  userBean2.setQuescontent(handleString(quescontent));
                  userBean2.setQuesType(handleString(quesType));
                  userBean2.setQuesscore(handleString(quesscore));
                   userBean2.setQuesanswer(handleString(quesanswer));
               }
            }
             else {
                 backNews="信息填写不完整或有非法字符";
                 userBean2.setBackNews(backNews);  
             }
             con.close();
      } 
     
      catch(SQLException exp){
            System.out.print(exp);
             backNews=exp+"题目名已被使用，请您更换名字";
             userBean2.setBackNews(backNews); 
      }}catch(SQLException exp){
          String backNews=""+exp;
          
      }
     
       
//重定向界面“importData” 项目请求配置path 路径

         RequestDispatcher dispatcher= 
      request.getRequestDispatcher("ques_option.jsp");
      dispatcher.forward(request, response);
    
    

    }}//转发}