package com.shop.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.shop.model.ClassIfication;
import com.shop.model.Product;
import com.shop.service.ClassIficationService;
import com.shop.service.LoginService;
import com.shop.service.ProductService;
import com.shop.util.ToolsUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/adminproduct")
public class AdminProductController {

    @Resource
    private ProductService productService;

    @Resource
    private LoginService loginService;

    @Resource
    private ClassIficationService classIficationService;

    /**
     * ��Ʒ�б�
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
     * ����Աҳ�棺��ʾ��Ʒ�б�
     */
    @ResponseBody
    @RequestMapping(value = "productlist", produces = "application/json;charset=UTF-8")
    public Map<String, Object> prodectList() {
        //��ҳ�б�
        /*int everyPage = Constants.PEODUCT_MAXSIZE;//ÿҳ��¼��
        int totalCount = 10;
        int currentPage;

        if (scurrentPage == null) {
            currentPage = 1;//Ĭ��1���ӵ�һҳ��ʼ����
        } else {
            currentPage = Integer.parseInt(scurrentPage);
        }

        Map<String, Object> map = new HashMap<String, Object>();
        if(classid==0){ //��ѯ���е���Ʒ�б�
            totalCount = productSvc.proSelAllCount();//��ȡ�ܼ�¼��
            //��ҳ��Ϣ���ɹ�����Է�ҳ������Ϣ���м��㡢����
            Page page = ToolsUtil.createPage(everyPage, totalCount, currentPage, classid);
            List<Product> list = productSvc.findAllPage(page);
            map.put("page_info", page);
            map.put("pro_all_list", list);
        }else {
            totalCount = productSvc.proSelCount(classid);
            Page page = ToolsUtil.createPage(everyPage, totalCount, currentPage, classid);
            List<Product> list = productSvc.findPage(page);
            map.put("page_info", page);
            map.put("pro_class_list", list);
        }*/

        Map<String, Object> map = new HashMap<String, Object>();
        List<Product> list = productService.selProductAll();
        map.put("pro_all_list", list);
        return map;
    }

    /**
     * ��ʾ��̨��ҳ��������Ʒ*6
     * */
    @ResponseBody
    @RequestMapping(value = "prolistcount", produces = "application/json;charset=UTF-8")
    public Map<String, Object> proListCount() {
        Map<String, Object> map = new HashMap<String, Object>();
        List<Product> list = productService.selNumProduct(6);
        map.put("my_list", list);
        return map;
    }

    /**
     * ����Աҳ�棺��ʾ��Ʒ��Ϣ
     */
    @RequestMapping(value = "proalter")
    public String amdSelUserByID(
            Integer pid,
            HttpServletRequest request) {
        Product product = productService.proSelByCId(pid);
        List<ClassIfication> list = classIficationService.selAllClass();
        request.setAttribute("adm_proinfo", product);
        request.setAttribute("adm_classlist", list);
        return "backstage/pro_alter";
    }

    /**
     * ����Աҳ�棺�޸���Ʒ��Ϣ
     */
    @ResponseBody
    @RequestMapping(value = "admUpProduct", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public Map<String, Object> admUpProduct(
            Product product,
            @RequestParam(value = "file", required = false) MultipartFile profile,
            HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        Product pro_info = productService.proSelByCId(product.getPid());

        if (profile != null) {
            String path = request.getSession().getServletContext().getRealPath("statics" + File.separator + "upprodectimg");//�ļ��ϴ��󱣴浽�ķ�����·����File.separator��·���ָ�����\��
            String res = ToolsUtil.upPic(path, profile, pro_info);
            if (res != null) {
                map.put("upError", res);
                return map;
            }
        }
        if (!("").equals(product.getPname())) {
            pro_info.setPname(product.getPname());
        }
        if (product.getPrice() != null) {
            pro_info.setPrice(product.getPrice());
        }
        if (product.getStock() != null) {
            pro_info.setStock(product.getStock());
        }
        if (!("").equals(product.getTitle())) {
            pro_info.setTitle(product.getTitle());
        }
        if (!("").equals(product.getDescb())) {
            pro_info.setDescb(product.getDescb());
        }
        if (product.getClassid() != null) {
            pro_info.setClassid(product.getClassid());
        }

        int i = productService.upProduct(pro_info);
        map.put("adm_upres", i);
        return map;
    }

    /**
     * ��Ʒ���
     * */
    @ResponseBody
    @RequestMapping(value = "addProduct", produces = "application/json;charset=UTF-8")
    public Map<String, Object> addProduct(
            Product product,
            @RequestParam(value = "addfile", required = false) MultipartFile addfile,
            HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();

        if (addfile != null) {
            String path = request.getSession().getServletContext().getRealPath("statics" + File.separator + "upprodectimg");
            String add_res = ToolsUtil.upPic(path, addfile, product);
            if (add_res != null) {
                System.out.println("�ļ��ϴ�ʧ��");
                map.put("upError", add_res);
                return map;
            }
        } else {
            product.setPimg("1572611601955_Product.jpg");
        }
        product.setBytime(ToolsUtil.getTime("yyyy-MM-dd HH:mm:ss", 0));
        int i = productService.addProduct(product);
        map.put("resI", i);
        return map;
    }

    /**
    * ��Ʒɾ��
    * */
    @ResponseBody
    @RequestMapping(value = "delProduct", produces = "application/json;charset=UTF-8")
    public Map<String, Object> delProduct(
            Integer pid) {
        Map<String, Object> map = new HashMap<String, Object>();
        int i = productService.delProduct(pid);
        map.put("delPro_res", i);
        return map;
    }
}
