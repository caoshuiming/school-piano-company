package com.dao;

import com.db.C3p0ConnectionFactory;
import com.pojo.Cart;
import com.pojo.Trade;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.SimpleFormatter;

public class TradeDao {
    private  static Logger logger= LoggerFactory.getLogger(TradeDao.class);
    /**
     * 根据用户id获取订单信息
     * @param user_id
     * @return
     */
    public List<Trade> getTradesByUser_id(int user_id){
        List<Trade> list = new ArrayList<>();
        String sql ="select trade_id,user_id,money,trade_time,state_id from trade where user_id=? order by trade_id DESC";
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pst = conn.prepareStatement(sql);
            pst.setInt(1, user_id);
            rs = pst.executeQuery();
            while (rs.next()){
                Trade trade = new Trade();
                trade.setTrade_id(rs.getString("trade_id"));
                trade.setUser_id(rs.getInt("user_id"));
                trade.setMoney(rs.getFloat("money"));
                trade.setTrade_time(rs.getString("trade_time"));
                trade.setState_id(rs.getInt("state_id"));
                list.add(trade);
            }
        } catch (SQLException e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pst, conn);
        }
        return list;
    }

    /**
     * 创建新订单
     */
    public static void insertTrade(Trade trade){
        String sql="INSERT INTO trade VALUES (?,?,?,?,?)";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            // 生成当前时间
            Date date=new Date();
            String trade_id=new SimpleDateFormat("yyyy-MM-dd").format(date);
            String trade_time=new SimpleDateFormat("yyyy-MM-dd").format(date);
            pstmt.setString(1,trade.getTrade_id());
            pstmt.setInt(2,trade.getUser_id());
            pstmt.setFloat(3,trade.getMoney());
            pstmt.setString(4,trade.getTrade_time());
            pstmt.setInt(5,trade.getState_id());
            pstmt.execute();
        } catch (Exception e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(null, pstmt, conn);
        }
    }

    /**
     * 插入新的订单详情
     */
    public static void insertTradeitem(String trade_id,int goods_id,int num,float count){
        String sql="INSERT INTO trade_items VALUES (?,?,?,?)";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,trade_id);
            pstmt.setInt(2,goods_id);
            pstmt.setInt(3,num);
            pstmt.setFloat(4,count);
            pstmt.execute();
        } catch (Exception e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(null, pstmt, conn);
        }
    }

    /**
     * 修改订单的支付状态
     */
    public static void updateTrade(Trade trade){
        String sql = "UPDATE trade SET  state_id = 1 WHERE trade_id=?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            // 设置参数
            pstmt.setString(1,trade.getTrade_id());
            pstmt.execute();
        } catch (Exception e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(null, pstmt, conn);
        }
    }

    /**
     * 根据订单ID来修改订单信息
     */
    public static void updateTradeByID(String trade_id){
        String sql = "UPDATE trade SET  state_id = 1 WHERE trade_id=?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            // 设置参数
            pstmt.setString(1,trade_id);
            pstmt.execute();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(null, pstmt, conn);
        }
    }


}
