/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mybean.data;

public class Bean_student {

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    String Student_name = "", Class_name = "", college = "", major = "",backNews="";
    int Student_No=0;
    public void setBackNews(String backNews) {
        this.backNews = backNews;
    }

    public String getBackNews() {
        return backNews;
    }
    public void setStudent_No(int Student_No) {
        this.Student_No = Student_No;
    }

    public int getStudent_No() {
        return Student_No;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getCollege() {
        return college;
    }
     public void setStudent_name(String Student_name) {
        this.Student_name = Student_name;
    }

    public String getStudent_name() {
        return Student_name;
    }

    public void setClass_name(String Class_name) {
        this.Class_name = Class_name;
    }

    public String getClass_name() {
        return Class_name;
    }
    public void setmajor(String major) {
        this.major = major;
    }

    public String getmajor() {
        return major;
    }
 public Bean_student(){}
    public Bean_student(String Student_name, String college, String major,String Class_name, int Student_No) {
        super();
        this.Student_name = Student_name;
         this.Class_name = Class_name;
        this.college = college;
        this.major = major;
        this.Student_No = Student_No;
    }
}
