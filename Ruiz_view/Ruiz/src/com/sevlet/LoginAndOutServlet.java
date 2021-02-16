package com.sevlet;





import com.pojo.User;
import com.service.UserService;
import com.utils.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 此servle用于登录与注销
 * (通过注解实现，不需要web.xml配置。)
 */
@WebServlet(name = "LoginAndOutServlet", urlPatterns = {"/login.action", "/logout.action"})
public class LoginAndOutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 编码
        //req.setCharacterEncoding(encoding);
        //resp.setContentType("text/html;charset=" + encoding);
        // 获取SERVELT的url-pattern。
        String path = req.getServletPath();
        // 问题：怎么区分到底是“登录”与“注销”
        if("/login.action".equals(path)) {
            // 登录
            login(req, resp);
        } else if("/logout.action".equals(path)) {
            // 注销
            logout(req, resp);
        }
    }

    /**
     * 处理登录的
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        // 获取用户表单里面提交的：用户名，和密码
        String username = request.getParameter("user-name");
        String password = request.getParameter("user-password");
        // 做非空校验。
        if(StringUtils.isNotEmpty(username) && StringUtils.isNotEmpty(password)) {
            UserService userService = new UserService();
            // 调用业务方法进行用户名密码校验。
            User user = userService.login(username, password);
            if (user != null) {
                // 表示登录成功
                // 需要把用户信息放入session.
                System.out.println("登录成功");
                session.setAttribute("user", user);
                // 请求往哪里转发： 转发到查询全部的学生信息：StudentsListServlet
                // 初始化分页，也就是第一页，查询10条。
//                int pageSize = ConfigFactory.getInt("common.pageSize", 15);
//                String path = "studentByPage.action?pageNo=0&pageSize=" + pageSize;
//                System.out.println("分页初始化：" + path);
                PrintWriter pw=response.getWriter();
                pw.write("true");
                pw.flush();
                pw.close();
                //request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                System.out.println("登陆失败");
                // 失败了去登录页面：重定向
                //response.sendRedirect("login-register.jsp");
                //失败了返回false給ajax
                PrintWriter pw=response.getWriter();
                pw.write("false");
                pw.flush();
                pw.close();
            }
        } else {
            // 用户名密码为空：
            System.out.println("用户名密码为空");
            response.sendRedirect("login-register.jsp");
        }
    }

    /**
     * 处理注销的
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        // 注销代码比较固定：
        // session销毁
        session.invalidate();
        // 页面跳转: 重定向到登录页面
        response.sendRedirect("login-register.jsp");
    }
}