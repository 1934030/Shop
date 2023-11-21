package com.shop.model;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Order {

    private Integer orderid;
    private String ordercode;    //订单�?
    private Integer uid;
    private String uname;
    private Integer status;    //订单状�??
    private String orderaddress;
    private float postalfee;    //邮费
    private Date orderdate;    //下单时间
    private String orderpostcode;    //邮�?�编�?
    private String orderpostname;    //邮�?�方�?
    /*
     * 因为�?个订单存在批量下单情况，
     * 因此要用�? List<OrderDetail> 来进行一对多�?
     * OrderDetail 要单独生成�?�数据表�?
     * */
    private List<OrderDetail> odetails;
    private Map<String, Object> params = new HashMap<String, Object>();

    public Order() {
    }

    public Order(Integer orderid, String ordercode, Integer uid, Integer status, String orderaddress, float postalfee, Date orderdate, String orderpostcode, String orderpostname, List<OrderDetail> odetails, Map<String, Object> params) {
        this.orderid = orderid;
        this.ordercode = ordercode;
        this.uid = uid;
        this.status = status;
        this.orderaddress = orderaddress;
        this.postalfee = postalfee;
        this.orderdate = orderdate;
        this.orderpostcode = orderpostcode;
        this.orderpostname = orderpostname;
        this.odetails = odetails;
        this.params = params;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public String getOrdercode() {
        return ordercode;
    }

    public void setOrdercode(String ordercode) {
        this.ordercode = ordercode;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getOrderaddress() {
        return orderaddress;
    }

    public void setOrderaddress(String orderaddress) {
        this.orderaddress = orderaddress;
    }

    public float getPostalfee() {
        return postalfee;
    }

    public void setPostalfee(float postalfee) {
        this.postalfee = postalfee;
    }

    public Date getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(Date orderdate) {
        this.orderdate = orderdate;
    }

    public String getOrderpostcode() {
        return orderpostcode;
    }

    public void setOrderpostcode(String orderpostcode) {
        this.orderpostcode = orderpostcode;
    }

    public String getOrderpostname() {
        return orderpostname;
    }

    public void setOrderpostname(String orderpostname) {
        this.orderpostname = orderpostname;
    }

    public List<OrderDetail> getOdetails() {
        return odetails;
    }

    public void setOdetails(List<OrderDetail> odetails) {
        this.odetails = odetails;
    }

    public Map<String, Object> getParams() {
        return params;
    }

    public void setParams(Map<String, Object> params) {
        this.params = params;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderid=" + orderid +
                ", ordercode='" + ordercode + '\'' +
                ", uid=" + uid +
                ", uname='" + uname + '\'' +
                ", status=" + status +
                ", orderaddress='" + orderaddress + '\'' +
                ", postalfee=" + postalfee +
                ", orderdate=" + orderdate +
                ", orderpostcode='" + orderpostcode + '\'' +
                ", orderpostname='" + orderpostname + '\'' +
                ", odetails=" + odetails +
                ", params=" + params +
                '}';
    }
}
