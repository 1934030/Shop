package com.shop.service;

import java.util.List;

import com.shop.model.ShoppingCart;

public interface ShoppingCartService {

	 int addCart(ShoppingCart cart);
	    List<ShoppingCart> selAllCart(Integer uid);
	    int delCartByID(Integer cartid);
}
