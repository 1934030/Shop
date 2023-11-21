package com.shop.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.core.CoreUtil;
import com.shop.model.Log;
import com.shop.model.User;
import com.shop.service.LoginService;
import com.shop.util.Constants;
import com.shop.util.ToolsUtil;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
@RequestMapping("/login")
public class LoginController {

    @Resource
    private LoginService loginService;

    /**
     * produces="application/json;charset=UTF-8"：防止ajax获取中文时出现乱码
     * @return 将数据回传给ajax
     */
    @ResponseBody
    @RequestMapping(value = "/usertologin", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public Object usertologin(
            Integer uid,
            String upswd,
            HttpServletResponse response,
            HttpSession session) {
        //创建 JSONObject 对象，它会把放入的数据以 json 的数据格式存储，对于集合类型的数据还要用到 JSONArray 数组
        JSONObject object = new JSONObject();
        int i = loginService.checkUid(uid);
        if (i > 0) { // 证明账号存在，进行密码验证
            object.put("num_i", i);
            object.put("SUCCESS_MESSAGE", "账号验证成功！");

            int j = loginService.checkLogin(new User(uid, upswd));
            if (j > 0) { // 密码正确，进行相同账号的登录验证
                object.put("num_j", j);
                object.put("SUCCESS_MESSAGE2", "密码验证成功！");

                User user_session = (User) CoreUtil.getSession().getAttribute(Constants.LOGIN_USER);
                if (user_session!=null) { //证明用户已登录，不允许相同账号的登录
                    object.put("ERROR_MESSAGE", "该账号已登录！");
                    return object.toString();
                } else {  //尚未有该用户登录，需要获取个人信息，保存用户名等，用以显示
                    /*String ipAddr = ToolsUtil.getIpAddr(request);
				    System.out.println("当前用户IP为：" + ipAddr);*/
                    User user = loginService.showUserInfo(uid);
                    /*保存信息，用于验证登录拦截器*/
                    session.setAttribute(Constants.LOGIN_USER, user);

                    session.setAttribute("myinfo", user);

                    String lasttime = ToolsUtil.getTime("yyyy-MM-dd HH:mm:ss", 0);
                    User user2 = loginService.showUserInfo(uid);
                    user2.setLasttime(lasttime);
                    int k = loginService.upUser(user2); // 此处可以对k进行判断，提示等

                    String logintime = ToolsUtil.getTime("yyyy年MM月dd日 HH:mm:ss", 0);
                    // 登录日志记录，此处为日志插入单独写了一个方法，调用即可
                    String descb = "您在【" + logintime + "】登录了本商城";
                    Log log = ToolsUtil.insertLog(uid, descb);
                    int m = loginService.insertUserLog(log);
                }
            } else {
                object.put("ERROR_MESSAGE", "密码错误，请重新输入！");
            }
        } else {
            object.put("ERROR_MESSAGE", "账号不存在！");
        }
        return object.toString();   //由于前端ajax在接收服务器数据时一般是字符串，因此要用“.toString()”方法转化
    }

    /**
     * 用户注册
     * */
    @ResponseBody
    @RequestMapping(value = "/register", produces = "application/json;charset=UTF-8")
    public Map<String,Object> register(User user) {
        Map<String, Object> map=new HashMap<String, Object>();

        User ex_user = loginService.selUserByUname(user.getUname());
        if(ex_user==null){
            user.setBytime(ToolsUtil.getTime("yyyy-MM-dd HH:mm:ss", 0));
            int i = loginService.addUser(user);
            User new_user = loginService.selUserByUname(user.getUname());
            map.put("add_res", i);
            map.put("add_userres", new_user);
        }else {
            map.put("add_res", 0);
        }
        return map;
    }

    /**
     * 退出
     */
    @ResponseBody
    @RequestMapping(value = "/invali", produces = "application/json;charset=UTF-8")
    public String invali(HttpSession session) {
        session.invalidate();
        JSONObject object=new JSONObject();
        object.put("test_date", " ");
        return object.toString();
        /*String str = ToolsUtil.getContextPath() + "/goindex.jsp";
        response.sendRedirect(str);*/
    }
}
