package com.test.sevlet;

import com.test.pojo.Users;
import com.test.service.UsersService;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 通过ID查询用户信息
 */
@WebServlet(name = "GetUsersByIdServlet", urlPatterns = {"/gubyid.action"})
public class GetUsersByIdServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ServletContext application = req.getServletContext();
        // 获取参数
        String encoding = application.getInitParameter("ctx");
        // 编码
        //req.setCharacterEncoding(encoding);
        //resp.setContentType("text/html;charset=" + encoding);

        // 获取ID：  <a href="getStuById.action?id=4">删除</a>
        String _id = req.getParameter("id");
        if(_id != null && !"".equals(_id)) {
            int id = Integer.parseInt(_id);
            // 调用业务层
            UsersService usersService = new UsersService();
            // 根据ID查询用户
            Users users = usersService.getUsersById(id);
            // 把用户信息放入request
            req.setAttribute("users", users);
            // 跳转：
            req.getRequestDispatcher("users_update.jsp").forward(req, resp);
        } else {
            // id错误直接去登录页。
            resp.sendRedirect("login_admi.jsp");
        }
    }
}