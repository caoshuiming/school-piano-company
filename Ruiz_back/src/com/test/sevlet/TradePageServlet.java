package com.test.sevlet;

import com.test.pojo.Pagination;
import com.test.service.GoodsService;
import com.test.service.TradeService;
import com.test.utils.RegexUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 分页处理trade数据
 */
@WebServlet(name = "TradePageServlet" ,urlPatterns = {"/tradePage.action"})
public class TradePageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session =req.getSession();

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

        TradeService tradeService = new TradeService();
        Pagination pagination = tradeService.getTradeByPage(pageNo,pageSize);
        // 保存到reques
        session.setAttribute("pagination_t", pagination);
        req.getRequestDispatcher("Trade_List.jsp").forward(req,resp);
    }
}
