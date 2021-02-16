<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.test.pojo.Users" %>

<%
    String path = request.getContextPath();

    // 设置请求的编码集
    request.setCharacterEncoding("UTF-8");
    // 设置响应的MIME，以及响应的编码集。
    response.setContentType("text/html;charset=UTF-8");

    // 获取request范围内保存的学生信息
    Users users = (Users)request.getAttribute("users");
    System.out.println("要修改的用户信息：" + users.toString());
%>
<html>
    <head>
        <title>更新用户信息</title>
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
            <form class="form-horizontal" method="post" action="<%=path%>/modUsers.action">
                <div class="form-group">
                    <div class="text-center col-md-6">
                        <h3>更新用户信息</h3>
                    </div>
                </div>


                <div class="form-group">
                    <label class="col-md-1 text-right">
                        姓名
                    </label>
                    <div class="col-md-5">
                        <!-- 隐藏域：它也是表单的一部分，但是在表单不显示，一般用于保存id这种数据。 -->
                        <input  type="hidden" id="user_id" name="user_id" value="<%=users.getUser_id() %>" />
                        <input class="form-control" id="user_name" name="user_name" value="<%=users.getUser_name()%>" placeholder="姓名" required />
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
                            <!-- 默认选中性别。 -->
                            <%
                                if("男".equals(users.getGender())) {
                            %>
                                <option value="男" selected>男</option>
                                <option value="女">女</option>
                            <%
                                }
                                if("女".equals(users.getGender())) {
                            %>
                                <option value="男">男</option>
                                <option value="女" selected>女</option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-1 text-right">
                        邮箱
                    </label>
                    <div class="col-md-5">
                        <input type="text" class="form-control" id="email" name="email" value="<%=users.getEmail()%>" placeholder="邮箱" required />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-1 text-right">生日</label>
                    <div class="col-md-5">
                        <input class="form-control" type="date" id="birth" name="birth" value="<%=users.getBirth()%>" required />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-1 text-right">电话号码</label>
                    <div class="col-md-5">
                        <input  class="form-control" type="text" id="tel" name="tel" placeholder="手机号码" value="<%=users.getTel()%>" required />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-1 text-right">
                        收货地址
                    </label>
                    <div class="col-md-5">
                        <input class="form-control" id="address" name="address" placeholder="收货地址" value="<%=users.getAddress()%>" required />
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-5 col-md-offset-1">
                        <button class="btn btn-primary">修改</button>
                        <button class="btn btn-primary" type="reset">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>