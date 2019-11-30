package com.alliswell.service;

import com.alliswell.pojo.Order;
import com.alliswell.util.PageBean;

import java.util.List;

public interface OrderService {
    List<Order> selAll();

    PageBean paging(int pageNumber,int pageSize);

    void insert(Order order);

    PageBean selectLike(String condition,String content);

    void orderHandle(String oId,int status);

    void deleteById(String id);
}
