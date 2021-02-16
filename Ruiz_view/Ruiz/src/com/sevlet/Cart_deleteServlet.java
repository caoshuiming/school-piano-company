package com.sevlet;



import com.pojo.User;
import com.service.CartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "Cart_deleteServlet ",urlPatterns = {"/Cart_delete.action"})
public class Cart_deleteServlet  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            HttpSession session= request.getSession();
           User user =(User) session.getAttribute("user");
          int    user_id=user.getUser_id();

        int  goods_id=Integer.parseInt(request.getParameter("goods_id"));

        new CartService().deleteCart(goods_id,user_id);


        request.getRequestDispatcher("cart.jsp").forward(request, response);




    }
}
