package com.test.service;

import com.test.pojo.Trade;
import com.test.utils.IOUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * 下载的业务类。
 */
public class DownloadTradeService {

    /**
     * 下载的业务处理。
     * @param path 下载文件的绝对路径
     * @return
     */
    public void downloadTrade(String path) {

        // 查询订单信息
        TradeService service = new TradeService();
        List<Trade> trades = service.getAllTrade();

        // List<Student> ---> List<String>
        List<String> lines = new ArrayList<String>();
        // 循环订单信息
        for(Trade  trade : trades) {
            //查询订单状态
            TradeService tradeService = new TradeService();
            String sign=tradeService.getStateById(trade.getState_id()).getSign();

            String line = trade.getTrade_id() + ", " + trade.getUser_id() + ", " + trade.getMoney() + ", " + trade.getTrade_time() + ", " + sign;
            lines.add(line);
        }
        ///////////////////////////////////
        try {
            // 把list的内容写入文件
            IOUtils.writeFileByList(path, lines);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
