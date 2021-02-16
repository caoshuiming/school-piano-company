package com.test.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 此过滤器用于设置编码集。
 */
public class EncodingFilter implements Filter {

    private String encoding;

    @Override
    public void init(FilterConfig fc) throws ServletException {
        // 取得配置的编码集
        this.encoding = fc.getInitParameter("encoding");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain fc) throws IOException, ServletException {

        System.out.println("EncodingFilter.doFilter() begin.................");
        // 我们首先先把ServletRequest，ServletResponse 转成 --> HttpServletRequest, HttpServletResponse
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;

        // 设置编码集
        request.setCharacterEncoding(this.encoding);
        response.setContentType("text/html;charset=" + this.encoding);
        // 调用FilterChain
        fc.doFilter(request, response);
        System.out.println("EncodingFilter.doFilter()   end.................");
    }

    @Override
    public void destroy() {
    }
}