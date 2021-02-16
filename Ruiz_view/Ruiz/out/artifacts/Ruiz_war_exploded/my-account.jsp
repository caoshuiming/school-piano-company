<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Random" %>
<%@ page import="com.pojo.*" %>
<%@ page import="com.service.StateService" %>
<%@ page errorPage="error404.jsp" %>
<%
    String path = request.getContextPath();
    List<com.pojo.Trade> tradelist = (List<Trade>) request.getAttribute("tradelist");
%>

<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>我的账户</title>
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.ico">

    <script src="jquery/jquery-1.12.4.min.js"></script>
    <script src="javascript/UserAjax.js"></script>
    <!-- CSS
	============================================ -->

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/vendor/bootstrap.min.css">
    <!-- Icon Font CSS -->
    <link rel="stylesheet" href="assets/css/vendor/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/vendor/simple-line-icons.css">

    <!-- Plugins CSS -->
    <link rel="stylesheet" href="assets/css/plugins/animation.css">
    <link rel="stylesheet" href="assets/css/plugins/slick.css">
    <link rel="stylesheet" href="assets/css/plugins/animation.css">
    <link rel="stylesheet" href="assets/css/plugins/nice-select.css">
    <link rel="stylesheet" href="assets/css/plugins/fancy-box.css">
    <link rel="stylesheet" href="assets/css/plugins/jqueryui.min.css">

    <!-- Vendor & Plugins CSS (Please remove the comment from below vendor.min.css & plugins.min.css for better website load performance and remove css files from avobe) -->
    <!--
    <script src="assets/js/vendor/vendor.min.js"></script>
    <script src="assets/js/plugins/plugins.min.js"></script>
    -->

    <!-- Main Style CSS (Please use minify version for better website load performance) -->
    <link rel="stylesheet" href="assets/css/style.css">
    <!--<link rel="stylesheet" href="assets/css/style.min.css">-->

</head>

<body>

<div class="main-wrapper">

    <!--  Header Start -->
    <%@include file="header.jsp"%>
    <!--  Header Start -->

    <!-- breadcrumb-area start -->
    <div class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- breadcrumb-list start -->
                    <ul class="breadcrumb-list">
                        <li class="breadcrumb-item"><a href="index.html">主页</a></li>
                        <li class="breadcrumb-item active">我的账户</li>
                    </ul>
                    <!-- breadcrumb-list end -->
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumb-area end -->


    <!-- main-content-wrap start -->
    <div class="main-content-wrap section-ptb my-account-page">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="account-dashboard">
                        <div class="dashboard-upper-info">
                            <div class="row align-items-center no-gutters">
                                <div class="col-lg-3 col-md-12">
                                    <div class="d-single-info">
                                        <p class="user-name">欢迎 <span><%=user.getUser_name()%></span></p>
                                        <p>(not <%=user.getUser_name()%>? <a id="logout" href="#">注销</a>)</p>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-12">
                                    <div class="d-single-info">
                                        <p>需要帮助? 客服电话.</p>
                                        <p>12345678912</p>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-12">
                                    <div class="d-single-info">
                                        <p>邮箱地址 </p>
                                        <p>support@yoursite.com</p>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-md-12">
                                    <div class="d-single-info text-lg-center">
                                        <a href="cart.jsp" class="view-cart"><i class="fa fa-cart-plus"></i>购物车</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-lg-2">
                                <!-- Nav tabs -->
                                <ul role="tablist" class="nav flex-column dashboard-list">
                                    <li><a href="#dashboard" data-toggle="tab" class="nav-link active">设置</a></li>
                                    <li> <a href="#orders" data-toggle="tab" class="nav-link">订单</a></li>
                                    <li><a href="#downloads" data-toggle="tab" class="nav-link">下载</a></li>
                                    <li><a href="#address" data-toggle="tab" class="nav-link">地址</a></li>
                                    <li><a href="#account-details" data-toggle="tab" class="nav-link">账户信息</a></li>
                                    <li><a id="relogout" href="#" class="nav-link">注销</a></li>
                                </ul>
                            </div>
                            <div class="col-md-12 col-lg-10">
                                <!-- Tab panes -->
                                <div class="tab-content dashboard-content">
                                    <div class="tab-pane active" id="dashboard">
                                        <h3>设置 </h3>
                                        <p>从您的设置面板。您可以轻松检查并查看您的<a href="#">最近的订单</a>,管理您的<a href="#">送货和账单地址</a>和<a href="#">编辑您的密码和账户信息。</a></p>
                                    </div>
                                    <div class="tab-pane fade" id="orders">
                                        <h3>订单</h3>
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                <tr>
                                                    <th>订单号</th>
                                                    <th>日期</th>
                                                    <th>状态</th>
                                                    <th>总计</th>
                                                    <th>动作</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <%
                                                    for(Trade trade : tradelist){
                                                %>
                                                <tr class="trItem">
                                                    <td><%=trade.getTrade_id()%></td>
                                                    <td><%=trade.getTrade_time()%></td>
                                                    <td><%=new StateService().getSignByID(trade.getState_id())%></td>
                                                    <td><%=trade.getMoney()%></td>
                                                    <td>
                                                        <a href="#" class="view" data-toggle="modal" data-target="#myModal" id="tradeinfo_<%=trade.getTrade_id()%>">查看</a>
                                                    </td>
                                                </tr>
                                                <%
                                                    }
                                                %>
                                                <tr>
                                                    <td align="center" colspan="5">
                                                        <div id="divPager"></div>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="downloads">
                                        <h3>下载</h3>
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                <tr>
                                                    <th>产品</th>
                                                    <th>下载时间</th>
                                                    <th>过期</th>
                                                    <th>下载</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>Haven - Free Real Estate PSD Template</td>
                                                    <td>May 10, 2018</td>
                                                    <td>never</td>
                                                    <td><a href="#" class="view">点击下载</a></td>
                                                </tr>
                                                <tr>
                                                    <td>Nevara - ecommerce html template</td>
                                                    <td>Sep 11, 2018</td>
                                                    <td>never</td>
                                                    <td><a href="#" class="view">点击下载</a></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="address">
                                        <p>以下是您结账时的默认收货地址。</p>
                                        <h4 class="billing-address">收货地址</h4>
                                        <a href="#" class="view">编辑</a>
                                        <p class="biller-name">Johan Don</p>
                                        <p>Bangladesh</p>
                                    </div>
                                    <div class="tab-pane fade" id="account-details">
                                        <h3>账户信息 </h3>
                                        <div class="login">
                                            <div class="login-form-container">
                                                <div class="account-login-form">
                                                    <form action="updateinfo.action?uid=<%=user.getUser_id()%>" method="post">
                                                        <p>您可以在此处修改您的个人信息！</p>
                                                        <label>称呼</label>
                                                        <div class="input-radio">
                                                            <span class="custom-radio"><input type="radio" value="1" name="id_gender"> 先生</span>
                                                            <span class="custom-radio"><input type="radio" value="2" name="id_gender"> 女士</span>
                                                        </div>
                                                        <div class="account-input-box">
                                                            <%--                                                                <label>姓</label>--%>
                                                            <%--                                                                <input type="text" name="first-name">--%>
                                                            <label>姓名</label>
                                                            <input type="text" id="userchange-name" name="userchange-name">
                                                            <label>Email</label>
                                                            <input type="email" id="email-name" name="email-name">
                                                            <label>密码</label>
                                                            <input type="password" id="userchange-password" name="userchange-password">
                                                            <label>生日</label>
                                                            <input type="date" placeholder="yyyy/MM/dd" value="" name="birthday">
                                                        </div>
                                                        <div class="example">
                                                            (例如：1970/5/31)
                                                        </div>
                                                        <div class="custom-checkbox">
                                                            <input type="checkbox" value="1" name="optin">
                                                            <label>接受合作伙伴的报价</label>
                                                        </div>
                                                        <div class="custom-checkbox">
                                                            <input type="checkbox" value="1" name="newsletter">
                                                            <label>注册我们的时事通讯<br><em>你可以随时退订。为此，请在法律公告中找到我们的联系方式。</em></label>
                                                        </div>
                                                        <div class="button-box">
                                                            <button class="btn default-btn" type="submit">保存</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- main-content-wrap end -->

    <!-- footer Start -->
    <footer>
        <div class="footer-top section-pb section-pt-60">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6">

                        <div class="widget-footer mt-40">
                            <h6 class="title-widget">联系方式</h6>

                            <div class="footer-addres">
                                <div class="widget-content mb--20">
                                    <p>地址: 翻斗花园二号楼一零零一室, <br> 湖南, 中国.</p>
                                    <p>电话: <a href="tel:">(012) 800 000 789</a></p>
                                    <p>传真: <a href="tel:">(012) 800 888 789</a></p>
                                    <p>Email: <a href="tel:">newobject@163.com</a></p>
                                </div>
                            </div>

                            <ul class="social-icons">
                                <li>
                                    <a class="facebook social-icon" href="#" title="Facebook" target="_blank"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li>
                                    <a class="twitter social-icon" href="#" title="Twitter" target="_blank"><i class="fa fa-twitter"></i></a>
                                </li>
                                <li>
                                    <a class="instagram social-icon" href="#" title="Instagram" target="_blank"><i class="fa fa-instagram"></i></a>
                                </li>
                                <li>
                                    <a class="linkedin social-icon" href="#" title="Linkedin" target="_blank"><i class="fa fa-linkedin"></i></a>
                                </li>
                                <li>
                                    <a class="rss social-icon" href="#" title="Rss" target="_blank"><i class="fa fa-rss"></i></a>
                                </li>
                            </ul>

                        </div>

                    </div>
                    <div class="col-lg-2 col-md-6 col-sm-6">
                        <div class="widget-footer mt-40">
                            <h6 class="title-widget">资讯</h6>
                            <ul class="footer-list">
                                <li><a href="index.html">主页</a></li>
                                <li><a href="about-us.jsp">关于我们</a></li>
                                <li><a href="contact-us.html">快速联系</a></li>
                                <li><a href="blog.html">博客</a></li>
                                <li><a href="#">发展史</a></li>
                                <li><a href="#">客户来源</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6 col-sm-6">
                        <div class="widget-footer mt-40">
                            <h6 class="title-widget">其它</h6>
                            <ul class="footer-list">

                                <li><a href="#">发展史</a></li>
                                <li><a href="#">客户来源</a></li>
                                <li><a href="about-us.jsp">关于我们</a></li>
                                <li><a href="contact-us.html">快速联系</a></li>
                                <li><a href="blog.html">博客</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="widget-footer mt-40">
                            <h6 class="title-widget">获取APP</h6>
                            <p>请在谷歌商店下载绿色版APP！</p>
                            <ul class="footer-list">
                                <li><img src="assets/images/brand/img-googleplay.jpg" alt=""></li>
                                <li><img src="assets/images/brand/img-appstore.jpg" alt=""></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer-bottom">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-md-6">
                        <div class="copy-left-text">
                            <p>Copyright &copy; <a href="http://www.bootstrapmb.com/" title="bootstrapmb">Ruiz</a> 2019. 版权所有.</p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="copy-right-image">
                            <img src="assets/images/icon/img-payment.png" alt="">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- footer End -->

    <!-- 模态框（Modal） -->
    <div class="modal fade modal-wrapper" id="myModal" >
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">
                        订单详情
                    </h4>
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">×
                    </button>
                </div>
                <div class="modal-body">
                    <%--表单--%>
                    <form   class="cart-table">
                        <div class="table-content table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th class="plantmore-product-thumbnail">图片</th>
                                    <th class="cart-product-name">产品</th>
                                    <th class="plantmore-product-price">单价</th>
                                    <th class="plantmore-product-quantity">数量</th>
                                    <th class="plantmore-product-subtotal">小计</th>
                                </tr>
                                </thead>
                                <tbody id="mytdoby">
                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- JS
============================================ -->

<!-- Modernizer JS -->
<script src="assets/js/vendor/modernizr-3.6.0.min.js"></script>
<!-- jQuery JS -->
<script src="assets/js/vendor/jquery-3.3.1.min.js"></script>
<!-- Bootstrap JS -->
<script src="assets/js/vendor/popper.min.js"></script>
<script src="assets/js/vendor/bootstrap.min.js"></script>

<!-- Plugins JS -->
<script src="assets/js/plugins/slick.min.js"></script>

<script src="assets/js/plugins/jquery.nice-select.min.js"></script>
<script src="assets/js/plugins/countdown.min.js"></script>
<script src="assets/js/plugins/image-zoom.min.js"></script>
<script src="assets/js/plugins/fancybox.js"></script>
<script src="assets/js/plugins/scrollup.min.js"></script>
<script src="assets/js/plugins/jqueryui.min.js"></script> <script src="assets/js/plugins/ajax-contact.js"></script>

<!-- Vendor & Plugins JS (Please remove the comment from below vendor.min.js & plugins.min.js for better website load performance and remove js files from avobe) -->
<!--
<script src="assets/js/vendor/vendor.min.js"></script>
<script src="assets/js/plugins/plugins.min.js"></script>
-->

<!-- Main JS -->
<script src="assets/js/main.js"></script>

<!-- 插件分页 -->
<script src="<%=path%>/pagination/jquery.pagination1.0.5.js"></script>
<link href="<%=path%>/pagination/pagination.css" rel="stylesheet" />
<script type="text/javascript">
    $(function() {
        $.pagMag.startPagination(
            perPage = 3, // 每页显示几条数据（页大小）
            reload = 0,         // default 0, value 1 keeps actual page when webpage is reloaded (need modul cookies.js)
            item = 'trItem',    // 要分页的数据。
            pager = 'divPager'  // 分页的容器，它会自动产生：1、2、3这种页码。
        );

        // $.pagMag.startPagination(
        //     perPage = 2, // 每页显示几条数据（页大小）
        //     reload = 0,         // default 0, value 1 keeps actual page when webpage is reloaded (need modul cookies.js)
        //     item = 'trs',    // 要分页的数据。
        //     pager = 'trPages'  // 分页的容器，它会自动产生：1、2、3这种页码。
        // );

        $("a[id^=tradeinfo_]").bind("click", function () {
            var _id = $(this).attr("id");
            var id = _id.substring(_id.indexOf("_")+1);
            // console.log(id);
            $.ajax({
                type: "GET",
                url: "tradeItemsList.action?trade_id=" + id,
                dataType: "JSON",
                success: function (json, status) {
                    // console.log(json);
                    var trs = "";
                    // <tr><td class='plantmore-product-thumbnail'><a href='goodslist.action?searchkey=" + json[i].goods_name + "'><img src='" + json[i].img_url + "' alt='' width='200'></a></td><td class='plantmore-product-name'><a href='goodslist.action?searchkey=" + json[i].goods_name + "' >" + json[i].goods_name + "</a></td><td class='plantmore-product-price'>$<span class='amount'>" + json[i].price + "</span></td><td class='plantmore-product-quantity'>" + json[i].num + "</td><td class='product-subtotal'>$" + json[i].count + "</td></tr>
                    for(var i = 0; i < json.length; i++){
                        json[i].goods_name;
                        var tr = "<tr class='trs'><td class='plantmore-product-thumbnail'><a href='goodslist.action?searchkey=" + json[i].goods_name + "'><img src='" + json[i].img_url + "' alt='' width='200'></a></td><td class='plantmore-product-name'><a href='goodslist.action?searchkey=" + json[i].goods_name + "'>" + json[i].goods_name + "</a></td><td class='plantmore-product-price'>$<span class='amount'>" + json[i].price + "</span></td><td class='plantmore-product-quantity'>" + json[i].num + "</td><td class='product-subtotal'>$" + json[i].count + "</td></tr>";
                        trs+=tr;
                    }
                    // <tr><td align="center" colspan="5"><div id="divPager"></div></td></tr>
                    trs+= "<tr><td align='center' colspan='5'><div id='trPages'></div></td></tr>";
                    $("tbody#mytdoby").html(trs);
                }
            });
        });
    });
</script>

</body>

</html>