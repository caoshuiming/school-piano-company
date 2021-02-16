package com.sevlet;

import com.dao.CartDao;
import com.pojo.Cart;
import com.pojo.Goods;
import com.pojo.Trade;
import com.pojo.User;
import com.service.GoodsService;
import com.service.TradeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "addTrade",urlPatterns = {"/addtrade.action"})
public class Trade_Add extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        int user_id = user.getUser_id();
        List<Goods> list = new GoodsService().getGoodsByUserID(user_id);
        int nums = 0;
        float totals = 0.0f;
        for (Goods good : list) {
            Cart cart = new CartDao().selectCart(good.getGoods_id(), user_id);
            int goods_num = cart.getGoods_num();
            nums = nums + goods_num;
            totals = totals + good.getPrice() * goods_num;
        }
        //插入新订单
        Date date=new Date();
        Trade trade=new Trade();
        trade.setTrade_id(new SimpleDateFormat("yyyyMMddHHmmss").format(date));
        trade.setUser_id(user_id);
        trade.setMoney(totals);
        trade.setTrade_time(new SimpleDateFormat("yyyy年MM月dd日").format(date));
        trade.setState_id(0);
        TradeService.insertTrade(trade);
        //将订单插入会话
        session.setAttribute("trade",trade);
        //插入新的订单详情
        for (Goods goods:list) {
            Cart cart = new CartDao().selectCart(goods.getGoods_id(), user_id);
            int goods_num = cart.getGoods_num();
            nums = nums + goods_num;
            totals =goods.getPrice() * goods_num;
            TradeService.insertTradeItem(trade.getTrade_id(),goods.getGoods_id(),cart.getGoods_num(),totals);
        }
        //跳转到结算界面
        resp.sendRedirect("checkout.jsp");
    }

}
