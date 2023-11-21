package com.shop.util;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.shop.service.LoginService;



/**
 * @Component <context:component-scan base-package="com.fanpin.*" />
 * @Aspect ����
 * ���ȼ���before����around����after
 * */
@Component
@Aspect
public class TransactionAdvice {

	@Resource
	private LoginService loginService;
	
	//�û���Ҫ��֤��ݲ��ܲ����������е�,�÷����޷�����,��ҪΪ����ͬ������������ʹ�ô˴����õ������
	//@Pointcut("execution(* com.fanpin.controller.ProductController.showphone(..))")
	public void aopCheckLogin() {}
	
	//@Before("aopCheckLogin()")
	public String before()
	{
		System.out.println("ǰ��֪ͨ��ִ�У�����");
		
		HttpServletRequest request =((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest(); 
		HttpSession session = request.getSession();
		if(session.getAttribute("myinfo")!=null) {
			System.out.println("�û��ѵ�¼��");
		}else {
			System.out.println("�û�δ��¼��");
		}
		return null;
	}
	public void after()
	{
		System.out.println("����֪ͨ��ִ�У������������Ƿ�����쳣����ִ�У�");
	}
	public void afterReturning()
	{
		System.out.println("����֪ͨ��ִ�У������������쳣��ִ�У�");
	}
	public void afterException()
	{
		System.out.println("�쳣֪ͨ��ִ�У�����");
	}
	public Object around(ProceedingJoinPoint point) throws Throwable
	{
		System.out.println("����ǰִ�е�����");
		Object proceed = point.proceed();
		System.out.println("���ƺ�ִ�е�����");
		return proceed;
	}

}
