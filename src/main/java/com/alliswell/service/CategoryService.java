package com.alliswell.service;

import com.alliswell.pojo.Category;
import com.alliswell.util.PageBean;

import java.util.List;

public interface CategoryService {
    List<Category> BackAll();

    Category selById(int g_brand);

    PageBean paging(int pageSize,int pageNumber);

    void updCategory(Category category);

    void insCategory(String name);

    void deleteByCategoryId(int id);
}
