package com.sevlet;

import com.alibaba.fastjson.JSON;
import com.pojo.Goods;
import com.service.GoodsService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "GetGoods",urlPatterns = {"/getGoods.action"})
public class GetGoodsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int goods_id=Integer.parseInt(req.getParameter("goods_id"));
        Goods goods= GoodsService.getGoodsByID(goods_id);
        String json= JSON.toJSONString(goods);
        PrintWriter pw=resp.getWriter();
        //System.out.println("后台json为"+json);
        //System.out.println(json.length());
        pw.write(json);
        pw.flush();
        pw.close();
    }
}
