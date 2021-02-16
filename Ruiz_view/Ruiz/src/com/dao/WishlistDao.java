package com.dao;


import com.db.C3p0ConnectionFactory;
import com.pojo.Wishlist;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class WishlistDao {
private  static Logger logger= LoggerFactory.getLogger(WishlistDao.class);
    /**
     *
     * @param //心愿清单加入
     */

    public void insertWishlist(Wishlist wishlist) {

        String sql = "INSERT INTO wishlist(user_id,  goods_id) VALUES (?, ?)";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            // 设置6个参数
            pstmt.setInt(1, wishlist.getUser_id());
            pstmt.setInt(2, wishlist.getGoods_id());



            pstmt.execute();
        } catch (Exception e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(null, pstmt, conn);
        }


    }

    /**
     *
     * @param  // 根据id删除心愿单
     */

    public void deletWishlist(int goods_id , int user_id) {


        String sql = "DELETE FROM wishlist WHERE goods_id = ? and user_id=?";
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
     *
     * @param  //根据id查找心愿单
     */

    public Wishlist selectWishlist(int goods_id,int user_id) {

        Wishlist wishlist = null;
        String sql = "SELECT    goods_id,user_id FROM wishlist WHERE goods_id = ? and user_id=? ";
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
                wishlist = new Wishlist ();
                wishlist.setGoods_id(rs.getInt("goods_id"));
                wishlist.setUser_id(rs.getInt("user_id"));

            }
        } catch (Exception e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            // 关闭资源
            C3p0ConnectionFactory.closeDBResource(rs, pstmt, conn);
        }

        return wishlist;
    }

}
