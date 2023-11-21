package com.shop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shop.dao.ClassIficationMapper;
import com.shop.model.ClassIfication;
import com.shop.service.ClassIficationService;

@Service
public class ClassIficationServiceIMPL implements ClassIficationService {

	@Resource
	private ClassIficationMapper classIficationMapper;
	@Override
	public List<ClassIfication> selAllClass() {
		// TODO Auto-generated method stub
		return classIficationMapper.selAllClass();
	}

	@Override
	public int addSort(ClassIfication sort) {
		// TODO Auto-generated method stub
		return classIficationMapper.addSort(sort);
	}

	@Override
	public int deleteSort(Integer classid) {
		// TODO Auto-generated method stub
		return classIficationMapper.deleteSort(classid);
	}

	@Override
	public int upSort(ClassIfication sort) {
		// TODO Auto-generated method stub
		return classIficationMapper.upSort(sort);
	}

}
