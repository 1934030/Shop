package com.shop.service;

import java.util.List;

import com.shop.model.Log;
import com.shop.model.User;

public interface LoginService {

	 int checkUid(Integer uid);

	    int checkLogin(User user);

	    User showUserInfo(Integer uid);

	    int upUser(User user);

	    int insertUserLog(Log log);

	    List<User> selAllUser();

	    int addUser(User user);

	    User selUserByUname(String uname);

	    int delUserById(Integer uid);
}
