<%@ page import="com.pojo.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pojo.Goods" %>
<%@ page import="java.util.Random" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="error404.jsp" %>
<%
    List<Goods> list=(List<Goods>)application.getAttribute("list");
%>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>index</title>
    <script src="jquery/jquery-1.12.4.min.js"></script>
    <script src="javascript/UserAjax.js"></script>
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


<%--    <!--  Header Start -->--%>
    <%@include file="header.jsp"%>
<%--    <!--  Header Start -->--%>

    <!-- Hero Section Start -->
    <div class="hero-slider hero-slider-one">

        <!-- Single Slide Start -->
        <div class="single-slide" style="background-image: url(assets/images/slider/lunbo1.jpg)">
            <!-- Hero Content One Start -->
            <div class="hero-content-one container">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="slider-content-text text-left">
                            <h5></h5>
                            <h1></h1>
                            <p></p>
                            <p></p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Hero Content One End -->
        </div>
        <!-- Single Slide End -->

        <!-- Single Slide Start -->
        <div class="single-slide" style="background-image: url(assets/images/slider/lunbo2.jpg)">
            <!-- Hero Content One Start -->
            <div class="hero-content-one container">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="slider-content-text text-left">
                            <h5></h5>
                            <h1></h1>
                            <p> </p>
                            <p></p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Hero Content One End -->
        </div>
        <!-- Single Slide End -->

    </div>
    <!-- Hero Section End -->

    <!-- Banner Area Start -->
    <div class="banner-area section-pt">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="single-banner mb-30">
                        <a href="#"><img src="assets/images/banner/show1.jpeg" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6  col-md-6">
                    <div class="single-banner mb-30">
                        <a href="#"><img src="assets/images/banner/show2.png" alt=""></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner Area End -->

    <!-- Product Area Start -->
    <div class="product-area section-pb section-pt-30">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h4>最畅销的产品</h4>
                    </div>
                </div>
            </div>

            <div class="row product-active-lg-4">
                <%
                    for (int i=0;i<5;i++){
                %>
                <div class="col-lg-12">
                    <!-- single-product-area start -->

                    <div class="single-product-area mt-30">
                        <div class="product-thumb">

                                <img class="primary-image" src="<%=list.get(i).getImg_url()%>" alt="">

                            <div class="label-product label_new">New</div>
                            <div class="action-links">
                                <a href="Cart_add.action?goods_id=<%=list.get(i).getGoods_id()%>" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                <a href="Wishlist_add.action?goods_id=<%=list.get(i).getGoods_id()%>" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                <a href="#" class="quick-view" id="detail_<%=list.get(i).getGoods_id()%>" goodsId="<%=list.get(i).getGoods_id()%>" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                            </div>
                            <ul class="watch-color">
                                <li class="twilight"><span></span></li>
                                <li class="pigeon"><span></span></li>
                                <li  class="portage"><span></span></li>
                            </ul>
                        </div>
                        <div class="product-caption">
                            <h4 class="product-name"><%=list.get(i).getGoods_name()%></h4>
                            <div class="price-box">
                                <span class="new-price">$<%=list.get(i).getPrice()%></span>
                                <span class="old-price">$<%=list.get(i).getPrice()%></span>
                            </div>
                        </div>
                    </div>

                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
    <!-- Product Area End -->

    <!-- Banner Area Start -->
    <div class="banner-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="single-banner mb-30">
                        <a href="#"><img src="assets/images/banner/show3.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6  col-md-6">
                    <div class="single-banner mb-30">
                        <a href="#"><img src="assets/images/slider/lunbo2.jpg" alt=""></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner Area End -->


    <!-- Product Area Start -->
    <div class="product-area section-pb section-pt-30">
        <div class="container">

            <div class="row">
                <div class="col-12 text-center">
                    <ul class="nav product-tab-menu" role="tablist">
                        <li class="product-tab-item nav-item active">
                            <a class="product-tab__link nav-link active" id="nav-featured-tab" data-toggle="tab" href="#nav-featured" role="tab" aria-selected="true">特色</a>
                        </li>
                        <li class="product-tab__item nav-item">
                            <a class="product-tab__link nav-link" id="nav-new-tab" data-toggle="tab" href="#nav-new" role="tab" aria-selected="false">新品</a>
                        </li>
                        <li class="product-tab__item nav-item">
                            <a class="product-tab__link nav-link" id="nav-bestseller-tab" data-toggle="tab" href="#nav-bestseller" role="tab" aria-selected="false">畅销</a>
                        </li>
                        <li class="product-tab__item nav-item">
                            <a class="product-tab__link nav-link" id="nav-onsale-tab" data-toggle="tab" href="#nav-onsale" role="tab" aria-selected="false">销售</a>
                        </li>
                    </ul>
                </div>
            </div>




            <div class="tab-content product-tab__content" id="product-tabContent">
                <div class="tab-pane fade show active" id="nav-featured" role="tabpanel">
                    <div class="product-carousel-group">

                        <div class="row product-active-row-4">
                            <%
                                for (int i=0;i<10;i++){
                            %>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                            <img  class="primary-image" src="<%=list.get(i).getImg_url()%>" alt="">
                                        <div class="label-product label_new">New</div>
                                        <div class="action-links">
                                            <a href="Cart_add.action?goods_id=<%=list.get(i).getGoods_id()%>" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="Wishlist_add.action?goods_id=<%=list.get(i).getGoods_id()%>" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" id="detail_<%=list.get(i).getGoods_id()%>" goodsId="<%=list.get(i).getGoods_id()%>" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><%=list.get(i).getGoods_name()%></h4>
                                        <div class="price-box">
                                            <span class="new-price">$<%=list.get(i).getPrice()%></span>
                                            <span class="old-price">$<%=list.get(i).getPrice()%></span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>

                            <%
                                }
                            %>

                        </div>

                    </div>
                </div>


                <div class="tab-pane fade" id="nav-new" role="tabpanel">
                    <div class="product-carousel-group">

                        <div class="row product-active-row-4">
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-10.png" alt="">
                                        </a>
                                        <div class="label-product label_new">New</div>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 001</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$44.00</span>
                                            <span class="old-price">$49.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-14.png" alt="">
                                        </a>
                                        <div class="label-product label_new">New</div>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 005</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$35.00</span>
                                            <span class="old-price">$39.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-15.png" alt="">
                                        </a>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 004</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$42.00</span>
                                            <span class="old-price">$45.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-17.png" alt="">
                                        </a>
                                        <div class="label-product label_new">New</div>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 004</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$35.00</span>
                                            <span class="old-price">$39.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-08.png" alt="">
                                        </a>
                                        <div class="label-product label_new">New</div>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 008</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$75.00</span>
                                            <span class="old-price">$79.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-09.png" alt="">
                                        </a>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 009</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$75.00</span>
                                            <span class="old-price">$79.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-10.png" alt="">
                                        </a>
                                        <div class="label-product label_new">New</div>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 010</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$65.00</span>
                                            <span class="old-price">$69.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-11.png" alt="">
                                        </a>
                                        <div class="label-product label_new">New</div>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 011</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$45.00</span>
                                            <span class="old-price">$69.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-12.png" alt="">
                                        </a>
                                        <div class="label-product label_new">New</div>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 012</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$45.00</span>
                                            <span class="old-price">$69.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-13.png" alt="">
                                        </a>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 013</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$45.00</span>
                                            <span class="old-price">$69.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-14.png" alt="">
                                        </a>
                                        <div class="label-product label_new">New</div>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 013</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$45.00</span>
                                            <span class="old-price">$69.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-15.png" alt="">
                                        </a>
                                        <div class="label-product label_new">New</div>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 015</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$35.00</span>
                                            <span class="old-price">$39.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                        </div>

                    </div>
                </div>
                <div class="tab-pane fade" id="nav-bestseller" role="tabpanel">
                    <div class="product-carousel-group">

                        <div class="row product-active-row-4">
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-11.png" alt="">
                                        </a>
                                        <div class="label-product label_new">New</div>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 001</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$44.00</span>
                                            <span class="old-price">$49.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-12.png" alt="">
                                        </a>
                                        <div class="label-product label_new">New</div>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 005</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$35.00</span>
                                            <span class="old-price">$39.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-13.png" alt="">
                                        </a>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 004</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$42.00</span>
                                            <span class="old-price">$45.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-07.png" alt="">
                                        </a>
                                        <div class="label-product label_new">New</div>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 004</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$35.00</span>
                                            <span class="old-price">$39.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-08.png" alt="">
                                        </a>
                                        <div class="label-product label_new">New</div>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 008</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$75.00</span>
                                            <span class="old-price">$79.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-09.png" alt="">
                                        </a>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 009</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$75.00</span>
                                            <span class="old-price">$79.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-10.png" alt="">
                                        </a>
                                        <div class="label-product label_new">New</div>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 010</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$65.00</span>
                                            <span class="old-price">$69.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-11.png" alt="">
                                        </a>
                                        <div class="label-product label_new">New</div>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 011</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$45.00</span>
                                            <span class="old-price">$69.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-12.png" alt="">
                                        </a>
                                        <div class="label-product label_new">New</div>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 012</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$45.00</span>
                                            <span class="old-price">$69.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-13.png" alt="">
                                        </a>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 013</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$45.00</span>
                                            <span class="old-price">$69.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-14.png" alt="">
                                        </a>
                                        <div class="label-product label_new">New</div>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 013</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$45.00</span>
                                            <span class="old-price">$69.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-15.png" alt="">
                                        </a>
                                        <div class="label-product label_new">New</div>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 015</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$35.00</span>
                                            <span class="old-price">$39.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                        </div>

                    </div>
                </div>
                <div class="tab-pane fade" id="nav-onsale" role="tabpanel">
                    <div class="product-carousel-group">

                        <div class="row product-active-row-4">
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-20.png" alt="">
                                        </a>
                                        <div class="label-product label_new">New</div>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 001</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$44.00</span>
                                            <span class="old-price">$49.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-19.png" alt="">
                                        </a>
                                        <div class="label-product label_new">New</div>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 005</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$35.00</span>
                                            <span class="old-price">$39.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-18.png" alt="">
                                        </a>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 004</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$42.00</span>
                                            <span class="old-price">$45.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-17.png" alt="">
                                        </a>
                                        <div class="label-product label_new">New</div>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 004</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$35.00</span>
                                            <span class="old-price">$39.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-03.png" alt="">
                                        </a>
                                        <div class="label-product label_new">New</div>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 008</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$75.00</span>
                                            <span class="old-price">$79.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-09.png" alt="">
                                        </a>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 009</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$75.00</span>
                                            <span class="old-price">$79.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-10.png" alt="">
                                        </a>
                                        <div class="label-product label_new">New</div>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 010</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$65.00</span>
                                            <span class="old-price">$69.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-11.png" alt="">
                                        </a>
                                        <div class="label-product label_new">New</div>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 011</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$45.00</span>
                                            <span class="old-price">$69.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-12.png" alt="">
                                        </a>
                                        <div class="label-product label_new">New</div>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 012</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$45.00</span>
                                            <span class="old-price">$69.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-13.png" alt="">
                                        </a>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 013</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$45.00</span>
                                            <span class="old-price">$69.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-14.png" alt="">
                                        </a>
                                        <div class="label-product label_new">New</div>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 013</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$45.00</span>
                                            <span class="old-price">$69.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-area start -->
                                <div class="single-product-area mt-30">
                                    <div class="product-thumb">
                                        <a href="product-details.html">
                                            <img class="primary-image" src="assets/images/product/product-15.png" alt="">
                                        </a>
                                        <div class="label-product label_new">New</div>
                                        <div class="action-links">
                                            <a href="cart.html" class="cart-btn" title="Add to Cart"><i class="icon-basket-loaded"></i></a>
                                            <a href="wishlist.html" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                            <a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                        </div>
                                        <ul class="watch-color">
                                            <li class="twilight"><span></span></li>
                                            <li  class="portage"><span></span></li>
                                            <li class="pigeon"><span></span></li>
                                        </ul>
                                    </div>
                                    <div class="product-caption">
                                        <h4 class="product-name"><a href="product-details.html">商品简介 015</a></h4>
                                        <div class="price-box">
                                            <span class="new-price">$35.00</span>
                                            <span class="old-price">$39.00</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- Product Area End -->


    <!-- our-brand-area start -->
    <div class="our-brand-area section-pb">
        <div class="container">
            <div class="row our-brand-active">
                <div class="brand-single-item">
                    <a href="#"><img src="assets/images/brand/brand-01.png" alt=""></a>
                </div>
                <div class="brand-single-item">
                    <a href="#"><img src="assets/images/brand/brand-01.png" alt=""></a>
                </div>
                <div class="brand-single-item">
                    <a href="#"><img src="assets/images/brand/brand-01.png" alt=""></a>
                </div>
                <div class="brand-single-item">
                    <a href="#"><img src="assets/images/brand/brand-01.png" alt=""></a>
                </div>
                <div class="brand-single-item">
                    <a href="#"><img src="assets/images/brand/brand-01.png" alt=""></a>
                </div>
                <div class="brand-single-item">
                    <a href="#"><img src="assets/images/brand/brand-01.png" alt=""></a>
                </div>
                <div class="brand-single-item">
                    <a href="#"><img src="assets/images/brand/brand-01.png" alt=""></a>
                </div>
            </div>
        </div>
    </div>
    <!-- our-brand-area end -->

    <div class="newletter-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="newletter-wrap">
                        <div class="row align-items-center">
                            <div class="col-lg-7 col-md-12">
                                <div class="newsletter-title mb-30">
                                    <h3>现在加入<br><span>我们的通讯</span></h3>
                                </div>
                            </div>

                            <div class="col-lg-5 col-md-7">
                                <div class="newsletter-footer mb-30">
                                    <input type="text" placeholder="你的电子邮件地址……">
                                    <div class="subscribe-button">
                                        <button class="subscribe-btn">订阅</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


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
                                        <img id="largeimg" src="" alt="product-details" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-7 col-md-6 col-sm-6">
                                <div class="product-details-view-content">
                                    <div class="product-info">
                                        <h3 id="detailname"></h3>
                                        <div class="product-rating d-flex">
                                            <ul class="d-flex">
                                                <li><a href="#"><i class="icon-star"></i></a></li>
                                                <li><a href="#"><i class="icon-star"></i></a></li>
                                                <li><a href="#"><i class="icon-star"></i></a></li>
                                                <li><a href="#"><i class="icon-star"></i></a></li>
                                                <li><a href="#"><i class="icon-star"></i></a></li>
                                            </ul>
                                            <%
                                                Random rand=new Random();
                                                int view=rand.nextInt(5000);
                                            %>
                                            <a href="#reviews">(<span class="count"><%=view%></span> 位顾客浏览过)</a>
                                        </div>
                                        <div class="price-box">
                                            <span id="new-price" class="new-price"></span>
                                            <span id="old-price" class="old-price"></span>
                                        </div>
                                        <p id="detaildescription"></p>

                                        <div class="single-add-to-cart">
                                            <form action="" method="post"  id="cartgoodsid" class="cart-quantity d-flex">
                                                <button class="add-to-cart" type="submit">加入购物车</button>
                                            </form>
                                        </div>
                                        <ul class="single-add-actions">
                                            <li class="add-to-wishlist">
                                                <a href="" id="wishgoodsid" class="add_to_wishlist"><i class="icon-heart"></i> 加入愿望清单</a>
                                            </li>
                                        </ul>
                                        <ul class="stock-cont">
                                            <li class="product-stock-status">类别: <a id="category" href="#"></a></li>
                                            <li class="product-stock-status">品牌: <a id="brand" href="#"></a></li>
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