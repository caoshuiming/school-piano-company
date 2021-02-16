package com.test.pojo;

public class State {
    private int state_id;
    private String sign;

    public int getState_id() {
        return state_id;
    }

    public void setState_id(int state_id) {
        this.state_id = state_id;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    @Override
    public String toString() {
        return "State{" +
                "state_id=" + state_id +
                ", sign='" + sign + '\'' +
                '}';
    }
}
