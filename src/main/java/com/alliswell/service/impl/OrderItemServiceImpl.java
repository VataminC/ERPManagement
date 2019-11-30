package com.alliswell.service.impl;

import com.alliswell.mapper.OrderItemMapper;
import com.alliswell.pojo.OrderItem;
import com.alliswell.service.OrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderItemServiceImpl implements OrderItemService {

    @Autowired
    private OrderItemMapper orderItemMapper;

    @Override
    public void insert(List<OrderItem> itemList) {
        orderItemMapper.insert(itemList);
    }

    @Override
    public List<OrderItem> orderDetail(String id) {
        return orderItemMapper.selByOrderId(id);
    }

    @Override
    public List<OrderItem> storeDetail(int id) {
        return orderItemMapper.selByGoodsId(id);
    }

}
