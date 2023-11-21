package com.shop.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shop.model.Log;
import com.shop.model.Order;
import com.shop.model.OrderDetail;
import com.shop.model.User;
import com.shop.service.LoginService;
import com.shop.service.OrderService;
import com.shop.service.ProductService;
import com.shop.util.Constants;
import com.shop.util.ToolsUtil;
import com.shop.util.UserUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: MR��Wang
 * Date: 2019/10/25
 * Time: ���� 11:48
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/order")
public class OrderController extends UserUtil {

    @Resource
    private OrderService orderService;

    @Resource
    private ProductService productService;

    @Resource
    private LoginService loginService;

    /**
     * ��������
     * ���� id ����
     */
    @RequestMapping(value = "genorder")
    public String genOrder(
            @RequestParam(required=false) Integer[] pid,
            @RequestParam(required=false) int[] pronum,
            Map<String,Object> map) {
        if(pid.length>0){
            List<Map<String, Object>> list = productService.proSelByCIds(pid, pronum);
            map.put("basic_info", list);
            System.out.println(pid.length+"-----"+pronum.length);
        }
        return "orderlist";
    }

    @RequestMapping("/addOrder")
    public String addOrder(
            String orderaddress,
            @RequestParam(required = false) Integer[] pid,
            @RequestParam(required = false) int[] pronum,
            HttpSession session) {
        Order order = new Order();
        order.setUid(getLoginUserId());
        order.setOrderaddress(orderaddress);
        /*Integer[] pid = {100001, 100002};
        int[] pronum = {23, 31};*/
        List<Map<String, Object>> prolist = productService.proSelByCIds(pid, pronum);
        List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
        for (Map<String, Object> aProlist : prolist) {
            OrderDetail od = new OrderDetail();
            od.setPid((Integer) aProlist.get("pid"));
            od.setPimg((String) aProlist.get("pimg"));
            od.setPname((String) aProlist.get("pname"));
            od.setPrice((Float) aProlist.get("price"));
            od.setOdetailnum((Integer) aProlist.get("pronum"));
            orderDetails.add(od);
        }
        /* �ʷ� 10-30 ��� */
        Random random = new Random();
        order.setPostalfee(random.nextInt(20) + 10);
        int i = orderService.addOrder(order, orderDetails); //�����Dao����order���������
        if(i>0){
            String descb = "�µ��ɹ��������ţ���" + order.getOrdercode() + "��";
            Log log = ToolsUtil.insertLog(UserUtil.getLoginUserId(), descb);
            loginService.insertUserLog(log);
        }
        System.out.println("----------" + i);
        return "redirect:getMyOrders";
    }

    @RequestMapping(value = "/getMyOrders")
    public ModelAndView getMyOrders(
            Integer status) {
        System.out.println("״̬��" + status);
        ModelAndView view = new ModelAndView();
        List<Order> list = orderService.getMyOrders(getLoginUserId(), status);
        view.addObject("order_list", list);
        view.setViewName("user_order");
        return view;
    }

    @ResponseBody
    @RequestMapping(value = "/orderStatus", produces = "application/json;charset=UTF-8")
    public Map<String, String> orderStatus(
            Integer orderid,
            int status,
            HttpSession session) {
        /*
         * ���� status �������û���ǰ����״̬���� curStatus ���ǵ�ǰ����״̬��
         * status ����������ղ�������Ķ���״̬�����磺��ǰ�û�����״̬Ϊ��1����δ��������
         * ���������˿����ʱ���� status Ϊ��2�����жϵ�ǰ����״̬���Ϊ��1�������״̬�޸�Ϊ��2����
         * ǰ̨ˢ����ʾ�����ύ�˿����룬�ȴ��̼Ҵ���
         **/
        Map<String, String> m = new HashMap<String, String>();
        try {
            boolean flag = false;
            int curStatus = orderService.getOrderStatusById(orderid);
            switch (status) {
                case 2://�����˿�
                    if (curStatus == 1) {
                        flag = true;
                    }
                    break;
                case 5://ȷ���ջ�
                    if (curStatus == 4) {
                        try {
                            int i = new Random().nextInt(9) + 1;
                            User user = loginService.showUserInfo(getLoginUserId());
                            user.setVip(user.getVip()+i);
                            int up = loginService.upUser(user);
                            if(up>0){
                                session.setAttribute(Constants.LOGIN_USER, user);
                                session.setAttribute("myinfo", user);
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        flag = true;
                    }
                    break;
                case 6://�����˻�
                    if (curStatus == 4) {
                        flag = true;
                    }
                    break;
                case 9://ȡ������
                    if (curStatus == 0) {
                        flag = true;
                    }
                    break;
                default:
                    flag = false;
            }
            if (flag) {
                orderService.upOrderStatus(orderid, status);
                m.put("handle", "success");
            } else {
                m.put("handle", "failure");
            }
        } catch (Exception e) {
            System.out.println(e.toString());
            m.put("handle", "exception");
        }
        return m;
    }

    @RequestMapping("/delMyOrders")
    public ModelAndView delMyOrders(
            Integer orderid,
            ModelAndView view) {
        int status = orderService.getOrderStatusById(orderid);
        if (status == 5 || status == 9) {//5 ���׳ɹ���9 ����ȡ��
            orderService.deleteOrder(orderid);
        } else {
            view.addObject("errorI", 0);
            view.addObject("errorMessage", "��Ǹ��Ŀǰ�Ķ���״̬������ɾ������");
        }
        view.setViewName("redirect:getMyOrders");
        return view;
    }

    @ResponseBody
    @RequestMapping("/toPay")
    public Map<String, Object> toPay(Integer orderid) {
        Map<String, Object> map = new HashMap<String, Object>();
        orderService.upOrderStatus(orderid, 1); // 1 δ����
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/countStatus", produces = "application/json;charset=UTF-8")
    public Map<String, Object> countStatus(
            Integer status) {
        Map<String, Object> map = new HashMap<String, Object>();
        int i = orderService.countOrderStatus(getLoginUserId(), status);// 0 δ����
        map.put("resCount", i);
        return map;
    }
}
