package com.alliswell.mapper;

import com.alliswell.pojo.Brand;

import java.util.List;

public interface BrandMapper {

    Brand selById(int id);

    List<Brand> selAll();

    void delById(int id);

    void insBrand(String name);

    void updBrand(Brand brand);

    List<Brand> selPaging(int pageStart,int pageNumber);
}
