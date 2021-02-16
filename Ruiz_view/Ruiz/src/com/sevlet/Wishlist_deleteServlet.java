package com.sevlet;



import com.pojo.User;
import com.service.WishlistService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "Wishlist_deleteServlet",urlPatterns = {"/Wishlist_delete.action"})
public class Wishlist_deleteServlet extends HttpServlet {
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

        new WishlistService().deleteWishlist(goods_id,user_id);


        request.getRequestDispatcher("wishlist.jsp").forward(request, response);





    }
}
