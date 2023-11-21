package com.shop.util;

/**
 * 静态最终常量
 * final成员变量表示常量，只能被赋值一次，赋值后值不再改变，为只读型
 * 用于保存一些信息，如登录状态、地址等
 */
public class Constants {

    /* 登录后用户信息在Session中的Key */
    public static final String LOGIN_USER = "_LOGIN_USER_";
    /* 登录后用户信息在Session中的Key */
    public static final String LOGIN_ADMIN = "_LOGIN_ADMIN_";

    /*分页：每页商品显示数*/
    public static final int PEODUCT_MAXSIZE = 12;
    /*分页：每页日志显示数*/
    public static final int LOG_MAXSIZE = 10;

    /* 订单状态 */
    public static final int ORDER_WAITING = 0;//等待付款
    public static final int ORDER_PAID = 1;//未发货
    public static final int ORDER_ASKREFUND = 2;//申请退款中
    public static final int ORDER_REFUNDSUCCEED = 3;//退款成功
    public static final int ORDER_SENDING = 4;//已发货
    public static final int ORDER_SUCCEED = 5;//交易成功
    public static final int ORDER_ASKRETURN = 6;//申请退货中
    public static final int ORDER_RETURNING = 7;//退货中
    public static final int ORDER_RETURNSUCEED = 8;//退货成功
    public static final int ORDER_CLOSED = 9;//交易关闭

    public static final String[] ORDER_STATUS_DISC = new String[]{"等待付款", "未发货", "申请退款中", "退款成功", "已发货", "交易成功", "申请退货中", "退货中", "退货成功", "交易关闭"};

    /* 记录返回页面地址用的session key */
    public static final String REFER_URL = "_REFER_URL_";
    public static final String REFER_URL_DEFAULT_KEY = "_REFER_URL_DEFAULT_KEY_";
}
