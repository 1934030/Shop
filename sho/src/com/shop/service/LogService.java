package com.shop.service;

import java.util.List;

import com.shop.model.Log;
import com.shop.model.Page;

public interface LogService {

	List<Log> logSelByUId(Integer uid);
	int logSelCount(Integer uid);
	List<Log> findLoad(Page page);
	int deleteLogByIds(Integer[] logids);
	int deleteLogAll();
}
