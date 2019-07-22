package entity;

import dao.Dao4Item;
import java.sql.Timestamp;

public class Item {
    private String name=null;
    private String category=null;
    private String picture=null;
    private Timestamp pushTime=null;
    private int clickNum=0;
    private String intro=null;

    public Item() { }

    public Item(String name, String category, String picture, Timestamp pushTime,int clickNum) {
        this.setName(name);
        this.setCategory(category);
        this.setPicture(picture);
        this.setPushTime(pushTime);
        this.clickNum=clickNum;
    }

    public int add(){
        Timestamp currentTime = new Timestamp(new java.util.Date().getTime());
        setPushTime(currentTime);
        setClickNum(0);
        return Dao4Item.addItem(this);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Timestamp getPushTime() {
        return pushTime;
    }

    public void setPushTime(Timestamp pushTime) {
        this.pushTime = pushTime;
    }

    public int getClickNum() {
        return clickNum;
    }

    public void setClickNum(int clickNum) {
        this.clickNum = clickNum;
    }

    public void addClickNum(){
        clickNum++;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }
}
