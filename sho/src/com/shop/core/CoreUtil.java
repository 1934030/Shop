package com.shop.core;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.shop.util.Constants;
import com.shop.util.ToolsUtil;

/**
 * ���Ĺ�����
 */
public class CoreUtil extends ToolsUtil {

    /**
     * �����࣬��ȡSession��Request��Response
     */
    public static HttpSession getSession() {
        return getRequest().getSession();
    }

    public static HttpServletRequest getRequest() {
        ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes();
        return attrs.getRequest();
    }

    public static HttpServletResponse getResponse() {
        ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes();
        return attrs.getResponse();
    }

    /* ��¼��ǰҳ����Ϊ���ص�ַ */
    public static void setCurrentUrl() {
        String currUrl = getRequestURL(getRequest());
        getSession().setAttribute(Constants.REFER_URL, currUrl);
    }
}
