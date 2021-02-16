package com.test.sevlet;

import com.test.service.ManagerService;
import com.test.service.UsersService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(name = "ManagerDeleteServlet", urlPatterns = {"/delManagerById.action"})
public class ManagerDeleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String path = req.getServletPath();
        if ("/delManagerById.action".equals(path)) {
            delManagerById(req, resp);
        }
    }

    /**
     * 传统方式删除学生。进行页面跳转的。
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    private void delManagerById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 获取ID：  <a href="delStuById.action?id=4">删除</a>
        String _id = req.getParameter("id");
        if (_id != null && !"".equals(_id)) {
            int id = Integer.parseInt(_id);
            // 调用业务层
            ManagerService managerService = new ManagerService();
            // 删除学生。
            managerService.removeManagerById(id);

            req.getRequestDispatcher("manager_detele.action").forward(req, resp);

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
}