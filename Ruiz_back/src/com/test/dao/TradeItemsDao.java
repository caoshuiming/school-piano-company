package com.test.dao;

import com.test.db.C3p0ConnectionFactory;
import com.test.pojo.TradeItems;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TradeItemsDao {

    /**
     * 根据订单ID删除订单详情
     *
     * @param id
     * @return
     */
    public int deleteTradeItemsByUserTradeId(int id) {

        int ret = 0;
        String sql = "DELETE FROM trade_items WHERE trade_id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            // 返回值是指数据库的响应行数，就是删除、或者更新了几行，就返回几。
            ret = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(null, pstmt, conn);
        }
        return ret;
    }
    /**
     * 根据订单id查询具体商品信息
     * @param trade_id
     * @return
     */
    public List<TradeItems> getInfoByID(String trade_id){

        List<TradeItems> list = new ArrayList<>();
        String sql = "SELECT trade_items.trade_id, goods_id, num, count FROM trade JOIN trade_items ON trade.trade_id = trade_items.trade_id  AND trade.trade_id = ?;";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,trade_id);
            rs = pstmt.executeQuery();

            while (rs.next()){
                TradeItems items = new TradeItems();
                items.setTrade_id(rs.getString("trade_id"));
                items.setGoods_id(rs.getInt("goods_id"));
                items.setNum(rs.getInt("num"));
                items.setCount(rs.getFloat("count"));
                list.add(items);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            C3p0ConnectionFactory.closeDBResource(rs, pstmt, conn);
        }
        return list;
    }
}
