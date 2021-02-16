<%@ page import="com.pojo.Goods" %>
<%@ page import="java.util.List" %>
<%@ page import="com.service.GoodsService" %>
<%@ page import="com.pojo.User" %>
<%@ page import="com.service.CartService" %>
<%@ page import="com.dao.CartDao" %>
<%@ page import="com.pojo.Cart" %>
<%@ page import="org.apache.commons.lang.enums.Enum" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="error404.jsp" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <%
        User user =(User) session.getAttribute("user");
        int user_id=user.getUser_id();
        //购物车商品数组
        List<Goods> list=new GoodsService().getGoodsByUserID(user_id);
        //愿望单商品数组
        List<Goods> whishlist=new GoodsService().selectWishlistByUser_Id(user_id);
    %>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Ruiz - Watch Store HTML Template</title>
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- JS -->
    <script src="jquery/jquery-1.12.4.min.js"></script>
    <script src="javascript/cart.js" type="text/javascript"></script>
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.ico">

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
    <header class="header">

        <!-- Header Top Start -->
        <div class="header-top-area d-none d-lg-block text-color-white bg-gren border-bm-1">

            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="header-top-settings">
                            <ul class="nav align-items-center">
                                <li class="language">中文<i class="fa fa-angle-down"></i>
                                    <ul class="dropdown-list">
                                        <li><a href="#">中文</a></li>
                                        <li><a href="#">英文</a></li>
                                    </ul>
                                </li>
                                <li class="curreny-wrap">货币 <i class="fa fa-angle-down"></i>
                                    <ul class="dropdown-list curreny-list">
                                        <li><a href="#">RMB</a></li>
                                        <li><a href="#">美元</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="top-info-wrap text-right">
                            <ul class="my-account-container">
                                <li><a href="tradelist.action">我的账户</a></li>
                                <li><a href="cart.jsp">购物车</a></li>
                                <li><a href="wishlist.jsp">愿望清单</a></li>
                                <li><a href="addtrade.action">付款</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- Header Top End -->

        <!-- haeader Mid Start -->
        <div class="haeader-mid-area bg-gren border-bm-1 d-none d-lg-block ">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-3 col-md-4 col-5">
                        <div class="logo-area">
                            <a href="index.jsp"><img src="assets/images/logo/logo.png" alt=""></a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="search-box-wrapper">
                            <div class="search-box-inner-wrap">
                                <form action="goodslist.action"  class="search-box-inner">
                                    <div class="search-field-wrap">
                                        <input type="text"  id="searchkey" name="searchkey" class="search-field" placeholder="Search product...">
                                        <div class="search-btn">
                                            <button type="submit"><i class="icon-magnifier"></i></button>
                                        </div>
                                    </div>
                                </form>
                                <div style="background-color: white;position: absolute;left: 20px;width: 360px;height: 225px;z-index:1;display: none" id="ac"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="right-blok-box text-white d-flex">

                            <%
                                // 登录上了，才显示我的账户。
                                int countWhish=0;
                                int countCart=0;

                                    //心愿清单的迭代
                                    for (Goods  whishgood:whishlist) {
                                        countWhish++;
                                    }
                                    //购物车的迭代
                                    for (Goods  cartgood:list) {
                                        countCart++;
                                    }
                            %>
                            <div class="user-wrap">
                                <a href="wishlist.jsp"><span class="cart-total"><%=countWhish%></span> <i class="icon-heart"></i></a>
                            </div>

                            <div class="shopping-cart-wrap">
                                <a href="cart.jsp"><i class="icon-basket-loaded"></i><span class="cart-total"><%=countCart%></span></a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- haeader Mid End -->

        <!-- haeader bottom Start -->
        <div class="haeader-bottom-area bg-gren header-sticky">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-12 d-none d-lg-block">
                        <div class="main-menu-area white_text">
                            <!--  Start Mainmenu Nav-->
                            <nav class="main-navigation text-center">
                                <ul>
                                    <li class="active"><a href="index.jsp">主页 <i class="fa fa-angle-down"></i></a>
                                    </li>

                                    <li><a href="goodslist.action">商品 <i class="fa fa-angle-down"></i></a>
                                    </li>
                                    <li><a href="#">页面 <i class="fa fa-angle-down"></i></a>
                                        <ul class="sub-menu">
                                            <li><a href="frequently-questions.html">常见问题解答</a></li>
                                            <li><a href="tradelist.action">我的账户</a></li>
                                            <li><a href="login-register.html">登录 &amp; 注册</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="about-us.jsp">关于我们</a></li>
                                    <li><a href="contact-us.html">联系我们</a></li>
                                </ul>
                            </nav>

                        </div>
                    </div>

                    <div class="col-5 col-md-6 d-block d-lg-none">
                        <div class="logo"><a href="index.html"><img src="assets/images/logo/logo.png" alt=""></a></div>
                    </div>


                    <div class="col-lg-3 col-md-6 col-7 d-block d-lg-none">
                        <div class="right-blok-box text-white d-flex">

                            <div class="user-wrap">
                                <a href="wishlist.html"><span class="cart-total">2</span> <i class="icon-heart"></i></a>
                            </div>

                            <div class="shopping-cart-wrap">
                                <a href="#"><i class="icon-basket-loaded"></i><span class="cart-total">2</span></a>
                                <ul class="mini-cart">
                                    <li class="cart-item">
                                        <div class="cart-image">
                                            <a href="product-details.html"><img alt="" src="assets/images/product/product-02.png"></a>
                                        </div>
                                        <div class="cart-title">
                                            <a href="product-details.html">
                                                <h4>物品  01</h4>
                                            </a>
                                            <div class="quanti-price-wrap">
                                                <span class="quantity">1 ×</span>
                                                <div class="price-box"><span class="new-price">￥130.00</span></div>
                                            </div>
                                            <a class="remove_from_cart" href="#"><i class="fa fa-times"></i></a>
                                        </div>
                                    </li>
                                    <li class="cart-item">
                                        <div class="cart-image">
                                            <a href="product-details.html"><img alt="" src="assets/images/product/product-03.png"></a>
                                        </div>
                                        <div class="cart-title">
                                            <a href="product-details.html">
                                                <h4>物品  03</h4>
                                            </a>
                                            <div class="quanti-price-wrap">
                                                <span class="quantity">1 ×</span>
                                                <div class="price-box"><span class="new-price">￥130.00</span></div>
                                            </div>
                                            <a class="remove_from_cart" href="#"><i class="icon-trash icons"></i></a>
                                        </div>
                                    </li>
                                    <li class="subtotal-box">
                                        <div class="subtotal-title">
                                            <h3>总计 :</h3><span>￥ 260.99</span>
                                        </div>
                                    </li>
                                    <li class="mini-cart-btns">
                                        <div class="cart-btns">
                                            <a href="cart.html">购物车</a>
                                            <a href="checkout.html">付款</a>
                                        </div>
                                    </li>
                                </ul>
                            </div>

                            <div class="mobile-menu-btn d-block d-lg-none">
                                <div class="off-canvas-btn">
                                    <a href="#"><img src="assets/images/icon/bg-menu.png" alt=""></a>
                                </div>
                            </div>

                        </div>
                    </div>



                </div>
            </div>
        </div>
        <!-- haeader bottom End -->

        <!-- off-canvas menu start -->
        <aside class="off-canvas-wrapper">
            <div class="off-canvas-overlay"></div>
            <div class="off-canvas-inner-content">
                <div class="btn-close-off-canvas">
                    <i class="fa fa-times"></i>
                </div>

                <div class="off-canvas-inner">

                    <div class="search-box-offcanvas">
                        <form>
                            <input type="text" placeholder="Search product...">
                            <button class="search-btn"><i class="icon-magnifier"></i></button>
                        </form>
                    </div>

                    <!-- mobile menu start -->
                    <div class="mobile-navigation">

                        <!-- mobile menu navigation start -->
                        <nav>
                            <ul class="mobile-menu">
                                <li class="menu-item-has-children"><a href="#">主页</a>
                                    <ul class="dropdown">
                                        <li><a href="index.jsp">主页 1</a></li>
                                        <li><a href="index-2.html">主页 2</a></li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children"><a href="#">商品</a>
                                    <ul class="megamenu dropdown">
                                        <li class="mega-title has-children"><a href="#">商品布局</a>
                                            <ul class="dropdown">
                                                <li><a href="shop.html">商品左侧边栏</a></li>
                                                <li><a href="shop-right-sidebar.html">商品右侧边栏</a></li>
                                                <li><a href="shop-list-left.html">商品列表左侧边栏</a></li>
                                                <li><a href="shop-list-right.html">商品列表右侧边栏</a></li>
                                                <li><a href="shop-fullwidth.html">商品无边栏</a></li>
                                            </ul>
                                        </li>
                                        <li class="mega-title has-children"><a href="#">商品信息</a>
                                            <ul class="dropdown">
                                                <li><a href="product-details.html">Single Product Details</a></li>
                                                <li><a href="variable-product-details.html">Variable Product Details</a></li>
                                                <li><a href="affiliate-product-details.html">affiliatel Product Details</a></li>
                                                <li><a href="gallery-product-details.html">Gallery Product Details</a></li>
                                            </ul>
                                        </li>
                                        <li class="mega-title has-children"><a href="#">购物页面</a>
                                            <ul class="dropdown">
                                                <li><a href="phonecheckout.jsp">404错误页面</a></li>
                                                <li><a href="compare.html">比较页面</a></li>
                                                <li><a href="cart.jsp">购物车</a></li>
                                                <li><a href="checkout.html">付款页</a></li>
                                                <li><a href="wishlist.html">愿望清单</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children "><a href="#">博客</a>
                                    <ul class="dropdown">
                                        <li><a href="blog.html">博客左侧边栏</a></li>
                                        <li><a href="blog-right-sidebar.html">博客右侧边栏</a></li>
                                        <li><a href="blog-grid.html">博客网格边栏</a></li>
                                        <li><a href="blog-largeimage.html">博客图片</a></li>
                                        <li><a href="blog-details.html">博客详情页</a></li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children "><a href="#">页面</a>
                                    <ul class="dropdown">
                                        <li><a href="frequently-questions.html">常见问题解答</a></li>
                                        <li><a href="tradelist.action">我的账户</a></li>
                                        <li><a href="login-register.html">登录 &amp; 注册</a></li>
                                    </ul>
                                </li>
                                <li><a href="about-us.jsp">关于我们</a></li>
                                <li><a href="contact-us.html">联系我们</a></li>
                            </ul>
                        </nav>
                        <!-- mobile menu navigation end -->
                    </div>
                    <!-- mobile menu end -->


                    <div class="header-top-settings offcanvas-curreny-lang-support">
                        <h5>My Account</h5>
                        <ul class="nav align-items-center">
                            <li class="language">中文 <i class="fa fa-angle-down"></i>
                                <ul class="dropdown-list">
                                    <li><a href="#">中文</a></li>
                                    <li><a href="#">英文</a></li>
                                </ul>
                            </li>
                            <li class="curreny-wrap">货币 <i class="fa fa-angle-down"></i>
                                <ul class="dropdown-list curreny-list">
                                    <li><a href="#">RMB</a></li>
                                    <li><a href="#">美元</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>

                    <!-- offcanvas widget area start -->
                    <div class="offcanvas-widget-area">
                        <div class="top-info-wrap text-left text-black">
                            <h5>我的账户</h5>
                            <ul class="offcanvas-account-container">
                                <li><a href="tradelist.action">我的账户</a></li>
                                <li><a href="cart.jsp">购物车</a></li>
                                <li><a href="wishlist.html">愿望清单</a></li>
                                <li><a href="checkout.html">付款</a></li>
                            </ul>
                        </div>

                    </div>
                    <!-- offcanvas widget area end -->
                </div>
            </div>
        </aside>
        <!-- off-canvas menu end -->

    </header>
    <!--  Header Start -->

        <!-- breadcrumb-area start -->
        <div class="breadcrumb-area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <!-- breadcrumb-list start -->
                        <ul class="breadcrumb-list">
                            <li class="breadcrumb-item"><a href="index.jsp">主页</a></li>
                            <li class="breadcrumb-item active">购物车页面</li>
                        </ul>
                        <!-- breadcrumb-list end -->
                    </div>
                </div>
            </div>
        </div>
        <!-- breadcrumb-area end -->

        <!-- main-content-wrap start -->
        <div class="main-content-wrap section-ptb cart-page">
            <div class="container">
                <div class="row">
                    <div class="col-12">

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
                                            <th class="plantmore-product-subtotal">总计</th>
                                            <th class="plantmore-product-remove">删除</th>
                                        </tr>
                                    </thead>
                                    <tbody>


                                    <%
                                        int nums=0;
                                        float totals=0.0f;

                                        for (Goods good:list) {
                                            Cart cart=new CartDao().selectCart(good.getGoods_id(),user_id);
                                            int goods_num=cart.getGoods_num();

                                                    nums=nums+goods_num;
                                                    totals=totals+good.getPrice()*goods_num;

                                    %>
                                        <tr id="goods_<%=good.getGoods_id()%>">
                                            <td class="plantmore-product-thumbnail">
                                                <a href="#"><img src="<%=good.getImg_url()%>" alt=""></a>
                                            </td>
                                            <td class="plantmore-product-name">
                                                <a href="#" ><%=good.getGoods_name()%></a>
                                            </td>
                                            <td class="plantmore-product-price">
                                                $<span class="amount" id="price_<%=good.getGoods_id()%>" ><%=good.getPrice()%></span>
                                            </td>
                                            <td class="plantmore-product-quantity">
                                                <input value="<%=goods_num%>"  id="num_<%=good.getGoods_id()%>" goodsId="<%=good.getGoods_id()%>" type="number"  min="1"  />
                                            </td>
                                            <td class="product-subtotal">
                                                $<span class="amount" id="total_<%=good.getGoods_id()%>"> <%=good.getPrice()*goods_num%> </span>
                                            </td>
                                            <td class="plantmore-product-remove">
                                             <i class="fa fa-times"  id="delSpan_<%=good.getGoods_id()%>"></i>
                                            </td>
                                        </tr>

                                    <%
                                    }
                                    %>
                                    </tbody>
                                </table>
                            </div>
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="coupon-all">

                                        <div class="coupon2">

                                            <a href="cart.jsp" class=" continue-btn">更新购物车</a>
                                            <a href="goodslist.action" class=" continue-btn">继续购物</a>
                                        </div>


                                    </div>
                                </div>
                                <div class="col-md-4 ml-auto">
                                    <div class="cart-page-total">
                                        <h2>购物车总计</h2>
                                        <ul>
                                            <li>数量<span id="nums"><%=nums%></span></li>
                                            <li>总计<span id="totals">$<%=totals%></span></li>
                                        </ul>
                                        <a href="addtrade.action" class="proceed-checkout-btn">商品支付</a>
                                    </div>
                                </div>
                            </div>
                        </form>




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
                                <li><a href="index.jsp">主页</a></li>
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
                            <p>Copyright &copy; <a href="#" >NewObject</a> 2019. 版权所有.</p>
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
<script src="assets/js/plugins/jqueryui.min.js"></script>
<script src="assets/js/plugins/ajax-contact.js"></script>

<!-- Vendor & Plugins JS (Please remove the comment from below vendor.min.js & plugins.min.js for better website load performance and remove js files from avobe) -->
<!--
<script src="assets/js/vendor/vendor.min.js"></script>
<script src="assets/js/plugins/plugins.min.js"></script>
-->

<!-- Main JS -->
<script src="assets/js/main.js"></script>

</body>

</html>