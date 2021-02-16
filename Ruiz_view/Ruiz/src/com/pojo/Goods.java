package com.pojo;

public class Goods {
    //商品id
    private Integer goods_id;
    //商品名
    private String goods_name;
    //图片
    private String img_url;
    //价格
    private float price;
    //品牌
    private String brand;
    //类别
    private String category;
    //库存
    private Integer stock;
    //已购人数
    private Integer payed_num;
    //描述
    private String description;

    public Integer getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(Integer goods_id) {
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

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Integer getPayed_num() {
        return payed_num;
    }

    public void setPayed_num(Integer payed_num) {
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
