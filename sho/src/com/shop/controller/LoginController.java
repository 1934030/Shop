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
     * produces="application/json;charset=UTF-8"����ֹajax��ȡ����ʱ��������
     * @return �����ݻش���ajax
     */
    @ResponseBody
    @RequestMapping(value = "/usertologin", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public Object usertologin(
            Integer uid,
            String upswd,
            HttpServletResponse response,
            HttpSession session) {
        //���� JSONObject ��������ѷ���������� json �����ݸ�ʽ�洢�����ڼ������͵����ݻ�Ҫ�õ� JSONArray ����
        JSONObject object = new JSONObject();
        int i = loginService.checkUid(uid);
        if (i > 0) { // ֤���˺Ŵ��ڣ�����������֤
            object.put("num_i", i);
            object.put("SUCCESS_MESSAGE", "�˺���֤�ɹ���");

            int j = loginService.checkLogin(new User(uid, upswd));
            if (j > 0) { // ������ȷ��������ͬ�˺ŵĵ�¼��֤
                object.put("num_j", j);
                object.put("SUCCESS_MESSAGE2", "������֤�ɹ���");

                User user_session = (User) CoreUtil.getSession().getAttribute(Constants.LOGIN_USER);
                if (user_session!=null) { //֤���û��ѵ�¼����������ͬ�˺ŵĵ�¼
                    object.put("ERROR_MESSAGE", "���˺��ѵ�¼��");
                    return object.toString();
                } else {  //��δ�и��û���¼����Ҫ��ȡ������Ϣ�������û����ȣ�������ʾ
                    /*String ipAddr = ToolsUtil.getIpAddr(request);
				    System.out.println("��ǰ�û�IPΪ��" + ipAddr);*/
                    User user = loginService.showUserInfo(uid);
                    /*������Ϣ��������֤��¼������*/
                    session.setAttribute(Constants.LOGIN_USER, user);

                    session.setAttribute("myinfo", user);

                    String lasttime = ToolsUtil.getTime("yyyy-MM-dd HH:mm:ss", 0);
                    User user2 = loginService.showUserInfo(uid);
                    user2.setLasttime(lasttime);
                    int k = loginService.upUser(user2); // �˴����Զ�k�����жϣ���ʾ��

                    String logintime = ToolsUtil.getTime("yyyy��MM��dd�� HH:mm:ss", 0);
                    // ��¼��־��¼���˴�Ϊ��־���뵥��д��һ�����������ü���
                    String descb = "���ڡ�" + logintime + "����¼�˱��̳�";
                    Log log = ToolsUtil.insertLog(uid, descb);
                    int m = loginService.insertUserLog(log);
                }
            } else {
                object.put("ERROR_MESSAGE", "����������������룡");
            }
        } else {
            object.put("ERROR_MESSAGE", "�˺Ų����ڣ�");
        }
        return object.toString();   //����ǰ��ajax�ڽ��շ���������ʱһ�����ַ��������Ҫ�á�.toString()������ת��
    }

    /**
     * �û�ע��
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
     * �˳�
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
