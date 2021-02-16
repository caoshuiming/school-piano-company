package com.sevlet;

import com.alibaba.fastjson.JSON;
import com.service.GoodsService;
import com.utils.StringUtils;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * 完成自动补全内容的查询。
 */
@WebServlet(name = "AutoCompleteServlet", urlPatterns = {"/autoComplete.action"})
public class AutoCompleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 获取用户输入的信息
        String keyword = req.getParameter("keyword");
        if(StringUtils.isEmpty(keyword)) {
            return;
        }
        // 根据关键字查询书本的信息
        List<String> names = GoodsService.getNames(keyword);

        // 转成JSON
        String json = JSON.toJSONString(names);
        // 通过流写回到客户端。
        PrintWriter writer = resp.getWriter();
        writer.write(json);
        writer.flush();
        writer.close();
    }
}
