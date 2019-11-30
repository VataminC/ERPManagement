package com.alliswell.mapper;

import com.alliswell.pojo.OrderItem;

import java.util.List;


public interface OrderItemMapper {

    void insert(List<OrderItem> list);

    List<OrderItem> selByGoodsId(int id);

    List<OrderItem> selByOrderId(String id);


}
