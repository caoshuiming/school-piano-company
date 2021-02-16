package com.service;


import com.dao.CartDao;
import com.pojo.Cart;

import java.util.List;

public class CartService {

    // 购物车加购
    public void insertCart(Cart cart) {

        new CartDao().insertCart(cart);

    }

    // 根据id删除购物车商品
    public void deleteCart(int goods_id , int user_id) {
        new CartDao().deleteCart(goods_id,user_id);
    }


    //判断Cart是否已有该商品，有的话不加购，修改cart中num值+1
    public boolean checkCartIsHaving(int goods_id,int user_id) {
      Cart cart= new CartDao().selectCart(goods_id,user_id);
      if (cart==null){
          return true;
      }

        return false;
    }

    //  修改cart中num
    public void updateCart(Cart cart) {
        new CartDao().updateCartNum(cart);
    }

    /**
     * 清空购物车
     */
    public static void deleteAll(int uid){
        CartDao.removeAll(uid);
    }
    /**
     * 根据用户ID来获取购物车信息
     */
    public static List<Cart> getAllByUserId(int uid){
        return CartDao.selectGoods(uid);
    }
    /**
     * 对库的操作
     */
    public static  void updatesql(List<Cart> list){
        CartDao.updatesql(list);
    }
}
