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
 * 这个servlet用于修改用户
 */
@WebServlet(name = "ModifyUsersServlet", urlPatterns = {"/modUsers.action"})
public class ModifyUsersServlet extends HttpServlet {

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
        String name = req.getParameter("user_name");
        String password = req.getParameter("password");
        String gender = req.getParameter("gender");
        String email = req.getParameter("email");
        String birth = req.getParameter("birth");
        String tel = req.getParameter("tel");
        String address = req.getParameter("address");

        ////////////////
        String _id = req.getParameter("user_id");

        System.out.println(_id);
        int id = Integer.parseInt(_id);
        // 封装成一个Users对象
        Users users = new Users(id, name, password, gender, email, birth, tel, address);
        // 调用业务类的方法，完成学生的添加。
        UsersService usersService = new UsersService();
        usersService.modifyUsers(users);

        req.getRequestDispatcher("usersPage.action").forward(req, resp);
        // 更新完以后往哪里去： 不能使用转发，因为如果重复刷新页面，导致重复添加。
        // 初始化分页，也就是第一页，查询10条。
//        int pageSize = ConfigFactory.getInt("common.pageSize", 15);
//        String path = "studentByPage.action?pageNo=0&pageSize=" + pageSize;
//        System.out.println("分页初始化：" + path);
//        req.getRequestDispatcher(path).forward(req, resp);
    }
}