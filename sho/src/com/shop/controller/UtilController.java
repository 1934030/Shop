package com.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * ����������
 */
@Controller
public class UtilController {

    /**
     * �˷���������ת����ҳ��
     * ֻ��Ҫ����ַ������http://localhost:8080/sho
     * ����http://localhost:8080/sho/toindex����
     */
    @RequestMapping("toindex")
    public String usertologin() {
        return "index";
    }
    @RequestMapping("toindex2")
    public String admintologin() {
    	return "backstage/index";
    }
}
