package com.shop.dao;

import java.util.List;

import com.shop.model.Log;
import com.shop.model.User;

public interface UserMapper {


    int checkUid(Integer uid);    //����˺��Ƿ����

    int checkLogin(User user);    //����˺��������Ƿ�ƥ��

    User showUserInfo(Integer uid);    //��ʾ�û�������Ϣ

    int upUser(User user);    //�޸��û���Ϣ

    int insertUserLog(Log log);    //�����û�������־

    List<User> selAllUser();    //��ѯ�����û�

    int addUser(User user);    //ע��

    User selUserByUname(String uname); //�û�������

    int delUserById(Integer uid);   //adminɾ���û�
}
