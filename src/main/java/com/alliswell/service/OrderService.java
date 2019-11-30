package com.alliswell.service;

import com.alliswell.pojo.Order;
import com.alliswell.pojo.PageBean;

import java.util.List;

public interface OrderService {
    List<Order> selAll();

    PageBean paging(int pageNumber,int pageSize);

    void insert(Order order);
}
