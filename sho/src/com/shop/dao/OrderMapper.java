package com.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shop.model.Order;
import com.shop.model.OrderDetail;


public interface OrderMapper {
	 void addOrder(Order order); //添加订单

	    void addOrderDetail(OrderDetail detail);    //订单详情

	    void deleteOrder(Integer orderid); //删除订单

	    List<Order> getOrders(Order order); //管理员查询所有订单

	    List<Order> getMyOrders(@Param("uid")Integer uid,@Param("status")Integer status);   //获取当前用户所有订单

	    int getOrderStatusById(Integer orderid);  //获取订单状态

	    void upOrderStatus(@Param("orderid") Integer orderid, @Param("status") int status);  //申请等操作后更新订单状态

	    int countOrderStatus(@Param("uid")Integer uid,@Param("status")Integer status);

	    Order getOrderDetailById(Integer orderid);  //管理员，查询订单详情

	    void updateOrderPostInfo(@Param("orderid")Integer orderid,@Param("postcode")String orderpostcode,@Param("postname")String orderpostname);

	    List<Order> adminGetOrders();
}
