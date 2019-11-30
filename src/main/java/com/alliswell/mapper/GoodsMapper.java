package com.alliswell.mapper;

import com.alliswell.pojo.Goods;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodsMapper {

    List<Goods> selAll();

    List<Goods> selPaging(int pageStart,int pageSize);

    int selCount();

    List<Goods> selByType(String condition,String content);

    void delById(int id);

    Goods selById(int id);

    void updGoods(Goods goods);

    void insGoods(Goods goods);

    List<Goods> selLike(String content);
}
