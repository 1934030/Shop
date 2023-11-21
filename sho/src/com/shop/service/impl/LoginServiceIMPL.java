package com.shop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shop.dao.UserMapper;
import com.shop.model.Log;
import com.shop.model.User;
import com.shop.service.LoginService;
 
@Service
public class LoginServiceIMPL implements LoginService{

	@Resource
	private UserMapper userMapper;
	@Override
	public int checkUid(Integer uid) {
		// TODO Auto-generated method stub
		return userMapper.checkUid(uid);
	}

	@Override
	public int checkLogin(User user) {
		// TODO Auto-generated method stub
		return userMapper.checkLogin(user);
	}

	@Override
	public User showUserInfo(Integer uid) {
		// TODO Auto-generated method stub
		return userMapper.showUserInfo(uid);
	}

	@Override
	public int upUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.upUser(user);
	}

	@Override
	public int insertUserLog(Log log) {
		// TODO Auto-generated method stub
		return userMapper.insertUserLog(log);
	}

	@Override
	public List<User> selAllUser() {
		// TODO Auto-generated method stub
		return userMapper.selAllUser();
	}

	@Override
	public int addUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.addUser(user);
	}

	@Override
	public User selUserByUname(String uname) {
		// TODO Auto-generated method stub
		return userMapper.selUserByUname(uname);
	}

	@Override
	public int delUserById(Integer uid) {
		// TODO Auto-generated method stub
		return userMapper.delUserById(uid);
	}

}
