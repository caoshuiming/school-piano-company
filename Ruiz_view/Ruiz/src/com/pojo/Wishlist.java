package com.pojo;

public class Wishlist {
    private  int goods_id;
    private  int user_id;

    public Wishlist() {
    }

    public Wishlist(int goods_id, int user_id) {
        this.goods_id = goods_id;
        this.user_id = user_id;
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

    @Override
    public String toString() {
        return "Wishlist{" +
                "goods_id=" + goods_id +
                ", user_id=" + user_id +
                '}';
    }
}
