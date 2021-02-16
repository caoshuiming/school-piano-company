package com.test.sevlet;

import com.test.pojo.Manager;
import com.test.service.ManagerService;
import com.test.utils.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

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
        String m_name = request.getParameter("username");
        String password = request.getParameter("password");
        String _code=request.getParameter("code");
        System.out.println("code="+_code);
        // 做非空校验。
        if(StringUtils.isNotEmpty(m_name) && StringUtils.isNotEmpty(password)) {
            ManagerService managerService = new ManagerService();
            //获取生成的验证码
            String sRand= (String) session.getAttribute("sRand");
            System.out.println("sRand="+sRand);
            // 调用业务方法进行用户名密码校验。
            Manager manager = managerService.login1(m_name, password);
            if (manager != null&& sRand.equals(_code)) {
                // 表示登录成功
                // 需要把用户信息放入session.
                session.setAttribute("manager", manager);
                // 请求往哪里转发： 转发到查询全部的学生信息：StudentsListServlet
                // 初始化分页，也就是第一页，查询10条。
//                int pageSize = ConfigFactory.getInt("common.pageSize", 15);
//                String path = "studentByPage.action?pageNo=0&pageSize=" + pageSize;
//                System.out.println("分页初始化：" + path);
                request.getRequestDispatcher("index-1.jsp").forward(request, response);
            } else {
                // 失败了去登录页面：重定向
                response.sendRedirect("login_admi.jsp");
                // 重定向的底层实现。
                //resp.setStatus(302);
                //resp.setHeader("Location", "login.jsp");
            }
        } else {
            // 用户名密码为空：
            response.sendRedirect("login_admi.jsp");
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
        response.sendRedirect("login_admi.jsp");
    }
}