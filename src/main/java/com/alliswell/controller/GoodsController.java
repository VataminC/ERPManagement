package com.alliswell.controller;

import com.alibaba.fastjson.JSONObject;
import com.alliswell.pojo.Brand;
import com.alliswell.pojo.Category;
import com.alliswell.pojo.Goods;
import com.alliswell.pojo.PageBean;
import com.alliswell.service.BrandService;
import com.alliswell.service.CategoryService;
import com.alliswell.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("goods")
public class GoodsController {
    @Autowired
    private GoodsService goodsServiceImpl;
    @Autowired
    private BrandService brandServiceImpl;
    @Autowired
    private CategoryService categoryServiceImpl;

    @RequestMapping(value = "paging")
    public String paging(@RequestParam(value = "pageSize",defaultValue ="8",required = false) int pageSize,
                       @RequestParam(value = "pageNumber",defaultValue ="1",required = false) int pageNumber,
                         Model model){
        PageBean pageBean = goodsServiceImpl.paging(pageSize, pageNumber);
        model.addAttribute("pageBean",pageBean);
        return "view/goodsManage/goodsManage";
    }
    @RequestMapping(value = "search")
    public String search(String condition,String content,Model model){
        PageBean pageBean = goodsServiceImpl.search(condition, content);
        model.addAttribute("pageBean",pageBean);
        return "view/goodsManage/goodsManage";
    }
    @RequestMapping(value = "deleteGoods")
    public String deleteDo(int g_id){
        goodsServiceImpl.delById(g_id);
        return "redirect:paging";
    }
    @RequestMapping(value = "toUpdateGoods")
    public String toUpdateGoods(int g_id,Model model){
        Goods goods = goodsServiceImpl.selById(g_id);
        model.addAttribute("goods",goods);
        return "view/goodsManage/updateGoods";
    }
    @RequestMapping(value = "updateGoods")
    public String updateGoods(int g_id, String g_name, int g_category, int g_brand, BigDecimal g_price){
        Goods goods = new Goods();
        goods.setId(g_id);
        goods.setName(g_name);
        goods.setCategory(categoryServiceImpl.selById(g_category));
        goods.setBrand(brandServiceImpl.selById(g_brand));
        goods.setPrice(g_price);
        goodsServiceImpl.updGoods(goods);
        return "redirect:paging";
    }

    @RequestMapping(value = "insertGoods")
    public String insertGoods(String g_name, int g_category, int g_brand, BigDecimal g_price){
        Goods goods = new Goods();
        goods.setName(g_name);
        goods.setCategory(categoryServiceImpl.selById(g_category));
        goods.setBrand(brandServiceImpl.selById(g_brand));
        goods.setPrice(g_price);
        goodsServiceImpl.insGoods(goods);
        return "redirect:paging";
    }
    @RequestMapping(value = "toInsert")
    public String toInsertPage(){
        return "view/goodsManage/insertGoods";
    }

    @RequestMapping(value = "batchdel")
    public String batchDelete(){
        return "redirect:paging";
    }

    @RequestMapping(value = "render",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String renderSelect(){
        List<Brand> brandList = brandServiceImpl.backAll();
        List<Category> categoryList = categoryServiceImpl.BackAll();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("brand",brandList);
        jsonObject.put("category",categoryList);
        System.out.println(jsonObject.toJSONString());
        return jsonObject.toJSONString();
    }
    @RequestMapping(value = "delById")
    public String delById(int g_id){
        goodsServiceImpl.delById(g_id);
        return "redirect:paging";
    }
}
