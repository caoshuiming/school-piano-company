<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.test.pojo.Manager" %>

<%
    // 从session里面获取用户的信息。
    Manager manager = (Manager)session.getAttribute("manager");
%>

<html>
    <head>
        <title>头文件</title>
    </head>
        <body>
        <%
            if(manager != null) {
        %>
        <h4 style=" display : inline">
        欢迎：<a href="#"><%=manager.getM_name() %></a>  |  <a href="logout.action">注销</a>  |  <a href="home.jsp">返回首页</a>
        <% } else { %>
            <a href="login_admi.jsp">请先登录</a>
        <% } %>
        </h4>
        </body>
</html>