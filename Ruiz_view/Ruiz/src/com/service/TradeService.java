package com.service;

import com.dao.TradeDao;
import com.pojo.Cart;
import com.pojo.Trade;

import java.util.List;

public class TradeService {

    /**
     * 根据用户id获取订单信息
     * @param user_id
     * @return
     */
    public List<Trade> getTradesByUser_id(int user_id){
        return new TradeDao().getTradesByUser_id(user_id);
    }

    /**
     * 插入新订单
     */
    public static void insertTrade(Trade trade){
        TradeDao.insertTrade(trade);
    }

    /**
     * 插入订单详细
     */
    public static void insertTradeItem(String trade_id,int goods_id,int num,float count){
        TradeDao.insertTradeitem(trade_id,goods_id,num,count);
    }

    /**
     * 修改订单状态
     */
    public static void updateTrade(Trade trade){
        TradeDao.updateTrade(trade);
    }

    /**
     * 根据货物ID来修改订单状态
     */
    public static void updateTradeByID(String trade_id){
       TradeDao.updateTradeByID(trade_id);
    }
}
