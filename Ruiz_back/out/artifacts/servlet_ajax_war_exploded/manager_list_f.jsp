<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.test.utils.ConfigFactory" %>
<%@ page import="com.test.pojo.Users" %>
<%
    String path = request.getContextPath();
    // 结果页面访问的前提是：已经登录，不然叫非法登录。
    // 去requesst里取学习信息

    // 取出结果集
    List<Manager> managers = (List<Manager>) request.getAttribute("managers");
%>
<html>
    <head>
        <title>浏览管理员信息</title>
        <link href="<%=path%>/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <script src="<%=path%>/bootstrap/js/jquery.min.js"></script>
        <script src="<%=path%>/bootstrap/js/bootstrap.js"></script>

        <script src="<%=path%>/pagination/jquery.pagination1.0.5.js"></script>
        <link href="<%=path%>/pagination/pagination.css" rel="stylesheet" />

        <style type="text/css">
            td {
                text-align: center;
            }
        </style>

        <script type="text/javascript">
            $(function() {
                $.pagMag.startPagination(
                    perPage = 20, // 每页显示几条数据（页大小）
                    reload = 0,         // default 0, value 1 keeps actual page when webpage is reloaded (need modul cookies.js)
                    item = 'trItem',    // 要分页的数据。
                    pager = 'divPager'  // 分页的容器，它会自动产生：1、2、3这种页码。
                );
            });
        </script>
    </head>
    <body>
        <br/>
        <!-- 展示管理员信息。 -->
        <div class="container">
            <h4 style=" display : inline">添加成功！</h4>
            <%@ include file="head.jsp" %>
            <a href="manager_add.jsp" type="button" class="btn btn-primary" style="float: right">继续进行添加</a>
        </div>
        <br/>

        <div class="container">
            <table class="table table-condensed table-hover table-bordered table-striped">
                <tr>
                    <td><b>序号</b></td>
                    <td><b>名字</b></td>
                    <td><b>密码</b></td>
                </tr>
                <%
                    if(managers != null) {
                        for(int i=0; i<managers.size(); i++) {
                            Manager mag = managers.get(i);
                %>
                <tr id="student_<%=mag.getM_id() %>" class="trItem">
                    <td id="index_<%=mag.getM_id()%>">
                        <%=i+1%>
<%--                        <%=p.getPageNo() * p.getPageSize() + (i + 1) %>--%>
                    </td>
                    <td>
                        <%=mag.getM_name() %>
                    </td>
                    <td>
                        <%=mag.getPassword() %>
                    </td>
                </tr>
                <%      }
                    } else {
                %>
                <tr>
                    <td colspan="9">没有数据！</td>
                </tr>
                <%  }  %>

                <tr>
                    <td align="center" colspan="10">
                        <div id="divPager"></div>
                    </td>
                </tr>

            </table>
        </div>
    </body>
</html>
