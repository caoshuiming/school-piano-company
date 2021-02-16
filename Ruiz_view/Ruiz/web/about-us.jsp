<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="error404.jsp" %>
<%@ page import="com.pojo.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pojo.Goods" %>
<!DOCTYPE HTML>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>关于我们</title>
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
                            <li class="breadcrumb-item active">关于我们</li>
                        </ul>
                        <!-- breadcrumb-list end -->
                    </div>
                </div>
            </div>
        </div>
        <!-- breadcrumb-area end -->

        <!-- Page Conttent -->
        <main class="about-us-page section-ptb">
            
            <div class="about-us_area section-pb">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-8">
                            <div class="about-us_img">
                                <video autoplay="autoplay" loop="loop" width="700" muted>
                                    <source src="audio/Comp1_2.mp4" type="video/mp4">
                                </video>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="about-us_content">
                                <h3 class="heading mb-20">关于我们</h3>
                                <p class="short-desc mb-20" id="myfont">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;关山难越，谁悲失路之人？萍水相逢，尽是他乡之客。
                                    怀帝阍而不见，奉宣室以何年？嗟乎！时运不齐，命途多舛。冯唐易老，李广难封。屈贾谊于长沙，非无圣主；
                                    窜梁鸿于海曲，岂乏明时？所赖君子见机，达人知命。老当益壮，宁移白首之心？穷且益坚，不坠青云之志。
                                <div class="munoz-btn-ps_left slide-btn">
                                    <a class="btn" href="goodslist.action">开始购物</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="testimonials-area bg-gray section-ptb">
            
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class=" testimonials-area">
                                <div class="row testimonial-two">
                                    <div class="col-lg-6 ml-auto mr-auto">
                                        <div class="testimonial-wrap-two text-center">
                                            <div class="quote-container">
                                                <div class="quote-image">
                                                    <img src="assets/images/testimonial/mzk.jpg" alt="">
                                                </div>
                                                <div class="author">
                                                    <h6>闵泽凯</h6>
                                                    <p>董事长</p>
                                                </div>
                                                <div class="testimonials-text">
                                                    <p>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;不了解我的人都在背后议论我是多么的富有，幻想我的生活有多么的快乐，
                                                        却不知许多个夜晚，我都在北京二环的四合院里伤怀感慨。生活就是这样，得到一些东西的同时也必然会失去一些东西，就好比我虽然得到了
                                                        金钱，但却失去了烦恼。=￣ω￣=
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 ml-auto mr-auto">
                                        <div class="testimonial-wrap-two text-center">
                                            <div class="quote-container">
                                                <div class="quote-image">
                                                    <img src="assets/images/testimonial/xjb.jpg" alt="">
                                                </div>
                                                <div class="author">
                                                    <h6>谢江波</h6>
                                                    <p>总经理</p>
                                                </div>
                                                <div class="testimonials-text">
                                                    <p>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;十分羡慕我的下属们每天都保持着乐观积极的心态，而我已经在这夜夜笙歌下
                                                        迷失了自己，丧失了斗志。18岁的我就已经有了别人80岁才有的棋艺，你知道我的朋友们在背后是怎么叫我的吗？他们叫我云顶江流儿！唉，人
                                                        生真是寂寞如雪啊！~(￣▽￣)~*
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 ml-auto mr-auto">
                                        <div class="testimonial-wrap-two text-center">
                                            <div class="quote-container">
                                                <div class="quote-image">
                                                    <img src="assets/images/testimonial/zy.jpg" alt="">
                                                </div>
                                                <div class="author">
                                                    <h6>邹公子</h6>
                                                    <p>副总经理</p>
                                                </div>
                                                <div class="testimonials-text">
                                                    <p>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;每天我都在努力的工作，因为我知道，别人如果不努力 ，可能也就是少买一套房、
                                                        一辆车，但是如果我不努力，那我就要回去继承100多家公司和200多栋楼。收房租什么的，光是想想就觉得实在是太可怕了，所以我一定要努力，
                                                        一起加油！(ง •_•)ง
                                                    </p>
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
        </main>
        <!--// Page Conttent -->

        <!-- our-brand-area start -->
        <div class="our-brand-area section-pb-30">
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
                                        <h3>加入我们 <br><span>(即刻投递)Newsletter Now</span></h3>
                                    </div>
                                </div>

                                <div class="col-lg-5 col-md-7">
                                    <div class="newsletter-footer mb-30">
                                        <input type="text" placeholder="Your email address...">
                                        <div class="subscribe-button">
                                            <button class="subscribe-btn">(订阅？)Subscribe</button>
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