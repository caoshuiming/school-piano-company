package com.test.sevlet;

import com.test.pojo.Pagination;
import com.test.service.GoodsService;
import com.test.utils.RegexUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 分页处理goods数据
 */
@WebServlet(name = "GoodsPageServlet" ,urlPatterns = {"/goodsPage.action"})
public class GoodsPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String _pageNo = req.getParameter("pageNo");
        if(!RegexUtils.isNumber(_pageNo)) {
            // 为空就认为是一页。
            _pageNo = "0";
        }
        String _pageSize = req.getParameter("pageSize");
        if(!RegexUtils.isNumber(_pageSize)) {
            // 为空，认为页码就是10
            _pageSize = "10";
        }

        int pageNo = Integer.parseInt(_pageNo);
        int pageSize = Integer.parseInt(_pageSize);

        // 处理异常的分页
        if(pageNo <= 0) {
            pageNo = 0; // 如果页码小于零，就设置成第一页
        }
        if(pageSize <= 0) {
            pageSize = 10; // 如果页码小于0就设置成，一页显示5个。
        }

        GoodsService goodsService = new GoodsService();
        Pagination pagination = goodsService.getGoodsByPage(pageNo,pageSize);
        // 保存到reques
        req.setAttribute("pagination", pagination);
        req.getRequestDispatcher("Products_List.jsp").forward(req,resp);
    }
}
