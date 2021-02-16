<%@ page import="java.util.List" %>

<%@ page import="java.util.Random" %>
<%@ page import="com.pojo.Pagination" %>
<%@ page import="com.pojo.Goods" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page errorPage="error404.jsp" %>
<%
    String path = request.getContextPath();
    Pagination pagination = (Pagination) request.getAttribute("pagination");
    String category = (String) request.getAttribute("category");
    String brand = (String) request.getAttribute("brand");
    String searchkey = (String) request.getAttribute("searchkey");
    int sort = (int) request.getAttribute("sort");
    int minprice = (int) request.getAttribute("minprice");
    int maxprice = (int) request.getAttribute("maxprice");
    List<Goods> list = (List<Goods>) pagination.getResult();
%>

<!doctype html>
<html class="no-js" lang="en">


<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>商品列表</title>
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
    <script src="jquery/jquery-1.12.4.min.js"></script>
    <script src="javascript/UserAjax.js"></script>
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
                            <li class="breadcrumb-item active">商品左侧边栏</li>
                        </ul>
                        <!-- breadcrumb-list end -->
                    </div>
                </div>
            </div>
        </div>
        <!-- breadcrumb-area end -->


        <!-- main-content-wrap start -->
        <div class="main-content-wrap shop-page section-ptb">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 order-lg-1 order-2">
                        <!-- shop-sidebar-wrap start -->
                        <div class="shop-sidebar-wrap">
                            <div class="shop-box-area">

                                <!--sidebar-categores-box start  -->
                                <div class="sidebar-categores-box shop-sidebar mb-30">
                                    <h4 class="title">商品类别</h4>
                                    <!-- category-sub-menu start -->
                                    <div class="category-sub-menu">
                                        <ul>
                                            <li class="has-sub"><a href="<%=path%>/goodslist.action?category=钢琴&page=0">钢琴</a>
                                                <ul>
                                                    <li><a href="<%=path%>/goodslist.action?brand=雅马哈&category=钢琴&page=0">雅马哈</a></li>
                                                    <li><a href="<%=path%>/goodslist.action?brand=施坦威&category=钢琴&page=0">施坦威</a></li>
                                                    <li><a href="<%=path%>/goodslist.action?brand=卡哇伊&category=钢琴&page=0">卡哇伊</a></li>
                                                    <li><a href="<%=path%>/goodslist.action?brand=罗曼&category=钢琴&page=0">罗曼</a></li>
                                                </ul>
                                            </li>
                                            <li class="has-sub"><a href="<%=path%>/goodslist.action?category=管乐器&page=0">管乐器</a>
                                                <ul>
                                                    <li><a href="<%=path%>/goodslist.action?brand=杰普特&category=管乐器&page=0">杰普特</a></li>
                                                    <li><a href="<%=path%>/goodslist.action?brand=布鲁斯&category=管乐器&page=0">布鲁斯</a></li>
                                                    <li><a href="<%=path%>/goodslist.action?brand=金音&category=管乐器&page=0">金音</a></li>
                                                </ul>
                                            </li>
                                            <li class="has-sub"><a href="<%=path%>/goodslist.action?category=民族乐器&page=0">民族乐器</a>
                                                <ul>
                                                    <li><a href="<%=path%>/goodslist.action?brand=敦煌古筝&category=民族乐器&page=0">敦煌古筝</a></li>
                                                    <li><a href="<%=path%>/goodslist.action?brand=敦煌二胡&category=民族乐器&page=0">敦煌二胡</a></li>
                                                </ul>
                                            </li>
                                            <li class="has-sub"><a href="<%=path%>/goodslist.action?category=打击乐器&page=0">打击乐器</a>
                                                <ul>
                                                    <li><a href="<%=path%>/goodslist.action?brand=雅马哈&category=打击乐器&page=0">雅马哈</a></li>
                                                    <li><a href="<%=path%>/goodslist.action?brand=雅马哈&category=打击乐器&page=0">雅马哈</a></li>
                                                </ul>
                                            </li>
                                            <li class="has-sub"><a href="<%=path%>/goodslist.action?category=吉他&page=0">吉他</a>
                                                <ul>
                                                    <li><a href="<%=path%>/goodslist.action?brand=雅马哈&category=吉他&page=0">雅马哈</a></li>
                                                    <li><a href="<%=path%>/goodslist.action?brand=马丁&category=吉他&page=0">马丁</a></li>
                                                </ul>
                                            </li>
                                            <li class="has-sub"><a href="<%=path%>/goodslist.action?category=弦乐器&page=0">弦乐器</a>
                                                <ul>
                                                    <li><a href="<%=path%>/goodslist.action?brand=铃木&category=弦乐器&page=0">铃木</a></li>
                                                </ul>
                                            </li>
                                            <li class="has-sub"><a href="<%=path%>/goodslist.action?category=手风琴&page=0">手风琴</a>
                                                <ul>
                                                    <li><a href="<%=path%>/goodslist.action?brand=金杯&category=手风琴&page=0">金杯</a></li>
                                                    <li><a href="<%=path%>/goodslist.action?brand=佰笛&category=手风琴&page=0">佰笛</a></li>
                                                </ul>
                                            </li>
                                            <li class="has-sub"><a href="<%=path%>/goodslist.action?category=电子键盘&page=0">电子键盘</a>
                                                <ul>
                                                    <li><a href="<%=path%>/goodslist.action?brand=雅马哈&category=电子键盘&page=0">雅马哈</a></li>
                                                    <li><a href="<%=path%>/goodslist.action?brand=罗兰&category=电子键盘&page=0">罗兰</a></li>
                                                    <li><a href="<%=path%>/goodslist.action?brand=卡西欧&category=电子键盘&page=0">卡西欧</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- category-sub-menu end -->
                                </div>
                                <!--sidebar-categores-box end  -->

                                <!-- shop-sidebar start -->
                                <div class="shop-sidebar mb-30">
                                    <h4 class="title">价格筛选</h4>
                                    <!-- filter-price-content start -->
                                    <div class="filter-price-content">
                                        <form action="#" method="post">
                                            <div id="price-slider" class="price-slider"></div>
                                            <div class="filter-price-wapper">

                                                <div class="add-to-cart-button" id="pricefilter">
                                                    <span>筛选</span>
                                                </div>
                                                <div class="filter-price-cont">

                                                    <span>价格:</span>
                                                    <div class="input-type">
                                                        <input type="text" id="database_minprice" value="<%=minprice%>" hidden>
                                                        <input type="text" id="min-price" readonly="" />
                                                    </div>
                                                    <span>—</span>
                                                    <div class="input-type">
                                                        <input type="text" id="database_maxprice" value="<%=maxprice%>" hidden>
                                                        <input type="text" id="max-price" readonly="" />
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- filter-price-content end -->
                                </div>
                                <!-- shop-sidebar end -->

                                <!-- shop-sidebar start -->
                                <div class="shop-sidebar mb-30">
                                    <h4 class="title">其他筛选</h4>

                                    <ul class="category-widget-list">
                                        <li>
                                            <a href="<%=path%>/goodslist.action?sort=3&brand=<%=brand%>&category=<%=category%>">近期入库</a>
                                        </li>
                                        <li>
                                            <a href="<%=path%>/goodslist.action?sort=4&brand=<%=brand%>&category=<%=category%>">品质保证</a>
                                        </li>
                                    </ul>

                                </div>
                                <!-- shop-sidebar end -->

                                <!-- shop-sidebar start -->
                                <div class="shop-sidebar mb-30">
                                    <h4 class="title">品牌标签</h4>

                                    <ul class="sidebar-tag">
                                        <li><a href="<%=path%>/goodslist.action?brand=雅马哈&page=0">雅马哈</a></li>
                                        <li><a href="<%=path%>/goodslist.action?brand=施坦威&page=0">施坦威</a></li>
                                        <li><a href="<%=path%>/goodslist.action?brand=卡哇伊&page=0">卡哇伊</a></li>
                                        <li><a href="<%=path%>/goodslist.action?brand=罗曼&page=0">&nbsp;罗曼&nbsp;</a></li>
                                        <li><a href="<%=path%>/goodslist.action?brand=布鲁斯&page=0">布鲁斯</a></li>
                                        <li><a href="<%=path%>/goodslist.action?brand=罗兰&page=0">&nbsp;罗兰&nbsp;</a></li>
                                        <li><a href="<%=path%>/goodslist.action?brand=铃木&page=0">&nbsp;铃木&nbsp;</a></li>
                                        <li><a href="<%=path%>/goodslist.action?brand=金杯&page=0">&nbsp;金杯&nbsp;</a></li>
                                        <li><a href="<%=path%>/goodslist.action?brand=卡西欧&page=0">卡西欧</a></li>
                                        <li><a href="<%=path%>/goodslist.action?brand=佰笛&page=0">&nbsp;佰笛&nbsp;</a></li>
                                    </ul>

                                </div>
                                <!-- shop-sidebar end -->

                            </div>
                        </div>
                        <!-- shop-sidebar-wrap end -->
                    </div>
                    <div class="col-lg-9 order-lg-2 order-1">

                        <!-- shop-product-wrapper start -->
                        <div class="shop-product-wrapper">
                            <div class="row align-itmes-center">
                                <div class="col">
                                    <!-- shop-top-bar start -->
                                    <div class="shop-top-bar">
                                        <!-- product-view-mode start -->

                                        <div class="product-mode">
                                            <!--shop-item-filter-list-->
                                            <ul class="nav shop-item-filter-list" role="tablist">
                                                <li class="active"><a class="active grid-view" data-toggle="tab" href="#grid"><i class="fa fa-th"></i></a></li>
                                                <li><a class="list-view" data-toggle="tab" href="#list"><i class="fa fa-th-list"></i></a></li>
                                            </ul>
                                            <!-- shop-item-filter-list end -->
                                        </div>
                                        <!-- product-view-mode end -->
                                        <!-- product-short start -->
                                        <div class="product-short">
                                            <p>排序 :</p>
                                            <input type="text" value="<%=category%>" id="category" hidden>
                                            <input type="text" value="<%=brand%>" id="brand" hidden>
                                            <select class="nice-select" name="sortby">
                                                <option value="0" <%=sort==0 ? "selected" : ""%> id="sort_0">
                                                    默认
                                                </option>
<%--                                                <option value="sales">首字母(A - Z)</option>--%>
<%--                                                <option value="sales">首字母(A - Z)</option>--%>
                                                <option value="1" <%=sort==1 ? "selected" : ""%> id="sort_1">
                                                    价格(低 > 高)
                                                </option>
                                                <option value="2" <%=sort==2 ? "selected" : ""%> id="sort_2">
                                                    价格(高 > 低)
                                                </option>
<%--                                                <option value="3" <%=sort==3 ? "selected" : ""%> id="sort_3">--%>
<%--                                                    价格(高 > 低)--%>
<%--                                                </option>--%>
                                                <option value="4" <%=sort==4 ? "selected" : ""%> id="sort_4">
                                                    销售量(高 > 低)
                                                </option>
<%--                                                <option value="date">评分(最低)</option>--%>
                                            </select>
                                        </div>
                                        <!-- product-short end -->
                                    </div>
                                    <!-- shop-top-bar end -->
                                </div>
                            </div>

                            <!-- shop-products-wrap start -->
                            <div class="shop-products-wrap">
                                <div class="tab-content">
                                    <div class="tab-pane active" id="grid">
                                        <div class="shop-product-wrap">
                                            <div class="row">
                                                <%
                                                    for (Goods goods : list) {
                                                %>
                                                <div class="col-lg-4 col-md-6">
                                                    <!-- single-product-area start -->
                                                    <div class="single-product-area mt-30">
                                                        <div class="product-thumb">
                                                                <img class="primary-image" src="<%=goods.getImg_url()%>" alt="">
                                                            <div class="label-product label_new">New</div>
                                                            <div class="action-links">
                                                                <a href="Cart_add.action?goods_id=<%=goods.getGoods_id()%>" class="cart-btn" title="加入购物车"><i class="icon-basket-loaded"></i></a>
                                                                <a href="Wishlist_add.action?goods_id=<%=goods.getGoods_id()%>" class="wishlist-btn" title="Add to Wish List"><i class="icon-heart"></i></a>
                                                                <a href="#" class="quick-view" id="detail_<%=goods.getGoods_id()%>" goodsId="<%=goods.getGoods_id()%>" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
                                                            </div>
                                                            <ul class="watch-color">
                                                                <li class="twilight"><span></span></li>
                                                                <li  class="portage"><span></span></li>
                                                                <li class="pigeon"><span></span></li>
                                                            </ul>
                                                        </div>
                                                        <div class="product-caption">
                                                            <h4 class="product-name"><%=goods.getGoods_name()%></h4>
                                                            <div class="price-box">
                                                                <span class="new-price">$<%=goods.getPrice()*0.8%></span>
                                                                <span class="old-price">$<%=goods.getPrice()%></span>
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
                                    <div class="tab-pane" id="list">
                                        <%
                                            for (Goods goods : list) {
                                        %>
                                        <div class="shop-product-list-wrap">
                                            <div class="row product-layout-list mt-30">
                                                <div class="col-lg-3 col-md-3">
                                                    <!-- single-product-wrap start -->
                                                    <div class="single-product">
                                                        <div class="product-image">
                                                            <img src="<%=goods.getImg_url()%>" alt="Produce Images">
                                                        </div>
                                                    </div>
                                                    <!-- single-product-wrap end -->
                                                </div>

                                                <div class="col-lg-6 col-md-6">
                                                    <div class="product-content-list text-left">

                                                        <h4><div class="product-name"><%=goods.getGoods_name()%></div></h4>
                                                        <div class="price-box">
                                                            <span class="new-price">$<%=goods.getPrice()%></span>
                                                            <span class="old-price">$<%=goods.getPrice()%></span>
                                                        </div>

                                                        <div class="product-rating">
                                                            <ul class="d-flex">
                                                                <li><a href="#"><i class="icon-star"></i></a></li>
                                                                <li><a href="#"><i class="icon-star"></i></a></li>
                                                                <li><a href="#"><i class="icon-star"></i></a></li>
                                                                <li><a href="#"><i class="icon-star"></i></a></li>
                                                                <li class="bad-reting"><a href="#"><i class="icon-star"></i></a></li>
                                                            </ul>
                                                        </div>

                                                        <p><%=goods.getDescription()%></p>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-md-3">
                                                    <div class="block2">
                                                        <ul class="stock-cont">
                                                            <li class="product-sku">ID: <span><%=goods.getGoods_id()%></span></li>
                                                            <li class="product-stock-status">剩余: <span class="in-stock"><%=goods.getStock()%></span></li>
                                                        </ul>
                                                        <div class="product-button">

                                                            <ul class="actions">
                                                                <li class="add-to-wishlist">
                                                                    <a href="Wishlist_add.action?goods_id=<%=goods.getGoods_id()%>" class="add_to_wishlist"><i class="icon-heart"></i> 加入愿望清单</a>
                                                                </li>
                                                            </ul>
                                                            <div class="add-to-cart">
                                                                <div class="product-button-action">
                                                                    <a href="Cart_add.action?goods_id=<%=goods.getGoods_id()%>" class="add-to-cart">加入购物车</a>
                                                                </div>
                                                            </div>
                                                        </div>
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
                            <!-- shop-products-wrap end -->

                        <%
                            if(pagination.getPages() > 1){
                        %>
                            <!-- paginatoin-area start -->
                            <div class="paginatoin-area">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                        <ul class="pagination-box">
                                            <%
                                                if(pagination.getPageNo() > 0){
                                            %>
                                            <li>
                                                <a class="First" href="<%=path%>/goodslist.action?minprice=<%=minprice%>&maxprice=<%=maxprice%>&sort=<%=sort%>&brand=<%=brand%>&category=<%=category%>&page=0">首页</a>
                                            </li>
                                            <li>
                                                <a class="Pre" href="<%=path%>/goodslist.action?minprice=<%=minprice%>&maxprice=<%=maxprice%>&sort=<%=sort%>&brand=<%=brand%>&category=<%=category%>&page=<%=pagination.getPageNo() - 1%>">上一页</a>
                                            </li>
                                            <%
                                                }
                                            %>
                                            <%
                                                // 页数大于7我才这样分页，否则直接显示吧
                                                if(pagination.getPages() > 7){
                                                    // 前面四页时，页码按钮的值应该不变
                                                    if(pagination.getPageNo() < 4){
                                                        for(int i = 0; i < 7; i++){
                                            %>
                                                        <li <%=pagination.getPageNo() == i? "class='active'" : ""%>>
                                                            <a href="<%=path%>/goodslist.action?minprice=<%=minprice%>&maxprice=<%=maxprice%>&sort=<%=sort%>&brand=<%=brand%>&category=<%=category%>&page=<%=i%>"><%=i + 1%></a>
                                                        </li>
                                            <%
                                                        }
                                                    // 后面四页时，页码按钮的值应该不变
                                                    }else if(pagination.getPageNo() > pagination.getPages() - 4){
                                                            for(int i = 7; i > 0; i--){
                                            %>
                                                        <li <%=pagination.getPageNo() == pagination.getPages() - i + 1? "class='active'" : ""%>>
                                                            <a href="<%=path%>/goodslist.action?minprice=<%=minprice%>&maxprice=<%=maxprice%>&sort=<%=sort%>&brand=<%=brand%>&category=<%=category%>&page=<%=pagination.getPages() - i + 1%>"><%=pagination.getPages() - i + 2%></a>
                                                        </li>
                                            <%
                                                            }
                                                    // 其他时候，页码按钮的值应该动态变化
                                                    } else {
                                                        for(int i = 0; i < 7; i++){
                                            %>
                                                        <li <%=i == 3 ? "class='active'" : ""%>>
                                                            <a href="<%=path%>/goodslist.action?minprice=<%=minprice%>&maxprice=<%=maxprice%>&sort=<%=sort%>&brand=<%=brand%>&category=<%=category%>&page=<%=pagination.getPageNo() + i - 3%>"><%=pagination.getPageNo() + i -2%></a>
                                                        </li>
                                            <%
                                                        }
                                                    }
                                                // 页数大于7我才这样分页，否则直接显示吧
                                                } else {
                                                    for(int i = 0; i <= pagination.getPages(); i++){
                                            %>
                                                    <li <%=pagination.getPageNo() == i? "class='active'" : ""%>>
                                                        <a href="<%=path%>/goodslist.action?minprice=<%=minprice%>&maxprice=<%=maxprice%>&sort=<%=sort%>&brand=<%=brand%>&category=<%=category%>&page=<%=i%>"><%=i + 1%></a>
                                                    </li>
                                            <%
                                                    }
                                                }
                                            %>
                                            <%
                                                if(pagination.getPageNo() < pagination.getPages()){
                                            %>
                                            <li>
                                                <a class="Next" href="<%=path%>/goodslist.action?minprice=<%=minprice%>&maxprice=<%=maxprice%>&sort=<%=sort%>&brand=<%=brand%>&category=<%=category%>&page=<%=pagination.getPageNo() + 1%>">下一页</a>
                                            </li>
                                            <li>
                                                <a class="First" href="<%=path%>/goodslist.action?minprice=<%=minprice%>&maxprice=<%=maxprice%>&sort=<%=sort%>&brand=<%=brand%>&category=<%=category%>&page=<%=pagination.getPages()%>">尾页</a>
                                            </li>
                                            <%
                                                }
                                            %>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- paginatoin-area end -->
                        <%
                            }
                        %>
                        </div>
                        <!-- shop-product-wrapper end -->
                    </div>
                </div>
            </div>
        </div>
        <!-- main-content-wrap end -->

        <%@include file="foot.jsp"%>

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
                                                    <a href="wishlist.html" class="add_to_wishlist"><i class="icon-heart"></i> 加入愿望清单</a>
                                                </li>
                                            </ul>
                                            <ul class="stock-cont">
                                                <li class="product-stock-status">类别: <a id="modal_category" href="#"></a></li>
                                                <li class="product-stock-status">品牌: <a id="modal_brand" href="#"></a></li>
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