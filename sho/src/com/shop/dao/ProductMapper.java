package com.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shop.model.ClassIfication;
import com.shop.model.Page;
import com.shop.model.Product;


public interface ProductMapper {

	 Product proSelByCId(Integer pid);    //通过id查找商品

	    List<Product> proSelByCIds(Integer[] pid);  //通过多个id查找商品列表

	    int proSelCount(@Param("classid") Integer classid);    //分页

	    List<Product> findPage(Page page);

	    ClassIfication findClassName(Integer classid);    //查找分类名

	    int proSelAllCount();    //分页

	    List<Product> findAllPage(Page page);   //管理员展示所有商品

	    List<Product> selProductAll();    //显示所有商品列表

	    int upProduct(Product product);    //商品信息修改

	    List<Product> selNumProduct(@Param("index") int index);    //显示固定商品列表

	    List<Product> selTypePro(@Param("type") String type, @Param("index") int index, @Param("sort") String sort);    //显示固定商品列表

	    List<Product> searchProduct(@Param("keyname") String keyname, @Param("classid") Integer classid);

	    int addProduct(Product product);

	    int delProduct(Integer pid);
}
