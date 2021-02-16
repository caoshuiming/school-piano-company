<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.test.utils.ConfigFactory" %>
<%@ page import="com.test.pojo.Users" %>
<%
    String path = request.getContextPath();
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
        <!-- 管理员信息。 -->
        <div class="container">
            <%@ include file="head.jsp" %>
        </div>
<%--        <br/>--%>
<%--        <center>--%>
<%--            <button id="download" class="btn btn-primary">下载学生信息</button>--%>
<%--        </center>--%>
<%--        <br/>--%>
        <div class="container">
            <table class="table table-condensed table-hover table-bordered table-striped">
                <tr>
                    <td><b>序号</b></td>
                    <td><b>管理员名</b></td>
                    <td><b>密码</b></td>
                </tr>
                <%
                    if(managers != null) {
                        for(int i=0; i<managers.size(); i++) {
                            Manager manager = managers.get(i);
                %>
                <tr id="student_<%=manager.getM_id() %>" class="trItem">
                    <td id="index_<%=manager.getM_id()%>">
                        <%=i+1%>
<%--                        <%=p.getPageNo() * p.getPageSize() + (i + 1) %>--%>
                    </td>
                    <td>
                        <%=manager.getM_name() %>
                    </td>
                    <td>
                        <%=manager.getPassword() %>
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

<%--        <!-- 下载的：模式对话框  -->--%>
<%--        <div id="myDownload" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLabel">--%>
<%--            <div class="modal-dialog" role="document" style="width:800px;">--%>
<%--                <div class="modal-content">--%>
<%--                    <div class="modal-header">--%>
<%--                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                            <span aria-hidden="true">&times;</span>--%>
<%--                        </button>--%>
<%--                        <h4 class="modal-title" id="myDownloadLabel">下载学生信息向导</h4>--%>
<%--                    </div>--%>
<%--                    <div class="modal-body">--%>
<%--                        <div class="container text-left">--%>
<%--                            <button id="downloadBtn" class="btn btn-primary">下载</button>--%>
<%--                            <!-- 完成下载-->--%>
<%--                            <a id="downloadA" target="_blank" href="" style="display: none" title="点击下载">--%>
<%--                                <span class="glyphicon glyphicon-cloud-download"></span>--%>
<%--                            </a>--%>
<%--                        </div>--%>

<%--                        <!-- 提示框 -->--%>
<%--                        <div id="myAlert3" class="alert alert-danger" role="alert" style="margin-top:10px;">--%>
<%--                            <a href="#" class="close" data-dismiss="alert">×</a> <span><b>温馨提示：</b></span>--%>
<%--                            <br />--%>
<%--                            <p>通过ajax的异步技术，完成学生信息的下载！</p>--%>
<%--                        </div>--%>

<%--                    </div>--%>
<%--                    <div class="modal-footer">--%>
<%--                        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

    </body>
</html>
