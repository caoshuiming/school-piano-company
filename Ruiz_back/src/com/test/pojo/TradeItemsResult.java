package com.test.pojo;

public class TradeItemsResult {

    private String trade_id;

    private int goods_id;

    private String img_url;

    private String goods_name;

    private float price;

    private int num;

    private float count;

    public TradeItemsResult() {
    }

    public String getTrade_id() {
        return trade_id;
    }

    public void setTrade_id(String trade_id) {
        this.trade_id = trade_id;
    }

    public int getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(int goods_id) {
        this.goods_id = goods_id;
    }

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public float getCount() {
        return count;
    }

    public void setCount(float count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "TradeItemsResult{" +
                "trade_id='" + trade_id + '\'' +
                ", goods_id=" + goods_id +
                ", img_url='" + img_url + '\'' +
                ", goods_name='" + goods_name + '\'' +
                ", price=" + price +
                ", num=" + num +
                ", count=" + count +
                '}';
    }
}
