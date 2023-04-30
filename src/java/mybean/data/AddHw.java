package mybean.data;


public class AddHw{  
   String  hw_name="" , select=""  ,begin_date="" , finish_date="",backNews="请输入题目";
int hw_no;

    public void setHw_no(int hw_no){  
      this.hw_no=hw_no;
   }
   public int getHw_no(){  
      return hw_no;
   }

public void setHw_name(String hw_name){  
      this.hw_name=hw_name;
   }
   public String getHw_name(){  
      return hw_name;
   }
   public void setSelect(String select){  
      this.select=select;
   }
   public String getSelect(){  
      return select;
   }
     public void setBegin_date(String begin_date){  
      this.begin_date=begin_date;
   }
   public String getBegin_date(){  
      return begin_date;
   }
   public void setFinish_date(String finish_date){  
      this.finish_date=finish_date;
   }
   public String getFinish_date(){  
      return finish_date;
   }
    public void setBackNews(String backNews){  
      this.backNews=backNews;
   }
   public String getBackNews(){  
      return backNews;
   }
   }