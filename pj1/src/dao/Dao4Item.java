package dao;

import entity.Item;
import java.util.ArrayList;

public class Dao4Item {
    private static final int HOTNUM=3;
    private static DAO dao=new DAO();


    public static ArrayList<Item> getHotItems(){
        String sql="select * from item_info order by clickNum DESC;";
        ArrayList<Item> allItems=null;
        allItems=(ArrayList<Item>) dao.getForList(Item.class,sql);
        ArrayList<Item> hotItems=new ArrayList<>();
        for(int i=0;i<HOTNUM;i++){
            hotItems.add(allItems.get(i));
        }
        return hotItems;
    }

    public static ArrayList<Item> getItemsByCategory(String category){
        String sql=null;
        ArrayList<Item> items=null;
        if(category.equals("全部")) {
            sql = "select * from item_info;";
            items=(ArrayList<Item>) dao.getForList(Item.class,sql);
        }
        else{
            sql="select * from item_info where category=?";
            items=(ArrayList<Item>)dao.getForList(Item.class,sql,category);
        }
        return items;
    }

    public static ArrayList<Item> getItemsBySearch(String content){
        // to do
        return null;
    }

    public static Item getItemByName(String name){
        String sql="select * from item_info where name=?";
        Item item=dao.get(Item.class,sql,name);
        return item;
    }

    public static void increaseClickNum(String itemName){
        String sql="update item_info set clickNum=clickNum+1 where name=?";
        dao.update(sql,itemName);
    }

    public static int addItem(Item item){
        if(getItemByName(item.getName())!=null)
            return 1;
        String sql="insert into item_info(name,category,clickNum,picture,pushTime,intro)" +
                "values(?,?,?,?,?,?)";
        dao.update(sql,
                item.getName(),
                item.getCategory(),
                item.getClickNum(),
                item.getPicture(),
                item.getPushTime(),
                item.getIntro()
        );
        return 0;
    }
    public static void deleteItem(String itemName){
        String sql="delete from item_info where name=?";
        dao.update(sql,itemName);
    }

    public static void changeItem(String oldname,Item item){
        String sql="update item_info " +
                "set name=?,category=?,picture=?,intro=?" +
                " where username=?";
        dao.update(sql,
                item.getName(),
                item.getCategory(),
                item.getPicture(),
                item.getIntro(),
                oldname
        );
    }
}
