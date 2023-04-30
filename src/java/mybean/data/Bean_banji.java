/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mybean.data;

import javax.ejb.Stateless;

/**
 *
 * @author 123
 */
@Stateless
public class Bean_banji {

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    String college="",major="", Class_name="",backNews="";
    int Class_id=0;
    public Bean_banji(){}
    public Bean_banji(String college, String major, String Class_name,int Class_id) {
        super();
        this.major = major;
        this.college = college;
        this.Class_name = Class_name;
      this.Class_id=Class_id;
    }
      public void setBackNews(String backNews){  
      this.backNews=backNews;
   }
   public String getBackNews(){  
      return backNews;
   }  public void setCollege(String college){  
      this.college=college;
   }
   public String getCollege(){  
      return college;
   }  public void setMajor(String major){  
      this.major=major;
   }
   public String getMajor(){  
      return major;
   }
      public void setClass_name(String Class_name){  
      this.Class_name=Class_name;
   }
   public String getClass_name(){  
      return Class_name;
   }
    public void setClass_id(int Class_id){  
      this.Class_id=Class_id;
   }
   public int getClass_id(){  
      return Class_id;
   }  
    

}
