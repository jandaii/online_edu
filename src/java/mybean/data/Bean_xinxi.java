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
public class Bean_xinxi {

    String Information_type = "", Information_title = "", Information_content = "",backNews="";

    public void setInformation_type(String Information_type) {
        this.Information_type = Information_type;
    }

    public String getInformation_type() {
        return Information_type;
    }

    public void setInformation_title(String Information_title) {
        this.Information_title = Information_title;
    }

    public String getInformation_title() {
        return Information_title;
    }

    public void setInformation_content(String Information_content) {
        this.Information_content = Information_content;
    }

    public String getInformation_content() {
        return Information_content;
    }
     public void setBackNews(String backNews){  
      this.backNews=backNews;
   }
   public String getBackNews(){  
      return backNews;
   }
}
