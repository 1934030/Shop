package com.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 辅助调节器
 */
@Controller
public class UtilController {

    /**
     * 此方法用于跳转到主页，
     * 只需要在网址中输入http://localhost:8080/sho
     * 或者http://localhost:8080/sho/toindex即可
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
