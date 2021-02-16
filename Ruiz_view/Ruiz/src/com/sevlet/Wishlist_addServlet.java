package com.sevlet;

import com.pojo.User;
import com.pojo.Wishlist;
import com.service.WishlistService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Wishlist_addServlet ",urlPatterns = {"/Wishlist_add.action"})
public class Wishlist_addServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           HttpSession session= request.getSession();
           User user =(User) session.getAttribute("user");
          int user_id=user.getUser_id();
        int goods_id=Integer.parseInt(request.getParameter("goods_id"));



        boolean bool= new WishlistService().checkWishlistIsHaving(goods_id,user_id);

        if (bool){

            Wishlist wishlist=new Wishlist(goods_id,user_id);

            new WishlistService().insertWishlist(wishlist);
            System.out.println("心愿单添加成功!");



            //使用重定向，防止刷新页面重复添加
            response.sendRedirect("wishlist.jsp");
        }


        else {


            response.sendRedirect("wishlist.jsp");
            System.out.println("该商品已经在心愿列表！");
        }





    }
    }

