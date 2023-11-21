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
        int everyPage = Constants.LOG_MAXSIZE;//ÿҳ��¼��
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
         * �ѵ�¼�û�id��ToolsUser.getLoginUserId()�������ṩ��
         * �����ɵ�ַ�����Σ�
         * �������Է�ֹ�û��ڵ�ַ��������getload?uid=10010�ȷ��ѵ�¼�û���Ϣ��
         * ����ʾ���û���Ϣ����������ϰ�ȫ
         * */
        int everyPage = Constants.LOG_MAXSIZE;
        int totalCount = logService.logSelCount(UserUtil.getLoginUserId());
        int currentPage;
        if (scurrentPage == null) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(scurrentPage);
        }

        //����
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
     * ����ɾ����־
     * */
    @ResponseBody
    @RequestMapping(value = "/delLogbyids",produces = "application/json;charset=UTF-8")
    public Object delLogByIds(@RequestParam("logids[]") Integer[] logids) {
        JSONObject object=new JSONObject();
        int i = logService.deleteLogByIds(logids);
        if(i>0){
            String descb = "��ɾ���ˡ�" + i + "������־��¼";
            Log log = ToolsUtil.insertLog(UserUtil.getLoginUserId(), descb);
            loginService.insertUserLog(log);
            object.put("my_i", i);
        }
        return object.toString();
    }

    /**
     * һ��ɾ����־
     * */
    @RequestMapping(value = "/dellogall")
    public String delLogAll(
            HttpServletResponse response,
            HttpServletRequest request) throws ServletException, IOException {
        int i = logService.deleteLogAll();
        if(i>0){
            String descb = "��һ��ɾ����������־��¼";
            Log log = ToolsUtil.insertLog(UserUtil.getLoginUserId(), descb);
            loginService.insertUserLog(log);
        }
        request.setAttribute("my_del_i", i);
        return "user_log";
    }

    @ResponseBody
    @RequestMapping(value = "/ajaxtest")
    public Map<String, String> test() {
        System.out.println("����ajax������");
        Map<String, String> map = new HashMap<String, String>();
        map.put("aaa", "ajax");
        map.put("bbb", "ajax");
        return map;
    }
}
