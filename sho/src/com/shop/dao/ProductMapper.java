package com.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shop.model.ClassIfication;
import com.shop.model.Page;
import com.shop.model.Product;


public interface ProductMapper {

	 Product proSelByCId(Integer pid);    //ͨ��id������Ʒ

	    List<Product> proSelByCIds(Integer[] pid);  //ͨ�����id������Ʒ�б�

	    int proSelCount(@Param("classid") Integer classid);    //��ҳ

	    List<Product> findPage(Page page);

	    ClassIfication findClassName(Integer classid);    //���ҷ�����

	    int proSelAllCount();    //��ҳ

	    List<Product> findAllPage(Page page);   //����Աչʾ������Ʒ

	    List<Product> selProductAll();    //��ʾ������Ʒ�б�

	    int upProduct(Product product);    //��Ʒ��Ϣ�޸�

	    List<Product> selNumProduct(@Param("index") int index);    //��ʾ�̶���Ʒ�б�

	    List<Product> selTypePro(@Param("type") String type, @Param("index") int index, @Param("sort") String sort);    //��ʾ�̶���Ʒ�б�

	    List<Product> searchProduct(@Param("keyname") String keyname, @Param("classid") Integer classid);

	    int addProduct(Product product);

	    int delProduct(Integer pid);
}
