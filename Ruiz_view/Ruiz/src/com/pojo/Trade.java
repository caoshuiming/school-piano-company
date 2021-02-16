package com.pojo;

public class Trade {

    private String trade_id;

    private int user_id;

    private float money;

    private String trade_time;

    private int state_id;

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
