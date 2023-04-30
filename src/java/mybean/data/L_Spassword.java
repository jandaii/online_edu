package mybean.data;

public class L_Spassword {
    String Student_password,newStudent_password="";
   String backNews="";
   
    public String getStudent_password() {   
        return Student_password;   
    }   
   
    public void setStudent_password(String Student_password) {   
        this.Student_password = Student_password;   
    }   
    
    public String getNewStudent_password() {   
        return newStudent_password;   
    }   
   
    public void setNewStudent_password(String newStudent_password) {   
        this.newStudent_password = newStudent_password;   
    }   
   
   public void setBackNews(String backNews){  
      this.backNews=backNews;
   }
   public String getBackNews(){  
      return backNews;
   }
}

