package com.test.sevlet;

import com.test.pojo.Manager;
import com.test.service.ManagerService;
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
@WebServlet(name="CheckManagernameServlet", urlPatterns = {"/checkmanagername.action"})
public class CheckManagernameServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 能不能获取到用户名。
        String manager_name = req.getParameter("m_name");
        System.out.println("后台接收的用户名：" + manager_name);
        if(StringUtils.isNotEmpty(manager_name)) {
            ManagerService managerservice = new ManagerService();
            // 调用业务方法进行判断。
            boolean bool = managerservice.checkManagernameIsHaving(manager_name);
            // 用流进行响应
            PrintWriter writer = resp.getWriter();
            // 把布尔型转成字符串。
            writer.write(String.valueOf(bool));
            writer.flush();
            writer.close();
        }
    }
}
