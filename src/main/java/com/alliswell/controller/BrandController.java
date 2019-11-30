package com.alliswell.controller;

import com.alliswell.pojo.Brand;
import com.alliswell.util.PageBean;
import com.alliswell.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("brand")
public class BrandController {
    @Autowired
    private BrandService brandServiceImpl;

    @RequestMapping(value = "toBrandManage")
    public String toBrandManage(){
        return "redirect:paging";
    }

    @RequestMapping(value = "paging")
    public String paging(@RequestParam(value = "pageSize",defaultValue ="8",required = false) int pageSize,
                         @RequestParam(value = "pageNumber",defaultValue ="1",required = false) int pageNumber,
                         Model model){
        PageBean pageBean = brandServiceImpl.paging(pageSize, pageNumber);
        model.addAttribute("pageBean",pageBean);
        return "view/goodsManage/brandManage";
    }
    @RequestMapping(value = "toUpdateBrand")
    public String toUpdateBrand(Model model,int b_id){
        Brand brand = brandServiceImpl.selById(b_id);
        model.addAttribute("brand",brand);
        return "forward:paging";
    }

    @RequestMapping(value = "updateBrand")
    public String updateBrand(int reId, String reName){
        Brand brand = new Brand(reId,reName);
        brandServiceImpl.update(brand);
        return "redirect:paging";
    }

    @RequestMapping(value = "delete")
    public String delete(int b_id){
        brandServiceImpl.delete(b_id);
        return "redirect:paging";
    }


    @RequestMapping(value = "insBrand")
    public String insBrand(String insName){
        brandServiceImpl.insert(insName);
        return "redirect:paging";
    }

}
