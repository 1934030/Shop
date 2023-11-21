package com.shop.controller;


import org.apache.commons.io.FilenameUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.util.ClassUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.shop.core.CoreUtil;
import com.shop.model.User;
import com.shop.service.LoginService;
import com.shop.util.Constants;
import com.shop.util.UserUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

@Controller
@RequestMapping("user")
public class UserController {

    @Resource
    private LoginService loginService;

    @RequestMapping("userinfo")
    public String userInfo() {
        return "user_info";
    }

    /*
     * �� @ModelAttribute ��ǵķ���, ���ڴ�controllerÿ������ִ��ǰ��ִ�У�
     * ��˶���һ��controllerӳ����URL���÷���˵��Ҫ����ʹ�á�
     * */
    @ModelAttribute
    public void query(Map<String, Object> map) {
        User user_session = (User) CoreUtil.getSession().getAttribute(Constants.LOGIN_USER);
        if (user_session != null) {
            User user = loginService.showUserInfo(UserUtil.getLoginUserId());
            map.put("user_map", user);   //map��key��ֵ�����󷽷���upUserInfo(User user)�������͵�����ĸСд��Ҳ��ͨ��@ModelAttribute("usermap")ָ��
        }
    }

    /*
     * �����û���Ϣ
     * 1.���������������ֶΣ�����ֻ�����һ�������ֶ�ʱ��
     * ����������г��ֵ��ֶ������Ϣ������ᱨ����ʾ�����ֶ�Ϊ���룬
     * ��֮�����µĲ��������Ȳ�ѯ�����û���Ϣ����������
     * 2.@ModelAttribute("user_map")User user ��ͨ��id�鵽���û���Ϣ����user�����У�������ֹ����ʱ����ֲ�Ϊ���ֶδ���
     * ���ڿ�ֵ���޸��ǲ�����ģ����ж�Ҫ��jQuery�з�������ǰ����
     * 3.��ʹ��User user���������ղ���ʱҪע�⣬
     * ǰ��form���µĸ��������name�ֶ��������ʵ����User�е��ֶ�����Ӧ��name���Ի�ȡ����input��value
     * */
    @ResponseBody
    @RequestMapping(value = "upuserinfo", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public Map<String, Object> upUserInfo(
            @ModelAttribute("user_map") User user,
            @RequestParam(value = "file", required = false) MultipartFile file,
            HttpServletRequest request,
            HttpSession session) throws IOException {
        Map<String, Object> map = new HashMap<String, Object>();

        String idPicPath = null;//����·��i
        String fileName = null;//�Զ���ͼƬ��

        if (file != null) {
            //������·�� + ·���ָ�����\�� + �ļ�����
            String path = request.getSession().getServletContext().getRealPath("statics" + File.separator + "uploadfiles");//�ļ��ϴ��󱣴浽�ķ�����·����File.separator��·���ָ�����\��

            //Դ�ļ���
            String oldFileName = file.getOriginalFilename();
            //Դ�ļ���׺��
            String prefix = FilenameUtils.getExtension(oldFileName);
            int filesize = 900000;
            if (file.getSize() > filesize) {
                map.put("upError", "* �ϴ��ļ���С���ó���900KB��");
            } else if (prefix.equalsIgnoreCase("jpg")
                    || prefix.equalsIgnoreCase("png")
                    || prefix.equalsIgnoreCase("jpeg")
                    || prefix.equalsIgnoreCase("pneg")) {   //ͼƬ�ϴ���ʽ��ȷ

                //���ļ���Ϊ��ϵͳʱ��+�����+�̶���׺����Ϊͬһʱ��Ҳ�����ж����޸�ͷ�������ɱ�֤�ļ�Ψһ
                Random random = new Random();
                fileName = System.currentTimeMillis() + random.nextInt(100000) * 100 + "_Person.jpg";

                //������������û��ϴ����ļ���
                File targetFile = new File(path, fileName);
                if (!targetFile.exists()) {//���path+fileName���������Զ�����
                    targetFile.mkdirs();
                }
                //����
                try {
                    file.transferTo(targetFile);//�쳣�����ļ��ϴ�
                    map.put("adm_upres", 1);
                } catch (Exception e) {
                    e.printStackTrace();
                    map.put("upError", "* �ϴ�ʧ�ܣ�");
                    return map;
                }
            } else {
                map.put("upError", "* ͼƬ�ϴ���ʽ����ȷ��");
                return map;
            }
            //ԭͷ��
            String oldHeadimgPath = user.getHeadimg();
            String delpath = request.getSession().getServletContext().getRealPath("statics" + File.separator + "uploadfiles") + File.separator + oldHeadimgPath;
            System.out.println(delpath);
            //�������Ĭ��ͼƬ��ɾ��
            if (!oldHeadimgPath.equals("1571405904746_Person.jpg")) {
                //�õ�ͼƬ��ַ���ѱ���ͼƬɾ��
                File f1 = new File(delpath);
                f1.delete();
            }

            user.setHeadimg(fileName);
        }
        /*
         * �Բ��������жϣ�
         * ���Ϊnull����δ����ǰget�����ֵ����ԭ����
         **/
        User old_user = loginService.showUserInfo(user.getUid());
        if (("").equals(user.getUname())) {
            user.setUname(old_user.getUname());
        }
        if (("").equals(user.getAddress())) {
            user.setAddress(old_user.getAddress());
        }
        if (("").equals(user.getSignature())) {
            user.setSignature(old_user.getSignature());
        }
        if (("").equals(user.getPhone())) {
            user.setPhone(old_user.getPhone());
        }
        if (("").equals(user.getEmail())) {
            user.setEmail(old_user.getEmail());
        }
        int i = loginService.upUser(user);
        if (i > 0) {
            //���³ɹ���Ӧ���±���session��Ϣ
            session.setAttribute("myinfo", user);
            session.setAttribute(Constants.LOGIN_USER, user);
            //request.setAttribute("mysavebasic", i);
            map.put("mysavebasic", i);
        }
        /*ע�⣺ʹ��return����json����Ҫ��ʹ��@ResponseBodyע�⣬
        ��������Ӧ��response.getWriter().print(date)����ʽ����*/
        return map;
    }

    /**
     * �����޸�
     */
    @ResponseBody
    @RequestMapping(value = "upuserpswd", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public Object upUserPswd(
            @ModelAttribute("user_map") User user,
            HttpSession session,
            String old_pswd) {
        JSONObject object = new JSONObject();

        if (!old_pswd.equals(UserUtil.getLoginUserPswd())) {
            System.out.println("ԭ�������");
            object.put("mysavepswd", 0);
            object.put("ERROR_PSWD", "�������");
        } else {
            System.out.println("ԭ������ȷ");
            object.put("ERROR_PSWD", "������ȷ��");
            int i = loginService.upUser(user);
            object.put("mysavepswd", i);
            session.invalidate();
        }
        return object.toString();
    }
}