package com.test.sevlet;

import com.test.pojo.Trade;
import com.test.service.TradeItemsService;
import com.test.service.TradeService;
import com.test.service.UsersService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(name = "UsersDeleteServlet", urlPatterns = {"/delUsersById.action", "/delUsersByIdByAjax.action"})
public class UsersDeleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String path = req.getServletPath();
        if ("/delUsersById.action".equals(path)) {
            delUsersById(req, resp);
        } else if ("/delUsersByIdByAjax.action".equals(path)) {
            delUsersByIdByAjax(req, resp);
        }
    }

    /**
     * 传统方式删除学生。进行页面跳转的。
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    private void delUsersById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 获取ID：  <a href="delStuById.action?id=4">删除</a>
        String _id = req.getParameter("id");
        if (_id != null && !"".equals(_id)) {
            int id = Integer.parseInt(_id);
            // 调用业务层
            UsersService usersService = new UsersService();
            TradeService tradeService=new TradeService();
            TradeItemsService tradeItemsService=new TradeItemsService();

            //先通过用户id查到订单id
            Trade trade=tradeService.getTradeByUserId(id);
            if (trade != null && !"".equals(trade)) {
                String _trade_id = trade.getTrade_id();
                int trade_id = Integer.parseInt(_trade_id);
                //先删除订单详情，再删除订单信息
                tradeItemsService.removeTradeItemsByTradeId(trade_id);
            }
            //先删除订单信息，解决外键问题
            tradeService.removeTradeByUserId(id);
            //再删除学生。
            usersService.removeUsersById(id);

            req.getRequestDispatcher("usersPage.action").forward(req, resp);

            // 初始化分页，也就是第一页，查询10条。
//            int pageSize = ConfigFactory.getInt("common.pageSize", 15);
//            String path = "studentByPage.action?pageNo=0&pageSize=" + pageSize;
//            System.out.println("分页初始化：" + path);
//            req.getRequestDispatcher(path).forward(req, resp);
        } else {
            // id错误直接去登录页。
            resp.sendRedirect("login_admi.jsp");
        }
    }

    /**
     * 使用ajax删除，不需要页面的跳转。
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    private void delUsersByIdByAjax(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String _id = req.getParameter("id");
        if (_id != null && !"".equals(_id)) {
            int id = Integer.parseInt(_id);
            // 调用业务层
            UsersService usersService = new UsersService();
            // 删除学生。
            boolean bool = usersService.removeUsersById(id);
            // 删除完毕:把删除结果写回给页面。
            PrintWriter writer = resp.getWriter();
            writer.write(String.valueOf(bool));
            writer.flush();
            writer.close();
        }
    }
}