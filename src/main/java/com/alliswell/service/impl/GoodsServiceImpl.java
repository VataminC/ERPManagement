package com.alliswell.service.impl;

import com.alliswell.mapper.GoodsMapper;
import com.alliswell.pojo.Goods;
import com.alliswell.pojo.PageBean;
import com.alliswell.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private GoodsMapper goodsMapper;

    @Override
    public List<Goods> selAllGoods() {
        return goodsMapper.selAll();
    }

    /**
     * 分页查询
     * @param pageSize
     * @param pageNumber
     * @return
     */
    @Override
    public PageBean paging(int pageSize, int pageNumber) {
        int totalCount = goodsMapper.selCount();
        PageBean pagebean = new PageBean(pageNumber,totalCount,pageSize);
        //每页显示的数据
        List<Goods> pagingGoods = goodsMapper.selPaging(pagebean.getPageSize() * (pagebean.getPageNumber() - 1), pagebean.getPageSize());
        pagebean.setBeanList(pagingGoods);
        return pagebean;
    }

    /**
     * 跟据条件查询
     * @param condition
     * @param content
     * @return
     */
    public PageBean search(String condition,String content){
        List<Goods> goods = goodsMapper.selByType(condition, content);
        PageBean pagebean = new PageBean(1,goods.size());
        //当前页数
        pagebean.setBeanList(goods);
        return pagebean;
    }

    /**
     * 通过id删除
     * @param id
     */
    @Override
    public void delById(int id) {
        goodsMapper.delById(id);
    }

    /**
     * 通过id查找
     * @param id
     * @return
     */
    @Override
    public Goods selById(int id) {
        return goodsMapper.selById(id);
    }

    @Override
    public void updGoods(Goods goods) {
        goodsMapper.updGoods(goods);
    }

    @Override
    public void insGoods(Goods goods) {
        goodsMapper.insGoods(goods);
    }

}
