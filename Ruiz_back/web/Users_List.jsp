<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.test.pojo.Pagination" %>
<%@ page import="java.util.List" %>
<%@ page import="com.test.utils.ConfigFactory" %>
<%@ page import="com.test.pojo.Users" %>
<%
    String path = request.getContextPath();
    Pagination pagina = (Pagination) session.getAttribute("pagination_u");
    List<Users> usersList = (List<Users>) pagina.getResult();
    int pageSize = ConfigFactory.getInt("common.pageSize");

//    System.out.println("pagina.getCounts()="+pagina.getCounts());
//    System.out.println("pageSize="+pageSize);
//    System.out.println("usersList="+usersList.size());
%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="assets/css/ace.min.css" />
    <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
    <link rel="stylesheet" href="Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link href="Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />
    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
    <![endif]-->
    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/typeahead-bs2.min.js"></script>
    <!-- page specific plugin scripts -->
    <script src="assets/js/jquery.dataTables.min.js"></script>
    <script src="assets/js/jquery.dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="js/H-ui.js"></script>
    <script type="text/javascript" src="js/H-ui.admin.js"></script>
    <script src="assets/layer/layer.js" type="text/javascript" ></script>
    <script src="assets/laydate/laydate.js" type="text/javascript"></script>
    <script type="text/javascript" src="Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>
    <script src="js/lrtk.js" type="text/javascript" ></script>

    <link href="<%=path%>/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="<%=path%>/bootstrap/js/jquery.min.js"></script>
    <script src="<%=path%>/bootstrap/js/bootstrap.js"></script>
    <title>产品列表</title>
</head>
<body>
<div class="container">
     <div class="border ">
       <span class="l_f">
           <a href="home.jsp" title="返回主页" class="btn btn-success "><i class="icon-home"></i>返回主页</a>
<%--           <button id="addusers_List" title="添加商品" class="btn btn-warning Order_form"><i class="icon-plus"></i>添加商品</button>--%>
<%--           <button class="btn btn-danger"><i class="icon-trash"></i>批量删除</button>--%>
        <!-- 使用隐藏域保存页码。 -->
        <input type="hidden" name="displayPageNo" id="displayPageNo" value="<%=pagina.getPageNo()%>"/>
        <select id="sizeSelect" class="btn btn-info" style="height: 35px;width: 110px">
            <option value="5" <%=pagina.getPageSize() == 5 ? "selected" : "" %>>每页5条</option>
            <option value="10" <%=pagina.getPageSize() == 10 ? "selected" : "" %>>每页10条</option>
             <option value="15" <%=pagina.getPageSize() == 15 ? "selected" : "" %>>每页15条</option>
            <option value="20" <%=pagina.getPageSize() == 20 ? "selected" : "" %>>每页20条</option>
            <option value="50" <%=pagina.getPageSize() == 50 ? "selected" : "" %>>每页50条</option>
            <option value="100" <%=pagina.getPageSize() == 100 ? "selected" : "" %>>每页100条</option>
        </select>

       </span>
       <span class="r_f" id="usersCounts">
           共：<b><%= pagina.getCounts()%></b>位用户
       </span>
     </div>
     <!--产品列表展示-->
     <div >
        <table class="table table-striped table-bordered table-hover" >
            <thead>
                <tr>
                    <th ><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                    <th >序号</th>
                    <th >用户名称</th>
                    <th >用户密码</th>
                    <th >用户性别</th>
                    <th >邮箱</th>
                    <th >生日</th>
                    <th >电话</th>
                    <th >收货地址</th>
                    <th >编辑</th>
                    <th >删除</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (usersList != null){
                        for (int i = 0; i < usersList.size(); i++) {
                            Users users = usersList.get(i);
                %>
                <tr id="users_<%=users.getUser_id()%>">
                    <td>
                        <label><input type="checkbox" class="ace"><span class="lbl" ></span></label>
                    </td>
                    <td id="index_<%=users.getUser_id()%>">
                        <%=pagina.getPageNo()*pagina.getPageSize() + (i + 1)%>
                    </td>
                    <td>
                        <%=users.getUser_name()%>
                    </td>
                    <td>
                        <%=users.getPassword()%>
                    </td>
                    <td>
                        <%=users.getGender()%>
                    </td>
                    <td>
                        <%=users.getEmail()%>
                    </td>
                    <td>
                        <%=users.getBirth()%>
                    </td>
                    <td>
                        <%=users.getTel()%>
                    </td>
                    <td>
                        <%=users.getAddress()%>
                    </td>
                    <td>
                        <a href="gubyid.action?id=<%=users.getUser_id()%>">
                            <span class="glyphicon glyphicon-edit" aria-hidden="true" style="color: #00a2d4"></span>
                        </a>
                    </td>
                    <td>
                        <a href="delUsersById.action?id=<%=users.getUser_id()%>">
                            <span class="glyphicon glyphicon-remove-circle" aria-hidden="true" style="color: #00a2d4"></span>
                        </a>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                        <tr>
                            <td colspan="9">没有数据！</td>
                        </tr>
                 <% } %>

                <tr>
                    <td align="center" colspan="11" >

                        <span>
                         <button class="btn btn-default"><b><%=pagina.getPageNo() + 1 %></b>/<%=pagina.getPages() %></button>
                            <% if(pagina.getFirstPage()) { %>
                                <button class="btn btn-default">首页</button> <button class="btn btn-default"> 上一页</button>
                            <% } else { %>
                                <button class="btn btn-info" style="height: 35px"><a href="usersPage.action?pageNo=0&pageSize=<%=pagina.getPageSize() %>">首页</a></button>
                                <button class="btn btn-info" style="height: 35px"><a href="usersPage.action?pageNo=<%=pagina.getPageNo()-1 %>&pageSize=<%=pagina.getPageSize() %>">上一页</a></button>
                            <% } %>
                        </span>
                        <span>
                            <% if(pagina.getLastPage()) { %>
                                <button class="btn btn-default">下一页</button> <button class="btn btn-default"> 尾页</button>
                            <% } else { %>
                                <button class="btn btn-info" style="height: 35px"><a href="usersPage.action?pageNo=<%=pagina.getPageNo()+1 %>&pageSize=<%=pagina.getPageSize() %>">下一页</a></button>
                                <button class="btn btn-info" style="height: 35px"><a href="usersPage.action?pageNo=<%=pagina.getPages()-1 %>&pageSize=<%=pagina.getPageSize() %>">尾页</a></button>
                            <% } %>
                        </span>
                        <span>
                             <%--<button id="btnJump1" class="btn btn-default" style="width: 70px;height: 28px;" ></button>--%>
                            <input type="number" id="jump" name="jump" value="" style="width:70px;margin-left :0px; float: right;height: 35px" size="5" maxlength="5" placeholder="第几页"  />
                            <input type="button" id="btnJump" class="btn btn-info" value="跳转至" style="float: right;margin-right: 0px;width: 65px;height: 35px;"/>
                                 <!-- 使用隐藏域保存页大小。 -->
                            <input type="hidden" name="pageSize" id="pageSize" value="<%=pagina.getPageSize()%>" />
                        </span>
                    </td>
                </tr>
            </tbody>
        </table>
     </div>
</div>
</body>
</html>

<script>
    //


    $(function () {
        <%--页面跳转--%>
        $("#btnJump").bind("click", function () {
            var no = $("#jump").val();
            no = no - 1;
            var pageSize = $("#pageSize").val();
            // 往后发送请求。
            var url = "usersPage.action?pageNo=" + no + "&pageSize=" + pageSize;
            //console.log("url=" + url);
            //alert(url);
            // 使用javascript进行页面跳转。
            window.location.href = url;
        });

        // 给页大小下拉框注册change事件
        $("#sizeSelect").bind("change", function () {
            // 获取设置的页大小
            var pageSize = $(this).val();
            // 获取页码。
            var pageNo = $("#displayPageNo").val();
            // 往后发送请求。
            var url = "usersPage.action?pageNo=" + pageNo + "&pageSize=" + pageSize;
            //console.log("url=" + url);
            //alert(url);
            // 使用javascript进行页面跳转。
            window.location.href = url;
        });

        /*应该是复选框得处理，原有的*/
        $('table th input:checkbox').on('click' , function(){
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox')
                .each(function(){
                    this.checked = that.checked;
                    $(this).closest('tr').toggleClass('selected');
                });

        });

        // 打开模式对话框：添加单个商品信息
        $("#addusers_List").bind("click", function () {
            $("div#myModal").modal();
        });


        // 打开模式对话框：修改单个商品信息
        $("button[id^='Modifyusers_']").bind("click",function () {
            $("div#myModify").modal();
            //获取id，查询此tr下users的原本信息
        });




        //Ajax删除users，局部刷新
        // A[B^=C]匹配A标签且拥有B属性且属性值以C开头
        $("button[id^='deleteOneusers_']").bind("click", function () {
            var id = $(this).attr("id");
            // console.log("id=" + id);
            id = id.replaceAll("deleteOneusers_", "");
            // console.log("id=" + id);
            // 异步发请求。
            $.ajax({
                type: "GET",
                url: "delUsersByIdByAjax?id=" + id,
                dataType: "text",
                success: function (text, status) {
                    //text返回查询到得总库存数
                    //console.log("text=" + text + ", id=" + id);
                    //每删除一件users，重新获取所以users库存数
                    var spans = " 共：<b>"+text+"</b>位用户";
                    //console.log(spans)
                    $("span#usersCounts").html(spans);
                    // 干什么？？？ 页面局部刷新
                    // 根据ID去查找要删除的<tr>：先fadeOut，然后在删除页面的tr.
                    $("tr#users_" + id).fadeOut(1000, function () {
                        $("tr#users_" + id).remove();
                        // 重新编序：找到序号的<td>，然后循环然后重新设置。
                        $("td[id^='index_']").each(function (i) {
                            $(this).html(i+1);
                        });
                    });
                }
            });
        });
    })
</script>