package com.alliswell.service;

import com.alliswell.pojo.PageBean;
import com.alliswell.pojo.Store;

public interface StoreService {

    PageBean paging(int pageNumber,int pageSize);

    PageBean selByCondition(String condition,String content);

    Store selById(int id);

    void addRepertory(int sId,int gId,int addedRepertory);
}
