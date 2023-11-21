package com.shop.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.shop.model.ClassIfication;
import com.shop.model.Page;
import com.shop.model.Product;

public interface ProductService {

	 Product proSelByCId(Integer pid);

	    List<Map<String, Object>> proSelByCIds(Integer[] pid, int[] pnum);

	    int proSelCount(Integer classid);

	    List<Product> findPage(Page page);

	    ClassIfication findClassName(Integer classid);

	    int proSelAllCount();

	    List<Product> findAllPage(Page page);

	    List<Product> selProductAll();

	    int upProduct(Product product);

	    /**
	     * @param index Ҫ��ʾ��������Ʒ����
	     */
	    List<Product> selNumProduct(int index);

	    /**
	     * @param type  ��ѯ���������
	     * @param index Ҫ��ʾ����Ʒ����
	     * @param sort  �������
	     */
	    List<Product> selTypePro(@Param("type") String type, @Param("index") int index, @Param("sort") String sort);

	    List<Product> searchProduct(@Param("keyname") String keyname, @Param("classid") Integer classid);

	    int addProduct(Product product);

	    int delProduct(Integer pid);
}
