<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>

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

                $("span[id^='xiugai_']").each(function () {
                    $(this).on("click",function () {
                        var _id = $(this).attr("id");
                        var id= _id.replaceAll("xiugai_","");
                        $("#m_id").val(id);
                    })
                })
            });
        </script>
    </head>
    <body>
        <br/>
        <!-- 展示管理员信息。 -->
        <div class="container">
            <%@ include file="head.jsp" %>
            <span style="float: right">超级管理员不可删除！</span>
        </div>
        <br/>

        <div class="container">
            <table class="table table-condensed table-hover table-bordered table-striped">
                <tr>
                    <td><b>序号</b></td>
                    <td><b>名字</b></td>
                    <td><b>密码</b></td>
                    <td><b>修改</b></td>
                    <td><b>是否可删除</b></td>
                    <td><b>删除</b></td>
                </tr>
                <%
                    if(managers != null) {
                        for(int i=0; i<managers.size(); i++) {
                            Manager mag = managers.get(i);
                %>
                <tr id="student_<%=mag.getM_id() %>" class="trItem">
                    <td id="index_<%=mag.getM_id()%>">
                        <%=i+1%>
                    </td>
                    <td>
                        <%=mag.getM_name() %>
                    </td>
                    <td>
                        <%=mag.getPassword() %>
                    </td>
                    <td>
                        <span style="color: #1d6fa6" class="glyphicon glyphicon-edit" aria-hidden="true" data-toggle="modal" data-target="#myMod" id="xiugai_<%=mag.getM_id()%>"></span>
                    </td>
                    <td>
                        <%
                            if(mag.getFlag()==1){
                        %>
                        <span>是</span>
                        <%
                            } else {
                        %>
                        <span>否</span>
                        <%
                            }
                        %>
                    </td>
                    <td>
                        <%
                            if(mag.getFlag()==1){
                        %>
                        <a href="delManagerById.action?id=<%=mag.getM_id()%>" style="color: #c12e2a">
                            <span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span>
                        </a>
                        <%
                        } else {
                        %>
                        <span class="glyphicon glyphicon-remove-circle" data-toggle="modal" data-target="#myModal" aria-hidden="true"></span>
                        <%
                            }
                        %>
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

<%--        禁止删除弹窗--%>
        <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLabel">
            <div class="modal-dialog" role="document" style="width:800px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- 提示框 -->
                        <div id="myAlert2" class="alert alert-danger" role="alert" style="margin-top:10px;">
                            <span><b>温馨提示：</b></span>
                            <br />
                            <p>该用户为超级管理员不可进行删除！</p>
                        </div>
                    </div>
                    <center>
                        <button class="btn btn-primary" data-dismiss="modal">关闭</button>
                    </center>
                    <br/>
                </div>
            </div>
        </div>

<%--        修改信息表单弹窗--%>
        <div id="myMod" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLabel">
            <div class="modal-dialog" role="document" style="width:1000px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="descsEndinfoLabel">修改管理员向导</h4>
                    </div>
                    <div class="modal-body">

                        <div class="container text-center">
                            <form class="form-horizontal" method="post" action="<%=path%>/modManager.action">
                                <div class="form-group">
                                    <label class="col-md-3 text-right">
                                        姓名
                                    </label>
                                    <div class="col-md-5">
                                        <input type="hidden" id="m_id" name="m_id" value="">
                                        <!-- 隐藏域：它也是表单的一部分，但是在表单不显示，一般用于保存id这种数据。 -->
                                        <input class="form-control" id="m_name" name="m_name" placeholder="你希望将姓名修改为" required />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 text-right">
                                        密码
                                    </label>
                                    <div class="col-md-5">
                                        <input type="password" class="form-control" id="m_password" name="m_password" placeholder="你希望将密码修改为" required />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 text-right">是否设置为超级管理员</label>
                                    <div class="col-md-5">
                                        <select id="m_flag" name="m_flag" class="form-control" required>
                                            <option value="1">否</option>
                                            <option value="0">是</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-5 col-md-offset-3">
                                        <button class="btn btn-primary" type="submit">修改</button>
                                        <button class="btn btn-primary" type="reset">重置</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
