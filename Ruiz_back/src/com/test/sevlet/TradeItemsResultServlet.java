package com.test.sevlet;

import com.alibaba.fastjson.JSON;
import com.test.dao.TradeItemsDao;
import com.test.pojo.Goods;
import com.test.pojo.TradeItems;
import com.test.pojo.TradeItemsResult;
import com.test.service.GoodsService;
import com.test.utils.ConfigFactory;

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

@WebServlet(name = "TradeItemsResultServlet",urlPatterns = {"/TradeItemsResult.action"})
public class TradeItemsResultServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session =  req.getSession();
        String _Trade_id = req.getParameter("trade_id");
        System.out.println(" String _Trade_id :"+_Trade_id);
        //获取交易详情表
        List<TradeItems> list = new TradeItemsDao().getInfoByID(_Trade_id);
        System.out.println("List<TradeItems> list :"+list);
        //
        List<TradeItemsResult> results = new ArrayList<>();

       for (TradeItems items : list){
           //从详情表获取goods的id，以此获取goods对象
           Goods goods = new GoodsService().getGoodsById(items.getGoods_id());
           TradeItemsResult tradeItemsResult = new TradeItemsResult();

           tradeItemsResult.setTrade_id(items.getTrade_id());
           tradeItemsResult.setGoods_id(goods.getGoods_id());
           tradeItemsResult.setGoods_name(goods.getGoods_name());
           tradeItemsResult.setImg_url(goods.getImg_url());
           tradeItemsResult.setNum(items.getNum());
           tradeItemsResult.setPrice(goods.getPrice());
           tradeItemsResult.setCount(items.getCount());

           results.add(tradeItemsResult);
       }

       session.setAttribute("TradeItemsResults",results);
       req.getRequestDispatcher("Items.jsp").forward(req,resp);

        //int pageSize = ConfigFactory.getInt("common.pageSize", 10);
       // String path = "tradePage.action?pageNo=0&pageSize="+pageSize;
        //req.getRequestDispatcher(path).forward(req,resp);
        /*String json = JSON.toJSONString(results);
        PrintWriter pw = resp.getWriter();
        pw.write(json);
        pw.flush();
        pw.close();*/
    }
}
