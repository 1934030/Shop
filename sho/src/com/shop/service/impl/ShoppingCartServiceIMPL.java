package com.shop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shop.dao.ShoppingCartMapper;
import com.shop.model.ShoppingCart;
import com.shop.service.ShoppingCartService;

@Service
public class ShoppingCartServiceIMPL implements ShoppingCartService{

	@Resource
	private ShoppingCartMapper shoppingCartMapper;
	@Override
	public int addCart(ShoppingCart cart) {
		// TODO Auto-generated method stub
		return shoppingCartMapper.addCart(cart);
	}

	@Override
	public List<ShoppingCart> selAllCart(Integer uid) {
		// TODO Auto-generated method stub
		return shoppingCartMapper.selAllCart(uid);
	}

	@Override
	public int delCartByID(Integer cartid) {
		// TODO Auto-generated method stub
		return shoppingCartMapper.delCartByID(cartid);
	}

}
