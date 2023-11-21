package com.shop.dao;

import java.util.List;

import com.shop.model.ShoppingCart;

public interface ShoppingCartMapper {

	int addCart(ShoppingCart cart); //Ìí¼Ó¹ºÎï³µ
    List<ShoppingCart> selAllCart(Integer uid);
    int delCartByID(Integer cartid);
}
