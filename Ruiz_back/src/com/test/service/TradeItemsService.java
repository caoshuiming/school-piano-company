package com.test.service;

import com.test.dao.TradeItemsDao;
import com.test.pojo.TradeItems;

import java.util.List;

public class TradeItemsService {

    /**
     * 根据订单ID删除订单详情
     *
     * @param id
     * @return
     */
    public boolean removeTradeItemsByTradeId(int id) {
        TradeItemsDao trade_itemsDao = new TradeItemsDao();
        int ret = trade_itemsDao.deleteTradeItemsByUserTradeId(id);
        return ret > 0 ? true : false;
    }
}
