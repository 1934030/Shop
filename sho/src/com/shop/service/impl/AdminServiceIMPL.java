package com.shop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shop.dao.AdminMapper;
import com.shop.model.Admin;
import com.shop.service.AdminService;

@Service
public class AdminServiceIMPL  implements AdminService{

	@Resource
	private AdminMapper adminMapper;
	
	@Override
	public Admin selAdmByID(Integer adminid) {
		// TODO Auto-generated method stub
		return adminMapper.selAdmByID(adminid);
	}

	@Override
	public int checkLogin(Admin admin) {
		// TODO Auto-generated method stub
		return adminMapper.checkLogin(admin);
	}

	@Override
	public List<Admin> getAdminList() {
		// TODO Auto-generated method stub
		return adminMapper.getAdminList();
	}

	@Override
	public int deleteAdminById(Integer amninid) {
		// TODO Auto-generated method stub
		return adminMapper.deleteAdminById(amninid);
	}

	@Override
	public int updateAdminById(Admin admin) {
		// TODO Auto-generated method stub
		return adminMapper.updateAdminById(admin);
	}

	@Override
	public int addAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return adminMapper.addAdmin(admin);
	}

}
