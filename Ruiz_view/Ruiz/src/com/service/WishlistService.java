package com.service;


import com.dao.WishlistDao;
import com.pojo.Wishlist;

public class WishlistService {
    /**
     *
     * @param  // 加入心愿单
     */

    public void insertWishlist(Wishlist wishlist) {

        new WishlistDao().insertWishlist(wishlist);


    }
    /**
     *
     * @param  // 根据id删除心愿单
     */


    public void deleteWishlist(int goods_id , int user_id) {

        new  WishlistDao().deletWishlist(goods_id ,user_id);
    }

    /**
     *
     * @param    // 判断心愿清单中是否已有该商品，有的话不加添加
     */

    public boolean checkWishlistIsHaving(int goods_id,int user_id) {
        Wishlist wishlist= new WishlistDao().selectWishlist(goods_id,user_id);
        if (wishlist==null){
            return true;
        }

        return false;
    }
}
