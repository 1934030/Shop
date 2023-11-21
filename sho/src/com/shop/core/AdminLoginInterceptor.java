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
        if (object instanceof Anonymous) {    //��������һ�������Ƿ�Ϊһ�����ʵ��
            return true;
        } else {
            Admin admin = (Admin) CoreUtil.getSession().getAttribute(Constants.LOGIN_ADMIN);
            if (admin != null) { //�ѵ�¼
                return true;
            }
        }

        System.out.println("����Աδ��¼������");
        response.sendRedirect(request.getContextPath() + "/admin/loginpage");    //���ʵ�ַ��ת
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}