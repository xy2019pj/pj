package dao;

import entity.User;

import java.util.ArrayList;

public class Dao4Friend {
    private static DAO dao=new DAO();

    public static ArrayList<User> getFriendsByName(String username){
        String sql1="select friendname from friend_pair where username=? and available='1'";
        ArrayList<String> friends1=(ArrayList<String>) dao.getForValue(sql1,username);
        String sql2="select username from friend_pair where friendname=? and available='1';";
        ArrayList<String> friends2=(ArrayList<String>) dao.getForValue(sql2,username);
        ArrayList<User> friendUser=new ArrayList<>();
        for(int i=0;i<friends1.size();i++)
            friendUser.add(Dao4User.getUserByName(friends1.get(i)));
        for(int i=0;i<friends2.size();i++)
            friendUser.add(Dao4User.getUserByName(friends2.get(i)));
        return friendUser;
    }
    public static void addFriendByName(String username,String friName){
        String sql="update friend_pair set available=? where username=? and friendname=?";
        dao.update(sql,"1",friName,username);
    }

    public static void deleteFriendByName(String username,String friName){
        String sql1="delete from friend_pair where username=? and friendname=?;";
        String sql2="delete from friend_pair where friendname=? and username=?;";
        dao.update(sql1,username, friName);
        dao.update(sql2,username, friName);
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
        String sql="select username from friend_pair where friendname=? and available='0';";
        ArrayList<String> requests=(ArrayList<String>) dao.getForValue(sql,username);
        return requests;
    }

    public static void addRequestByName(String username,String friendname){
        String sql1="select friendname from friend_pair where username=? and available='0';";
        ArrayList<String> friends=(ArrayList<String>) dao.getForValue(sql1,username);
        if(friends.contains(friendname))
            return;
        String sql="insert into friend_pair(username,friendname,available) values(?,?,'0');";
        dao.update(sql,username, friendname);
    }
}
