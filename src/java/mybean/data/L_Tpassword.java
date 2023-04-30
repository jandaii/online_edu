
package mybean.data;

public class L_Tpassword {
    String Teacher_password,newTeacher_password="";
   String backNews="";
   
    public String getTeacher_password() {   
        return Teacher_password;   
    }   
   
    public void setTeacher_password(String Teacher_password) {   
        this.Teacher_password = Teacher_password;   
    }   
    
    public String getNewTeacher_password() {   
        return newTeacher_password;   
    }   
   
    public void setNewTeacher_password(String newTeacher_password) {   
        this.newTeacher_password = newTeacher_password;   
    }   
   
   public void setBackNews(String backNews){  
      this.backNews=backNews;
   }
   public String getBackNews(){  
      return backNews;
   }
}
