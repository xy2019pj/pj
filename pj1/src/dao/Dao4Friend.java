package dao;

import entity.User;

import java.util.ArrayList;

public class Dao4Friend {
    private static DAO dao=new DAO();

    public static ArrayList<User> getFriendsByName(String username){
        String sql="select friendname from friend_pair where username=? and available=1;";
        ArrayList<String> friends=(ArrayList<String>) dao.getForValue(sql,username);
        ArrayList<User> friendUser=new ArrayList<>();
        for(int i=0;i<friends.size();i++)
            friendUser.add(Dao4User.getUserByName(friends.get(i)));
        return friendUser;
    }
    public static void addFriendByName(String username,String friName){
        String sql="insert into friend_pair(username,friendname,available) values(?,?,1);";
        dao.update(sql,username, friName);
    }

    public static void deleteFriendByName(String username,String friName){
        String sql="delete from friend_pair where username=?,friendname=?;";
        dao.update(sql,username, friName);
    }

    public static void changeFriendsByName(String username,String friName){
        ArrayList<User> friends=getFriendsByName(username);
        for(int i=0;i<friends.size();i++)
            if(friends.get(i).getUsername().equals(friName)) {
                deleteFriendByName(username, friName);
                return;
            }
        addFriendByName(username, friName);
    }

    public static ArrayList<String> getRequestByName(String username){
        String sql="select username from friend_pair where friendname=?,available=0;";
        ArrayList<String> requests=(ArrayList<String>) dao.getForValue(sql,username);
        return requests;
    }

    public static void addRequestByName(String username,String friendname){
        String sql="insert into friend_pair(username,friendname,available) values(?,?,0);";
        dao.update(sql,username, friendname);
    }
}
