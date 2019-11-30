package com.alliswell.pojo;

import java.math.BigDecimal;
import java.util.Objects;

public class OrderItem {
    private int id;
    private Goods goods;
    private int goodsNumber;
    private BigDecimal totalMoney;
    private String orderId;

    public OrderItem() {
    }

    public OrderItem(int id, Goods goods, int goodsNumber, BigDecimal totalMoney, String orderId) {
        this.id = id;
        this.goods = goods;
        this.goodsNumber = goodsNumber;
        this.totalMoney = totalMoney;
        this.orderId = orderId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public int getGoodsNumber() {
        return goodsNumber;
    }

    public void setGoodsNumber(int goodsNumber) {
        this.goodsNumber = goodsNumber;
    }

    public BigDecimal getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(BigDecimal totalMoney) {
        this.totalMoney = totalMoney;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {return true;}
        if (!(o instanceof OrderItem)) {return false;}
        OrderItem orderItem = (OrderItem) o;
        return id == orderItem.id &&
                goodsNumber == orderItem.goodsNumber &&
                Objects.equals(goods, orderItem.goods) &&
                Objects.equals(totalMoney, orderItem.totalMoney) &&
                Objects.equals(orderId, orderItem.orderId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, goods, goodsNumber, totalMoney, orderId);
    }

    @Override
    public String toString() {
        return "OrderItem{" +
                "id=" + id +
                ", goods=" + goods +
                ", goodsNumber=" + goodsNumber +
                ", totalMoney=" + totalMoney +
                ", orderId='" + orderId + '\'' +
                '}';
    }
}
