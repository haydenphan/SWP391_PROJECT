<!doctype html>
<html class="no-js" lang="zxx">


<!-- Mirrored from codeskdhaka.com/html/eduman-prv/eduman/login.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 May 2024 15:25:33 GMT -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Eduman - Education & Online Courses HTML Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Place favicon.ico in the root directory -->
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/favicon.png">
    <!-- CSS here -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/preloader.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/meanmenu.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/swiper-bundle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/backToTop.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/huicalendar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontAwesome5Pro.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>


    <!--[if lte IE 9]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
<![endif]-->

    <!-- Add your site or application content here -->

    <!-- pre loader area start -->
    <div id="loading">
        <div id="loading-center">
            <div id="loading-center-absolute">
                <div class="loading-icon text-center d-flex flex-column align-items-center justify-content-center">
                    <img src="${pageContext.request.contextPath}/img/logo/logo-text.png" alt="logo-img">
                    <img class="loading-logo" src="${pageContext.request.contextPath}/img/logo/preloader.svg" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- pre loader area end -->

    <!-- cart mini area start -->
    <div class="cartmini__area">
        <div class="cartmini__wrapper">
            <div class="cartmini__title">
                <h4>Shopping cart</h4>
            </div>
            <div class="cartmini__close">
                <button type="button" class="cartmini__close-btn"><i class="fal fa-times"></i></button>
            </div>
            <div class="cartmini__widget">
                <div class="cartmini__inner">
                    <ul>
                        <li>
                            <div class="cartmini__thumb">
                                <a href="course.jsp">
                                    <img src="${pageContext.request.contextPath}/img/products/product-thumb-01.png" alt="image not found">
                                </a>
                            </div>
                            <div class="cartmini__content">
                                <h5><a href="course.jsp">Turn Yourself</a></h5>
                                <div class="product-quantity mt-10 mb-10">
                                    <span class="cart-minus">-</span>
                                    <input class="cart-input" type="text" value="1">
                                    <span class="cart-plus">+</span>
                                </div>
                                <div class="product__sm-price-wrapper">
                                    <span class="product__sm-price">$24.00</span>
                                </div>
                            </div>
                            <a href="#" class="cartmini__del"><i class="fal fa-times"></i></a>
                        </li>
                        <li>
                            <div class="cartmini__thumb">
                                <a href="course.jsp">
                                    <img src="${pageContext.request.contextPath}/img/products/product-thumb-02.png" alt="image not found">
                                </a>
                            </div>
                            <div class="cartmini__content">
                                <h5><a href="course.jsp">Art of Not Giving</a></h5>
                                <div class="product-quantity mt-10 mb-10">
                                    <span class="cart-minus">-</span>
                                    <input class="cart-input" type="text" value="1">
                                    <span class="cart-plus">+</span>
                                </div>
                                <div class="product__sm-price-wrapper">
                                    <span class="product__sm-price">$12.00</span>
                                </div>
                            </div>
                            <a href="#" class="cartmini__del"><i class="fal fa-times"></i></a>
                        </li>
                        <li>
                            <div class="cartmini__thumb">
                                <a href="course.jsp">
                                    <img src="${pageContext.request.contextPath}/img/products/product-thumb-03.png" alt="image not found">
                                </a>
                            </div>
                            <div class="cartmini__content">
                                <h5><a href="course.jsp">Attract Women</a></h5>
                                <div class="product-quantity mt-10 mb-10">
                                    <span class="cart-minus">-</span>
                                    <input class="cart-input" type="text" value="1">
                                    <span class="cart-plus">+</span>
                                </div>
                                <div class="product__sm-price-wrapper">
                                    <span class="product__sm-price">$42.00</span>
                                </div>
                            </div>
                            <a href="#" class="cartmini__del"><i class="fal fa-times"></i></a>
                        </li>
                    </ul>
                </div>
                <div class="cartmini__checkout">
                    <div class="cartmini__checkout-title mb-30">
                        <h4>Subtotal:</h4>
                        <span>$78.00</span>
                    </div>
                </div>
                <div class="cartmini__viewcart">
                    <a href="cart.jsp" class="edu-sec-btn">View cart</a>
                    <a href="checkout.jsp" class="edu-sec-btn">Checkout</a>
                </div>
            </div>
        </div>
    </div>
    <div class="body-overlay"></div>
    <!-- cart mini area end -->

    <!-- side toggle start -->
    <div class="fix">
        <div class="side-info">
            <div class="side-info-content">
                <div class="offset-widget offset-logo mb-40">
                    <div class="row align-items-center">
                        <div class="col-9">
                            <a href="index.jsp">
                                <img src="${pageContext.request.contextPath}/img/logo/logo-black.png" alt="Logo">
                            </a>
                        </div>
                        <div class="col-3 text-end"><button class="side-info-close"><i
                                    class="fal fa-times"></i></button>
                        </div>
                    </div>
                </div>
                <div class="mobile-menu d-xl-none fix"></div>
                <div class="offset-widget offset_searchbar mb-30">
                    <div class="menu-search position-relative ">
                        <form action="#" class="filter-search-input">
                            <input type="text" placeholder="Search keyword">
                            <button><i class="fal fa-search"></i></button>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="offcanvas-overlay"></div>
    <div class="offcanvas-overlay-white"></div>
    <!-- side toggle end -->

    <!-- header-area-start  -->
    <header>
        <!-- header-top start-->
        <div class="header-top-area d-none d-lg-block">
            <div class="container-fluid">
                <div class="header-top-inner">
                    <div class="row align-items-center">
                        <div class="col-xl-8 col-lg-8">
                            <div class="header-top-icon">
                                <a href="tel:(555)674890556"><i class="fas fa-phone"></i>(555) 674 890 556</a>
                                <a href="mailto:info@example.com"><i class="fal fa-envelope"></i>info@example.com</a>
                                <i class="fal fa-map-marker-alt"></i><span>3rd Avenue, San Francisco</span>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-4">
                            <div class="header-top-login d-flex f-right">
                                <div class="header-user-login p-relative d-none">
                                    <span><a class="user-btn-sign-up" href="#">Login / Register</a></span>
                                </div>
                                <div class="header-social">
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-vimeo-v"></i></a>
                                    <a href="#"><i class="fab fa-linkedin"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- header-top end -->
        <div class="header-area sticky-header">
            <div class="container-fluid">
                <div class="header-main-wrapper">
                    <div class="row align-items-center">
                        <div class="col-xl-7 col-lg-7 col-md-5 col-sm-9 col-9">
                            <div class="header-left d-flex align-items-center">
                                <div class="header-logo">
                                    <a href="index.jsp"><img src="${pageContext.request.contextPath}/img/logo/logo-black.png" alt="logo"></a>
                                </div>
                                <div class="category-menu d-none d-xxl-block">
                                    <div class="Category-click">
                                        <figure class="cattext"><svg class="icons" id="menu_1_" data-name="menu (1)"
                                                xmlns="http://www.w3.org/2000/svg" width="18.087" height="18.087"
                                                viewBox="0 0 18.087 18.087">
                                                <path id="Path_25" data-name="Path 25"
                                                    d="M3.768,0H.754A.754.754,0,0,0,0,.754V3.768a.754.754,0,0,0,.754.754H3.768a.754.754,0,0,0,.754-.754V.754A.754.754,0,0,0,3.768,0Z"
                                                    fill="#141517"></path>
                                                <path id="Path_26" data-name="Path 26"
                                                    d="M3.768,9H.754A.754.754,0,0,0,0,9.754v3.015a.754.754,0,0,0,.754.754H3.768a.754.754,0,0,0,.754-.754V9.754A.754.754,0,0,0,3.768,9Z"
                                                    transform="translate(0 -2.217)" fill="#141517"></path>
                                                <path id="Path_27" data-name="Path 27"
                                                    d="M3.768,18H.754A.754.754,0,0,0,0,18.754v3.015a.754.754,0,0,0,.754.754H3.768a.754.754,0,0,0,.754-.754V18.754A.754.754,0,0,0,3.768,18Z"
                                                    transform="translate(0 -4.434)" fill="#141517"></path>
                                                <path id="Path_28" data-name="Path 28"
                                                    d="M12.768,0H9.754A.754.754,0,0,0,9,.754V3.768a.754.754,0,0,0,.754.754h3.015a.754.754,0,0,0,.754-.754V.754A.754.754,0,0,0,12.768,0Z"
                                                    transform="translate(-2.217)" fill="#141517"></path>
                                                <path id="Path_29" data-name="Path 29"
                                                    d="M12.768,9H9.754A.754.754,0,0,0,9,9.754v3.015a.754.754,0,0,0,.754.754h3.015a.754.754,0,0,0,.754-.754V9.754A.754.754,0,0,0,12.768,9Z"
                                                    transform="translate(-2.217 -2.217)" fill="#141517"></path>
                                                <path id="Path_30" data-name="Path 30"
                                                    d="M12.768,18H9.754A.754.754,0,0,0,9,18.754v3.015a.754.754,0,0,0,.754.754h3.015a.754.754,0,0,0,.754-.754V18.754A.754.754,0,0,0,12.768,18Z"
                                                    transform="translate(-2.217 -4.434)" fill="#141517"></path>
                                                <path id="Path_31" data-name="Path 31"
                                                    d="M21.768,0H18.754A.754.754,0,0,0,18,.754V3.768a.754.754,0,0,0,.754.754h3.015a.754.754,0,0,0,.754-.754V.754A.754.754,0,0,0,21.768,0Z"
                                                    transform="translate(-4.434)" fill="#141517"></path>
                                                <path id="Path_32" data-name="Path 32"
                                                    d="M21.768,9H18.754A.754.754,0,0,0,18,9.754v3.015a.754.754,0,0,0,.754.754h3.015a.754.754,0,0,0,.754-.754V9.754A.754.754,0,0,0,21.768,9Z"
                                                    transform="translate(-4.434 -2.217)" fill="#141517"></path>
                                                <path id="Path_33" data-name="Path 33"
                                                    d="M21.768,18H18.754a.754.754,0,0,0-.754.754v3.015a.754.754,0,0,0,.754.754h3.015a.754.754,0,0,0,.754-.754V18.754A.754.754,0,0,0,21.768,18Z"
                                                    transform="translate(-4.434 -4.434)" fill="#141517"></path>
                                            </svg> <span class="text">Category</span></figure>
                                        <div class="dropdown-category">
                                            <nav>
                                                <ul>
                                                    <li class="item-has-children"><a href="course.jsp">Development</a>
                                                        <ul class="category-submenu">
                                                            <li><a href="course.jsp">All Development</a></li>
                                                            <li><a href="course.jsp">Mobile App</a></li>
                                                            <li><a href="course.jsp">Web Development</a></li>
                                                            <li><a href="course.jsp">Development tools</a></li>
                                                            <li><a href="course.jsp">Database</a></li>
                                                            <li><a href="course.jsp">Programming language</a></li>
                                                        </ul>
                                                    </li>
                                                    <li class="item-has-children"><a href="course.jsp">Art & Design</a>
                                                        <ul class="category-submenu">
                                                            <li><a href="course.jsp">Web Design</a></li>
                                                            <li><a href="course.jsp">Graphic Design</a></li>
                                                            <li><a href="course.jsp">Design tools</a></li>
                                                            <li><a href="course.jsp">All Art</a></li>
                                                            <li><a href="course.jsp">Marketing</a></li>
                                                        </ul>
                                                    </li>
                                                    <li class="item-has-children"><a href="course.jsp">Business</a>
                                                        <ul class="category-submenu">
                                                            <li><a href="course.jsp">All Business</a></li>
                                                            <li><a href="course.jsp">Communications</a></li>
                                                            <li><a href="course.jsp">Finance</a></li>
                                                            <li><a href="course.jsp">Management</a></li>
                                                            <li><a href="course.jsp">Sales</a></li>
                                                        </ul>
                                                    </li>
                                                    <li class="item-has-children"><a href="course.jsp">Life Style</a>
                                                        <ul class="category-submenu">
                                                            <li><a href="course.jsp">Life Style</a></li>
                                                            <li><a href="course.jsp">Mental Health</a></li>
                                                            <li><a href="course.jsp">Dieting</a></li>
                                                            <li><a href="course.jsp">All Art</a></li>
                                                            <li><a href="course.jsp">Nutrition</a></li>
                                                        </ul>
                                                    </li>
                                                    <li class="item-has-children"><a href="course.jsp">Health &
                                                            Fitness</a>
                                                        <ul class="category-submenu">
                                                            <li><a href="course.jsp">All Health & Fitness</a></li>
                                                            <li><a href="course.jsp">Beauty & Makeup</a></li>
                                                            <li><a href="course.jsp">Food & Beverages</a></li>
                                                            <li><a href="course.jsp">Good Food</a></li>
                                                        </ul>
                                                    </li>
                                                    <li><a href="course.jsp">Data Science</a></li>
                                                    <li><a href="course.jsp">Marketing</a></li>
                                                    <li><a href="course.jsp">Photography</a></li>
                                                </ul>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                                <div class="main-menu d-none d-xl-block">
                                    <nav id="mobile-menu">
                                        <ul>
                                            <li class="menu-item-has-children"><a href="index.jsp">Home</a>
                                                <ul class="sub-menu">
                                                    <li><a href="index.jsp">Home 1</a></li>
                                                    <li><a href="index-2.jsp">Home 2</a></li>
                                                    <li><a href="index-3.jsp">Home 3</a></li>
                                                </ul>
                                            </li>
                                            <li class="menu-item-has-children"><a href="course.jsp">Course</a>
                                                <ul class="sub-menu">
                                                    <li><a href="course.jsp">Course 1</a></li>
                                                    <li><a href="course-2.jsp">Course 2</a></li>
                                                    <li><a href="course-3.jsp">Course 3</a></li>
                                                    <li><a href="course-4.jsp">Course 4</a></li>
                                                    <li><a href="course-details.jsp">course details</a></li>
                                                    <li><a href="webinars.jsp">Webinars</a></li>
                                                    <li><a href="webinar-details.jsp">Webinar Details</a></li>
                                                </ul>
                                            </li>
                                            <li class="menu-item-has-children"><a href="shop.jsp">shop</a>
                                                <ul class="sub-menu">
                                                    <li><a href="shop.jsp">shop</a></li>
                                                    <li><a href="shop-details.jsp">shop details</a></li>
                                                    <li><a href="wishlist.jsp">wishlist</a></li>
                                                    <li><a href="cart.jsp">cart</a></li>
                                                    <li><a href="checkout.jsp">checkout</a></li>
                                                </ul>
                                            </li>
                                            <li class="menu-item-has-children"><a href="#!">Pages</a>
                                                <ul class="sub-menu">
                                                    <li><a href="about.jsp">About</a></li>
                                                    <li class="menu-item-has-children"><a
                                                            href="instructor.jsp">instructor</a>
                                                        <ul class="sub-menu">
                                                            <li><a href="instructor.jsp">instructor</a></li>
                                                            <li><a href="instructor-profile.jsp">instructor profile</a>
                                                            </li>
                                                            <li><a href="user-profile.jsp">Student profile</a></li>
                                                            <li><a href="become-instructor.jsp">become instructor</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li class="menu-item-has-children"><a href="zoom-class.jsp">zoom
                                                            class</a>
                                                        <ul class="sub-menu">
                                                            <li><a href="zoom-class.jsp">zoom class</a></li>
                                                            <li><a href="zoom-class-detalis.jsp">zoom class details</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li class="menu-item-has-children"><a href="blog.jsp">blog</a>
                                                        <ul class="sub-menu">
                                                            <li><a href="blog.jsp">blog</a></li>
                                                            <li><a href="blog-details.jsp">blog details</a></li>
                                                        </ul>
                                                    </li>
                                                    <li class="menu-item-has-children"><a href="event.jsp">event</a>
                                                        <ul class="sub-menu">
                                                            <li><a href="event.jsp">event</a></li>
                                                            <li><a href="event-details.jsp">event details</a></li>
                                                        </ul>
                                                    </li>
                                                    <li class="menu-item-has-children"><a href="faq-page.jsp">FAQ
                                                            page</a>
                                                        <ul class="sub-menu">
                                                            <li><a href="faq-page.jsp">FAQ page</a></li>
                                                            <li><a href="faq-details.jsp">FAQ details</a></li>
                                                        </ul>
                                                    </li>
                                                    <li><a href="membership.jsp">membership plan</a></li>
                                                    <li><a href="login.jsp">SignIn</a></li>
                                                    <li><a href="registration.jsp">Sign Up</a></li>
                                                    <li><a href="404-page.jsp">404 page</a></li>
                                                    <li><a href="contact.jsp">contact</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-5 col-lg-5 col-md-7 col-sm-3 col-3">
                            <div class="header-right d-flex align-items-center justify-content-end">
                                <div class="header-search d-none d-xxl-block mr-30">
                                    <form action="#">
                                        <div class="search-icon p-relative">
                                            <input type="text" placeholder="Search courses...">
                                            <button type="submit"><i class="fas fa-search"></i></button>
                                        </div>
                                    </form>
                                </div>
                                <div class="cart-wrapper mr-30">
                                    <a href="javascript:void(0);" class="cart-toggle-btn">
                                        <div class="header__cart-icon p-relative">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="19.988" height="19.988"
                                                viewBox="0 0 19.988 19.988">
                                                <g id="trolley-cart" transform="translate(-1 -1)">
                                                    <path id="Path_36" data-name="Path 36"
                                                        d="M1.666,2.333H3.8L6.159,12.344a1.993,1.993,0,0,0,.171,3.98H17.656a.666.666,0,1,0,0-1.333H6.33a.666.666,0,0,1,0-1.333H17.578a1.992,1.992,0,0,0,1.945-1.541l1.412-6a2,2,0,0,0-1.946-2.456H5.486L4.98,1.514A.666.666,0,0,0,4.331,1H1.666a.666.666,0,0,0,0,1.333ZM18.989,5a.677.677,0,0,1,.649.819l-1.412,6a.662.662,0,0,1-.648.514H7.524L5.8,5Z"
                                                        transform="translate(0 0)" fill="#141517" />
                                                    <path id="Path_37" data-name="Path 37"
                                                        d="M20,27a2,2,0,1,0,2-2A2,2,0,0,0,20,27Zm2.665,0A.666.666,0,1,1,22,26.333.666.666,0,0,1,22.665,27Z"
                                                        transform="translate(-6.341 -8.01)" fill="#141517" />
                                                    <path id="Path_38" data-name="Path 38"
                                                        d="M9,27a2,2,0,1,0,2-2A2,2,0,0,0,9,27Zm2.665,0A.666.666,0,1,1,11,26.333.666.666,0,0,1,11.665,27Z"
                                                        transform="translate(-2.67 -8.01)" fill="#141517" />
                                                </g>
                                            </svg>
                                            <span class="item-number">3</span>
                                        </div>
                                    </a>
                                </div>
                                <div class="user-btn-inner p-relative d-none d-md-block">
                                    <div class="user-btn-wrapper">
                                        <div class="user-btn-content ">
                                            <a class="user-btn-sign-in" href="login.jsp">Sign In</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-none d-md-block">
                                    <a class="user-btn-sign-up edu-btn" href="registration.jsp">Sign Up</a>
                                </div>
                                <div class="menu-bar d-xl-none ml-20">
                                    <a class="side-toggle" href="javascript:void(0)">
                                        <div class="bar-icon">
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- header-area-end -->


    <main>
        <!-- hero-area-start -->
        <div class="hero-arera course-item-height" data-background="${pageContext.request.contextPath}/img/slider/course-slider.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-course-1-text">
                            <h2>Sign in</h2>
                        </div>
                        <div class="course-title-breadcrumb">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                                    <li class="breadcrumb-item"><span>Sign in</span></li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- hero-area-end -->

        <!-- sigin-area sart-->
        <div class="signin-page-area pt-120 pb-120">
            <div class="signin-page-area-wrapper">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-10 col-lg-10">
                            <form action="#">
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="signup-box text-center">
                                            <div class="signup-text">
                                                <h3>Sign in</h3>
                                            </div>
                                            <div class="signup-thumb">
                                                <img src="${pageContext.request.contextPath}/img/sing-up/sign-up.png" alt="image not found">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="signup-form-wrapper">
                                            <div class="signup-wrapper">
                                                <input type="text" placeholder="Email or Username">
                                            </div>
                                            <div class="signup-wrapper">
                                                <input type="text" placeholder="Password">
                                            </div>
                                            <div class="signup-action">
                                                <div class="course-sidebar-list">
                                                    <input class="signup-checkbo" type="checkbox" id="sing-in">
                                                    <label class="sign-check" for="sing-in"><span>Remember
                                                            me</span></label>
                                                </div>
                                            </div>
                                            <div class="sing-buttom mb-20">
                                                <button type="submit" class="sing-btn">Signin now</button>
                                            </div>
                                            <div class="registered wrapper">
                                                <div class="not-register">
                                                    <span>Not registered?</span><span><a href="registration.jsp">Sign
                                                            up</a></span>
                                                </div>
                                                <div class="forget-password">
                                                    <a href="forgot-password.jsp">Forgot password?</a>
                                                </div>
                                            </div>
                                            <div class="sign-social text-center">
                                                <span>Or Sign- in with</span>
                                            </div>
                                            <div class="sign-social-icon">
                                                <div class="sign-facebook">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="9.034"
                                                        height="18.531" viewBox="0 0 9.034 18.531">
                                                        <path id="Path_212" data-name="Path 212"
                                                            d="M183.106,757.2v-1.622c0-.811.116-1.274,1.39-1.274h1.621v-3.127h-2.664c-3.243,0-4.285,1.506-4.285,4.169v1.969h-2.085v3.127h1.969v9.265h4.054v-9.265h2.664l.347-3.243Z"
                                                            transform="translate(-177.083 -751.176)" fill="#2467ec" />
                                                    </svg>
                                                    <a href="#">Facebook</a>
                                                </div>
                                                <div class="sign-gmail">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="21.692"
                                                        height="16.273" viewBox="0 0 21.692 16.273">
                                                        <g id="gmail" transform="translate(0 -63.953)">
                                                            <path id="Path_8685" data-name="Path 8685"
                                                                d="M1.479,169.418H4.93v-8.381l-2.26-3.946L0,157.339v10.6a1.479,1.479,0,0,0,1.479,1.479Z"
                                                                transform="translate(0 -89.192)" fill="#0085f7" />
                                                            <path id="Path_8686" data-name="Path 8686"
                                                                d="M395.636,169.418h3.451a1.479,1.479,0,0,0,1.479-1.479v-10.6l-2.666-.248-2.264,3.946v8.381Z"
                                                                transform="translate(-378.874 -89.192)"
                                                                fill="#00a94b" />
                                                            <path id="Path_8687" data-name="Path 8687"
                                                                d="M349.816,65.436,347.789,69.3l2.027,2.541,4.93-3.7V66.176A2.219,2.219,0,0,0,351.2,64.4Z"
                                                                transform="translate(-333.054)" fill="#ffbc00" />
                                                            <path id="Path_8688" data-name="Path 8688"
                                                                d="M72.7,105.365l-1.932-4.08L72.7,98.956l5.916,4.437,5.916-4.437v6.409L78.619,109.8Z"
                                                                transform="translate(-67.773 -33.52)" fill="#ff4131"
                                                                fill-rule="evenodd" />
                                                            <path id="Path_8689" data-name="Path 8689"
                                                                d="M0,66.176v1.972l4.93,3.7V65.436L3.55,64.4A2.219,2.219,0,0,0,0,66.176Z"
                                                                transform="translate(0)" fill="#e51c19" />
                                                        </g>
                                                    </svg>
                                                    <a href="#">Google</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- sigin-area end-->

    </main>


    <!-- footer-area-start -->
    <footer>
        <div class="footer-area pt-100">
            <div class="container">
                <div class="footer-main mb-60">
                    <div class="row">
                        <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                            <div class="footer-widget f-w1 mb-40">
                                <div class="footer-img">
                                    <a href="index.jsp"> <img src="${pageContext.request.contextPath}/img/logo/footer-logo.png"
                                            alt="footer-logo"></a>
                                    <p>Great lesson ideas and lesson plans for ESL teachers! Educators can customize
                                        lessons as
                                        best plans to knowledge.</p>
                                </div>
                                <div class="footer-icon">
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-instagram"></i></a>
                                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                            <div class="footer-widget f-w2 mb-40">
                                <h3>Online Platform</h3>
                                <ul>
                                    <li><a href="#">Proper Guidelines</a></li>
                                    <li><a href="#">Digital Library</a></li>
                                    <li><a href="#">Compare Us</a></li>
                                    <li><a href="#">Become Instructor</a></li>
                                    <li><a href="#">Build Career</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                            <div class="footer-widget f-w3 mb-40">
                                <h3>Browse Courses</h3>
                                <ul>
                                    <li><a href="#">Development</a></li>
                                    <li><a href="#">Business</a></li>
                                    <li><a href="#">Health & Fitness</a></li>
                                    <li><a href="#">Life Styles</a></li>
                                    <li><a href="#">Photography</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                            <div class="footer-widget f-w4 mb-40">
                                <h3>Insight Community</h3>
                                <ul>
                                    <li><a href="#">Global Partners</a></li>
                                    <li><a href="#">Forum</a></li>
                                    <li><a href="#">Help & Support</a></li>
                                    <li><a href="#">Community</a></li>
                                    <li><a href="#">Documentation</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="copyright-area">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                                <div class="copyright-text border-line">
                                    <p>© Copyrighted & Designed
                                        by <a href="https://themeforest.net/user/bdevs"><span>BDevs</span></a> </p>
                                </div>
                            </div>
                            <div class="col-xl-4 col-lg-4 col-sm-6">
                                <div class="copy-right-support border-line-2">
                                    <div class="copy-right-svg">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="43.945" height="50"
                                            viewBox="0 0 43.945 50">
                                            <g id="headphones" transform="translate(-31)">
                                                <g id="Group_2171" data-name="Group 2171"
                                                    transform="translate(36.859 20.508)">
                                                    <g id="Group_2170" data-name="Group 2170">
                                                        <path id="Path_2983" data-name="Path 2983"
                                                            d="M95.395,210A4.4,4.4,0,0,0,91,214.395v11.914a4.395,4.395,0,1,0,8.789,0V214.395A4.4,4.4,0,0,0,95.395,210Z"
                                                            transform="translate(-91 -210)" fill="#2467ec" />
                                                    </g>
                                                </g>
                                                <g id="Group_2173" data-name="Group 2173"
                                                    transform="translate(31 23.669)">
                                                    <g id="Group_2172" data-name="Group 2172">
                                                        <path id="Path_2984" data-name="Path 2984"
                                                            d="M33.93,243.6a7.268,7.268,0,0,1,.125-1.234A4.386,4.386,0,0,0,31,246.529v6.055a4.386,4.386,0,0,0,3.054,4.163,7.268,7.268,0,0,1-.125-1.234Z"
                                                            transform="translate(-31 -242.366)" fill="#2467ec" />
                                                    </g>
                                                </g>
                                                <g id="Group_2175" data-name="Group 2175"
                                                    transform="translate(48.578 20.508)">
                                                    <g id="Group_2174" data-name="Group 2174">
                                                        <path id="Path_2985" data-name="Path 2985"
                                                            d="M227.113,210a4.4,4.4,0,0,0-4.395,4.395v11.914a4.4,4.4,0,0,0,4.395,4.395,4.335,4.335,0,0,0,1.259-.206,4.386,4.386,0,0,1-4.189,3.136h-4.664a4.395,4.395,0,1,0,0,2.93h4.664a7.333,7.333,0,0,0,7.324-7.324V214.395A4.4,4.4,0,0,0,227.113,210Z"
                                                            transform="translate(-211 -210)" fill="#2467ec" />
                                                    </g>
                                                </g>
                                                <g id="Group_2177" data-name="Group 2177"
                                                    transform="translate(71.891 23.669)">
                                                    <g id="Group_2176" data-name="Group 2176">
                                                        <path id="Path_2986" data-name="Path 2986"
                                                            d="M449.722,242.366a7.266,7.266,0,0,1,.125,1.234v11.914a7.266,7.266,0,0,1-.125,1.234,4.386,4.386,0,0,0,3.055-4.163v-6.055A4.386,4.386,0,0,0,449.722,242.366Z"
                                                            transform="translate(-449.722 -242.366)" fill="#2467ec" />
                                                    </g>
                                                </g>
                                                <g id="Group_2179" data-name="Group 2179" transform="translate(31)">
                                                    <g id="Group_2178" data-name="Group 2178">
                                                        <path id="Path_2987" data-name="Path 2987"
                                                            d="M52.973,0A22,22,0,0,0,31,21.973v.037a7.253,7.253,0,0,1,3-1.361,19.02,19.02,0,0,1,37.952,0,7.256,7.256,0,0,1,3,1.361v-.037A22,22,0,0,0,52.973,0Z"
                                                            transform="translate(-31)" fill="#2467ec" />
                                                    </g>
                                                </g>
                                            </g>
                                        </svg>
                                    </div>
                                    <div class="copyright-svg-content">
                                        <p>Have a question? Call us 24/7</p>
                                        <h5><a href="tel:(987)547587587">(987) 547587587</a></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-5 col-lg-5 col-md-12">
                                <div class="copyright-subcribe">
                                    <form action="#" class="widget__subscribe">
                                        <div class="field">
                                            <input type="email" placeholder="Enter Email">
                                        </div>
                                        <button type="submit">Subscribe<i class="fas fa-paper-plane"></i></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- footer-area-end -->

    <!-- back to top start -->
    <div class="progress-wrap">
        <svg class="progress-circle svg-content" width="100%" height="100%" viewBox="-1 -1 102 102">
            <path d="M50,1 a49,49 0 0,1 0,98 a49,49 0 0,1 0,-98" />
        </svg>
    </div>
    <!-- back to top end -->


    <!-- JS here -->
    <script src="${pageContext.request.contextPath}/js/vendor/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/vendor/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/meanmenu.js"></script>
    <script src="${pageContext.request.contextPath}/js/swiper-bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/huicalendar.js"></script>
    <script src="${pageContext.request.contextPath}/js/parallax.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/backToTop.js"></script>
    <script src="${pageContext.request.contextPath}/js/nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/counterup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/ajax-form.js"></script>
    <script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/isotope.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/imagesloaded.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>


<!-- Mirrored from codeskdhaka.com/html/eduman-prv/eduman/login.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 May 2024 15:25:34 GMT -->
</html>