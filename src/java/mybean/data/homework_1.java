package mybean.data;
import com.sun.rowset.*; 

public class homework_1 {
    
    int Task_name=0;
     public void setTask_name(int Task_name){
       Task_name=Task_name;
    }
    public int getTask_name(){
       return Task_name;
    } 
    
    String Subject_name="";
     public void setSubject_name(String Subject_name){
       this.Subject_name=Subject_name;
    }
    public String getSubject_name(){
       return Subject_name;
    } 
    
    String Subject_content="";
     public void setSubject_content(String Subject_content){
       this.Subject_content=Subject_content;
    }
    public String getSubject_content(){
       return Subject_content;
    } 
    
     String Subject_type="";
     public void setSubject_type(String Subject_type){
       this.Subject_type=Subject_type;
    }
    public String getSubject_type(){
       return Subject_type;
    } 
    
     float Subject_score=0;
     public void setSubject_score(float Subject_score){
       Subject_score=Subject_score;
    }
    public float getSubject_score(){
       return Subject_score;
    }     
    
    CachedRowSetImpl rowSet=null;         //存储表中全部记录的行集对象
    public void setRowSet(CachedRowSetImpl set){
       rowSet=set;
    }
    public CachedRowSetImpl getRowSet(){
       return rowSet;
    }
    
}
 