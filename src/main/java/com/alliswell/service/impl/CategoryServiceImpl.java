package com.alliswell.service.impl;

import com.alliswell.mapper.CategoryMapper;
import com.alliswell.pojo.Category;
import com.alliswell.util.PageBean;
import com.alliswell.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    public List<Category> BackAll() {
        return categoryMapper.selAll();
    }

    @Override
    public Category selById(int g_brand) {
        return categoryMapper.selById(g_brand);
    }

    @Override
    public PageBean paging(int pageSize, int pageNumber) {
        int count = categoryMapper.selCount();
        PageBean pageBean = new PageBean(pageNumber,count,pageSize);
        List<Category> categoryList = categoryMapper.selPaging(pageBean.getPageSize() * (pageBean.getPageNumber() - 1), pageBean.getPageSize());
        pageBean.setBeanList(categoryList);
        return pageBean;
    }

    @Override
    public void updCategory(Category category) {
        categoryMapper.udpCategory(category);
    }

    @Override
    public void insCategory(String name) {
        categoryMapper.insCategory(name);
    }

    @Override
    public void deleteByCategoryId(int id) {
        categoryMapper.delById(id);
    }


}
