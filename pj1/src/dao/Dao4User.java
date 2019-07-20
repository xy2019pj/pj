package dao;

import entity.User;

public class Dao4User {
    private static DAO dao=new DAO();

    public static User getActuserByUser(User user){
        String sql="select * from user_account where username=?,auth=?;";
        String username=user.getUsername();
        char auth=user.getAuth();
        User actUser=dao.get(User.class,sql,username,auth);
        return actUser;
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
}
