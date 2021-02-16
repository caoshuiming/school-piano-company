package com.sevlet;

import com.dao.CartDao;
import com.pojo.Cart;
import com.pojo.Goods;
import com.pojo.Trade;
import com.pojo.User;
import com.service.CartService;
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

@WebServlet(name = "checkoutcount",urlPatterns = {"/checkoutcount.action","/phonecheck.action"})
public class CheckOutServlrt extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path=req.getServletPath();
        if(path.equals("/checkoutcount.action")){
            PCcheck(req, resp);
        }else if (path.equals("/phonecheck.action")){
            PHONEcheck(req, resp);
        }
    }


    /**
     * 电脑提交的处理
     */
    public void PCcheck(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        HttpSession session=req.getSession();
        User user =(User) session.getAttribute("user");
        int uid=user.getUser_id();
        //将订单修改为已支付
        Trade trade=(Trade)session.getAttribute("trade");
        TradeService.updateTrade(trade);
        List<Cart> cartslist= CartService.getAllByUserId(uid);
        //清空购物车
        CartService.deleteAll(uid);
        //对库的操作
        CartService.updatesql(cartslist);
        resp.sendRedirect("cart.jsp");
    }
    /**
     * 手机提交的处理
     */
    public void PHONEcheck(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        HttpSession session=req.getSession();
        int uid=Integer.parseInt(req.getParameter("user_id"));
        System.out.println(uid);
        //将订单修改为已支付
        String trade_id=req.getParameter("trade_id");
        TradeService.updateTradeByID(trade_id);
        List<Cart> cartslist= CartService.getAllByUserId(uid);
        //清空购物车
        CartService.deleteAll(uid);
        //对库的操作
        CartService.updatesql(cartslist);
        resp.sendRedirect("phonesuccess.jsp");
    }
}
