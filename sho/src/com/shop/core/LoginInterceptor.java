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
		if (object instanceof Anonymous) {	//��������һ�������Ƿ�Ϊһ�����ʵ��
			return true;
		} else {
			//��ȡ��¼�󱣴���session�е���Ϣ����֤�Ƿ��ѵ�¼
			User user = (User) CoreUtil.getSession().getAttribute(Constants.LOGIN_USER);
			if(user!=null){ //�ѵ�¼
				return true;
			}
		}
		
		System.out.println("�û�δ��¼������");
		response.sendRedirect(request.getContextPath()+"/page/nologin.html");
		return false;
	}

}
