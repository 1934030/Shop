package com.shop.service;

import java.util.List;

import com.shop.model.Order;
import com.shop.model.OrderDetail;

public interface OrderService {

	 int addOrder(Order order, List<OrderDetail> orderDetails);

	    List<Order> getMyOrders(Integer uid, Integer status);

	    void deleteOrder(Integer orderid);

	    List<Order> getAdminOrders(String ordercode, Integer uid, String status, String startDate, String endDate, String sort);

	    int getOrderStatusById(Integer orderid);

	    void upOrderStatus(Integer orderid, int status);

	    int countOrderStatus(Integer uid, Integer status);

	    Order getOrderDetailById(Integer orderid);

	    void updateOrderPostInfo(Integer orderid,String orderpostcode,String orderpostname);
}
