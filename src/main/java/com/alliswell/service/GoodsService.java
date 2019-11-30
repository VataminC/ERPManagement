package com.alliswell.service;

import com.alliswell.pojo.Goods;
import com.alliswell.util.PageBean;

import java.util.List;

public interface GoodsService {
    List<Goods> selAllGoods();

    PageBean paging(int pageStart, int pageNumber);

    PageBean selByCondition(String condition,String content);

    void delById(int id);

    Goods selById(int id);

    void updGoods(Goods goods);

    void insGoods(Goods goods);

    PageBean selectLike(String content);
}
