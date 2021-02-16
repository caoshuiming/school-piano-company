package com.sevlet;




import com.pojo.User;
import com.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 用于注册
 */
@WebServlet(name = "register",urlPatterns = {"/register.action"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 编码
        HttpSession session = req.getSession();

        // 获取注册的属性：用户名、密码、邮箱
        String username = req.getParameter("user-name");
        String password = req.getParameter("user-password");
        String Email = req.getParameter("Email");
        // 注册时候的“校验码”
//        String code = req.getParameter("code");
//        // 获取ValidateImageServlet产生的校验码的值。
//        //String sRand = (String) req.getAttribute("sRand");
//        String sRand = (String)session.getAttribute("sRand");
//        System.out.println("从session里面获取的校验码是："+ sRand);
        User user=new User();
        user.setUser_name(username);
        user.setPassword(password);
        user.setEmail(Email);
        boolean bool= UserService.addUser(user);
        if (bool==true){
            resp.sendRedirect("login-register.jsp");
        }
    }


}