package com.alliswell.controller;

import com.alliswell.pojo.*;
import com.alliswell.service.GoodsService;
import com.alliswell.service.OrderItemService;
import com.alliswell.service.OrderService;
import com.alliswell.service.StoreService;
import com.alliswell.util.JsonUtil;
import com.alliswell.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.*;


@Controller
@RequestMapping("order")
public class OrderController {

    @Autowired
    private OrderService orderServiceImpl;
    @Autowired
    private GoodsService goodsServiceImpl;
    @Autowired
    private OrderItemService orderItemServiceImpl;
    @Autowired
    private StoreService storeServiceImpl;

    /**
     * 库存分页
     * @param pageSize 页面大小
     * @param pageNumber 页码
     * @param model
     * @return
     */
    @RequestMapping(value = "paging")
    public String paging(@RequestParam(value = "pageSize",defaultValue ="8",required = false) int pageSize,
                         @RequestParam(value = "pageNumber",defaultValue ="1",required = false) int pageNumber,
                         Model model){
        PageBean pageBean = orderServiceImpl.paging(pageSize, pageNumber);
        model.addAttribute("pageBean",pageBean);
        return "view/orderManage/orderManage";
    }
    @RequestMapping(value = "toInsertPaging")
    public String toInsertPaging(@RequestParam(value = "pageSize",defaultValue ="8",required = false) int pageSize,
                         @RequestParam(value = "pageNumber",defaultValue ="1",required = false) int pageNumber,
                         Model model){
        PageBean pageBean = goodsServiceImpl.paging(pageSize, pageNumber);
        model.addAttribute("pageBean",pageBean);
        return "view/orderManage/insertOrder";
    }
    @RequestMapping(value = "createOrder")
    public ModelAndView createOrder(String data, HttpSession session){
        HashMap<String, Object> map = JsonUtil.jsonFormatOrderItem(data);
        Order order = new Order();
        order.setId((String)map.get("s"));
        order.setUser((User)session.getAttribute("login"));
        order.setGoodsNum((int)map.get("totalNum"));
        order.setTotalMoney((BigDecimal)map.get("totalMoney"));
        orderServiceImpl.insert(order);
        orderItemServiceImpl.insert((List<OrderItem>)map.get("itemList"));
        return new ModelAndView("view/orderManage/orderManage");
    }
    @RequestMapping(value = "detail")
    public String orderDetail(String oId,Model model){
        List<OrderItem> orderItems = orderItemServiceImpl.orderDetail(oId);
        model.addAttribute("orderItems",orderItems);
        return "view/orderManage/orderDetail";
    }
    @RequestMapping(value = "search")
    public String search(String condition,String content,Model model){
        if(("".equals(condition) || condition == null) && ("".equals(content) || content==null)){
            return "redirect:paging";
        }else{
            model.addAttribute("pageBean",orderServiceImpl.selectLike(condition,content));
            return "view/orderManage/orderManage";
        }
    }
    @RequestMapping(value = "print")
    public String orderPrint(String oId){
        orderServiceImpl.orderHandle(oId,2);
        storeServiceImpl.changeRepertory(oId,"print");
        return "redirect:paging";
    }
    @RequestMapping(value = "deliver")
    public String orderDeliver(String oId){
        orderServiceImpl.orderHandle(oId,3);
        storeServiceImpl.changeRepertory(oId,"deliver");
        return "redirect:paging";
    }
    @RequestMapping(value = "delete")
    public String delete(String oId){
        orderServiceImpl.deleteById(oId);
        return "redirect:paging";
    }
}
