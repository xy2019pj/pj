package dao;

import java.util.ArrayList;

public class Dao4Friend {
    private static DAO dao=new DAO();

    public static ArrayList<String> getFriendsByName(String username){
        String sql="select friendname from friend_pair where username=?,available=1;";
        ArrayList<String> friends=(ArrayList<String>) dao.getForValue(sql,username);
        return friends;
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
        ArrayList<String> friends=getFriendsByName(username);
        for(int i=0;i<friends.size();i++)
            if(friends.get(i).equals(friName)) {
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
