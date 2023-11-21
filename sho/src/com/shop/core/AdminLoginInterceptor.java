package com.shop.core;



import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.shop.model.Admin;
import com.shop.util.Constants;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminLoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
        if (object instanceof Anonymous) {    //用来测试一个对象是否为一个类的实例
            return true;
        } else {
            Admin admin = (Admin) CoreUtil.getSession().getAttribute(Constants.LOGIN_ADMIN);
            if (admin != null) { //已登录
                return true;
            }
        }

        System.out.println("管理员未登录已拦截");
        response.sendRedirect(request.getContextPath() + "/admin/loginpage");    //访问地址跳转
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}