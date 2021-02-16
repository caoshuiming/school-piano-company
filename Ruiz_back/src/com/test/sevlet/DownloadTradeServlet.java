package com.test.sevlet;

import com.test.service.DownloadTradeService;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 处理学生信息下载
 */
@WebServlet(name="DownloadTradeServlet", urlPatterns = {"/downloadTrade.action"})
public class DownloadTradeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ServletContext application = req.getServletContext();

        // 把list的内容写入文件。
        // 先确定文件写在哪里。
        String downloadPath = application.getRealPath("/download");
        // 判断目录有没有，没有就创建
        if(!new File(downloadPath).exists()) {
            // 创建
            new File(downloadPath).mkdirs();
        }
        // 确定下载文件的名称
        String fileName = "Trade.txt";
        // 下载文件的绝对路径
        String path = downloadPath + File.separator + fileName;
        System.out.println("下载完毕以后的文件：" + path);
        // 掉业务方法下载文件
        new DownloadTradeService().downloadTrade(path);
        // 通过流把下载完毕以后的文件写回到浏览器。
        PrintWriter writer = resp.getWriter();
        writer.write(fileName);// 写回的是“文件名”
        writer.flush();
        writer.close();
    }
}
