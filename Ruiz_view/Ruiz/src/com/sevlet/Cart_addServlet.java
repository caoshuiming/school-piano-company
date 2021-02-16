package com.sevlet;

import com.dao.CartDao;
import com.pojo.Cart;
import com.pojo.Goods;
import com.pojo.User;
import com.service.CartService;
import com.service.GoodsService;
import com.sun.xml.internal.ws.api.model.wsdl.WSDLOutput;

import org.apache.commons.lang.enums.Enum;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Cart_addServlet",urlPatterns = {"/Cart_add.action"})
public class Cart_addServlet  extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           HttpSession session= request.getSession();
           User user =(User) session.getAttribute("user");
          int  user_id=user.getUser_id();
          int  goods_id=Integer.parseInt(request.getParameter("goods_id"));
        Goods goods= GoodsService.getGoodsByID(goods_id);


       boolean bool= new CartService().checkCartIsHaving(goods_id,user_id);
       if (bool){
           Cart cart=new Cart(goods_id,user_id,1);
           new CartService().insertCart(cart);
           //使用重定向，防止刷新页面重复添加
           response.sendRedirect("cart.jsp");
       }


    else {

        Cart cart=new CartDao().selectCart(goods_id,user_id);
            int goods_num=cart.getGoods_num();
           System.out.println("goods_num="+goods_num);
            goods_num=goods_num+1;

        Cart cart2=new Cart(goods_id,user_id,goods_num);
        new CartService().updateCart(cart2);
           response.sendRedirect("cart.jsp");
       }

    }
}
