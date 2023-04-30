package mybean.data;

public class L_Student {
    private String Student_No,Student_id,Student_name,Student_password,Class_id,backNews="请输入信息";
    public L_Student(String Student_No,String Student_id, String Student_name, String Student_password,String Class_id,String backNews) {   
        super(); 
        this.Student_No = Student_No;
        this.Student_id = Student_id;   
        this.Student_name = Student_name;   
        this.Student_password = Student_password;
        this.Class_id = Class_id;
        this.backNews = backNews;
    }   
   
    public L_Student() {   
        super();   
        // TODO Auto-generated constructor stub   
    }   
   
    public String getStudent_id() {   
        return Student_id;   
    }   
   
    public void setStudent_id(String Student_id) {   
        this.Student_id = Student_id;   
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
   public void setClass_id(String Class_id){  
      this.Class_id=Class_id;
   }
   public String getClass_id(){  
      return Class_id;
   }
   public void setBackNews(String backNews){  
      this.backNews=backNews;
   }
   public String getBackNews(){  
      return backNews;
   }
}
