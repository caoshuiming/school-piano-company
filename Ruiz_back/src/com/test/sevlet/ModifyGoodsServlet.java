package com.test.servlet;

import com.test.pojo.Goods;
import com.test.service.GoodsService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ModifyGoodsServlet",urlPatterns = {"/modifyGoods.action"})
public class ModifyGoodsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String _goodsId = req.getParameter("ModifyId");
        System.out.println(_goodsId);
        String goodsName = req.getParameter("ModifyName");
        String goodsImage = req.getParameter("ModifyImage");
        String _goodsPrice = req.getParameter("ModifyPrice");
        String goodsBrand = req.getParameter("ModifyBrand");
        String goodsCategory = req.getParameter("ModifyCategory");
        String _goodsStock = req.getParameter("ModifyStock");
        String goodsDescription = req.getParameter("ModifyDescription");

        String _pageNo = req.getParameter("ModifyPageNo");
        String _pageSize = req.getParameter("ModifyPageSize");
        int pageNo = Integer.parseInt(_pageNo);
        int pageSize = Integer.parseInt(_pageSize);
        System.out.println(pageNo+pageSize);

        int goodsId = Integer.parseInt(_goodsId);
        Float goodsPrice = Float.parseFloat(_goodsPrice);
        int goodsStock = Integer.parseInt(_goodsStock);

        Goods goods = new Goods(goodsId,goodsName,goodsImage,goodsPrice,goodsBrand,goodsCategory,goodsStock,goodsDescription);
        GoodsService service = new GoodsService();
        service.modifyGoods(goods);

        String path = "goodsPage.action?pageNo="+pageNo+"&pageSize="+pageSize;
        req.getRequestDispatcher(path).forward(req,resp);
    }
}
