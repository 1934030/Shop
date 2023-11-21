package com.shop.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shop.dao.ProductMapper;
import com.shop.model.ClassIfication;
import com.shop.model.Page;
import com.shop.model.Product;
import com.shop.service.ProductService;

@Service
public class ProductServiceIMPL implements ProductService{

	@Resource
	private ProductMapper productMapper;
	@Override
	public Product proSelByCId(Integer pid) {
		// TODO Auto-generated method stub
		return productMapper.proSelByCId(pid);
	}

	@Override
	public List<Map<String, Object>> proSelByCIds(Integer[] pid, int[] pnum) {
		// TODO Auto-generated method stub
		 /* 调用 Dao 层从数据库获取相应商品列表 */
        List<Product> proinfo = productMapper.proSelByCIds(pid);
        /* 创建新的键值对集合，存放信息 */
        List<Map<String,Object>> prolist=new ArrayList<Map<String, Object>>();
        for(int i=0;i<pid.length;i++){
            Product product=new Product();
            product.setPid(pid[i]);
            /* 返回对象 product 在 proinfo 集合中出现的索引位置
            int j=proinfo.indexOf(proinfo.get(i));
            System.out.println("---Svc---："+product);
            System.out.println("---Svc---："+proinfo.get(i));
            System.out.println("---Svc---："+j);
            if(j!=-1){*/
                Product pro=proinfo.get(i);
                Map<String,Object> m=new HashMap<String, Object>();
                m.put("pid", pid[i]);
                m.put("pname", pro.getPname());
                m.put("price", pro.getPrice());
                m.put("pimg", pro.getPimg());
                m.put("pronum", pnum[i]);
                prolist.add(m);
            /*}*/
        }
        return prolist;
	}

	@Override
	public int proSelCount(Integer classid) {
		// TODO Auto-generated method stub
		return productMapper.proSelCount(classid);
	}

	@Override
	public List<Product> findPage(Page page) {
		// TODO Auto-generated method stub
		return productMapper.findPage(page);
	}

	@Override
	public ClassIfication findClassName(Integer classid) {
		// TODO Auto-generated method stub
		return productMapper.findClassName(classid);
	}

	@Override
	public int proSelAllCount() {
		// TODO Auto-generated method stub
		return productMapper.proSelAllCount();
	}

	@Override
	public List<Product> findAllPage(Page page) {
		// TODO Auto-generated method stub
		return productMapper.findAllPage(page);
	}

	@Override
	public List<Product> selProductAll() {
		// TODO Auto-generated method stub
		return productMapper.selProductAll();
	}

	@Override
	public int upProduct(Product product) {
		// TODO Auto-generated method stub
		return productMapper.upProduct(product);
	}

	@Override
	public List<Product> selNumProduct(int index) {
		// TODO Auto-generated method stub
		return productMapper.selNumProduct(index);
	}

	@Override
	public List<Product> selTypePro(String type, int index, String sort) {
		// TODO Auto-generated method stub
		return productMapper.selTypePro(type, index, sort);
	}

	@Override
	public List<Product> searchProduct(String keyname, Integer classid) {
		// TODO Auto-generated method stub
		return productMapper.searchProduct(keyname, classid);
	}

	@Override
	public int addProduct(Product product) {
		// TODO Auto-generated method stub
		return productMapper.addProduct(product);
	}

	@Override
	public int delProduct(Integer pid) {
		// TODO Auto-generated method stub
		return productMapper.delProduct(pid);
	}

}
