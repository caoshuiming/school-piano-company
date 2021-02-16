package com.test.sevlet;

import com.test.pojo.Goods;
import com.test.service.GoodsService;
import com.test.utils.ConfigFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "GoodsInsertServlet",urlPatterns = {"/goodsAdd.action"})
public class GoodsInsertServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        addGoods(req,resp);
    }

    private void addGoods(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

        String goodsName = req.getParameter("goodsName");
        System.out.println(goodsName);
        String goodsImage = req.getParameter("goodsImage");
        String _goodsPrice = req.getParameter("goodsPrice");
        String goodsBrand = req.getParameter("goodsBrand");
        String goodsCategory = req.getParameter("goodsCategory");
        String _goodsStock = req.getParameter("goodsStock");
        String goodsDescription = req.getParameter("goodsDescription");

        Float goodsPrice = Float.parseFloat(_goodsPrice);
        int goodsStock = Integer.parseInt(_goodsStock);

        Goods goods = new Goods(goodsName,goodsImage,goodsPrice,goodsBrand,goodsCategory,goodsStock,0,goodsDescription);
        System.out.println(goods);
        GoodsService goodsService = new GoodsService();
        Boolean result = false;
        result = goodsService.insertGoodsService(goods);
        System.out.println(result);
        if (result){
            int pageSize = ConfigFactory.getInt("common.pageSize", 10);

            String path = "goodsPage.action?pageNo=0&pageSize=" + pageSize;
//        System.out.println("分页初始化：" + path);
            req.getRequestDispatcher(path).forward(req, resp);
        }



    }
}
