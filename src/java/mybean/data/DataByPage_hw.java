package mybean.data;
import com.sun.rowset.*; 
public class DataByPage_hw{
    CachedRowSetImpl rowSet=null;         //存储表中全部记录的行集对象
    int pageSize=1;                      //每页显示的记录数
    int totalPages=1;                     //分页后的总页数
    int currentPage =1   ;   
    String hw_name="是空";//当前显示页 
    public void setRowSet(CachedRowSetImpl set){
       rowSet=set;
    }
    public CachedRowSetImpl getRowSet(){
       return rowSet;
    }
    public void setPageSize(int size){
       pageSize=size;
    }
    public int getPageSize(){
       return pageSize;
    } 
    public int getTotalPages(){
       return totalPages;
    } 
    public void setTotalPages(int n){
       totalPages=n; 
    }
    public void setCurrentPage(int n){
       currentPage =n;
    }
    public int getCurrentPage(){
       return currentPage ;
    }
     public void setHw_name(String hw_name){
      hw_name=hw_name;
    }
    public String getHw_name(){
       return hw_name ;
    }
}
