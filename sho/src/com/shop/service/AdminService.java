package com.shop.service;

import java.util.List;

import com.shop.model.Admin;

public interface AdminService {

	 Admin selAdmByID(Integer adminid);

	    int checkLogin(Admin admin);

	    List<Admin> getAdminList();

	    int deleteAdminById(Integer amninid);

	    int updateAdminById(Admin admin);

	    int addAdmin(Admin admin);
}
