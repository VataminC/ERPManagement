package com.alliswell.service;

import com.alliswell.pojo.Brand;
import com.alliswell.util.PageBean;

import java.util.List;

public interface BrandService {
    List<Brand> backAll();

    Brand selById(int id);

    PageBean paging(int pageSize,int pageNumber);

    void update(Brand brand);

    void delete(int id);

    void insert(String name);
}
