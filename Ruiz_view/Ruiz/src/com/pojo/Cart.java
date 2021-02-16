package com.pojo;

public class Cart {
    private  int goods_id;
    private  int user_id;
    private  int goods_num;

    public   Cart(){


    }

    public Cart(int goods_id, int user_id, int goods_num) {
        this.goods_id = goods_id;
        this.user_id = user_id;
        this.goods_num = goods_num;
    }

    public int getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(int goods_id) {
        this.goods_id = goods_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getGoods_num() {
        return goods_num;
    }

    public void setGoods_num(int goods_num) {
        this.goods_num = goods_num;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "goods_id=" + goods_id +
                ", user_id=" + user_id +
                ", goods_num=" + goods_num +
                '}';
    }
}
