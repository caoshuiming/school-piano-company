package com.test.sevlet;

import com.test.pojo.Users;
import com.test.service.UsersService;
import com.test.utils.ConfigFactory;
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
 * 这个servlet用于添加用户
 */
@WebServlet(name = "AddUsersServlet", urlPatterns = {"/addusers.action","/addusersbatch.action"})
public class AddUsersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 获取路径<url-pattern>
        String path = req.getServletPath();
        // 单个添加学生
        if ("/addusers.action".equals(path)) {
            addUsers(req, resp);
        }
        else if ("/addusersbatch.action".equals(path)) {
            // 批量添加学生
            addUsersBatch(req, resp);
        }
    }


    /**
     * 单个添加学生
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void addUsers(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 获取添加学生表单的信息
        String name = req.getParameter("user_name");
        String password = req.getParameter("password");
        String gender = req.getParameter("gender");
        String email = req.getParameter("email");
        String birth = req.getParameter("birth");
        String tel = req.getParameter("tel");
        String address = req.getParameter("address");

        // 封装成一个users对象
        Users users = new Users(name,password, gender, email, birth, tel, address);
        // 调用业务类的方法，完成学生的添加。
        UsersService usersService = new UsersService();
        usersService.addUsers(users);

        req.getRequestDispatcher("usersPage.action").forward(req, resp);
        // 添加完以后往哪里去： 不能使用转发，因为如果重复刷新页面，导致重复添加。
        // 初始化分页，也就是第一页，查询10条。
//        int pageSize = ConfigFactory.getInt("common.pageSize", 15);
//        String path = "studentByPage.action?pageNo=0&pageSize=" + pageSize;
//        System.out.println("分页初始化：" + path);
//        req.getRequestDispatcher(path).forward(req, resp);
    }

    /**
     * 批量添加学生
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void addUsersBatch(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ServletContext application = req.getServletContext();
        // 定义阈值，表示提交的表单的大小能超过这个阈值(字节)
        int sizeThreshold = 20 * 1024 * 1024;
        // 设置单个图片的大小。
        int fileMaxSize = 5 * 1024 * 1024;

        // 定义一个临时目录
        String temp = application.getRealPath("/temp");
        // 设置图片往哪里上传
        String target = application.getRealPath("/upload");

        // 判断目录是否存在。
        if (!new File(temp).exists()) {
            // 不存在就创建
            new File(temp).mkdirs();
        }

        // 判断文件上传的目录是否存在。
        if (!new File(target).exists()) {
            // 不存在就创建
            new File(target).mkdirs();
        }

        // 创建了磁盘文件工厂类
        DiskFileItemFactory dfif = new DiskFileItemFactory(sizeThreshold, new File(temp));

        // 构建上传文件的处理类。
        ServletFileUpload sfu = new ServletFileUpload(dfif);
        // 设置单个文件的大小限制。
        sfu.setFileSizeMax(fileMaxSize);

        // 解析请求了
        List<FileItem> fileItems = null;
        try {
            fileItems = sfu.parseRequest(req);
        } catch (FileUploadException e) {
            e.printStackTrace();
        }

        for (FileItem fileItem : fileItems) {
            // 获取字段名称
            String fieldName = fileItem.getFieldName();
            // 获取字段的大小
            long size = fileItem.getSize();
            // 获取字段的类型
            String type = fileItem.getContentType();
            // 判断是否为上传字段
            boolean bool = fileItem.isFormField();
            // 我们要的是上传的字段
            if (!bool) {
                if ("file".equals(fieldName)) {
                    // 说明是上传字段：这里不需要文件重命名。
                    File file = new File(target + File.separator + fieldName);
                    try {
                        fileItem.write(file);
                        // 上传完毕：读取文件里面的内容
                        List<String> lines = IOUtils.readFileByLines(file);
                        // 调用业务方法，执行批量插入。
                        new UsersService().addUsersBatch(lines);
                        //new StudentService().addStudentBatch1(lines);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }

        req.getRequestDispatcher("usersPage.action").forward(req, resp);
//        // 初始化分页，也就是第一页，查询10条。
//        int pageSize = ConfigFactory.getInt("common.pageSize", 15);
//        String path = "studentByPage.action?pageNo=0&pageSize=" + pageSize;
//        System.out.println("分页初始化：" + path);
//        req.getRequestDispatcher(path).forward(req, resp);
    }
}