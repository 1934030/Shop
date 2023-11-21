package com.shop.core;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.shop.model.User;
import com.shop.util.Constants;


public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception exception)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView view)
			throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		if (object instanceof Anonymous) {	//用来测试一个对象是否为一个类的实例
			return true;
		} else {
			//获取登录后保存在session中的信息，验证是否已登录
			User user = (User) CoreUtil.getSession().getAttribute(Constants.LOGIN_USER);
			if(user!=null){ //已登录
				return true;
			}
		}
		
		System.out.println("用户未登录已拦截");
		response.sendRedirect(request.getContextPath()+"/page/nologin.html");
		return false;
	}

}
