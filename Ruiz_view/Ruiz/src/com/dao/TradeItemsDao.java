package com.dao;

import com.db.C3p0ConnectionFactory;
import com.pojo.TradeItems;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TradeItemsDao {
private static Logger logger= LoggerFactory.getLogger(TradeItemsDao.class);
    /**
     * 根据订单id查询具体商品信息
     * @param trade_id
     * @return
     */
    public List<TradeItems> getInfoByID(String trade_id){
        List<TradeItems> list = new ArrayList<>();
        String sql = "select trade_id,goods_id,num,count from trade_items where trade_id=?";
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pst = conn.prepareStatement(sql);
            pst.setString(1, trade_id);
            rs = pst.executeQuery();
            while(rs.next()){
                TradeItems tradeItems = new TradeItems();
                tradeItems.setTrade_id(rs.getString("trade_id"));
                tradeItems.setGoods_id(rs.getInt("goods_id"));
                tradeItems.setNum(rs.getInt("num"));
                tradeItems.setCount(rs.getFloat("count"));
                list.add(tradeItems);
            }
        } catch (SQLException e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        }finally {
            C3p0ConnectionFactory.closeDBResource(rs,pst,conn);
        }
        return list;
    }
}
