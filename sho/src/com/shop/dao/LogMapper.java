package com.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shop.model.Log;
import com.shop.model.Page;


public interface LogMapper {

	List<Log> logSelByUId(Integer uid);	//ͨ��id������־
	int logSelCount(Integer uid);	//���ص���������
	List<Log> findLoad(Page page);	//��ȡ������
	int deleteLogByIds(@Param("logids") Integer[] logids);	//����ɾ����־
	int deleteLogAll();	//һ��ɾ����־
}
