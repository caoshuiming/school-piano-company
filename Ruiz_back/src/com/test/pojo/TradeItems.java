package com.test.pojo;

/**
 * 每项交易详情
 */
public class TradeItems {

    private String trade_id;//订单id
    private int goods_id;
    private int num;
    private float count;

    public TradeItems() {
    }

    public TradeItems(String trade_id, int goods_id, int num, float count) {
        this.trade_id = trade_id;
        this.goods_id = goods_id;
        this.num = num;
        this.count = count;
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
        return "Trade_Items{" +
                "trade_id='" + trade_id + '\'' +
                ", goods_id=" + goods_id +
                ", num=" + num +
                ", count=" + count +
                '}';
    }
}
