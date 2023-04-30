
package mybean.data;

public class Course{
    private String Course_id,Course_name,Course_time,backNews="";
    
    public String getCourse_id() {   
        return Course_id;   
    }   
   
    public void setCourse_id(String Course_id) {   
        this.Course_id = Course_id;   
    }
     public String getCourse_name() {   
        return Course_name;   
    }   
   
    public void setCourse_name(String Course_name) {   
        this.Course_name = Course_name;   
    }
    
     public String getCourse_time() {   
        return Course_time;   
    }   
   
    public void setCourse_time(String Course_time) {   
        this.Course_time = Course_time;   
    }
       
   public void setBackNews(String backNews){  
      this.backNews=backNews;
   }
   public String getBackNews(){  
      return backNews;
   }
}
