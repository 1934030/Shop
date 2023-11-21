package com.shop.util;

import com.shop.core.CoreUtil;
import com.shop.model.User;

/**
 * 用于获取已登录用户的所需信息
 */
public class UserUtil {

    /* 获取登录用户ID */
    public static int getLoginUserId() {
        User user = getLoginUser();
        return user.getUid();
    }

    /* 获取登录用户名 */
    public static String getLoginUserName() {
        User user = getLoginUser();
        return user.getUname();
    }

    /* 获取登录密码 */
    public static String getLoginUserPswd() {
        User user = getLoginUser();
        return user.getPassword();
    }

    /* 获取登录用户对象 */
    private static User getLoginUser() {
        return (User) CoreUtil.getSession().getAttribute(Constants.LOGIN_USER);
    }
}
