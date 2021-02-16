package com.service;

import com.dao.TradeItemsDao;
import com.pojo.TradeItems;

import java.util.List;

public class TradeItemsService {

    /**
     * 根据订单id查询具体商品信息
     * @param trade_id
     * @return
     */
    public List<TradeItems> getInfoByID(String trade_id){
        return new TradeItemsDao().getInfoByID(trade_id);
    }
}
