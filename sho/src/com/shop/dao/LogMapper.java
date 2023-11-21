package com.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shop.model.Log;
import com.shop.model.Page;


public interface LogMapper {

	List<Log> logSelByUId(Integer uid);	//通过id查找日志
	int logSelCount(Integer uid);	//加载的总数据项
	List<Log> findLoad(Page page);	//读取加载项
	int deleteLogByIds(@Param("logids") Integer[] logids);	//批量删除日志
	int deleteLogAll();	//一键删除日志
}
