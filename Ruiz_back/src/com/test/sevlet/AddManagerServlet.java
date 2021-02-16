package com.test.sevlet;

import com.test.pojo.Manager;
import com.test.pojo.Users;
import com.test.service.ManagerService;
import com.test.service.UsersService;
import com.test.utils.IOUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * 这个servlet用于添加管理员
 */
@WebServlet(name = "AddManagerServlet", urlPatterns = {"/addmanager.action","/addmanager_zc.action"})
public class AddManagerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 获取路径<url-pattern>
        String path = req.getServletPath();
        // 单个添加管理员
        if ("/addmanager.action".equals(path)) {
            addmanager(req, resp);
        } else if ("/addmanager_zc.action".equals(path)) {
            addmanager_zc(req, resp);
        }
    }


    /**
     * 单个添加管理员
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void addmanager(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 获取添加管理员表单的信息
        String name = req.getParameter("m_name");
        String password = req.getParameter("password");
        String flag = req.getParameter("flag");
        int _flag=Integer.parseInt(flag);

        // 封装成一个manager对象
        Manager manager = new Manager(name,password, _flag);
        // 调用业务类的方法，完成学生的添加。
        ManagerService managerService = new ManagerService();
        managerService.addManager(manager);

        req.getRequestDispatcher("manager_f.action").forward(req, resp);
    }
    /**
     * 注册管理员
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void addmanager_zc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 获取添加管理员表单的信息
        String name = req.getParameter("m_name");
        String password = req.getParameter("password");
        String flag = req.getParameter("flag");
        int _flag=Integer.parseInt(flag);

        // 封装成一个manager对象
        Manager manager = new Manager(name,password, _flag);
        // 调用业务类的方法，完成学生的添加。
        ManagerService managerService = new ManagerService();
        managerService.addManager(manager);

        req.getRequestDispatcher("login_admi.jsp").forward(req, resp);
    }
}