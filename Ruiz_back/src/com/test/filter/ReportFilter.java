package com.test.filter;

import com.test.utils.DateUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Date;

/**
 *这个过滤器监控“所有的jsp”的访问情况。
 * 使用的注解实现，省去了配置，然后是过滤器可以过滤JSP。
 */
@WebFilter(filterName = "ReportFilter", urlPatterns = {"*.jsp"})
public class ReportFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        // 拿到客户端的ip.
        // 我们首先先把ServletRequest，ServletResponse 转成 --> HttpServletRequest, HttpServletResponse
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        String remoteAdd = request.getRemoteAddr();
        String requestUrl = request.getRequestURL().toString();
        // 当前时间。
        String now = DateUtils.formatDate(new Date(), "yyyy-MM-dd HH:mm:ss");
        String log = remoteAdd + "访问了: " + requestUrl + ", 访问时间是：" + now;
        //System.out.println(log);
        // FilterChain
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {
    }
}
