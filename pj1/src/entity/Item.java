package entity;

import java.sql.Date;

public class Item {
    private String name=null;
    private String category=null;
    private String picture=null;
    private Date pushTime=null;
    private int clickNum=0;
    private String intro=null;

    public Item() { }

    public Item(String name, String category, String picture, Date pushTime,int clickNum) {
        this.setName(name);
        this.setCategory(category);
        this.setPicture(picture);
        this.setPushTime(pushTime);
        this.clickNum=clickNum;
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

    public Date getPushTime() {
        return pushTime;
    }

    public void setPushTime(Date pushTime) {
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
