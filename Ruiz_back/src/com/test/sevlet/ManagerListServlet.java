package com.test.sevlet;

import com.test.pojo.Manager;
import com.test.pojo.Users;
import com.test.service.ManagerService;
import com.test.service.UsersService;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 用于查询全部的用户信息。
 */
@WebServlet(name = "ManagerListServlet", urlPatterns = {"/manager_detele.action","/manager_f.action"})
public class ManagerListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String path = req.getServletPath();
            if ("/manager_detele.action".equals(path)) {
                manager_d(req, resp);
        }else if ("/manager_f.action".equals(path)){
                manager_f(req, resp);
            }
    }

    private void manager_d(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext application = req.getServletContext();
        // 获取参数
        String encoding = application.getInitParameter("ctx");
        // 编码
        //req.setCharacterEncoding(encoding);
        //resp.setContentType("text/html;charset=" + encoding);
        // 调用业务层
        ManagerService managerService = new ManagerService();
        // 查询全部的学生信息。
        List<Manager> managers = managerService.getAllManager();
        // 可以放在request里面。
        req.setAttribute("managers", managers);
        // 页面跳转
        req.getRequestDispatcher("manager_list_detele.jsp").forward(req, resp);
    }

    private void manager_f(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext application = req.getServletContext();
        // 获取参数
        String encoding = application.getInitParameter("ctx");
        // 编码
        //req.setCharacterEncoding(encoding);
        //resp.setContentType("text/html;charset=" + encoding);
        // 调用业务层
        ManagerService managerService = new ManagerService();
        // 查询全部的学生信息。
        List<Manager> managers = managerService.getAllManager();
        // 可以放在request里面。
        req.setAttribute("managers", managers);
        // 页面跳转
        req.getRequestDispatcher("manager_list_f.jsp").forward(req, resp);
    }
}