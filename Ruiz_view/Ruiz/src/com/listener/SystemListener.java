package com.listener;
import com.pojo.Goods;
import com.service.GoodsService;
import com.utils.ConfigFactory;
import com.utils.LogConfig;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.io.File;
import java.util.List;
import java.util.logging.Logger;

/**
 * 系统级listener.
 */
public class SystemListener implements ServletContextListener {

    /**
     * 随着web容器的启动的时候调用。
     * @param sce
     */
    @Override
    public void contextInitialized(ServletContextEvent sce) {

        System.out.println("contextInitialized()..........................");
        ServletContext application = sce.getServletContext();



        // 配置：${stj} : 该项目路径
        String path = "E:/QQ/2639067440/FileRecv/项目/Ruiz_view/Ruiz";
        // linux目录。
        // path = "/home/sinoyang/tools/web";

        // 设置：以便logback在配置文件里面使用${stj}获取路径。
        System.setProperty("stj", path);

        // 初始化配置文件
        String configPath = path + File.separator + "conf/config.xml";
        ConfigFactory.init(configPath);

        // 完成日志的初始化。
        String logPath = path + File.separator + "conf/logback.xml";
        LogConfig.init(logPath);

        //初始化主页的时候就加载所有商品
        List<Goods> list= GoodsService.getAll();
        application.setAttribute("list",list);



    }

    /**
     * 随着web容器的关闭而关闭的。
     * @param sce
     */
    @Override
    public void contextDestroyed(ServletContextEvent sce) {

        //System.out.println("contextDestroyed()......................");
        // tomcat关闭的时候调用。

    }
}