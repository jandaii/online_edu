/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mybean.data;

public class Bean_teacher {

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    String Teacher_name = "", college = "", title = "", backNews = "";
    int Teacher_No=0;
    public void setBackNews(String backNews) {
        this.backNews = backNews;
    }

    public String getBackNews() {
        return backNews;
    }
    public void setTeacher_NO(int Teacher_No) {
        this.Teacher_No = Teacher_No;
    }

    public int getTeacher_No() {
        return Teacher_No;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getCollege() {
        return college;
    }
     public void setTitle(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }

    public void setTeacher_name(String Teacher_name) {
        this.Teacher_name = Teacher_name;
    }

    public String getTeacher_name() {
        return Teacher_name;
    }
 public Bean_teacher(){}
    public Bean_teacher(String Teacher_name, String college, String title, int Teacher_No) {
        super();
        this.Teacher_name = Teacher_name;
        this.college = college;
        this.title = title;
        this.Teacher_No = Teacher_No;
    }
}