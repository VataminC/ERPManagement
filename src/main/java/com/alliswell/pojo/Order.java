package com.alliswell.pojo;

import java.math.BigDecimal;
import java.util.Objects;

public class Order {
    private String id;
    private User user;
    private int goodsNum;
    private BigDecimal totalMoney;
    private int status;
    private String createTime;

    public Order() {
    }

    public Order(String id, User user, int goodsNum, BigDecimal totalMoney, int status, String createTime) {
        this.id = id;
        this.user = user;
        this.goodsNum = goodsNum;
        this.totalMoney = totalMoney;
        this.status = status;
        this.createTime = createTime;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getGoodsNum() {
        return goodsNum;
    }

    public void setGoodsNum(int goodsNum) {
        this.goodsNum = goodsNum;
    }

    public BigDecimal getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(BigDecimal totalMoney) {
        this.totalMoney = totalMoney;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {return true;}
        if (!(o instanceof Order)) {return false;}
        Order order = (Order) o;
        return goodsNum == order.goodsNum &&
                status == order.status &&
                Objects.equals(id, order.id) &&
                Objects.equals(user, order.user) &&
                Objects.equals(totalMoney, order.totalMoney) &&
                Objects.equals(createTime, order.createTime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, user, goodsNum, totalMoney, status, createTime);
    }

    @Override
    public String toString() {
        return "Order{" +
                "id='" + id + '\'' +
                ", user=" + user +
                ", goodsNum=" + goodsNum +
                ", totalMoney=" + totalMoney +
                ", status=" + status +
                ", createTime='" + createTime + '\'' +
                '}';
    }
}

