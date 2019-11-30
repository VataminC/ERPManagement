package com.alliswell.mapper;

import com.alliswell.pojo.Category;

import java.util.List;

public interface CategoryMapper {
    Category selById(int id);

    List<Category> selAll();

    int selCount();

    List<Category> selPaging(int startPage,int pageSize);

    void udpCategory(Category category);

    void insCategory(String name);

    void delById(int cId);
}
