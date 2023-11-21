package com.shop.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.apache.commons.io.FilenameUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.shop.model.ClassIfication;
import com.shop.model.Log;
import com.shop.model.Page;
import com.shop.model.Product;
import com.shop.service.ClassIficationService;
import com.shop.service.LoginService;
import com.shop.service.ProductService;
import com.shop.util.Constants;
import com.shop.util.ToolsUtil;
import com.shop.util.UserUtil;

@Controller
@RequestMapping(value = "/product")
public class ProductController {

    @Resource
    private ProductService productService;
    @Resource
    private LoginService loginService;
    @Resource
    private ClassIficationService classIficationService;

    /**
     * չʾ��Ʒ��Ϣ
     */
    @RequestMapping(value = "/showpro")
    public String showphone(
            Integer classid,
            HttpServletRequest request,
            String scurrentPage) {
        int everyPage = Constants.PEODUCT_MAXSIZE;//ÿҳ��¼��
        int totalCount = productService.proSelCount(classid);//��ȡ�ܼ�¼��
        int currentPage; //��ǰҳ

        if (scurrentPage == null) {
            currentPage = 1;//Ĭ��1���ӵ�һҳ��ʼ����
        } else {
            currentPage = Integer.parseInt(scurrentPage);
        }

        //��ҳ��Ϣ���ɹ�����Է�ҳ������Ϣ���м��㡢����
        Page page = ToolsUtil.createPage(everyPage, totalCount, currentPage, classid);
        List<Product> list = productService.findPage(page);

        ClassIfication classinfo = productService.findClassName(classid);
        String time = ToolsUtil.getTime("yyyy-MM-dd hh:mm:ss", 0);
        request.setAttribute("nowdate", time);
        request.setAttribute("mypage", page);
        request.setAttribute("myphone", list);
        request.setAttribute("mycinfo", classinfo);

        String time_ago = ToolsUtil.getTime("yyyy-MM-dd HH:mm:ss", -7);
        request.setAttribute("mypasetime", time_ago);
        return "product";
    }

    /**
     * ������Ʒ�б�
     */
    @ResponseBody
    @RequestMapping(value = "getHotList", produces = "application/json;charset=UTF-8")
    public Map<String, Object> getHotList() {
        Map<String, Object> map = new HashMap<String, Object>();
        /* selTypePro�������壺���տ������ 3 ����Ʒ���������ѯ���������Ϊ��ǰ�����ϵ��*/
        List<Product> list = productService.selTypePro("stock", 3, "DESC");
        map.put("my_pro_list", list);
        return map;
    }

    /**
     * �����ƷͼƬ���������ҳ��
     */
    @RequestMapping(value = "/productinfo")
    public ModelAndView productinfo(
            Integer pid) {
        ModelAndView view = new ModelAndView();
        Product product = productService.proSelByCId(pid);
        view.addObject("myproinfo", product);
        view.setViewName("proinfo");
        if(product!=null){
            String descb = "������ˡ�" + product.getCname() + "�������µġ�" + product.getPname() + "��";
            Log log = ToolsUtil.insertLog(UserUtil.getLoginUserId(), descb);
            loginService.insertUserLog(log);
        }
        return view;
    }

    /**
     * ��Ʒģ����ѯ����
     */
    @RequestMapping(value = "searchPro")
    public ModelAndView searchPro(
            String searchkey,
            Integer classid) {
        ModelAndView view = new ModelAndView();
        List<Product> list = productService.searchProduct(searchkey, classid);
        String str_search = searchkey;
        if("".equals(str_search)){
            str_search ="����û������";
        }
        view.addObject("search_key", str_search);
        view.addObject("search_list", list);
        view.setViewName("pro_search");
        return view;
    }
}
