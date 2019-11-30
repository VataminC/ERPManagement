package com.alliswell.service.impl;

import com.alliswell.mapper.OrderItemMapper;
import com.alliswell.mapper.StoreMapper;
import com.alliswell.pojo.OrderItem;
import com.alliswell.util.PageBean;
import com.alliswell.pojo.Store;
import com.alliswell.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StoreServiceImpl implements StoreService {

    @Autowired
    private StoreMapper storeMapper;
    @Autowired
    private OrderItemMapper orderItemMapper;
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

    /**
     * 条件查询
     * @param condition 条件
     * @param content 内容
     * @return
     */
    @Override
    public PageBean selByCondition(String condition, String content) {
        List<Store> storeList = storeMapper.selByCondition(condition, content);
        PageBean pageBean = new PageBean(1,storeList.size(),8);
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

    @Override
    public void changeRepertory(String oId,String type) {
        List<OrderItem> orderItems = orderItemMapper.selByOrderId(oId);
        if(orderItems.size()!=0){
            if("print".equals(type)){
                for (OrderItem orderitem :orderItems) {
                    storeMapper.updUnDeliverRepertory(orderitem.getGoods().getId(),orderitem.getGoodsNumber());
                }
            }else if("deliver".equals(type)){
                for (OrderItem orderitem:orderItems){
                    storeMapper.updDeliveredRepertory(orderitem.getGoods().getId(),orderitem.getGoodsNumber());
                    storeMapper.updUnDeliverRepertory(orderitem.getGoods().getId(),-orderitem.getGoodsNumber());
                }
            }
        }
    }
}
