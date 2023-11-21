package com.shop.controller;


import org.apache.commons.io.FilenameUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.shop.model.User;
import com.shop.service.LoginService;

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
@RequestMapping("adminuser")
public class AdminUserController {

    @Resource
    private LoginService loginService;

    @RequestMapping("userinfo")
    public String userInfo() {
        return "user_info";
    }

    /**
     * ����Աҳ�棺��ʾ�����û�
     */
    @ResponseBody
    @RequestMapping(value = "showalluser", produces = "application/json;charset=UTF-8")
    public Map<String, Object> showAllUser() {
        List<User> list = loginService.selAllUser();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("adm_alluser", list);
        return map;
    }

    /**
     * ����Աҳ�棺��ʾ�û���Ϣ
     */
    @RequestMapping(value = "useralter", produces = "application/json;charset=UTF-8")
    public String amdSelUserByID(
            Integer uid,
            HttpServletRequest request) {
        User user = loginService.showUserInfo(uid);
        request.setAttribute("adm_userinfo", user);
        return "backstage/user_alter";
    }

    /**
     * ����Աҳ�棺�޸��û���Ϣ
     */
    @ResponseBody
    @RequestMapping(value = "admupuser", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public Map<String, Object> admUpUser(
            User user,
            @RequestParam(value = "file", required = false) MultipartFile file,
            HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        User user_info = loginService.showUserInfo(user.getUid());

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
            String oldHeadimgPath = user_info.getHeadimg();
            String delpath = path + File.separator + oldHeadimgPath;
            //�������Ĭ��ͼƬ��ɾ��
            if (!oldHeadimgPath.equals("1571405904746_Person.jpg")) {
                //�õ�ͼƬ��ַ���ѱ���ͼƬɾ��
                File f1 = new File(delpath);
                f1.delete();
            }
            user_info.setHeadimg(fileName);
        }

        if (!("").equals(user.getUname())) {
            user_info.setUname(user.getUname());
        }
        if (!("").equals(user.getPassword())) {
            user_info.setPassword(user.getPassword());
        }
        if (!("").equals(user.getMyname())) {
            user_info.setMyname(user.getMyname());
        }
        if (!("").equals(user.getSex())) {
            user_info.setSex(user.getSex());
        }
        if (user.getVip() != null) {
            user_info.setVip(user.getVip());
        }
        if (!("").equals(user.getPhone())) {
            user_info.setPhone(user.getPhone());
        }
        if (!("").equals(user.getEmail())) {
            user_info.setEmail(user.getEmail());
        }
        if (!("").equals(user.getAddress())) {
            user_info.setAddress(user.getAddress());
        }
        if (!("").equals(user.getSignature())) {
            user_info.setSignature(user.getSignature());
        }
        int i = loginService.upUser(user_info);
        System.out.println(i);
        //�޸ĳɹ������²�ѯ
        /*User new_user = loginSvc.showUserInfo(uid);
        request.setAttribute("adm_userinfo", new_user);*/
        map.put("adm_upres", i);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "delUser", produces = "application/json;charset=UTF-8")
    public Map<String, Object> delUser(Integer uid) {
        Map<String, Object> map = new HashMap<String, Object>();
        int i = loginService.delUserById(uid);
        map.put("delU_res", i);
        return map;
    }
}