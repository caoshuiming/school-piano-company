package com.test.service;

import com.test.dao.GoodsDao;
import com.test.dao.TradeDao;
import com.test.pojo.Goods;
import com.test.pojo.Pagination;
import com.test.pojo.State;
import com.test.pojo.Trade;

import java.util.List;

public class TradeService {

    /**
     * @return
     */
    public List<Trade> getAllTrade() {
        return new TradeDao().selectAllTrade();
    }
    /**
     * 根据状态id获取一个状态对象
     * @param id
     * @return
     */
    public State getStateById(int id) {
        return new TradeDao().selectStateById(id);
    }

    /**
     * 按照用户ID查询订单信息。
     *
     * @param id
     * @return
     */
    public Trade getTradeByUserId(int id) {
        return new TradeDao().selectByUserId(id);
    }
    /**
     * 根据状态id获取该状态的数量
     * @param id
     * @return
     */
    public int getStateByZt(int id) {
        int count  = new TradeDao().selectTradeCountsByZt(id);
        return count ;
    }
    /**
     * 根据用户ID删除订单，用于解决用户存在外键不能删除的情况。
     *
     * @param id
     * @return
     */
    public boolean removeTradeByUserId(int id) {
        TradeDao tradeDao = new TradeDao();
        int ret = tradeDao.deleteTradeByUserId(id);
        return ret > 0 ? true : false;
    }


    /**
     * 数据库分页查询处理
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Pagination getTradeByPage (int pageNo, int pageSize) {

        TradeDao tradeDao = new TradeDao();

        int counts = tradeDao.selectTradeCounts();
        int pages = counts % pageSize == 0 ? counts / pageSize : counts / pageSize + 1;

        boolean fistPage = pageNo == 0 ? true : false;
        boolean lastPage = false;

        if(pageNo == pages - 1) {
            lastPage = true;
        }
        // 如果页码大于总页数：页码就等于总页数。
        if(pageNo > pages) {
            pageNo = pages - 1;// 页码从0开始，所以减一。
        }

        List<Trade> tradeList = tradeDao.selectTradeByPage(pageNo*pageSize , pageSize);
        Pagination pagination = new Pagination();
        pagination.setPageSize(pageSize);
        pagination.setPageNo(pageNo);
        pagination.setCounts(counts);
        pagination.setPages(pages);
        pagination.setFirstPage(fistPage);
        pagination.setLastPage(lastPage);
        pagination.setResult(tradeList);

        return pagination;
    }

    /**
     * 获得库中trade总数
     * @return
     */
    public int getTradeCounts(){
        int count  = new TradeDao().selectTradeCounts();
        return count ;
    }
}
