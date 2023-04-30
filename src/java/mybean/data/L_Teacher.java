package mybean.data;

public class L_Teacher {
    private String Teacher_No,Teacher_id,Teacher_name,Teacher_password,college,title,backNews="请输入信息";   
   
    public L_Teacher(String Teacher_No,String Teacher_id, String Teacher_name, String Teacher_password,String college,String title,String backNews) {   
        super();   
        this.Teacher_No = Teacher_No;
        this.Teacher_id = Teacher_id;   
        this.Teacher_name = Teacher_name;   
        this.Teacher_password = Teacher_password;   
        this.college = college;
        this.title = title;
        this.backNews = backNews;
    }   
   
    public L_Teacher() {   
        super();   
        // TODO Auto-generated constructor stub   
    }   
   
    public String getTeacher_id() {   
        return Teacher_id;   
    }   
   
    public void setTeacher_id(String Teacher_id) {   
        this.Teacher_id = Teacher_id;   
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
    
      public String getCollege() {   
        return college;   
    }   
   
    public void setCollege(String college) {   
        this.college = college;   
    }   
   public void setTitle(String title){  
      this.title=title;
   }
   public String getTitle(){  
      return title;
   }
   public void setBackNews(String backNews){  
      this.backNews=backNews;
   }
   public String getBackNews(){  
      return backNews;
   }
}   
