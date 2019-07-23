package dao;

import entity.Item;
import entity.User;

import java.util.ArrayList;

public class Dao4User {
    private static DAO dao=new DAO();

    public static User getActuserByUser(User user){
        String sql="select * from user_account where username=?";
        String username=user.getUsername();
        User actUser=dao.get(User.class,sql,username);
        return actUser;
    }
    public static User getUserByName(String username){
        String sql="select * from user_account where username=?";
        User actUser=dao.get(User.class,sql,username);
        return actUser;
    }

    public static ArrayList<User> getUserBySearch(String search){
        String sql="select * from user_account where username like ?";
        ArrayList<User> users=(ArrayList<User>) dao.getForList(User.class,sql,
                "%"+search+"%");
        return users;
    }

    public static String getPwdByUser(User user){
        User actUser=getActuserByUser(user);
        if(actUser==null)
            return null;
        else
            return actUser.getPassword();
    }

    public static int addUser(User user){
        if(getActuserByUser(user)!=null)
            return 1;
        String sql="insert into user_account(username,auth,password,email)" +
                "values(?,?,?,?)";
        dao.update(sql,
                user.getUsername(),
                user.getAuth(),
                user.getPassword(),
                user.getEmail());
        return 0;
    }

    public static void deleteUser(String username){
        String sql="delete from user_account where username=?";
        dao.update(sql,username);
    }
    public static void changeAuthByName(User user) {
        char auth=user.getAuth();
        char newAuth=0;
        if(auth=='a')
            newAuth='n';
        if(auth=='n')
            newAuth='a';
        String sql = "update user_account " +
                "set auth=?" +
                " where username=?,auth=?";
        dao.update(sql,newAuth,user.getUsername(),auth);
    }

    public static void changeUserByName(String oldname,User newUser){
        String sql="update user_account " +
                "set username=?,password=?,email=?,intro=?" +
                " where username=?";
        dao.update(sql,
                newUser.getUsername(),
                newUser.getPassword(),
                newUser.getEmail(),
                newUser.getIntro(),
                oldname
        );
    }

    public static ArrayList<User> getAllUser(){
        String sql="select * from user_account;";
        ArrayList<User> allUser=(ArrayList<User>) dao.getForList(User.class,sql);
        return allUser;
    }

    public static void updateRecentTime(User user){
        String sql="update user_account " +
                "set recent_login_time=?" +
                " where username=?";
        dao.update(sql,user.getRecent_login_time(),user.getUsername());
    }
}
