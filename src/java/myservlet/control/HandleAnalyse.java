package myservlet.control;
import java.util.ArrayList;
import mybean.data.DataByPage_hw;
import com.sun.rowset.*;
import java.sql.*;
import java.io.*;
import java.text.DecimalFormat;
import javax.servlet.*;
import javax.servlet.http.*;
public class HandleAnalyse extends HttpServlet{
   CachedRowSetImpl rowSet=null;
   public void init(ServletConfig config) throws ServletException{
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
    public static String txfloat(float a,int b) {
	    // TODO 自动生成的方法存根
	 
	    DecimalFormat df=new DecimalFormat("0.00");//设置保留位数
 
	    return df.format((float)a/b);
	   
	}
   public void doPost(HttpServletRequest request,HttpServletResponse response) 
                        throws ServletException,IOException{
      request.setCharacterEncoding("gb2312");
      String idNumber= request.getParameter("fenleiNumber");
      if(idNumber == null){
          idNumber = "0";
      int id = Integer.parseInt(idNumber);    
      HttpSession session=request.getSession(true); 
      Connection con=null; 
      DataByPage_hw dataBean=null;
      try{ 
           dataBean=(DataByPage_hw)session.getAttribute("dataBean");
           if(dataBean==null){
              dataBean=new DataByPage_hw();  //创建Javabean对象
              session.setAttribute("dataBean",dataBean);
           }
      }
      catch(Exception exp){
           dataBean=new DataByPage_hw();  
           session.setAttribute("dataBean",dataBean);
      } 
      String uri="jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work";
      try{ 
           con=DriverManager.getConnection(uri,"work","swufework");
           Statement sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                                                ResultSet.CONCUR_READ_ONLY);
          // ResultSet rs=sql.executeQuery("SELECT Task_name,COUNT(DISTINCT Student_No) From "
                 //  + "task,answer "
                  // + " WHERE task.Task_id=answer.Task_id GROUP BY Task_name");
            
            ResultSet rs2=sql.executeQuery("SELECT Task_name,SUM(Subject_score) From "
                   + "subject "
                   + " GROUP BY Task_name");
           ArrayList task_name = new ArrayList();
           ArrayList Sum = new ArrayList();
        while (rs2.next()){
    task_name.add(rs2.getString(1));
     Sum.add(rs2.getFloat(2));
}   
        for(int i = 0; i < task_name.size(); i++) {
     //用get()方法返回的是Object类型

         Float sum=(Float)Sum.get(i);
     String Task_name=(String)task_name.get(i);
     
      String UpdateCondition="UPDATE task set sum='"+sum+"' where Task_name='"+Task_name+"'";
            int j=sql.executeUpdate(UpdateCondition);
         
        }
           
           ResultSet rs3=sql.executeQuery("SELECT Task_name,COUNT(DISTINCT Student_No),SUM(student_score) From "
                  + "task,answer "
                   + " WHERE task.Task_id=answer.Task_id GROUP BY Task_name");
           
               ArrayList task_name2 = new ArrayList();
           ArrayList Count = new ArrayList();
           ArrayList Sumscore=new ArrayList();
           while (rs3.next()){
    task_name2.add(rs3.getString(1));
     Count.add(rs3.getInt(2));
      Sumscore.add(rs3.getFloat(3));
}   
        for(int i = 0; i < task_name2.size(); i++) {
     //用get()方法返回的是Object类型

     int count=(Integer)Count.get(i);
     String Task_name2=(String)task_name2.get(i);
     Float sumscore=(Float)Sumscore.get(i);
     String aver= txfloat(sumscore,count);
     Float avg=Float.parseFloat(aver);
      String UpdateCondition="UPDATE task set count='"+count+"' ,avg='"+avg+"'where Task_name='"+Task_name2+"'";
            int j=sql.executeUpdate(UpdateCondition);
         
        }
            
     
         ResultSet rs=sql.executeQuery("SELECT * FROM task");
             
           rowSet=new CachedRowSetImpl();   //创建行集对象
           rowSet.populate(rs);
           dataBean.setRowSet(rowSet);      //行集数据存储在dataBean中 
         
       
           
          // for(int i = 0; i < task_name.size(); i++) {
               
           // String Task_name = (String)task_name.get(i); 
            //Float sum = (Float)Sum.get(i); 
           // String Task_name = "Hello"; 
           // Float sum =4f; 
           // String UpdateCondition="UPDATE task set sum='"+sum+"' where Task_name='"+Task_name+"'";
            //int j=sql.executeUpdate(UpdateCondition);
           
          // }
            //boo=rowSet.next();
          
        // }
    // }
           

             //String Task_name = (String)task_name.get(1); 
           // Float sum =5f; 
            //String UpdateCondition="UPDATE task set sum='"+sum+"' where Task_name='"+Task_name+"'";
            //int j=sql.executeUpdate(UpdateCondition);
           
         
         
         //rowSet=new CachedRowSetImpl();   //创建行集对象
           //rowSet.populate(rs);
           //dataBean.setRowSet(rowSet);      //行集数据存储在dataBean中 
       
    

         
        
         
        /* for(int i = 0; i < task_name.size(); i++) {
               
           //String Task_name = (String)task_name.get(i); 
            //Float sum = (Float)Sum.get(i); 
            String Task_name = "上课啦"; 
           Float sum =4f; 
           String UpdateCondition="UPDATE task set sum='"+sum+"' where Task_name='"+Task_name+"'";
            int j=sql.executeUpdate(UpdateCondition);
           
           }*/
       
 
         con.close(); 
        
                             //关闭连接
      }
      catch(SQLException exp){}
      
     
      response.sendRedirect("hw_analyse.jsp");//重定向到byPageShow.jsp
   } 
   }
   public void doGet(HttpServletRequest request,
              HttpServletResponse response) 
                        throws ServletException,IOException{
       doPost(request,response);
   }
}