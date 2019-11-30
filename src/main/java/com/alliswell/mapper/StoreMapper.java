package com.alliswell.mapper;

import com.alliswell.pojo.Store;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StoreMapper {

    List<Store> selByPaging(int pageStart,int pageSize);

    int selCount();

    List<Store> selByCondition(String condition,String content);

    Store selById(int id);

    void updStoreRepertory(@Param("sId") int sId,@Param("gId") int gId,@Param("addedRepertory") int addedRepertory);

    void updUnDeliverRepertory(int goodsId,int num);

    void updDeliveredRepertory(int goodsId,int num);
}
