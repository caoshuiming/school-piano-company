
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
        <title>添加管理员信息</title>
        <link href="<%=path%>/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <script src="<%=path%>/bootstrap/js/jquery.min.js"></script>
        <script src="<%=path%>/bootstrap/js/bootstrap.js"></script>
        <script type="text/javascript" src="<%=path%>/jquery/jquery-1.12.4.min.js"></script>
        <script type="text/javascript" src="<%=path%>/js/jquery_ajax.js"></script>
        <style type="text/css">
            td {
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="container text-center">
            <form class="form-horizontal" method="post" action="<%=path%>/addmanager.action">
                <div class="form-group">
                    <div class="text-center col-md-8">
                        <h3>管理员添加</h3>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 text-right">
                        管理员名
                    </label>
                    <div class="col-md-5">
                        <input class="form-control" id="m_name" name="m_name" placeholder="姓名" required />
                    </div>
                    <div class="col-md-2 text-left">
                        <span id="managernameTip" style="display: none">用户名已经被占用！</span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 text-right">
                        密码
                    </label>
                    <div class="col-md-5">
                        <input type="password" class="form-control" id="password" name="password" placeholder="密码" required />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 text-right">是否设置为超级管理员</label>
                    <div class="col-md-5">
                        <select id="flag" name="flag" class="form-control" required>
                            <option value="1">否</option>
                            <option value="0">是</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-5 col-md-offset-3">
                        <button class="btn btn-primary" type="submit" id="m_tj">添加</button>
                        <button class="btn btn-primary" type="reset">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>