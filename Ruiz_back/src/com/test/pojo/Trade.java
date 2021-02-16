package com.test.pojo;

public class Trade {
    private String trade_id;//订单id
    private int user_id;//用户id
    private float money;//交易总额
    private String trade_time;//交易时间
    private int state_id;//状态id

    public Trade(String trade_id, int user_id, float money, String trade_time, int state_id) {
        this.trade_id = trade_id;
        this.user_id = user_id;
        this.money = money;
        this.trade_time = trade_time;
        this.state_id = state_id;
    }
    public Trade() {

    }

    public String getTrade_id() {
        return trade_id;
    }

    public void setTrade_id(String trade_id) {
        this.trade_id = trade_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public float getMoney() {
        return money;
    }

    public void setMoney(float money) {
        this.money = money;
    }

    public String getTrade_time() {
        return trade_time;
    }

    public void setTrade_time(String trade_time) {
        this.trade_time = trade_time;
    }

    public int getState_id() {
        return state_id;
    }

    public void setState_id(int state_id) {
        this.state_id = state_id;
    }

    @Override
    public String toString() {
        return "Trade{" +
                "trade_id='" + trade_id + '\'' +
                ", user_id=" + user_id +
                ", money=" + money +
                ", trade_time='" + trade_time + '\'' +
                ", state_id=" + state_id +
                '}';
    }
}
