<%@ page import="com.pojo.Trade" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int user_id=Integer.parseInt(request.getParameter("id"));
    String trade_id=request.getParameter("trade_id");
%>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>手机结算</title>
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
                                    <li><a href="my-account.html">我的账户</a></li>
                                    <li><a href="cart.html">购物车</a></li>
                                    <li><a href="wishlist.html">愿望清单</a></li>
                                    <li><a href="checkout.html">付款</a></li>
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
                                <a href="index.html"><img src="assets/images/logo/logo.png" alt=""></a>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="search-box-wrapper">
                                <div class="search-box-inner-wrap">
                                    <form class="search-box-inner">
                                        <div class="search-select-box">
                                            <select class="nice-select">
                                                <optgroup label=" Watch">
                                                    <option value="volvo">所有</option>
                                                    <option value="saab">Watch</option>
                                                    <option value="saab">Air cooler</option>
                                                </optgroup>
                                                <optgroup label="Fashion">
                                                    <option value="mercedes">Womens tops</option>
                                                </optgroup>
                                            </select>
                                        </div>
                                        <div class="search-field-wrap">
                                            <input type="text" class="search-field" placeholder="Search product...">

                                            <div class="search-btn">
                                                <button><i class="icon-magnifier"></i></button>
                                            </div>
                                        </div>

                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
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
                                                <a class="remove_from_cart" href="#"><i class="icon_close"></i></a>
                                            </div>
                                        </li>
                                        <li class="cart-item">
                                            <div class="cart-image">
                                                <a href="product-details.html"><img alt="" src="assets/images/product/product-03.png"></a>
                                            </div>
                                            <div class="cart-title">
                                                <a href="product-details.html">
                                                    <h4>物品  02</h4>
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
                                                <h3>合计 :</h3><span>￥ 260.99</span>
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
                                        <li class="active"><a href="index.html">主页 <i class="fa fa-angle-down"></i></a>
                                            <ul class="sub-menu">
                                                <li><a href="index.html">主页 1</a></li>
                                                <li><a href="index-2.html">主页 2</a></li>
                                            </ul>
                                        </li>

                                        <li><a href="#">商品 <i class="fa fa-angle-down"></i></a>
                                            <ul class="mega-menu">
                                                <li><a href="#">商品布局</a>
                                                    <ul>
                                                        <li><a href="shop.html">商品左侧边栏</a></li>
                                                        <li><a href="shop-right-sidebar.html">商品右侧边栏</a></li>
                                                        <li><a href="shop-list-left.html">商品列表左侧边栏</a></li>
                                                        <li><a href="shop-list-right.html">商品列表右侧边栏</a></li>
                                                        <li><a href="shop-fullwidth.html">商品无边栏</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="blog.html">商品信息</a>
                                                    <ul>
                                                        <li><a href="product-details.html">Single Product Details</a></li>
                                                        <li><a href="variable-product-details.html">Variable Product Details</a></li>
                                                        <li><a href="affiliate-product-details.html">affiliatel Product Details</a></li>
                                                        <li><a href="gallery-product-details.html">Gallery Product Details</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#">购物页面</a>
                                                    <ul>
                                                        <li><a href="phonecheckout.jsp">404错误页面</a></li>
                                                        <li><a href="compare.html">比较页面</a></li>
                                                        <li><a href="cart.html">购物车</a></li>
                                                        <li><a href="checkout.html">付款页</a></li>
                                                        <li><a href="wishlist.html">愿望清单</a></li>
                                                    </ul>
                                                </li>
                                            </ul>

                                        </li>
                                        <li><a href="blog.html">博客 <i class="fa fa-angle-down"></i></a>

                                            <ul class="sub-menu">
                                                <li><a href="blog.html">博客左侧边栏</a></li>
                                                <li><a href="blog-right-sidebar.html">博客右侧边栏</a></li>
                                                <li><a href="blog-grid.html">博客网格页</a></li>
                                                <li><a href="blog-largeimage.html">博客图片</a></li>
                                                <li><a href="blog-details.html">博客详情页</a></li>
                                            </ul>
                                        </li>

                                        <li><a href="#">页面 <i class="fa fa-angle-down"></i></a>
                                            <ul class="sub-menu">
                                                <li><a href="frequently-questions.html">常见问题解答</a></li>
                                                <li><a href="my-account.html">我的账户</a></li>
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
                                            <li><a href="index.html">主页 1</a></li>
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
                                                    <li><a href="cart.html">购物车</a></li>
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
                                            <li><a href="my-account.html">我的账户</a></li>
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
                                    <li><a href="my-account.html">我的账户</a></li>
                                    <li><a href="cart.html">购物车</a></li>
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
        <div class="order-button-payment">

            <form action="phonecheck.action?user_id=<%=user_id%>&trade_id=<%=trade_id%>" method="post">
                <input type="submit" value="点此结算" />
            </form>
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
          
           
          
           
        <!-- Modal -->
        <div class="modal fade modal-wrapper" id="exampleModalCenter" >
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <div class="modal-inner-area">
                            <div class="row  product-details-inner">
                                <div class="col-lg-5 col-md-6 col-sm-6">
                                    <!-- Product Details Left -->
                                    <div class="product-large-slider">
                                        <div class="pro-large-img">
                                            <img src="assets/images/product/product-01.png" alt="product-details" />
                                        </div>
                                        <div class="pro-large-img">
                                            <img src="assets/images/product/product-02.png" alt="product-details" />
                                        </div>
                                        <div class="pro-large-img ">
                                            <img src="assets/images/product/product-03.png" alt="product-details" />
                                        </div>
                                        <div class="pro-large-img">
                                            <img src="assets/images/product/product-04.png" alt="product-details" />
                                        </div>
                                        <div class="pro-large-img">
                                            <img src="assets/images/product/product-05.png" alt="product-details" />
                                        </div>

                                    </div>
                                    <div class="product-nav">
                                        <div class="pro-nav-thumb">
                                            <img src="assets/images/product/product-01.png" alt="product-details" />
                                        </div>
                                        <div class="pro-nav-thumb">
                                            <img src="assets/images/product/product-02.png" alt="product-details" />
                                        </div>
                                        <div class="pro-nav-thumb">
                                            <img src="assets/images/product/product-03.png" alt="product-details" />
                                        </div>
                                        <div class="pro-nav-thumb">
                                            <img src="assets/images/product/product-04.png" alt="product-details" />
                                        </div>
                                        <div class="pro-nav-thumb">
                                            <img src="assets/images/product/product-05.png" alt="product-details" />
                                        </div>
                                    </div>
                                    <!--// Product Details Left -->
                                </div>

                                <div class="col-lg-7 col-md-6 col-sm-6">
                                    <div class="product-details-view-content">
                                        <div class="product-info">
                                            <h3>商品简介</h3>
                                            <div class="product-rating d-flex">
                                                <ul class="d-flex">
                                                    <li><a href="#"><i class="icon-star"></i></a></li>
                                                    <li><a href="#"><i class="icon-star"></i></a></li>
                                                    <li><a href="#"><i class="icon-star"></i></a></li>
                                                    <li><a href="#"><i class="icon-star"></i></a></li>
                                                    <li><a href="#"><i class="icon-star"></i></a></li>
                                                </ul>
                                                <a href="#reviews">(<span class="count">1</span> 位顾客浏览过)</a>
                                            </div>
                                            <div class="price-box">
                                                <span class="new-price">$70.00</span>
                                                <span class="old-price">$78.00</span>
                                            </div>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor.</p>

                                            <div class="single-add-to-cart">
                                                <form action="#" class="cart-quantity d-flex">
                                                    <div class="quantity">
                                                        <div class="cart-plus-minus">
                                                            <input type="number" class="input-text" name="quantity" value="1" title="Qty">
                                                        </div>
                                                    </div>
                                                    <button class="add-to-cart" type="submit">加入购物车</button>
                                                </form>
                                            </div>
                                            <ul class="single-add-actions">
                                                <li class="add-to-wishlist">
                                                    <a href="wishlist.html" class="add_to_wishlist"><i class="icon-heart"></i> 加入愿望清单</a>
                                                </li>
                                            </ul>
                                            <ul class="stock-cont">
                                                <li class="product-stock-status">类别: <a href="#">手表,</a> <a href="#">男士手表</a></li>
                                                <li class="product-stock-status">标签: <a href="#">男士</a></li>
                                            </ul>
                                            <div class="share-product-socail-area">
                                                <p>分享此商品</p>
                                                <ul class="single-product-share">
                                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                                </ul>
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