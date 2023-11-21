package com.shop.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shop.model.Log;
import com.shop.model.Product;
import com.shop.model.ShoppingCart;
import com.shop.service.LoginService;
import com.shop.service.ProductService;
import com.shop.service.ShoppingCartService;
import com.shop.util.ToolsUtil;
import com.shop.util.UserUtil;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/usercart")
public class ShoCartController {

    @Resource
    private ShoppingCartService shoppingCartService;
    @Resource
    private ProductService productService;
    @Resource
    private LoginService loginService;

    @RequestMapping(value = "addcart")
    public String addCart(
            ShoppingCart cart) {
        cart.setCartbytime(ToolsUtil.getTime("yyyy-MM-dd HH:mm:ss", 0));
        Product product = productService.proSelByCId(cart.getPid());
        cart.setPriceall(cart.getNumbers() * product.getPrice());
        final int i = shoppingCartService.addCart(cart);
        Log log = ToolsUtil.insertLog(UserUtil.getLoginUserId(), "您添加了一款名为【" + product.getPname() + "】的商品到购物车");
        loginService.insertUserLog(log);
        return "redirect:mycart";
    }

    @RequestMapping(value = "delcart")
    public String delCart(Integer cartid) {
        int i = shoppingCartService.delCartByID(cartid);
        Log log = ToolsUtil.insertLog(UserUtil.getLoginUserId(), "您在购物车删除了购物ID为【" + cartid + "】的商品");
        loginService.insertUserLog(log);
        return "redirect:mycart";
    }

    @RequestMapping(value = "mycart")
    public ModelAndView myCart(ModelAndView view) {
        List<ShoppingCart> list = shoppingCartService.selAllCart(UserUtil.getLoginUserId());
        view.addObject("res_list", list);
        view.setViewName("user_cart");
        return view;
    }
}
