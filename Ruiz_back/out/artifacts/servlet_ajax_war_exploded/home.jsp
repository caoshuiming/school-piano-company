<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.test.pojo.Pagination" %>
<%@ page import="com.test.pojo.Trade" %>
<%@ page import="java.util.List" %>
<%@ page import="com.test.service.UsersService" %>
<%@ page import="com.test.service.TradeService" %>

<%
    //用户
    UsersService usersService = new UsersService();
    int users_number = usersService.getUsersCounts();
    //订单状态1的数量
    TradeService tradeService = new TradeService();
    int trade_number = tradeService.getStateByZt(1);
    int trade_number1 = tradeService.getStateByZt(2);
    int trade_number2 = tradeService.getStateByZt(3);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="assets/css/ace.min.css" />
    <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
    <link href="assets/css/codemirror.css" rel="stylesheet">
    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
    <![endif]-->
    <script src="assets/js/ace-extra.min.js"></script>
    <!--[if lt IE 9]>
    <script src="assets/js/html5shiv.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    <!--[if !IE]> -->
    <script src="assets/js/jquery.min.js"></script>
    <!-- <![endif]-->
    <script src="assets/dist/echarts.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <title></title>
</head>

<body>

<div class="page-content clearfix" style="width: 75%; margin: 0 auto;">
    <%--<div class="alert alert-block alert-success">
<button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>
<i class="icon-ok green"></i>欢迎使用<strong class="green">后台管理系统<small>(v1.2)</small></strong>,你本次登录时间为2016年7月12日13时34分，登录IP:192.168.1.110.
</div>--%>
    <div class="state-overview clearfix">
        <div class="col-lg-6 col-sm-6">
            <section class="panel">
                <a href="usersPage.action" title="商城用户">
                    <div class="symbol terques">
                        <i class="icon-user"></i>
                    </div>
                    <div class="value">
                        <h1><%=users_number%></h1>
                        <p>商城用户</p>
                    </div>
                </a>
            </section>
        </div>
        <div class="col-lg-6 col-sm-6">
            <section class="panel">
                <a href="tradePage.action" title="已发货">
                    <div class="symbol red">
                        <i class="icon-tags"></i>
                    </div>
                    <div class="value">
                        <h1><%=trade_number1%></h1>
                        <p>已发货</p>
                    </div>
                </a>
            </section>
        </div>
        <div class="col-lg-6 col-sm-6">
            <section class="panel">
                <a href="tradePage.action" title="商城订单">
                    <div class="symbol yellow">
                        <i class="icon-shopping-cart"></i>
                    </div>
                    <div class="value">
                        <h1>
                            <%=trade_number%>
                        </h1>
                        <p>商城订单</p>
                    </div>
                </a>
            </section>
        </div>
        <div class="col-lg-6 col-sm-6">
            <section class="panel">
                <a href="tradePage.action" title="交易完成">
                    <div class="symbol blue">
                        <i class="icon-bar-chart"></i>
                    </div>
                    <div class="value">
                        <h1>
                            <%=trade_number2%>
                        </h1>
                        <p>交易完成</p>
                    </div>
                </a>
            </section>
        </div>
    </div>

    <!--记录-->
    <div class="clearfix">
        <div class="home_btn">
            <div>
                <a href="users_add_batch.jsp" title="批量添加用户" class="btn  btn-info btn-sm no-radius">
                    <i class="bigger-200"><img src="images/icon-addwz.png" /></i>
                    <h5 class="margin-top">批量添加用户</h5>
                </a>
                <a href="goodsPage.action" title="商品信息管理" class="btn  btn-info btn-sm no-radius">
                    <i class="bigger-200"><img src="images/icon-addp.png" /></i>
                    <h5 class="margin-top">商品管理</h5>
                </a>
                <a href="usersPage.action" title="用户信息管理" class="btn  btn-primary btn-sm no-radius">
                    <i class="bigger-200"><img src="images/icon-addwz.png" /></i>
                    <h5 class="margin-top">用户管理</h5>
                </a>
                <a href="users_add.jsp" title="添加用户" class="btn  btn-success btn-sm no-radius">
                    <i class="bigger-200"><img src="images/icon-grxx.png" /></i>
                    <h5 class="margin-top">添加用户</h5>
                </a>
                <a href="manager_detele.action" title="管理员信息管理" class="btn  btn-purple btn-sm no-radius">
                    <i class="bigger-200"><img src="images/icon-grxx.png" /></i>
                    <h5 class="margin-top">管理员信息</h5>
                </a>
                <a href="manager_add.jsp" title="添加管理员" class="btn  btn-pink btn-sm no-radius">
                    <i class="bigger-200"><img src="images/icon-wz.png" /></i>
                    <h5 class="margin-top">添加新管理员</h5>
                </a>
            </div>
        </div>

    </div>

</div>
</body>

</html>
<script type="text/javascript">
    //面包屑返回值
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.iframeAuto(index);
    $('.no-radius').on('click', function() {
        var cname = $(this).attr("title");
        var chref = $(this).attr("href");
        var cnames = parent.$('.Current_page').html();
        var herf = parent.$("#iframe").attr("src");
        parent.$('#parentIframe').html(cname);
        parent.$('#iframe').attr("src", chref).ready();;
        parent.$('#parentIframe').css("display", "inline-block");
        parent.$('.Current_page').attr({
            "name": herf,
            "href": "javascript:void(0)"
        }).css({
            "color": "#4c8fbd",
            "cursor": "pointer"
        });
        parent.layer.close(index);

    });
    $(document).ready(function() {

        $(".t_Record").width($(window).width() - 640);
        //当文档窗口发生改变时 触发
        $(window).resize(function() {
            $(".t_Record").width($(window).width() - 640);
        });
    });
</script>