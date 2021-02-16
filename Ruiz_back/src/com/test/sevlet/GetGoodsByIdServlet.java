package com.test.sevlet;

import com.alibaba.fastjson.JSON;
import com.test.pojo.Goods;
import com.test.service.GoodsService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "GetGoodsByIdServlet",urlPatterns = {"/getGoodsById.action"})
public class GetGoodsByIdServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String _id = req.getParameter("id");
        int id = Integer.parseInt(_id);

        Goods goods = new GoodsService().getGoodsById(id);
        String json = JSON.toJSONString(goods);
        //System.out.println(goods);
        System.out.println(json);

        PrintWriter writer = resp.getWriter();
        writer.write(json);
        writer.flush();
        writer.close();

    }
}
