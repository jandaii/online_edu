/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myservlet.control;

import java.awt.Color;

import java.awt.Font;
import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;
import mybean.data.DataByPage_hw;

import org.jfree.chart.ChartFactory;

import org.jfree.chart.ChartRenderingInfo;

import org.jfree.chart.ChartUtilities;

import org.jfree.chart.JFreeChart;

import org.jfree.chart.entity.StandardEntityCollection;

import org.jfree.chart.plot.PiePlot;

import org.jfree.chart.servlet.ServletUtilities;

import org.jfree.data.general.DefaultPieDataset;

import org.jfree.data.general.PieDataset;

 

public class DisplayChart {
 static int youxiu;
 static  int lianghao;
 static  int zhongdeng;
  static int jige;
  static int bujige;
    //在此方法内填入数据，key-value.value为数字。
 public void doPost(HttpServletRequest request,HttpServletResponse response) 
                        throws ServletException,IOException{
 Connection con=null; 
 String uri="jdbc:mysql://rm-2vcwo56w973ev4a09pm.mysql.cn-chengdu.rds.aliyuncs.com:3306/work";
     try{
           con=DriverManager.getConnection(uri,"work","swufework");
           Statement sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                                                ResultSet.CONCUR_READ_ONLY);
            String task_name= request.getParameter("taskname");
            ResultSet rs2=sql.executeQuery("SELECT SUM(Subject_score),Task_id From "
                   + "subject where Task_name='"+task_name+"'"
                   + " GROUP BY Task_name");
      
           ArrayList sum= new ArrayList();
           ArrayList t_id= new ArrayList();
        while (rs2.next()){
    sum.add(rs2.getFloat(1));
    t_id.add(rs2.getInt(2));
        } 
        for(int i = 0; i < sum.size(); i++) {
     //用get()方法返回的是Object类型

         Float Sum=(Float)sum.get(0);
         int T_id=(Integer)t_id.get(0);
        Float p1=Sum*0.9f;
        Float p2=Sum*0.8f;
        Float p3=Sum*0.7f;
        Float p4=Sum*0.6f;
        
         ResultSet rs3=sql.executeQuery("SELECT COUNT(Student_no) From "
                   + "OneScore where Task_id='"+T_id+"'AND Onescore>='"+p1+"'");
        
         while (rs3.next()){
          youxiu=rs3.getInt(1);
        } 
         ResultSet rs4=sql.executeQuery("SELECT COUNT(Student_no) From "
                   + "OneScore where Task_id='"+T_id+"'AND Onescore>='"+p2+"'AND Onescore<'"+p1+"'");
         while (rs4.next()){
         lianghao=rs4.getInt(1);
        } 
         ResultSet rs5=sql.executeQuery("SELECT COUNT(Student_no) From "
                   + "OneScore where Task_id='"+T_id+"'AND Onescore>='"+p3+"'AND Onescore<'"+p2+"'");
         while (rs5.next()){
         zhongdeng=rs5.getInt(1);
        } 
         ResultSet rs6=sql.executeQuery("SELECT COUNT(Student_no) From "
                   + "OneScore where Task_id='"+T_id+"'AND Onescore>='"+p4+"'AND Onescore<'"+p3+"'");
         while (rs6.next()){
         jige=rs6.getInt(1);
        } 
          ResultSet rs7=sql.executeQuery("SELECT COUNT(Student_no) From "
                   + "OneScore where Task_id='"+T_id+"'AND  Onescore<'"+p4+"'");
         while (rs7.next()){
          bujige=rs7.getInt(1);
        } 
        }
        
}   catch(SQLException exp){}
 
 }
    private static PieDataset createDataset()

    {   DefaultPieDataset   dpd=new DefaultPieDataset();
       
  
         
           
           


       dpd.setValue("A", youxiu);

       dpd.setValue("B", lianghao);

       dpd.setValue("C", zhongdeng);

       dpd.setValue("d",jige);

       dpd.setValue("E", bujige);

    
    
       return dpd;      
    }

   

    private static JFreeChart createChart(PieDataset dpd)

    {

       //JFreeChart jfc=ChartFactory.createPieChart3D("",dpd,true,true,false);  //这个有3D效果

       JFreeChart jfc=ChartFactory.createPieChart("",dpd,true,true,false);    //这个没有有3D效果

       jfc.setBackgroundPaint(Color.white);  //背景色
        

       jfc.getTitle().setFont(new Font("宋体",Font.BOLD,20));//设置标题字体

        PiePlot plot= (PiePlot) jfc.getPlot();//获取图表区域对象

        plot.setLabelFont(new Font("宋体",Font.BOLD,10));

        jfc.getLegend().setItemFont(new Font("宋体",Font.BOLD,10));
        plot.setBackgroundPaint(Color.white);
        // 前景色 透明度
       
       return jfc;

    }

   

    public static String generateBarChart(HttpSession session, PrintWriter pw)

    {

       String filename=null;

       PieDataset cd=createDataset();

       JFreeChart chart=createChart(cd);

       ChartRenderingInfo info=new ChartRenderingInfo(new StandardEntityCollection());

       try {

           filename=ServletUtilities.saveChartAsPNG(chart, 800, 400, info,session);//设置生成的图片的大小

           ChartUtilities.writeImageMap(pw, filename, info, false);

       } catch (Exception e) {

           e.printStackTrace();

       }

       pw.flush();

       return filename;

    }

}