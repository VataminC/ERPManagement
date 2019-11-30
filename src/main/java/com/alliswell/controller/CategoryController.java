package com.alliswell.controller;

import com.alliswell.pojo.Category;
import com.alliswell.pojo.PageBean;
import com.alliswell.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("category")
public class CategoryController {

    @Autowired
    private CategoryService categoryServiceImpl;

    @RequestMapping(value = "toCategoryManage")
    public String toCategoryManage(){
        return  "forward:paging";
    }

    @RequestMapping(value = "paging")
    public String paging(@RequestParam(value = "pageSize",defaultValue ="8",required = false) int pageSize,
                         @RequestParam(value = "pageNumber",defaultValue ="1",required = false) int pageNumber,
                         Model model){
        PageBean pageBean = categoryServiceImpl.paging(pageSize, pageNumber);
        model.addAttribute("pageBean",pageBean);
        return "view/goodsManage/categoryManage";
    }
    @RequestMapping(value = "toUpdateCategory")
    public String toUpdateBrand(Model model,int c_id){
        Category category = categoryServiceImpl.selById(c_id);
        model.addAttribute("category",category);
        return  "forward:paging";
    }
    @RequestMapping(value = "updateCategory")
    public String updateCategory(int reId,String reName){
        Category category = new Category(reId,reName);
        categoryServiceImpl.updCategory(category);
        return  "redirect:paging";
    }

    @RequestMapping(value = "insBrand")
    public String insBrand(String insName){
        categoryServiceImpl.insCategory(insName);
        return  "redirect:paging";
    }

}
