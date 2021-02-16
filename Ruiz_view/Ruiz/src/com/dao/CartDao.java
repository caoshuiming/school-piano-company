package com.dao;

import com.db.C3p0ConnectionFactory;
import com.pojo.Cart;
import com.pojo.Goods;
import org.omg.CORBA.INTERNAL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartDao {

    /**
     * 购物车加购
     * @param cart
     */
    private static Logger logger = LoggerFactory.getLogger(CartDao.class);
    public void insertCart(Cart cart) {


        String sql = "INSERT INTO cart(user_id,  goods_id, goods_num) VALUES (?, ?, ?)";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            // 设置6个参数
            pstmt.setInt(1, cart.getUser_id());
            pstmt.setInt(2, cart.getGoods_id());
            pstmt.setInt(3, cart.getGoods_num());

            pstmt.execute();
        } catch (Exception e) {

            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(null, pstmt, conn);
        }


    }


    /**
     * 根据id删除购物车商品
     * @param goods_id
     * @param user_id
     */
    public void deleteCart(int goods_id , int user_id) {
        String sql = "DELETE FROM cart WHERE goods_id = ? and user_id=?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, goods_id);
            pstmt.setInt(2, user_id);

            pstmt.execute ();
        } catch (Exception e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(null, pstmt, conn);
        }
    }

    /**
     * 根据id查找购物车信息
     * @param goods_id
     * @param user_id
     * @return
     */
    public Cart selectCart(int goods_id,int user_id) {
        Cart cart = null;
        String sql = "SELECT  user_id, goods_id, goods_num FROM cart WHERE goods_id = ? and user_id=? ";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            // 设置参数
            pstmt.setInt(1, goods_id);
            pstmt.setInt(2, user_id);
            // 查询
            rs = pstmt.executeQuery();
            // 循环迭代
            while (rs.next()) {
                 cart = new Cart ();
                cart.setGoods_id(rs.getInt("goods_id"));
                cart.setGoods_num(rs.getInt("goods_num"));
                cart.setUser_id(rs.getInt("user_id"));
            }
        } catch (Exception e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            // 关闭资源
            C3p0ConnectionFactory.closeDBResource(rs, pstmt, conn);
        }
        return cart;
    }

    /**
     *    //修改cart中num
     * @param cart
     */
    public void updateCartNum(Cart cart) {
        String sql = "UPDATE cart SET  goods_num = ? WHERE   goods_id = ? and user_id=?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            // 设置三个参数
            pstmt.setInt(1,cart.getGoods_num() );
            pstmt.setInt(2, cart.getGoods_id());
            pstmt.setInt(3, cart.getUser_id());
            pstmt.execute();
        } catch (Exception e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(null, pstmt, conn);
        }
    }

    /**
     * 根据用户ID获取所有的购物车信息
     * @param uid
     * @return
     */
    public static List<Cart> selectGoods(int uid){
        List<Cart> list=new ArrayList<Cart>();
        Cart cart = null;
        String sql="SELECT goods_id,goods_num,user_id FROM cart where user_id=?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet res=null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            // 设置三个参数
            pstmt.setInt(1,uid);
            res=pstmt.executeQuery();
            while (res.next()) {
                cart = new Cart ();
                cart.setGoods_id(res.getInt("goods_id"));
                cart.setGoods_num(res.getInt("goods_num"));
                cart.setUser_id(res.getInt("user_id"));
                list.add(cart);
            }
        } catch (Exception e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(res, pstmt, conn);
        }
        return list;
    }

    /**
     * 清空购物车
     * @param uid
     */
    public static void removeAll(int uid){
        String sql = "DELETE FROM cart WHERE  user_id=?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, uid);
            pstmt.execute ();
        } catch (Exception e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(null, pstmt, conn);
        }
    }

    /**
     * 对库的操作
     */
    public static void updatesql(List<Cart> list){
        String sql="update goods set stock=stock-? where goods_id=?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        for (Cart cart:list) {
            try {
                conn = C3p0ConnectionFactory.getConnection();
                pstmt = conn.prepareStatement(sql);
                // 设置三个参数
                pstmt.setInt(1,cart.getGoods_num() );
                pstmt.setInt(2, cart.getGoods_id());
                pstmt.execute();
            } catch (Exception e) {
                logger.error(e.getMessage());
                e.printStackTrace();
            } finally {
                C3p0ConnectionFactory.closeDBResource(null, pstmt, conn);
            }
        }
    }
}
