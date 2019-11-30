package com.alliswell.service.impl;

import com.alliswell.mapper.OrderMapper;
import com.alliswell.pojo.Order;
import com.alliswell.pojo.PageBean;
import com.alliswell.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;

    @Override
    public List<Order> selAll() {
        return orderMapper.selAll();
    }

    @Override
    public PageBean paging(int pageSize,int pageNumber) {
        int count = orderMapper.selCount();
        PageBean pageBean =  new PageBean(pageNumber,count);
        List<Order> orderList = orderMapper.selPaging(pageBean.getPageSize() * (pageBean.getPageNumber() - 1), pageBean.getPageSize());
        pageBean.setBeanList(orderList);
        return pageBean;
    }

    @Override
    public void insert(Order order) {
        orderMapper.insert(order);
    }
}
