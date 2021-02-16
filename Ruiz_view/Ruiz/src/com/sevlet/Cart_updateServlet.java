package com.sevlet;



import com.pojo.Cart;
import com.pojo.User;
import com.service.CartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name="Cart_updateServlet",urlPatterns = {"/Cart_update.action"})
public class Cart_updateServlet  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            HttpSession session= request.getSession();
           User user =(User) session.getAttribute("user");
          int    user_id=user.getUser_id();

       int goods_num = Integer.parseInt(request.getParameter("num")) ;
        int goods_id = Integer.parseInt(request.getParameter("goods_id")) ;


        Cart cart=new Cart(goods_id,user_id,goods_num);
        new CartService().updateCart(cart);




    }
}
