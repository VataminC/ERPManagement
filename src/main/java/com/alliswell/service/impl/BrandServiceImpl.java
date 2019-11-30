package com.alliswell.service.impl;

import com.alliswell.mapper.BrandMapper;
import com.alliswell.pojo.Brand;
import com.alliswell.util.PageBean;
import com.alliswell.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BrandServiceImpl implements BrandService {
    @Autowired
    private BrandMapper brandMapper;

    @Override
    public List<Brand> backAll() {
        return brandMapper.selAll();
    }

    @Override
    public Brand selById(int id) {
        return brandMapper.selById(id);
    }

    @Override
    public PageBean paging(int pageSize, int pageNumber) {
        List<Brand> brands = brandMapper.selAll();
        PageBean pageBean =  new PageBean(pageNumber,brands.size(),pageSize);
        List<Brand> brandList = brandMapper.selPaging(pageBean.getPageSize() * (pageBean.getPageNumber() - 1), pageBean.getPageSize());
        pageBean.setBeanList(brandList);
        return pageBean;
    }
    @Override
    public void update(Brand brand){
        brandMapper.updBrand(brand);
    }

    @Override
    public void delete(int id) {
        brandMapper.delById(id);
    }

    @Override
    public void insert(String name) {
        brandMapper.insBrand(name);
    }

}
