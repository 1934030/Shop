package com.shop.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.model.Log;
import com.shop.model.Page;
import com.shop.service.LogService;
import com.shop.service.LoginService;
import com.shop.util.Constants;
import com.shop.util.ToolsUtil;
import com.shop.util.UserUtil;



@Controller
@RequestMapping("/log")
public class LogController {

    @Resource
    private LogService logService;
    @Resource
    private LoginService loginService;

    @RequestMapping(value = "/getlog")
    public String getLog(
            HttpServletRequest request,
            String scurrentPage) {
        int everyPage = Constants.LOG_MAXSIZE;//每页记录数
        int totalCount = logService.logSelCount(UserUtil.getLoginUserId());
        int currentPage;

        if (scurrentPage == null) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(scurrentPage);
        }

        Page page = ToolsUtil.createLoad(everyPage, totalCount, currentPage, UserUtil.getLoginUserId());
        List<Log> list = logService.findLoad(page);

        request.setAttribute("myload", page);

        request.setAttribute("mylog_info", list);
        request.setAttribute("mylog_count", totalCount);

        return "user_log";
    }

    @ResponseBody
    @RequestMapping(value = "/getload", method = RequestMethod.POST)
    public void getLoad(
            HttpServletResponse response,
            String scurrentPage) throws IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");

        /*
         * 已登录用户id由ToolsUser.getLoginUserId()工具类提供，
         * 不再由地址栏传参，
         * 这样可以防止用户在地址栏中输入getload?uid=10010等非已登录用户信息，
         * 而显示该用户信息的情况，保障安全
         * */
        int everyPage = Constants.LOG_MAXSIZE;
        int totalCount = logService.logSelCount(UserUtil.getLoginUserId());
        int currentPage;
        if (scurrentPage == null) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(scurrentPage);
        }

        //加载
        Page page = ToolsUtil.createLoad(everyPage, totalCount, currentPage, UserUtil.getLoginUserId());
        List<Log> list = logService.findLoad(page);

        JSONArray array = new JSONArray();
        for (Log aList : list) {
            JSONObject object = new JSONObject();
            object.put("log_id", aList.getLogid());
            object.put("logbyname", aList.getUname());
            object.put("logdescb", aList.getDescb());
            object.put("logtime", aList.getBytime());
            object.put("logpage", page.isHasNextPage());
            array.put(object);
        }
        response.getWriter().print(array.toString());
    }

    /**
     * 批量删除日志
     * */
    @ResponseBody
    @RequestMapping(value = "/delLogbyids",produces = "application/json;charset=UTF-8")
    public Object delLogByIds(@RequestParam("logids[]") Integer[] logids) {
        JSONObject object=new JSONObject();
        int i = logService.deleteLogByIds(logids);
        if(i>0){
            String descb = "您删除了【" + i + "】条日志记录";
            Log log = ToolsUtil.insertLog(UserUtil.getLoginUserId(), descb);
            loginService.insertUserLog(log);
            object.put("my_i", i);
        }
        return object.toString();
    }

    /**
     * 一键删除日志
     * */
    @RequestMapping(value = "/dellogall")
    public String delLogAll(
            HttpServletResponse response,
            HttpServletRequest request) throws ServletException, IOException {
        int i = logService.deleteLogAll();
        if(i>0){
            String descb = "您一键删除了所有日志记录";
            Log log = ToolsUtil.insertLog(UserUtil.getLoginUserId(), descb);
            loginService.insertUserLog(log);
        }
        request.setAttribute("my_del_i", i);
        return "user_log";
    }

    @ResponseBody
    @RequestMapping(value = "/ajaxtest")
    public Map<String, String> test() {
        System.out.println("来自ajax的请求");
        Map<String, String> map = new HashMap<String, String>();
        map.put("aaa", "ajax");
        map.put("bbb", "ajax");
        return map;
    }
}
