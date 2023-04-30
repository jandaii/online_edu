package mybean.data;
import java.util.*;
public class L_Teacherlogin {
    private String Teacher_No,Teacher_name,Teacher_password,backNews="";
    public L_Teacherlogin(String Teacher_name, String Teacher_password,String backNews) {   
        super(); 
        this.Teacher_No = Teacher_No;
        this.Teacher_name = Teacher_name;   
        this.Teacher_password = Teacher_password;
        this.backNews = backNews;
    }   
   
    public L_Teacherlogin() {   
        super();   
        // TODO Auto-generated constructor stub   
    }   
   
    public String getTeacher_No() {   
        return Teacher_No;   
    }   
   
    public void setTeacher_No(String Teacher_No) {   
        this.Teacher_No = Teacher_No;   
    } 
    
    public String getTeacher_name() {   
        return Teacher_name;   
    }   
   
    public void setTeacher_name(String Teacher_name) {   
        this.Teacher_name = Teacher_name;   
    }   
   
    public String getTeacher_password() {   
        return Teacher_password;   
    }   
   
    public void setTeacher_password(String Teacher_password) {   
        this.Teacher_password = Teacher_password;   
    }   
   public void setBackNews(String backNews){  
      this.backNews=backNews;
   }
   public String getBackNews(){  
      return backNews;
   }
}