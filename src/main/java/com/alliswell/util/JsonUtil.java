package com.alliswell.util;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alliswell.pojo.Goods;
import com.alliswell.pojo.OrderItem;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.UUID;

public class JsonUtil {
    public static HashMap<String,Object> jsonFormatOrderItem(String str){
        String s = UUID.randomUUID().toString().replaceAll("-","");
        ArrayList<OrderItem> itemList = new ArrayList<>();
        JSONArray jsonArray = JSONArray.parseArray(str);
        Iterator<Object> iterator = jsonArray.iterator();
        int totalNum =0;
        BigDecimal totalMoney = new BigDecimal("0.000");
        while(iterator.hasNext()){
            JSONObject next = (JSONObject) iterator.next();
            int goodsId = (int)next.get("id");
            int num= (int)next.get("num");
            BigDecimal goodsPrice = next.getBigDecimal("price");
            OrderItem orderItem = new OrderItem();
            Goods goods = new Goods();
            goods.setId(goodsId);
            orderItem.setGoods(goods);
            orderItem.setGoodsNumber(num);
            orderItem.setTotalMoney(new BigDecimal(num).multiply(goodsPrice));
            orderItem.setOrderId(s);
            itemList.add(orderItem);
            totalNum +=num;
            totalMoney = totalMoney.add(new BigDecimal(num).multiply(goodsPrice));
        }
        HashMap<String,Object> map = new HashMap<>(4);
        map.put("totalNum",totalNum);
        map.put("totalMoney",totalMoney);
        map.put("itemList",itemList);
        map.put("s",s);
        return map;
    }
}
