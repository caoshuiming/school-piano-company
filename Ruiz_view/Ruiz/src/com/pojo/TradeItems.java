package com.pojo;

public class TradeItems {

    private String trade_id;

    private int goods_id;

    private int num;

    private float count;

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
        return "TradeItems{" +
                "trade_id='" + trade_id + '\'' +
                ", goods_id=" + goods_id +
                ", num=" + num +
                ", count=" + count +
                '}';
    }
}
