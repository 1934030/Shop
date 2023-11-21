package com.shop.util;

import com.shop.core.CoreUtil;
import com.shop.model.User;

/**
 * ���ڻ�ȡ�ѵ�¼�û���������Ϣ
 */
public class UserUtil {

    /* ��ȡ��¼�û�ID */
    public static int getLoginUserId() {
        User user = getLoginUser();
        return user.getUid();
    }

    /* ��ȡ��¼�û��� */
    public static String getLoginUserName() {
        User user = getLoginUser();
        return user.getUname();
    }

    /* ��ȡ��¼���� */
    public static String getLoginUserPswd() {
        User user = getLoginUser();
        return user.getPassword();
    }

    /* ��ȡ��¼�û����� */
    private static User getLoginUser() {
        return (User) CoreUtil.getSession().getAttribute(Constants.LOGIN_USER);
    }
}
