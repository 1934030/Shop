package com.shop.model;

/**
 * Created by IntelliJ IDEA.
 * User: MR·Wang
 * Date: 2019/10/25
 * Time: 下午 12:42
 * 订单详情信息
 */
public class OrderDetail {
    private Integer odetailid;  //订单详情编号
    private Integer orderid;  //订单编号
    private Integer pid;  //商品编号
    private String pimg;  //商品图片
    private String pname;  //商品�?
    private float price;  //商品价格
    private Integer odetailnum;  //商品数量

    public OrderDetail() {
    }

    public OrderDetail(Integer odetailid, Integer orderid, Integer pid, String pname, float price, Integer odetailnum, String pimg) {
        this.odetailid = odetailid;
        this.orderid = orderid;
        this.pid = pid;
        this.pname = pname;
        this.price = price;
        this.odetailnum = odetailnum;
        this.pimg = pimg;
    }

    public Integer getOdetailid() {
        return odetailid;
    }

    public void setOdetailId(Integer odetailid) {
        this.odetailid = odetailid;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Integer getOdetailnum() {
        return odetailnum;
    }

    public void setOdetailnum(Integer odetailnum) {
        this.odetailnum = odetailnum;
    }

    public String getPimg() {
        return pimg;
    }

    public void setPimg(String pimg) {
        this.pimg = pimg;
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "odetailid=" + odetailid +
                ", orderid=" + orderid +
                ", pid=" + pid +
                ", pname='" + pname + '\'' +
                ", price=" + price +
                ", odetailnum=" + odetailnum +
                ", pimg='" + pimg + '\'' +
                '}';
    }
}
