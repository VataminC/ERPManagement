package com.alliswell.service;

import com.alliswell.pojo.Goods;
import com.alliswell.pojo.PageBean;

import java.util.List;

public interface GoodsService {
    List<Goods> selAllGoods();

    PageBean paging(int pageStart, int pageNumber);

    PageBean search(String condition,String content);

    void delById(int id);

    Goods selById(int id);

    void updGoods(Goods goods);

    void insGoods(Goods goods);
}
