package com.sevlet;

import com.alibaba.fastjson.JSON;
import com.pojo.*;
import com.service.GoodsService;
import com.service.TradeItemsService;
import com.service.TradeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "TradeServlet", urlPatterns = {"/tradelist.action", "/tradeItemsList.action"})
public class TradeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
//        System.out.println(path);
        if("/tradelist.action".equals(path)){
            getTradeList(req, resp);
        }else if("/tradeItemsList.action".equals(path)){
            getTradeItemsList(req, resp);
        }
    }

    /**
     * 获取订单集合
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    public void getTradeList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        TradeService tradeService = new TradeService();
        List<Trade> tradelist = tradeService.getTradesByUser_id(user.getUser_id());
        req.setAttribute("tradelist", tradelist);
        req.getRequestDispatcher("my-account.jsp").forward(req, resp);
    }

    /**
     * 获取订单详情集合(Ajax)
     * @param req
     * @param resp
     */
    private void getTradeItemsList(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String trade_id = req.getParameter("trade_id");
        List<TradeItems> list = new TradeItemsService().getInfoByID(trade_id);
        List<TradeItemsResult> results = new ArrayList<>();
        for(TradeItems item : list){
            Goods goods = GoodsService.getGoodsByID(item.getGoods_id());
            TradeItemsResult tradeItemsResult = new TradeItemsResult();
            tradeItemsResult.setTrade_id(item.getTrade_id());
            tradeItemsResult.setGoods_id(goods.getGoods_id());
            tradeItemsResult.setImg_url(goods.getImg_url());
            tradeItemsResult.setGoods_name(goods.getGoods_name());
            tradeItemsResult.setPrice(goods.getPrice());
            tradeItemsResult.setNum(item.getNum());
            tradeItemsResult.setCount(item.getCount());
            results.add(tradeItemsResult);
        }
        String json = JSON.toJSONString(results);
        PrintWriter pw = resp.getWriter();
        pw.write(json);
        pw.flush();
        pw.close();
    }
}
