package com.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shop.model.Order;
import com.shop.model.OrderDetail;


public interface OrderMapper {
	 void addOrder(Order order); //��Ӷ���

	    void addOrderDetail(OrderDetail detail);    //��������

	    void deleteOrder(Integer orderid); //ɾ������

	    List<Order> getOrders(Order order); //����Ա��ѯ���ж���

	    List<Order> getMyOrders(@Param("uid")Integer uid,@Param("status")Integer status);   //��ȡ��ǰ�û����ж���

	    int getOrderStatusById(Integer orderid);  //��ȡ����״̬

	    void upOrderStatus(@Param("orderid") Integer orderid, @Param("status") int status);  //����Ȳ�������¶���״̬

	    int countOrderStatus(@Param("uid")Integer uid,@Param("status")Integer status);

	    Order getOrderDetailById(Integer orderid);  //����Ա����ѯ��������

	    void updateOrderPostInfo(@Param("orderid")Integer orderid,@Param("postcode")String orderpostcode,@Param("postname")String orderpostname);

	    List<Order> adminGetOrders();
}
