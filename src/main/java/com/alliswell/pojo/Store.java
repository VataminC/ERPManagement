package com.alliswell.pojo;

import java.util.Objects;

public class Store {
    private int id;
    private Goods goods;
    private int residueGoods;
    private int unDeliverGoods;
    private int deliveredGoods;

    public Store() {
    }

    public Store(int id, Goods goods, int residueGoods, int unDeliverGoods, int deliveredGoods) {
        this.id = id;
        this.goods = goods;
        this.residueGoods = residueGoods;
        this.unDeliverGoods = unDeliverGoods;
        this.deliveredGoods = deliveredGoods;
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

    public int getResidueGoods() {
        return residueGoods;
    }

    public void setResidueGoods(int residueGoods) {
        this.residueGoods = residueGoods;
    }

    public int getunDeliverGoods() {
        return unDeliverGoods;
    }

    public void setunDeliverGoods(int unDeliverGoods) {
        this.unDeliverGoods = unDeliverGoods;
    }

    public int getDeliveredGoods() {
        return deliveredGoods;
    }

    public void setDeliveredGoods(int deliveredGoods) {
        this.deliveredGoods = deliveredGoods;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {return true;}
        if (!(o instanceof Store)) {return false;}
        Store store = (Store) o;
        return id == store.id &&
                residueGoods == store.residueGoods &&
                unDeliverGoods == store.unDeliverGoods &&
                deliveredGoods == store.deliveredGoods &&
                Objects.equals(goods, store.goods);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, goods, residueGoods, unDeliverGoods, deliveredGoods);
    }

    @Override
    public String toString() {
        return "Store{" +
                "id=" + id +
                ", goods=" + goods +
                ", residueGoods=" + residueGoods +
                ", unDeliverGoods=" + unDeliverGoods +
                ", deliveredGoods=" + deliveredGoods +
                '}';
    }
}
