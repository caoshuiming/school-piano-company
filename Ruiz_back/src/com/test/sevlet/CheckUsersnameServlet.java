package com.test.sevlet;

import com.test.service.UsersService;
import com.test.utils.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
//用于检测是否重名
@WebServlet(name="CheckUsersnameServlet", urlPatterns = {"/checkusersname.action"})
public class CheckUsersnameServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 能不能获取到用户名。
        String username = req.getParameter("username");
        System.out.println("后台接收的用户名：" + username);
        if(StringUtils.isNotEmpty(username)) {
            UsersService usersservice = new UsersService();
            // 调用业务方法进行判断。
            boolean bool = usersservice.checkUsersnameIsHaving(username);
            // 用流进行响应
            PrintWriter writer = resp.getWriter();
            // 把布尔型转成字符串。
            writer.write(String.valueOf(bool));
            writer.flush();
            writer.close();
        }
    }
}
