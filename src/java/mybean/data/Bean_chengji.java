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
public class Bean_chengji {

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    String college = "", major = "", Class_name = "", Student_name = "", Course_name = "", backNews = "";
    float  all_score=0.0f; int Student_no=0;

    public Bean_chengji() {
    }

    public Bean_chengji(String college, String major, String Class_name, String Student_name, String Course_name, Float all_score,int Student_no) {
        super();
       
        this.major = major;
        this.college = college;
        this.Class_name = Class_name;
        this.Student_name = Student_name;
        this.Course_name = Course_name;
        this.all_score = all_score;
         this.Student_no = Student_no;
    }

    public void setBackNews(String backNews) {
        this.backNews = backNews;
    }

    public String getBackNews() {
        return backNews;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getCollege() {
        return college;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getMajor() {
        return major;
    }

    public void setClass_name(String Class_name) {
        this.Class_name = Class_name;
    }

    public String getClass_name() {
        return Class_name;
    }

    public void setStudent_name(String Student_name) {
        this.Student_name = Student_name;
    }

    public String getStudent_name() {
        return Student_name;
    }

    public void setCourse_name(String Course_name) {
        this.Course_name = Course_name;
    }

    public String getCourse_name() {
        return Course_name;
    }
    public void setStudent_no(int Student_no) {
        this.Student_no = Student_no;
    }

    public int getStudent_no() {
        return Student_no;
    }

    public void setAll_score(Float all_score) {
        this.all_score = all_score;
    }

    public float getAll_score() {
        return all_score;
    }
}
