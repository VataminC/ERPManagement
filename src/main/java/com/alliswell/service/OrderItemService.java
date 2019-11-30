package com.alliswell.service;

import com.alliswell.pojo.OrderItem;

import java.util.List;

public interface OrderItemService {
    void insert(List<OrderItem> itemList);

    List<OrderItem> storeDetail(int id);

    List<OrderItem> orderDetail(String id);
}
