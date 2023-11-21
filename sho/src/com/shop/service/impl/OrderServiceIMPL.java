package com.shop.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shop.dao.OrderMapper;
import com.shop.model.Order;
import com.shop.model.OrderDetail;
import com.shop.service.OrderService;

@Service
public class OrderServiceIMPL implements OrderService{

	@Resource
	private OrderMapper orderMapper;
	@Override
	public int addOrder(Order order, List<OrderDetail> orderDetails) {
		// TODO Auto-generated method stub
		 Date d=new Date();
	        SimpleDateFormat sf=new SimpleDateFormat("yyyyMMddHHmmssSSS", Locale.CHINA);
	        String str=sf.format(d);
	        Random r=new Random();
	        int i=r.nextInt(100);
	        String s="";
	        if(i<10){
	            s="00"+i;
	        }
	        else if(i>=10&&i<=99){
	            s="0"+i;
	        }
	        String orderCode=str+s;
	        order.setOrdercode(orderCode);
	        /*调用 Dao 为订单表添加数据 */
	        orderMapper.addOrder(order);

	        int orderid=order.getOrderid();
	        System.out.println("---------"+order.getOrderid());

	        for(int j=0;j<orderDetails.size();j++){
	            OrderDetail od=orderDetails.get(j);
	            od.setOrderid(orderid);
	            orderMapper.addOrderDetail(od);
	        }
	        return orderid;
	}

	@Override
	public List<Order> getMyOrders(Integer uid, Integer status) {
		// TODO Auto-generated method stub
		return orderMapper.getMyOrders(uid, status);
	}

	@Override
	public void deleteOrder(Integer orderid) {
		// TODO Auto-generated method stub
		orderMapper.deleteOrder(orderid);
	}

	@Override
	public List<Order> getAdminOrders(String ordercode, Integer uid, String status, String startDate, String endDate,
			String sort) {
		// TODO Auto-generated method stub
		 Order order=new Order();
	        order.setUid(uid);
	        Map<String,Object> m=new HashMap<String,Object>();
	        m.put("orderCode", ordercode);
	        m.put("uid", uid);
	        m.put("status", status);
	        m.put("startDate", startDate);
	        m.put("endDate", endDate);
	        m.put("sort", sort);
	        order.setParams(m);
	        System.out.println("---------orderCode:"+order.getParams().get("status"));
	        return orderMapper.getOrders(order);
	}

	@Override
	public int getOrderStatusById(Integer orderid) {
		// TODO Auto-generated method stub
		return orderMapper.getOrderStatusById(orderid);
	}

	@Override
	public void upOrderStatus(Integer orderid, int status) {
		// TODO Auto-generated method stub
		orderMapper.upOrderStatus(orderid, status);
	}

	@Override
	public int countOrderStatus(Integer uid, Integer status) {
		// TODO Auto-generated method stub
		return orderMapper.countOrderStatus(uid, status);
	}

	@Override
	public Order getOrderDetailById(Integer orderid) {
		// TODO Auto-generated method stub
		return orderMapper.getOrderDetailById(orderid);
	}

	@Override
	public void updateOrderPostInfo(Integer orderid, String orderpostcode, String orderpostname) {
		// TODO Auto-generated method stub
		orderMapper.updateOrderPostInfo(orderid, orderpostcode, orderpostname);
	}

}
