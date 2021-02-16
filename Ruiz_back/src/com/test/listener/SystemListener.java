package com.test.listener;

import com.test.utils.ConfigFactory;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.List;

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
        // 配置文件的绝对路径
        String path = "D:/jsp程序/servlet_ajax/conf/config.xml";
        // 初始化配置文件
        ConfigFactory.init(path);

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