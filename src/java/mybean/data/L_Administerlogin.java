package mybean.data;
import java.util.*;

public class L_Administerlogin {
    private String Administer_No,Administer_name,Administer_password,backNews="";
    public L_Administerlogin(String Administer_No,String Administer_name, String Administer_password,String backNews) {   
        super();    
        this.Administer_No = Administer_No;
        this.Administer_name = Administer_name;   
        this.Administer_password = Administer_password;
        this.backNews = backNews;
    }   
   
    public L_Administerlogin() {   
        super();   
        // TODO Auto-generated constructor stub   
    }   
   
    public String getAdminister_No() {   
        return Administer_No;   
    }   
   
    public void setAdminister_No(String Administer_No) {   
        this.Administer_No = Administer_No;   
    } 
    
    public String getAdminister_name() {   
        return Administer_name;   
    }   
   
    public void setAdminister_name(String Administer_name) {   
        this.Administer_name = Administer_name;   
    }   
   
    public String getAdminister_password() {   
        return Administer_password;   
    }   
   
    public void setAdminister_password(String Administer_password) {   
        this.Administer_password = Administer_password;   
    }   
   public void setBackNews(String backNews){  
      this.backNews=backNews;
   }
   public String getBackNews(){  
      return backNews;
   }
}

