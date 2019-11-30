package com.alliswell.test;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alliswell.mapper.CategoryMapper;
import com.alliswell.mapper.GoodsMapper;
import com.alliswell.mapper.UserMapper;
import com.alliswell.pojo.Goods;
import com.alliswell.pojo.User;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.lang.reflect.Array;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserTest extends UserTestBase {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private GoodsMapper goodsMapper;

    @Autowired
    private CategoryMapper categoryMapper;
    @Test
    public void selByUserTest(){
        List<Goods> allGoods = goodsMapper.selAll();

        JSONArray goodsArray = new JSONArray();
        for(int i =0;i<allGoods.size();i++){
            Goods goods = allGoods.get(i);
            Map<String,Object> map = new HashMap<>();
            map.put("id",goods.getId());
            map.put("name",goods.getName());
            map.put("brandName",goods.getBrand().getName());
            map.put("category",goods.getCategory().getName());
            map.put("price",goods.getPrice());
            map.put("date",goods.getDate());
            goodsArray.add(map);
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code",0);
        jsonObject.put("msg","");
        jsonObject.put("total",allGoods.size());
        jsonObject.put("data",goodsArray);
        System.out.println(jsonObject.toJSONString());
    }
    @Test
    public void testRedis(){
    }

}
