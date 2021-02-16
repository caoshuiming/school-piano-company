<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/22
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="error404.jsp" %>
<%@ page import="com.pojo.User" %>
<%@ page import="com.service.GoodsService" %>
<%
    User user=(User)session.getAttribute("user");

%>
<html>
<head>

</head>
<body>
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
                            <%
                                // 登录上了，才显示我的账户。
                                if(user != null) {
                            %>
                            <li><a href="tradelist.action">我的账户</a></li>
                            <%
                            }else{
                            %>
                            <li><a href="login-register.jsp">现在登录</a></li>
                            <%
                                }
                            %>
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
                            if(user != null) {
                                int user_id=user.getUser_id();
                                List<Goods> whishlist=new GoodsService().selectWishlistByUser_Id(user_id);
                                List<Goods> cartlist=GoodsService.getGoodsByUserID(user_id);
                                //心愿清单的迭代
                                for (Goods  whishgood:whishlist) {
                                    countWhish++;
                                }
                                //购物车的迭代
                                for (Goods  cartgood:cartlist) {
                                    countCart++;
                                }
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
                                <li class="active"><a href="index.jsp">主页</a>
                                </li>

                                <li><a href="goodslist.action">商品 </a>
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

</body>
</html>
