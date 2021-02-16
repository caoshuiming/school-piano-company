
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    // 设置请求的编码集
    request.setCharacterEncoding("UTF-8");
    // 设置响应的MIME，以及响应的编码集。
    response.setContentType("text/html;charset=UTF-8");
%>
<html>
    <head>
        <title>批量添加用户信息</title>
        <link href="<%=path%>/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <script src="<%=path%>/bootstrap/js/jquery.min.js"></script>
        <script src="<%=path%>/bootstrap/js/bootstrap.js"></script>
        <style type="text/css">
            td {
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="container text-center">
            <form class="form-horizontal" method="post" enctype="multipart/form-data" action="<%=path%>/addusersbatch.action">
                <div class="form-group">
                    <div class="text-center col-md-6">
                        <h3>批量添加用户</h3>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-1 text-right">
                        文件
                    </label>
                    <div class="col-md-5">
                        <input class="form-control" type="file" id="file" name="file" placeholder="选中要上传的批量学习信息" required />
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-5 col-md-offset-1">
                        <button class="btn btn-primary">添加</button>
                        <button class="btn btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>