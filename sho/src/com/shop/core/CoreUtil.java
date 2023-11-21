package com.shop.core;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.shop.util.Constants;
import com.shop.util.ToolsUtil;

/**
 * 核心工具类
 */
public class CoreUtil extends ToolsUtil {

    /**
     * 工具类，获取Session、Request、Response
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

    /* 记录当前页面作为返回地址 */
    public static void setCurrentUrl() {
        String currUrl = getRequestURL(getRequest());
        getSession().setAttribute(Constants.REFER_URL, currUrl);
    }
}
