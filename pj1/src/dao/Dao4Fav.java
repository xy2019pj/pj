package dao;

import entity.Item;

import java.util.ArrayList;

public class Dao4Fav {
    private static DAO dao=new DAO();

    public static ArrayList<Item> getFavByName(String username){
        String sql="select itemname from fav_pair where username=?";
        ArrayList<String> favItemNames=(ArrayList<String>) dao.getForValue(sql,username);
        ArrayList<Item> favItems=new ArrayList<>();
        for(int i=0;i<favItemNames.size();i++){
            Item item=Dao4Item.getItemByName(favItemNames.get(i));
            favItems.add(item);
        }
        return favItems;
    }

    public static ArrayList<Item> getOpenFavByName(String username){
        String sql="select itemname from fav_pair where username=? and open=?";
        ArrayList<String> favItemNames=(ArrayList<String>) dao.getForValue(sql,username,"1");
        ArrayList<Item> favItems=new ArrayList<>();
        for(int i=0;i<favItemNames.size();i++){
            Item item=Dao4Item.getItemByName(favItemNames.get(i));
            favItems.add(item);
        }
        return favItems;
    }

    public static void addFavByName(String username,String itemname){
        String sql="insert into fav_pair(username,itemname) values(?,?);";
        dao.update(sql,username, itemname);
    }

    public static void deleteFavByName(String username,String itemname){
        String sql="delete from fav_pair where username=? and itemname=?;";
        dao.update(sql,username, itemname);
    }

    public static void changeFavByName(String username,String itemname){
        ArrayList<Item> favItem=getFavByName(username);
        for(int i=0;i<favItem.size();i++)
            if(favItem.get(i).getName().equals(itemname)) {
                deleteFavByName(username, itemname);
                return;
            }
        addFavByName(username, itemname);
    }

    public static void openFavByName(String username,String itemname){
        String sql1="select open from fav_pair where username=? and itemname=?";
        String open=dao.getForValue(sql1,username,itemname).get(0);
        if(open.equals("1"))open="0";
        else open="1";
        String sql="update fav_pair set open=? where username=? and itemname=?;";
        dao.update(sql,open,username,itemname);
    }
}
