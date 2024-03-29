package entity;

import dao.Dao4User;


import java.io.IOException;
import java.sql.Timestamp;


public class User {
    private int id;
    private char auth='n';
    private String username=null;
    private String password=null;
    private String email=null;
    private String intro=null;
    private Timestamp recent_login_time=null;

    public User(){}
    public User(String name,char auth, String password,String email,Timestamp recent_login_time) throws IOException {
        this.setUsername( name);
        this.setAuth(auth);
        this.setPassword(password);
        this.setEmail(email);
        this.setIntro("您暂时没有添加简介。");
        this.setRecent_login_time(recent_login_time);
    }

    public int login(){
        String password= Dao4User.getPwdByUser(this);
        if(password==null)
            return 1;//用户名不存在
        else if(!password.equals(this.getPassword()))
            return 2;//密码不正确
        else {
            Timestamp currentTime = new Timestamp(new java.util.Date().getTime());
            setRecent_login_time(currentTime);
            Dao4User.updateRecentTime(this);
            return 0;//登陆成功
        }
    }

    public int signup(){
        return Dao4User.addUser(this);
    }

    public int add(){
        return Dao4User.addUser(this);
    }
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    public char getAuth() {
        return auth;
    }

    public void setAuth(char auth) {
        this.auth = auth;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        if(intro!=null)this.intro = intro;
    }

    public Timestamp getRecent_login_time() {
        return recent_login_time;
    }

    public void setRecent_login_time(Timestamp recent_login_time) {
        if(recent_login_time!=null)
            this.recent_login_time = recent_login_time;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
