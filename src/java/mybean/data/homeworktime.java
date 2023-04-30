package mybean.data;	
import com.sun.rowset.CachedRowSetImpl;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class homeworktime {
    int Task_id=0;
     public void setTask_id(int Task_id){
       Task_id=Task_id;
    }
    public int getTask_id(){
       return Task_id;
    } 
    
    String Task_name="";
     public void setTask_name(String Task_name){
       this.Task_name=Task_name;
    }
    public String getTask_name(){
       return Task_name;
    } 
    
    String Task_start="";
     public void setTask_start(String Task_start){
       this.Task_start=Task_start;
    }
    public String getTask_start(){
       return Task_start;
    } 
    
    String Task_end="";
     public void setTask_end(String Task_end){
       this.Task_end=Task_end;
    }
    public String getTask_end(){
       return Task_end;
    } 
    
      
//    Timestamp createTime;
//     public void setCreateTime(Timestamp createTime) {
//        this.createTime = createTime;
//    }
//     public Timestamp getCreateTime() {
//        return createTime;
//    }

//    Date Timestamp;
//    Timestamp createTime;
//    public void setTimestamp(String Timestamp){
//       Timestamp=Timestamp;
//    }
//    public void getTimestamp(){
//        Timestamp=Timestamp;
//        Timestamp;
//        date.ctime(Timestamp)
//    } 
     
      CachedRowSetImpl rowSet=null;         //存储表中全部记录的行集对象
    public void setRowSet(CachedRowSetImpl set){
       rowSet=set;
    }
    public CachedRowSetImpl getRowSet(){
       return rowSet;
    }


    }

