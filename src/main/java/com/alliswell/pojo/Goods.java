package com.alliswell.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Objects;

public class Goods implements Serializable {
    private Integer id;
    private String name;
    private Category category;
    private Brand brand;
    private BigDecimal price;
    private String date;

    public Goods() {
    }

    public Goods(Integer id, String name, Category category, Brand brand, BigDecimal price, String date) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.brand = brand;
        this.price = price;
        this.date = date;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {return true;}
        if (!(o instanceof Goods)) {return false;}
        Goods goods = (Goods) o;
        return Objects.equals(id, goods.id) &&
                Objects.equals(name, goods.name) &&
                Objects.equals(category, goods.category) &&
                Objects.equals(brand, goods.brand) &&
                Objects.equals(price, goods.price) &&
                Objects.equals(date, goods.date);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, category, brand, price, date);
    }

    @Override
    public String toString() {
        return "Goods{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", category=" + category +
                ", brand=" + brand +
                ", price=" + price +
                ", date='" + date + '\'' +
                '}';
    }
}
