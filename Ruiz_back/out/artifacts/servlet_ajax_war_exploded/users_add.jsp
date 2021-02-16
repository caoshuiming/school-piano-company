
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
        <title>添加用户信息</title>
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
            <form class="form-horizontal" method="post" action="<%=path%>/addusers.action">
                <div class="form-group">
                    <div class="text-center col-md-6">
                        <h3>用户添加</h3>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-1 text-right">
                        姓名
                    </label>
                    <div class="col-md-5">
                        <input class="form-control" id="user_name" name="user_name" placeholder="姓名" required />
                    </div>
                    <div class="col-md-2 text-left">
                        <span id="usersnameTip" style="display: none">用户名已经被占用！</span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-1 text-right">
                        密码
                    </label>
                    <div class="col-md-5">
                        <input type="password" class="form-control" id="password" name="password" value="123456" placeholder="密码" required />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-1 text-right">性别</label>
                    <div class="col-md-5">
                        <select id="gender" name="gender" class="form-control" required>
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-1 text-right">
                        邮箱
                    </label>
                    <div class="col-md-5">
                        <input type="text" class="form-control" id="email" name="email" value="19399999@qq.com" placeholder="邮箱" required />
                    </div>
                </div>


                <div class="form-group">
                    <label class="col-md-1 text-right">生日</label>
                    <div class="col-md-5">
                        <input class="form-control" type="date" id="birth" name="birth" value="2003-12-12" required />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-1 text-right">电话号码</label>
                    <div class="col-md-5">
                        <input  class="form-control" type="text" id="tel" name="tel" placeholder="电话号码" value="13999999999" required />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-1 text-right">
                        收货地址
                    </label>
                    <div class="col-md-5">
                        <input class="form-control" id="address" name="address" value="湖南省长沙市芙蓉区" placeholder="收货地址" required />
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-5 col-md-offset-1">
                        <button class="btn btn-primary" type="submit" id="tj">添加</button>
                        <button class="btn btn-primary" type="reset">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>