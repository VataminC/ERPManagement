package com.alliswell.service;

import com.alliswell.controller.CategoryController;
import com.alliswell.pojo.Category;
import com.alliswell.pojo.PageBean;

import java.util.List;

public interface CategoryService {
    List<Category> BackAll();

    Category selById(int g_brand);

    PageBean paging(int pageSize,int pageNumber);

    void updCategory(Category category);

    void insCategory(String name);
}
