package com.shop.dao;

import java.util.List;

import com.shop.model.Admin;

public interface AdminMapper {

	Admin selAdmByID(Integer adminid);

    int checkLogin(Admin admin);

    List<Admin> getAdminList(); //��ȡ���й���Ա�б�

    int deleteAdminById(Integer amninid);

    int updateAdminById(Admin admin);

    int addAdmin(Admin admin);
}
