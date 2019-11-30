package com.alliswell.service.impl;

import com.alliswell.mapper.StoreMapper;
import com.alliswell.pojo.PageBean;
import com.alliswell.pojo.Store;
import com.alliswell.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StoreServiceImpl implements StoreService {
    @Autowired
    private StoreMapper storeMapper;

    /**
     * 数据分页
     * @param pageNumber
     * @param pageSize
     * @return
     */
    @Override
    public PageBean paging(int pageSize, int pageNumber) {
        int count = storeMapper.selCount();
        PageBean pageBean = new PageBean(pageNumber,count,pageSize);
        List<Store> storeList = storeMapper.selByPaging(pageBean.getPageSize() * (pageBean.getPageNumber() - 1), pageBean.getPageSize());
        pageBean.setBeanList(storeList);
        return pageBean;
    }

    @Override
    public PageBean selByCondition(String condition, String content) {
        List<Store> storeList = storeMapper.selByCondition(condition, content);
        PageBean pageBean = new PageBean(1,storeList.size());
        pageBean.setBeanList(storeList);
        return pageBean;
    }

    @Override
    public Store selById(int id) {
        return storeMapper.selById(id);
    }

    @Override
    public void addRepertory(int sId, int gId, int addedRepertory) {
        storeMapper.updStoreRepertory(sId,gId,addedRepertory);
    }
}
