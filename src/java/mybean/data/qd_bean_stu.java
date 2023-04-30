package mybean.data;

public class qd_bean_stu {

    int Sign_in_id;    //签到个数
    String Student_id;
    String if_sign_in;
    String[] ip;

    public void setSign_in_id(int s) {
        Sign_in_id = s;
    }

    public int getSign_in_id() {
        return Sign_in_id;
    }

    public void setStudent_id(String s) {
        Student_id = s;
    }

    public String getStudent_id() {
        return Student_id;
    }

    public void setIf_sign_in(String s) {
        if_sign_in = s;
    }

    public String getIf_sign_in() {
        return if_sign_in;
    }

//    public String getIp() {
//        return ip;
//    }
//    public void setIp(String[] s) {
//        ip = s;
//    }
}
