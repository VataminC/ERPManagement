package com.alliswell.controller;

import com.alliswell.pojo.OrderItem;
import com.alliswell.util.PageBean;
import com.alliswell.pojo.Store;
import com.alliswell.service.OrderItemService;
import com.alliswell.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("store")
public class StoreController {

    @Autowired
    private StoreService storeServiceImpl;
    @Autowired
    private OrderItemService orderItemServiceImpl;

    @RequestMapping(value = "toManage")
    public String toManage(){
        return "redirect:paging";
    }

    @RequestMapping(value = "paging")
    public String paging(@RequestParam(value = "pageSize",defaultValue ="8",required = false) int pageSize,
                         @RequestParam(value = "pageNumber",defaultValue ="1",required = false) int pageNumber,
                         Model model){
        PageBean pageBean = storeServiceImpl.paging(pageSize, pageNumber);
        model.addAttribute("pageBean",pageBean);
        return "view/storeManage/storeManage";
    }

    @RequestMapping(value = "selByCondition")
    public String selByCondition(String condition,String content,Model model){
        PageBean pageBean = storeServiceImpl.selByCondition(condition, content);
        model.addAttribute("pageBean",pageBean);
        return "view/storeManage/storeManage";
    }

    @RequestMapping(value = "toWarehousing")
    public ModelAndView toWarehousing(Integer sId, ModelAndView modelAndView){
        Store store = storeServiceImpl.selById(sId);
        modelAndView.addObject("store",store);
        modelAndView.setViewName("view/storeManage/goodsWarehousing");
        return modelAndView;
    }

    @RequestMapping(value = "addRepertory")
    public ModelAndView addRepertory(Integer sId,Integer gId,Integer residueGoods,Integer addRepertory, ModelAndView modelAndView){
        if(addRepertory == null && "".equals(addRepertory)){
            addRepertory = 0;
        }
        storeServiceImpl.addRepertory(sId,gId,residueGoods+addRepertory);
        modelAndView.setViewName("redirect:paging");
        return modelAndView;
    }

    @RequestMapping(value = "detail")
    public ModelAndView orderDetail(int goodsId){
        List<OrderItem> orderItems = orderItemServiceImpl.storeDetail(goodsId);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("view/storeManage/storeDetail");
        modelAndView.addObject("orderItems",orderItems);
        return modelAndView;
    }

}
