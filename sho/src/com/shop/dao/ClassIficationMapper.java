package com.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shop.model.ClassIfication;



public interface ClassIficationMapper {

	  List<ClassIfication> selAllClass();

	    int addSort(ClassIfication sort);

	    int deleteSort(@Param("classid") Integer classid);

	    int upSort(ClassIfication sort);
}
