package com.test.servlet;

import com.test.service.GoodsService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DeleteGoodsServlet",urlPatterns = {"/deleteGoodsAjax.action","/deleteBatchGoods.action"})
public class DeleteGoodsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String path = req.getServletPath();
        if ("/deleteGoodsAjax.action".equals(path)){
            deleteGoodsOne(req,resp);

        } else if ("/deleteBatchGoods.action".equals(path)){
            deleteBatchGoods(req,resp);
        }

    }

    private void deleteBatchGoods(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String _id = req.getParameter("id");
        //27*28*29*30*31*
        //System.out.println(_id);
        String data = "";
        String[] id = _id.split("\\*");
        for (int i = 0; i < id.length; i++) {
            data = data+","+id[i];//,27,28,29,30,31
        }
        //去掉第一个逗号
        data = data.substring(1);//27,28,29,30,31

        GoodsService service = new GoodsService();
        service.deleteBatchGoods(data);
        int counts = service.getGoodsCounts();
        String text = ""+counts;

        PrintWriter writer = resp.getWriter();
        writer.write(text);
        writer.flush();
        writer.close();

    }

    private void deleteGoodsOne(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String _goods_id = req.getParameter("id");
        if (_goods_id != null && !"".equals(_goods_id)){
            int id = Integer.parseInt(_goods_id);

            GoodsService service = new GoodsService();
            int counts = service.getGoodsCounts();
            service.deleteGoodsByIdService(id);
            // 删除完毕:把删除结果写回给页面。
            String data = "" + counts;
            PrintWriter writer = resp.getWriter();
            writer.write(data);
            writer.flush();
            writer.close();
        }

    }
}
