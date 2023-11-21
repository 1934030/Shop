package com.shop.model;

public class ShoppingCart {

	private Integer carid;
	private Integer uid;
	private Integer pid;
	private Integer numbers;
	private float priceall;
	private float price;
	private String cartbytime;
    private String pname;	//商品�?
    private String pimg;	//图片
    private String title;	//标题
    private String descb;	//描述

	public ShoppingCart() {
		super();
	}

    public ShoppingCart(Integer carid, Integer uid, Integer pid, Integer numbers, float priceall, float price, String cartbytime, String pname, String pimg, String title, String descb) {
        this.carid = carid;
        this.uid = uid;
        this.pid = pid;
        this.numbers = numbers;
        this.priceall = priceall;
        this.price = price;
        this.cartbytime = cartbytime;
        this.pname = pname;
        this.pimg = pimg;
        this.title = title;
        this.descb = descb;
    }

    public Integer getCarid() {
        return carid;
    }

    public void setCarid(Integer carid) {
        this.carid = carid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getNumbers() {
        return numbers;
    }

    public void setNumbers(Integer numbers) {
        this.numbers = numbers;
    }

    public float getPriceall() {
        return priceall;
    }

    public void setPriceall(float priceall) {
        this.priceall = priceall;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getCartbytime() {
        return cartbytime;
    }

    public void setCartbytime(String cartbytime) {
        this.cartbytime = cartbytime;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPimg() {
        return pimg;
    }

    public void setPimg(String pimg) {
        this.pimg = pimg;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescb() {
        return descb;
    }

    public void setDescb(String descb) {
        this.descb = descb;
    }

    @Override
    public String toString() {
        return "ShoppingCart{" +
                "carid=" + carid +
                ", uid=" + uid +
                ", pid=" + pid +
                ", numbers=" + numbers +
                ", priceall=" + priceall +
                ", price=" + price +
                ", bytime='" + cartbytime + '\'' +
                ", pname='" + pname + '\'' +
                ", pimg='" + pimg + '\'' +
                ", title='" + title + '\'' +
                ", descb='" + descb + '\'' +
                '}';
    }
}
