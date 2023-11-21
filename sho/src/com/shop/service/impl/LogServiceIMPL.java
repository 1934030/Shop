package com.shop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shop.dao.LogMapper;
import com.shop.model.Log;
import com.shop.model.Page;
import com.shop.service.LogService;



@Service
public class LogServiceIMPL  implements LogService{

	@Resource
	private LogMapper logMapper;
	@Override
	public List<Log> logSelByUId(Integer uid) {
		// TODO Auto-generated method stub
		return logMapper.logSelByUId(uid);
	}

	@Override
	public int logSelCount(Integer uid) {
		// TODO Auto-generated method stub
		return logMapper.logSelCount(uid);
	}

	@Override
	public List<Log> findLoad(Page page) {
		// TODO Auto-generated method stub
		return logMapper.findLoad(page);
	}

	@Override
	public int deleteLogByIds(Integer[] logids) {
		// TODO Auto-generated method stub
		return logMapper.deleteLogByIds(logids);
	}

	@Override
	public int deleteLogAll() {
		// TODO Auto-generated method stub
		return logMapper.deleteLogAll();
	}

}
