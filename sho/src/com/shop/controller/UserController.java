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
     * 有 @ModelAttribute 标记的方法, 会在此controller每个方法执行前被执行，
     * 因此对于一个controller映射多个URL的用法来说，要谨慎使用。
     * */
    @ModelAttribute
    public void query(Map<String, Object> map) {
        User user_session = (User) CoreUtil.getSession().getAttribute(Constants.LOGIN_USER);
        if (user_session != null) {
            User user = loginService.showUserInfo(UserUtil.getLoginUserId());
            map.put("user_map", user);   //map中key的值是请求方法（upUserInfo(User user)）中类型的首字母小写，也可通过@ModelAttribute("usermap")指定
        }
    }

    /*
     * 更改用户信息
     * 1.更新语句出现所有字段，而你只想更新一个或多个字段时，
     * 必须向语句中出现的字段填充信息，否则会报错，提示其余字段为必须，
     * 总之，更新的操作就是先查询更新用户信息，再做更新
     * 2.@ModelAttribute("user_map")User user 将通过id查到的用户信息放入user对象中，这样防止更新时会出现不为空字段错误
     * 对于空值的修改是不允许的，该判断要在jQuery中发送请求前处理
     * 3.当使用User user对象来接收参数时要注意，
     * 前端form表单下的各个组件的name字段名必须和实体类User中的字段名对应，name属性获取的是input的value
     * */
    @ResponseBody
    @RequestMapping(value = "upuserinfo", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public Map<String, Object> upUserInfo(
            @ModelAttribute("user_map") User user,
            @RequestParam(value = "file", required = false) MultipartFile file,
            HttpServletRequest request,
            HttpSession session) throws IOException {
        Map<String, Object> map = new HashMap<String, Object>();

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
                    map.put("adm_upres", 1);
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
            String oldHeadimgPath = user.getHeadimg();
            String delpath = request.getSession().getServletContext().getRealPath("statics" + File.separator + "uploadfiles") + File.separator + oldHeadimgPath;
            System.out.println(delpath);
            //如果不是默认图片则删除
            if (!oldHeadimgPath.equals("1571405904746_Person.jpg")) {
                //拿到图片地址，把本地图片删除
                File f1 = new File(delpath);
                f1.delete();
            }

            user.setHeadimg(fileName);
        }
        /*
         * 对参数进行判断，
         * 如果为null，则将未更新前get对象的值赋给原参数
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
            //更新成功后应重新保存session信息
            session.setAttribute("myinfo", user);
            session.setAttribute(Constants.LOGIN_USER, user);
            //request.setAttribute("mysavebasic", i);
            map.put("mysavebasic", i);
        }
        /*注意：使用return返回json数据要先使用@ResponseBody注解，
        否则数据应以response.getWriter().print(date)的形式返回*/
        return map;
    }

    /**
     * 密码修改
     */
    @ResponseBody
    @RequestMapping(value = "upuserpswd", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public Object upUserPswd(
            @ModelAttribute("user_map") User user,
            HttpSession session,
            String old_pswd) {
        JSONObject object = new JSONObject();

        if (!old_pswd.equals(UserUtil.getLoginUserPswd())) {
            System.out.println("原密码错误");
            object.put("mysavepswd", 0);
            object.put("ERROR_PSWD", "密码错误！");
        } else {
            System.out.println("原密码正确");
            object.put("ERROR_PSWD", "密码正确！");
            int i = loginService.upUser(user);
            object.put("mysavepswd", i);
            session.invalidate();
        }
        return object.toString();
    }
}