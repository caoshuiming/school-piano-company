package com.sevlet;





import com.service.UserService;
import com.utils.RegexUtils;
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
 * 用于注册
 */
@WebServlet(name = "registercheck",urlPatterns = {"/registercheck.action"})
public class RegisterCheck extends HttpServlet {

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

        // 非空判断，以及密码与确认密码一致的校验。

        if (StringUtils.isNotEmpty(username)) {
            //验证用户名
            boolean bool= UserService.checkUsernameIsHaving(username);
            PrintWriter pw=resp.getWriter();
            pw.write(String.valueOf(bool));
            pw.flush();
            pw.close();
        }
        if(StringUtils.isNotEmpty(password)){
            //验证密码
            boolean bool=password.length()>5? true:false;
            PrintWriter pw=resp.getWriter();
            pw.write(String.valueOf(bool));
            pw.flush();
            pw.close();
        }
        if (StringUtils.isNotEmpty(Email)){
            //验证邮箱
            boolean bool= RegexUtils.isEmail(Email);
            PrintWriter pw=resp.getWriter();
            pw.write(String.valueOf(bool));
            pw.flush();
            pw.close();
        }
    }


}