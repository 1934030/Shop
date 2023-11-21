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
     * 商品列表
     */
    @ResponseBody
    @RequestMapping(value = "getHotList", produces = "application/json;charset=UTF-8")
    public Map<String, Object> getHotList() {
        Map<String, Object> map = new HashMap<String, Object>();
        /* selTypePro参数含义：按照库存搜索 3 个商品进行升序查询，库存最多的为当前最火热系列*/
        List<Product> list = productService.selTypePro("stock", 3, "DESC");
        map.put("my_pro_list", list);
        return map;
    }

    /**
     * 管理员页面：显示商品列表
     */
    @ResponseBody
    @RequestMapping(value = "productlist", produces = "application/json;charset=UTF-8")
    public Map<String, Object> prodectList() {
        //分页列表
        /*int everyPage = Constants.PEODUCT_MAXSIZE;//每页记录数
        int totalCount = 10;
        int currentPage;

        if (scurrentPage == null) {
            currentPage = 1;//默认1，从第一页开始访问
        } else {
            currentPage = Integer.parseInt(scurrentPage);
        }

        Map<String, Object> map = new HashMap<String, Object>();
        if(classid==0){ //查询所有的商品列表
            totalCount = productSvc.proSelAllCount();//获取总记录数
            //分页信息，由工具类对分页具体信息进行计算、设置
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
     * 显示后台主页的热门商品*6
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
     * 管理员页面：显示商品信息
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
     * 管理员页面：修改商品信息
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
            String path = request.getSession().getServletContext().getRealPath("statics" + File.separator + "upprodectimg");//文件上传后保存到的服务器路径，File.separator是路径分隔符（\）
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
     * 商品添加
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
                System.out.println("文件上传失败");
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
    * 商品删除
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
