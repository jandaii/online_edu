package myservlet.control;
import java.util.ArrayList;
import mybean.data.DataByPage_hw;
import com.sun.rowset.*;
import java.sql.*;
import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;
import org.python.core.Py;

import org.python.core.PyFunction;
import org.python.core.PyInteger;
import org.python.core.PyObject;
import org.python.core.PyString;
import org.python.util.PythonInterpreter;
public class Score extends HttpServlet{
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
public PythonInterpreter interpreter ;
public void start(){
		interpreter = new PythonInterpreter();
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
            
            ResultSet rs2=sql.executeQuery("SELECT Student_No,Subject_id,Task_id,student_answer,auto From answer");
           ArrayList student_no = new ArrayList();
           ArrayList subject_id = new ArrayList();
           ArrayList task_id = new ArrayList();
           ArrayList student_answer = new ArrayList();
           ArrayList auto = new ArrayList();
           //ArrayList auto = new ArrayList();
        while (rs2.next()){
    student_no.add(rs2.getInt(1));
    subject_id.add(rs2.getInt(2));
    task_id.add(rs2.getInt(3));
    student_answer.add(rs2.getString(4));
   auto.add(rs2.getString(5));
     
}   
        for(int i = 0; i < student_no.size(); i++) {
     //用get()方法返回的是Object类型

         int Student_no=(Integer)student_no.get(i);
         int Subject_id=(Integer)subject_id.get(i);
         int Task_id=(Integer)task_id.get(i);
         String Student_answer=(String)student_answer.get(i);
        String Auto=(String)auto.get(i);
         
      ResultSet rsAns=sql.executeQuery("SELECT Subject_name,Subject_type,Subject_score,answer,Task_id From subject"
              + " where Subject_id='"+Subject_id+"'");
     ArrayList Answer = new ArrayList();
     ArrayList Type = new ArrayList();
     ArrayList subject_score = new ArrayList();
      while (rsAns.next()){
    Answer.add(rsAns.getString(4));
    Type.add(rsAns.getString(2));
   subject_score.add(rsAns.getFloat(3));
  
   // auto.add(rs2.getString(6));   
}   
      String answer=(String)Answer.get(0); 
    String type=(String)Type.get(0);
    Float Subject_score=(Float)subject_score.get(0);
    
    if(type.equals("问答题")&&Auto.equals("是")){
        //PythonInterpreter interpreter = new PythonInterpreter();
   //interpreter.execfile("D:\\Study\\fifth\\presentation\\NetBeans\\score.py");
      //PyFunction func = (PyFunction) interpreter.get("score",PyFunction.class);
  
      //PyObject pyobj = func.__call__(new PyString(answer), new PyString(Student_answer));
        
     // Float score=Float.parseFloat(pyobj.toString());

   String cmds = String.format("python D://Study//fifth//presentation//NetBeans//un.py %s %s", 
                                    answer,Student_answer);

        // 执行CMD命令
        System.out.println("\nExecuting python script file now.");
        Process pcs = Runtime.getRuntime().exec(cmds);
        pcs.waitFor();

        // 定义Python脚本的返回值
        String result = null;
        // 获取CMD的返回流
        BufferedInputStream in = new BufferedInputStream(pcs.getInputStream());
        // 字符流转换字节流
        BufferedReader br = new BufferedReader(new InputStreamReader(in));
        // 这里也可以输出文本日志

        String lineStr = null;
        while ((lineStr = br.readLine()) != null) {
            result = lineStr;
        }
        if (result==null){
            result="0";
        }
        // 关闭输入流
        br.close();
        in.close();
        Float score=Float.parseFloat(result)*Subject_score;
      //Float score=3f;
      //int no=2;
      //int sid=111;
      String UpdateCondition="UPDATE answer set student_score='"+score+"' where Student_No='"+Student_no+"'AND Subject_id='"+Subject_id+"'";
            int j=sql.executeUpdate(UpdateCondition); 
    
    }
    else if(type.equals("选择题")){
        if(answer.equals(Student_answer)){
            
            String UpdateCondition="UPDATE answer set student_score='"+Subject_score+"' where Student_No='"+Student_no+"'AND Subject_id='"+Subject_id+"'";
            int j=sql.executeUpdate(UpdateCondition);
        }else{
            float score=0f;
            String UpdateCondition="UPDATE answer set student_score='"+score+"' where Student_No='"+Student_no+"'AND Subject_id='"+Subject_id+"'";
            int j=sql.executeUpdate(UpdateCondition); 
        }
    }else if(type.equals("判断题")){
        if(answer.equals(Student_answer)){
            
            String UpdateCondition="UPDATE answer set student_score='"+Subject_score+"' where Student_No='"+Student_no+"'AND Subject_id='"+Subject_id+"'";
            int j=sql.executeUpdate(UpdateCondition);
        }else{
            float score=0f;
            String UpdateCondition="UPDATE answer set student_score='"+score+"' where Student_No='"+Student_no+"'AND Subject_id='"+Subject_id+"'";
            int j=sql.executeUpdate(UpdateCondition); 
        }
    }else if(type.equals("填空题")){
        if(answer.equals(Student_answer)){
            
            String UpdateCondition="UPDATE answer set student_score='"+Subject_score+"' where Student_No='"+Student_no+"'AND Subject_id='"+Subject_id+"'";
            int j=sql.executeUpdate(UpdateCondition);
        }else{
            float score=0f;
            String UpdateCondition="UPDATE answer set student_score='"+score+"' where Student_No='"+Student_no+"'AND Subject_id='"+Subject_id+"'";
            int j=sql.executeUpdate(UpdateCondition); 
        }
    }
     // String UpdateCondition="UPDATE task set sum='"+sum+"' where Task_name='"+Task_name+"'";
           // int j=sql.executeUpdate(UpdateCondition);
         
        }
        
        
         ResultSet rs=sql.executeQuery("SELECT * FROM task");
             
          rowSet=new CachedRowSetImpl();   //创建行集对象
           rowSet.populate(rs);
          dataBean.setRowSet(rowSet);      //行集数据存储在dataBean中 
          
          
         Statement sql1_1; 
    sql1_1=con.createStatement();
        ResultSet rst_id=sql1_1.executeQuery("SELECT DISTINCT Task_id From answer");
      while(rst_id.next()){
            int Task_id=rst_id.getInt(1); 
            
            
          Statement sql1_2; 
    sql1_2=con.createStatement();
        ResultSet rsAdd=sql1_2.executeQuery("SELECT SUM(student_score),Student_No From answer GROUP BY Student_No HAVING Task_id='"+Task_id+"'");
     
          
      while (rsAdd.next()){
   Float Onescore=rsAdd.getFloat(1);
    int Student_No=rsAdd.getInt(2);
   // int Subject_id=rsAdd.getInt(3); 
   // String St_score=rsAdd.getString(4);
   // String Auto=rsAdd.getString(5); 
  

    
    Statement sql2; 
    sql2=con.createStatement();
 ResultSet rs_sub=sql2.executeQuery("SELECT Subject_id,Auto From subject where Taskt_id='"+Task_id+"'");
    while (rs_sub.next()){
   int sb_id=rs_sub.getInt(1);
   String at=rs_sub.getString(2);
   
  

  Statement sql3; 
  sql3=con.createStatement();

 ResultSet rsNull=sql3.executeQuery("SELECT Subject_type From subject where Subject_id='"+sb_id+"'");
       while(rsNull.next()){
           String Subject_type=rsNull.getString(1);
       
 Statement sql4; 
  sql4=con.createStatement();

 ResultSet rsif=sql4.executeQuery("SELECT * From onescore where Student_no='"+Student_No+"' AND Task_id='"+Task_id+"'");          
if (rsif!=null){
          if((Subject_type.equals("编程题"))||(Subject_type.equals("问答题")&&at.equals("否"))){
              String un="主观题未批改";
               Statement sql5; 
                 sql5=con.createStatement();
             String insertCondition="insert into OneScore values"+"('"+Student_No+"','"+Task_id+"','"+Onescore+"','"+un+"')";
             int len = sql5.executeUpdate(insertCondition);
      
          }else{
               String al="已批改";
                Statement sql6; 
                 sql6=con.createStatement();
               String insertCondition="insert into OneScore values"+"('"+Student_No+"','"+Task_id+"','"+Onescore+"','"+al+"')";
             int len = sql6.executeUpdate(insertCondition);
          }}else{
     Statement sql7; 
                 sql7=con.createStatement();
    String UpdateCondition="UPDATE onescore set onescore='"+Onescore+"' where Student_No='"+Student_No+"'AND Task_id='"+Task_id+"'";
            int j=sql7.executeUpdate(UpdateCondition);
    
}
      }}}
      }
  
            
     
         
       
           
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
      catch(SQLException exp){} catch (InterruptedException ex) {
              Logger.getLogger(Score.class.getName()).log(Level.SEVERE, null, ex);
          }
      
     
      response.sendRedirect("hw_analyse.jsp");//重定向到byPageShow.jsp
   } 
   }
   public void doGet(HttpServletRequest request,
              HttpServletResponse response) 
                        throws ServletException,IOException{
       doPost(request,response);
   }
}