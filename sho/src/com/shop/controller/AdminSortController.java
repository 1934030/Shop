package com.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shop.model.ClassIfication;
import com.shop.service.ClassIficationService;

@Controller
@RequestMapping("/sort")
public class AdminSortController {

    @Resource
    private ClassIficationService classIficationService;

    @ResponseBody
    @RequestMapping(value = "/getSort", produces = "application/json;charset=UTF-8")
    public Map<String, Object> getSort() {
        Map<String, Object> map = new HashMap<String, Object>();
        List<ClassIfication> list = classIficationService.selAllClass();
        map.put("sort_list", list);
        return map;
    }

    @RequestMapping(value = "/addSort")
    public ModelAndView addSort(ClassIfication sort) {
        ModelAndView view = new ModelAndView();
        classIficationService.addSort(sort);
        view.setViewName("backstage/pro_manage_sort");
        return view;
    }

    @RequestMapping(value = "/deleteSort")
    public ModelAndView deleteSort(Integer classid) {
        ModelAndView view = new ModelAndView();
        classIficationService.deleteSort(classid);
        view.setViewName("backstage/pro_manage_sort");
        return view;
    }

    @ResponseBody
    @RequestMapping(value = "/alterSort", produces = "application/json;charset=UTF-8")
    public Map<String, Object> alterSort(ClassIfication sort) {
        Map<String, Object> map = new HashMap<String, Object>();
        int i = classIficationService.upSort(sort);
        map.put("sort_alter", i);
        return map;
    }
}
