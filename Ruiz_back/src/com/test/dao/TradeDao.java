package com.test.dao;

import com.test.db.C3p0ConnectionFactory;
import com.test.pojo.State;
import com.test.pojo.Trade;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 交易处理
 */
public class TradeDao {


    /**
     * 查询全部订单
     *
     * @return
     */
    public List<Trade> selectAllTrade() {

        List<Trade> trades = new ArrayList<Trade>();
        String sql = "SELECT trade_id, user_id, money,trade_time, state_id FROM trade";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Trade trade = new Trade();
                trade.setTrade_id(rs.getString("trade_id"));
                trade.setUser_id(rs.getInt("user_id"));
                trade.setMoney(rs.getFloat("money"));
                trade.setTrade_time(rs.getString("trade_time"));
                trade.setState_id(rs.getInt("state_id"));
                trades.add(trade);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pstmt, conn);
        }
        return trades;
    }

    /**
     * 根据用户ID查询订单。
     * @param id
     * @return
     */
    public Trade selectByUserId(int id) {
        Trade trade = null;
        String sql = "SELECT trade_id, user_id,money,trade_time,state_id FROM trade WHERE user_id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                trade = new Trade();
                trade.setTrade_id(rs.getString("trade_id"));
                trade.setUser_id(rs.getInt("user_id"));
                trade.setMoney(rs.getFloat("money"));
                trade.setTrade_time(rs.getString("trade_time"));
                trade.setState_id(rs.getInt("state_id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pstmt, conn);
        }
        return trade;
    }
    /**
     * 根据状态ID查询状态。
     * @param id
     * @return
     */
    public State selectStateById(int id) {
        State state = null;
        String sql = "SELECT state_id, sign FROM state WHERE state_id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                state = new State();
                state.setState_id(rs.getInt("state_id"));
                state.setSign(rs.getString("sign"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pstmt, conn);
        }
        return state;
    }

    /**
     * 分页查询全部交易
     * @param start
     * @param pageSize
     * @return
     */
    public List<Trade> selectTradeByPage(int start, int pageSize ){

        List<Trade> tradeList = new ArrayList<Trade>();
        String sql = "SELECT trade_id,user_id,money,trade_time,state_id FROM trade LIMIT ?, ?;";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = C3p0ConnectionFactory.getConnection();
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1,start);
            preparedStatement.setInt(2,pageSize);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Trade trade = new Trade();
                trade.setTrade_id(resultSet.getString("trade_id"));
                trade.setUser_id(resultSet.getInt("user_id"));
                trade.setMoney(resultSet.getFloat("money"));
                trade.setTrade_time(resultSet.getString("trade_time"));
                trade.setState_id(resultSet.getInt("state_id"));

                tradeList.add(trade);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(resultSet,preparedStatement,connection);
        }
        return tradeList;
    }

    /**
     * 查询所有交易数
     * @return
     */
    public int selectTradeCounts(){

        int counts = 0;
        String sql ="SELECT COUNT(trade_id) cnt FROM trade;";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = C3p0ConnectionFactory.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                counts = resultSet.getInt("cnt");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(resultSet,preparedStatement,connection);
        }
        return counts;
    }

    /**
     * 根据状态查询交易数
     * @return
     */
    public int selectTradeCountsByZt(int id){

        int counts = 0;
        String sql ="SELECT COUNT(trade_id) cnt FROM trade where state_id=?;";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = C3p0ConnectionFactory.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                counts = resultSet.getInt("cnt");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(resultSet,preparedStatement,connection);
        }
        return counts;
    }

    /**
     * 根据用户ID删除订单，用于解决用户存在外键不能删除的情况。
     *
     * @param id
     * @return
     */
    public int deleteTradeByUserId(int id) {

        int ret = 0;
        String sql = "DELETE FROM trade WHERE user_id = ?";
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


}
