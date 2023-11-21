package com.shop.service;

import java.util.List;

import com.shop.model.ClassIfication;

public interface ClassIficationService {

	 List<ClassIfication> selAllClass();

	    int addSort(ClassIfication sort);

	    int deleteSort(Integer classid);

	    int upSort(ClassIfication sort);
}
