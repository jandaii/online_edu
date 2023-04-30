package mybean.data;
import java.util.*;
public class L_Studentlogin {
    private String Student_No,Student_name,Student_password,backNews="";
    public L_Studentlogin(String Student_No,String Student_name, String Student_password,String backNews) {   
        super();    
        this.Student_No = Student_No;
        this.Student_name = Student_name;   
        this.Student_password = Student_password;
        this.backNews = backNews;
    }   
   
    public L_Studentlogin() {   
        super();   
        // TODO Auto-generated constructor stub   
    }   
   
   
    
    public String getStudent_No() {   
        return Student_No;   
    }   
   
    public void setStudent_No(String Student_No) {   
        this.Student_No = Student_No;   
    }   
    
    public String getStudent_name() {   
        return Student_name;   
    }   
   
    public void setStudent_name(String Student_name) {   
        this.Student_name = Student_name;   
    }   
   
    public String getStudent_password() {   
        return Student_password;   
    }   
   
    public void setStudent_password(String Student_password) {   
        this.Student_password = Student_password;   
    }   
   public void setBackNews(String backNews){  
      this.backNews=backNews;
   }
   public String getBackNews(){  
      return backNews;
   }
}