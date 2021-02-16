package com.test.pojo;

public class Goods {

    int goods_id;
    String goods_name;
    String img_url;
    float price;
    String brand;
    String category;
    int stock;
    int payed_num;
    String description;

    public Goods() {
    }

    public Goods( String goods_name, String img_url,
                 float price, String brand, String category, int stock,
                 int payed_num, String description) {
        this.goods_name = goods_name;
        this.img_url = img_url;
        this.price = price;
        this.brand = brand;
        this.category = category;
        this.stock = stock;
        this.payed_num = payed_num;
        this.description = description;
    }

    public Goods(int goods_id, String goods_name,
                 String img_url, float price, String brand,
                 String category, int stock, String description) {
        this.goods_id = goods_id;
        this.goods_name = goods_name;
        this.img_url = img_url;
        this.price = price;
        this.brand = brand;
        this.category = category;
        this.stock = stock;
        this.description = description;
    }

    public int getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(int goods_id) {
        this.goods_id = goods_id;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getPayed_num() {
        return payed_num;
    }

    public void setPayed_num(int payed_num) {
        this.payed_num = payed_num;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    @Override
    public String toString() {
        return "Goods{" +
                "goods_id=" + goods_id +
                ", goods_name='" + goods_name + '\'' +
                ", img_url='" + img_url + '\'' +
                ", price=" + price +
                ", brand='" + brand + '\'' +
                ", category='" + category + '\'' +
                ", stock=" + stock +
                ", payed_num=" + payed_num +
                ", description='" + description + '\'' +
                '}';
    }
}
