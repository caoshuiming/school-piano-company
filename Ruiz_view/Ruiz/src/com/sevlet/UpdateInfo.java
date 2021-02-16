package com.sevlet;

import com.pojo.User;
import com.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(name = "UpdateInfo",urlPatterns = {"/updateinfo.action"})
public class UpdateInfo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String updatename=req.getParameter("userchange-name");
        String updateemail=req.getParameter("email-name");
        String updatepassword=req.getParameter("userchange-password");
        String updatebirth=req.getParameter("birthday");
        String uid=req.getParameter("uid");
        int genderflag=Integer.parseInt(req.getParameter("id_gender"));
        String gender="男";
        if(genderflag==2){
            gender="女";
        }
        User user=new User();
        user.setUser_id(Integer.parseInt(uid));
        user.setUser_name(updatename);
        user.setEmail(updateemail);
        user.setPassword(updatepassword);
        user.setBirth(updatebirth);
        user.setGender(gender);
        if(UserService.updateInfo(user)){
            resp.sendRedirect("login-register.jsp");
        }
    }
}
