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
     * 管理员页面：显示所有用户
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
     * 管理员页面：显示用户信息
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
     * 管理员页面：修改用户信息
     */
    @ResponseBody
    @RequestMapping(value = "admupuser", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public Map<String, Object> admUpUser(
            User user,
            @RequestParam(value = "file", required = false) MultipartFile file,
            HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        User user_info = loginService.showUserInfo(user.getUid());

        String idPicPath = null;//绝对路径i
        String fileName = null;//自定义图片名

        if (file != null) {
            //服务器路径 + 路径分隔符（\） + 文件夹名
            String path = request.getSession().getServletContext().getRealPath("statics" + File.separator + "uploadfiles");//文件上传后保存到的服务器路径，File.separator是路径分隔符（\）

            //源文件名
            String oldFileName = file.getOriginalFilename();
            //源文件后缀名
            String prefix = FilenameUtils.getExtension(oldFileName);
            int filesize = 900000;
            if (file.getSize() > filesize) {
                map.put("upError", "* 上传文件大小不得超过900KB！");
            } else if (prefix.equalsIgnoreCase("jpg")
                    || prefix.equalsIgnoreCase("png")
                    || prefix.equalsIgnoreCase("jpeg")
                    || prefix.equalsIgnoreCase("pneg")) {   //图片上传格式正确

                //新文件名为：系统时间+随机数+固定后缀，因为同一时刻也可能有多人修改头像，这样可保证文件唯一
                Random random = new Random();
                fileName = System.currentTimeMillis() + random.nextInt(100000) * 100 + "_Person.jpg";

                //创建对象接收用户上传的文件流
                File targetFile = new File(path, fileName);
                if (!targetFile.exists()) {//如果path+fileName不存在则自动创建
                    targetFile.mkdirs();
                }
                //保存
                try {
                    file.transferTo(targetFile);//异常捕获，文件上传
                } catch (Exception e) {
                    e.printStackTrace();
                    map.put("upError", "* 上传失败！");
                    return map;
                }
            } else {
                map.put("upError", "* 图片上传格式不正确！");
                return map;
            }
            //原头像
            String oldHeadimgPath = user_info.getHeadimg();
            String delpath = path + File.separator + oldHeadimgPath;
            //如果不是默认图片则删除
            if (!oldHeadimgPath.equals("1571405904746_Person.jpg")) {
                //拿到图片地址，把本地图片删除
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
        //修改成功后重新查询
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