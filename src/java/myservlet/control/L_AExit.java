/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myservlet.control;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author dell
 */
public class L_AExit extends HttpServlet {
 
   public void init(ServletConfig config) throws ServletException{
      super.init(config);
   }
   public  void  doPost(HttpServletRequest request,HttpServletResponse response) 
                        throws ServletException,IOException {
       HttpSession session=request.getSession(true); 
       session.invalidate();              //销毁用户的session对象
       response.sendRedirect("L_Alogin.jsp"); //返回主页 
   }
   public  void  doGet(HttpServletRequest request,HttpServletResponse response) 
                        throws ServletException,IOException {
      doPost(request,response);
   }
}

