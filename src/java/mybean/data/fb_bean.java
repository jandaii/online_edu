package mybean.data;
import javax.ejb.Stateless;

public class fb_bean {
    String course_name="";
    String course_time="";
    String qd_time="";
    String news="";

    public fb_bean() {
    }
    public fb_bean(String course_name, String course_time, String qd_time) {
        super();
        this.course_name = course_name;
        this.course_time = course_time;
        this.qd_time = qd_time;
    }
    public void setCourse_name(String s) {
        course_name = s;
    }
    public String getCourse_name() {
        return course_name;
    }
    public void setCourse_time(String s) {
        course_time = s;
    }
    public String getCourse_time() {
        return course_time;
    }
    public void setQd_time(String s) {
        qd_time = s;
    }
    public String getQd_time() {
        return qd_time;
    }
    public void setNews(String s) {
        news = s;
    }
    public String getNews() {
        return news;
    }
}
