package mybean.data;
import com.sun.rowset.*; 

public class answer {
    
    int Student_No=0;
     public void setStudent_No(int Student_No){
       Student_No=Student_No;
    }
    public int getStudent_No(){
       return Student_No;
    } 
    
    int Subject_id=0;
     public void setSubject_id(int Subject_id){
       Subject_id=Subject_id;
    }
    public int getSubject_id(){
       return Subject_id;
    } 
    
    int Task_id=0;
     public void setTask_id(int Task_id){
       Task_id=Task_id;
    }
    public int getTask_id(){
       return Task_id;
    } 
    
    String student_answer="";
     public void setStudent_answer(String student_answer){
       this.student_answer=student_answer;
    }
    public String getStudent_answer(){
       return student_answer;
    } 
    
     float Student_score=0;
     public void setStudent_score(float Student_score){
       Student_score=Student_score;
    }
    public float getStudent_score(){
       return Student_score;
    }     
    
    CachedRowSetImpl rowSet=null;         //存储表中全部记录的行集对象
    public void setRowSet(CachedRowSetImpl set){
       rowSet=set;
    }
    public CachedRowSetImpl getRowSet(){
       return rowSet;
    }
    
}
 