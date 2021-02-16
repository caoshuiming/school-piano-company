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

/**
 * 这个servlet用于修改用户
 */
@WebServlet(name = "ModifyManagerServlet", urlPatterns = {"/modManager.action"})
public class ModifyManagerServlet extends HttpServlet {

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

        // 获取添加用户表单的信息
        String name = req.getParameter("m_name");
        String password = req.getParameter("m_password");
        String _flag = req.getParameter("m_flag");
        ////////////////
        String _id = req.getParameter("m_id");

        int id = Integer.parseInt(_id);
        int flag=Integer.parseInt(_flag);
        // 封装成一个Manager对象
        Manager manager = new Manager(id, name, password,flag);
        // 调用业务类的方法，完成管理员的添加。
        ManagerService managerService = new ManagerService();
        managerService.modifyManager(manager);

        req.getRequestDispatcher("manager_detele.action").forward(req, resp);
        // 更新完以后往哪里去： 不能使用转发，因为如果重复刷新页面，导致重复添加。
        // 初始化分页，也就是第一页，查询10条。
//        int pageSize = ConfigFactory.getInt("common.pageSize", 15);
//        String path = "studentByPage.action?pageNo=0&pageSize=" + pageSize;
//        System.out.println("分页初始化：" + path);
//        req.getRequestDispatcher(path).forward(req, resp);
    }
}