package com.alliswell.mapper;

import com.alliswell.pojo.Order;

import java.util.List;

public interface OrderMapper {
    List<Order> selAll();

    List<Order> selPaging(int pageStart,int pageSize);

    int selCount();

    void insert(Order order);

    List<Order> selByType(String condition,String content);

    void updOrder(String oId,int status);

    void delById(String id);
}
