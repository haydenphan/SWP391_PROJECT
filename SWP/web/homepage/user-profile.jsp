<%-- 
    Document   : user-profile
    Created on : May 17, 2024, 7:41:07 AM
    Author     : tuan6
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">


<!-- Mirrored from codeskdhaka.com/html/eduman-prv/eduman/user-profile.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 May 2024 15:25:29 GMT -->
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
    <header>
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
                                                    <li class="item-has-children"><a href="course.jsp">Art &
                                                            Design</a>
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
                                                 <li class="menu-item-has-children"><a href="instructor.jsp">instructor</a>
                                                    <ul class="sub-menu">
                                                       <li><a href="instructor.jsp">instructor</a></li>
                                                       <li><a href="instructor-profile.jsp">instructor profile</a></li>
                                                       <li><a href="user-profile.jsp">Student profile</a></li>
                                                       <li><a href="become-instructor.jsp">become instructor</a></li>
                                                    </ul>
                                                 </li>
                                                 <li class="menu-item-has-children"><a href="zoom-class.jsp">zoom class</a>
                                                    <ul class="sub-menu">
                                                       <li><a href="zoom-class.jsp">zoom class</a></li>
                                                       <li><a href="zoom-class-detalis.jsp">zoom class details</a></li>
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
                                                 <li class="menu-item-has-children"><a href="faq-page.jsp">FAQ page</a>
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
                            <h2>User Profile</h2>
                        </div>
                        <div class="course-title-breadcrumb">
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">David Allberto</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- hero-area-end -->


        <!-- User Profile Start-->
        <div class="course-details-area pt-120 pb-100">
            <div class="container">
                <div class="student-profile-author pb-30">
                    <div class="student-profile-author-img">
                        <img src="${pageContext.request.contextPath}/img/course/course-student.png" alt="img not found" />
                    </div>
                    <div class="student-profile-author-text">
                        <span>Hello,</span>
                        <h3 class='student-profile-author-name'>David Allberto</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-3 col-lg-4">
                        <div class="student-profile-sidebar mb-30">
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link active" id="home-tab" data-bs-toggle="tab"
                                        data-bs-target="#home" type="button" role="tab" aria-controls="home"
                                        aria-selected="true"><i class="fas fa-tachometer-alt-fast"></i>
                                        Dashboard</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="profile-tab" data-bs-toggle="tab"
                                        data-bs-target="#profile" type="button" role="tab" aria-controls="profile"
                                        aria-selected="false"><i class="fas fa-user"></i> My Profile</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="contact-tab" data-bs-toggle="tab"
                                        data-bs-target="#contact" type="button" role="tab" aria-controls="contact"
                                        aria-selected="false"><i class="fas fa-graduation-cap"></i> Enrolled
                                        Courses</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="wishlist-tab" data-bs-toggle="tab"
                                        data-bs-target="#wishlist" type="button" role="tab" aria-controls="wishlist"
                                        aria-selected="false"><i class="fas fa-bookmark"></i> Wishlist</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="reviews-tab" data-bs-toggle="tab"
                                        data-bs-target="#reviews" type="button" role="tab" aria-controls="reviews"
                                        aria-selected="false"><i class="fas fa-star"></i> Reviews</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="quiz-tab" data-bs-toggle="tab" data-bs-target="#quiz"
                                        type="button" role="tab" aria-controls="quiz" aria-selected="false"><i
                                            class="fas fa-cubes"></i> My Quiz Attempts</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="history-tab" data-bs-toggle="tab"
                                        data-bs-target="#history" type="button" role="tab" aria-controls="history"
                                        aria-selected="false"><i class="fas fa-cart-plus"></i> Order
                                        History</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="ques-tab" data-bs-toggle="tab" data-bs-target="#ques"
                                        type="button" role="tab" aria-controls="ques" aria-selected="false"><i
                                            class="fas fa-fist-raised"></i> Question &
                                        Answer</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="setting-tab" data-bs-toggle="tab"
                                        data-bs-target="#setting" type="button" role="tab" aria-controls="setting"
                                        aria-selected="false"><i class="fas fa-cog"></i> Settings</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="logout-tab" data-bs-toggle="tab"
                                        data-bs-target="#logout" type="button" role="tab" aria-controls="logout"
                                        aria-selected="false" onclick="window.location.href='login.jsp';"><i class="fas fa-sign-out-alt"></i> Logout</button>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-8">
                        <div class="student-profile-content">
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="home" role="tabpanel"
                                    aria-labelledby="home-tab">
                                    <h4 class='mb-25'>Dashboard</h4>
                                    <div class="student-profile-content-fact">
                                        <div class="row">
                                            <div class="col-xl-4 col-lg-6 col-md-4">
                                                <div class="counter-wrapper text-center mb-30">
                                                    <div class="counter-icon">
                                                        <div class="counter-icon-wrap">
                                                            <svg id="layer2" xmlns="http://www.w3.org/2000/svg"
                                                                width="50.897" height="56.553"
                                                                viewBox="0 0 50.897 56.553">
                                                                <path id="path3518"
                                                                    d="M26.3.646,1.793,13.689a.834.834,0,0,0,.048,1.522L16.07,21.734h21.4L51.7,15.211a.834.834,0,0,0,.05-1.522L27.244.647a.9.9,0,0,0-.473-.117A1.023,1.023,0,0,0,26.3.646Z"
                                                                    transform="translate(-1.323 -0.529)"
                                                                    fill="#5299d3" />
                                                                <path id="path3534"
                                                                    d="M16.66,2.911a35.363,35.363,0,0,0-7.55.718,9.782,9.782,0,0,0-2.456.841,3.065,3.065,0,0,0-.858.648,1.7,1.7,0,0,0-.451,1.106v7.4l-.077.893a17.977,17.977,0,0,1,22.781,0l-.077-.891v-7.4a1.7,1.7,0,0,0-.451-1.106,3.056,3.056,0,0,0-.856-.648,9.78,9.78,0,0,0-2.456-.841,35.363,35.363,0,0,0-7.55-.718Z"
                                                                    transform="translate(8.788 5.574)" fill="#a0c7e7" />
                                                                <path id="path3604"
                                                                    d="M9.111,3.629a9.782,9.782,0,0,0-2.456.841,3.065,3.065,0,0,0-.858.648,1.7,1.7,0,0,0-.451,1.106v7.4l-.077.893a17.891,17.891,0,0,1,1.962-1.388V6.225a1.7,1.7,0,0,1,.451-1.106A3.066,3.066,0,0,1,8.54,4.47,9.782,9.782,0,0,1,11,3.629a34,34,0,0,1,6.607-.7c-.316-.006-.62-.02-.943-.02a35.363,35.363,0,0,0-7.55.718Z"
                                                                    transform="translate(8.788 5.574)" fill="#74addc" />
                                                                <path id="rect3599"
                                                                    d="M18.372,4.5h1.885A14.107,14.107,0,0,1,34.395,18.636V33.67H4.233V18.636A14.107,14.107,0,0,1,18.372,4.5Z"
                                                                    transform="translate(6.135 9.64)" fill="#356287" />
                                                                <path id="path3610"
                                                                    d="M18.372,4.5A14.107,14.107,0,0,0,4.233,18.636V33.669H6.118V18.636A14.107,14.107,0,0,1,20.257,4.5Z"
                                                                    transform="translate(6.135 9.64)" fill="#2c5170" />
                                                                <path id="path3506"
                                                                    d="M15.317,11.649a14.343,14.343,0,0,0-13.2,14.545v1.451a.943.943,0,0,0,.939.946H46.418a.943.943,0,0,0,.939-.946V26.193a14.341,14.341,0,0,0-13.2-14.545H15.317Z"
                                                                    transform="translate(0.711 27.962)"
                                                                    fill="#5299d3" />
                                                                <path id="path3508"
                                                                    d="M7.827,9.922a.943.943,0,0,0-.948.939v8.909a.943.943,0,0,0,.948.939h9.42a.943.943,0,0,0,.946-.939V10.861a.943.943,0,0,0-.946-.939Z"
                                                                    transform="translate(12.912 23.538)" fill="#fca" />
                                                                <path id="path3510"
                                                                    d="M7.827,9.922a.943.943,0,0,0-.948.939v2.723a9.605,9.605,0,0,0,11.314,0V10.861a.943.943,0,0,0-.946-.939Z"
                                                                    transform="translate(12.913 23.538)"
                                                                    fill="#ffb889" />
                                                                <path id="path3512"
                                                                    d="M15.318,11.648a14.345,14.345,0,0,0-13.2,14.546v1.451a.943.943,0,0,0,.939.946H4.941A.943.943,0,0,1,4,27.645V26.194A14.345,14.345,0,0,1,17.2,11.648H15.318Z"
                                                                    transform="translate(0.711 27.961)"
                                                                    fill="#3385c8" />
                                                                <path id="path3514"
                                                                    d="M8.661,11.126,5.83,13.95a.943.943,0,0,0,0,1.329l6.6,6.6a.943.943,0,0,0,1.329,0l2.163-2.158,2.165,2.158a.943.943,0,0,0,1.329,0l6.6-6.6a.943.943,0,0,0,0-1.329L23.19,11.126a.942.942,0,0,0-1.337,0l-5.928,5.928L9.99,11.126a.933.933,0,0,0-1.329,0Z"
                                                                    transform="translate(9.523 25.911)"
                                                                    fill="#a0c7e7" />
                                                                <path id="path3520"
                                                                    d="M8.387,7.087a3.625,3.625,0,0,0-3.514,3.7A3.63,3.63,0,0,0,8.387,14.5a3.252,3.252,0,0,0,.808-.114c0-.007,0-.013,0-.02V7.189a3.341,3.341,0,0,0-.8-.1Z"
                                                                    transform="translate(7.773 16.275)"
                                                                    fill="#ffb889" />
                                                                <path id="path3522"
                                                                    d="M15.171,10.79A3.63,3.63,0,0,1,11.656,14.5a3.252,3.252,0,0,1-.808-.114c0-.007,0-.013,0-.02V7.189a3.341,3.341,0,0,1,.8-.1,3.625,3.625,0,0,1,3.514,3.7Z"
                                                                    transform="translate(23.084 16.275)" fill="#fca" />
                                                                <path id="path3528"
                                                                    d="M13.067,5.316a.943.943,0,0,0-.954.933A3.829,3.829,0,0,1,8.28,10.055H6.7a.943.943,0,0,0-.939.939v4.732a9.637,9.637,0,0,0,19.273,0V10.994a.943.943,0,0,0-.939-.939h-5.54a4.624,4.624,0,0,1-4.571-3.938.943.943,0,0,0-.919-.8Z"
                                                                    transform="translate(10.051 11.736)" fill="#fca" />
                                                                <path id="path3530" d="M4.8,3.167l-1.887,1v13.16H4.8Z"
                                                                    transform="translate(2.743 6.23)" fill="#eee" />
                                                                <path id="path3532"
                                                                    d="M3.592,6.614a.943.943,0,0,0-.946.939v8.511a.943.943,0,0,0,.946.946H5.473a.943.943,0,0,0,.939-.946V7.553a.943.943,0,0,0-.939-.939Z"
                                                                    transform="translate(2.067 15.063)"
                                                                    fill="#ffca28" />
                                                                <path id="path3537"
                                                                    d="M3.592,6.614a.943.943,0,0,0-.946.939v8.512a.943.943,0,0,0,.946.946H5.473a.943.943,0,0,1-.943-.946V7.553a.943.943,0,0,1,.943-.939Z"
                                                                    transform="translate(2.067 15.063)"
                                                                    fill="#ecb200" />
                                                                <path id="path3542"
                                                                    d="M6.7,6.646a.943.943,0,0,0-.939.939v4.731a9.613,9.613,0,0,0,6.526,9.1,10.337,10.337,0,0,1-5.374-9.068V7.255a1.014,1.014,0,0,1,.206-.609Z"
                                                                    transform="translate(10.051 15.145)"
                                                                    fill="#ffb889" />
                                                                <g id="Group_2872" data-name="Group 2872"
                                                                    transform="translate(11.311 50.9)">
                                                                    <path id="path3544"
                                                                        d="M5.483,14.818A.943.943,0,0,0,4.5,15.84v4.62H6.379V15.84A.943.943,0,0,0,5.483,14.818Z"
                                                                        transform="translate(-4.498 -14.817)"
                                                                        fill="#3385c8" />
                                                                    <path id="path3547"
                                                                        d="M12.891,14.818a.943.943,0,0,0-.981,1.022v4.62h1.878V15.84a.943.943,0,0,0-.9-1.022Z"
                                                                        transform="translate(14.485 -14.817)"
                                                                        fill="#3385c8" />
                                                                </g>
                                                            </svg>
                                                        </div>
                                                        <div class="count-number">
                                                            <span class="counter">5</span>
                                                            <p>Online Courses</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-4 col-lg-6 col-md-4">
                                                <div class="counter-wrapper text-center mb-30">
                                                    <div class="counter-icon">
                                                        <div class="counter-icon-wrap">
                                                            <svg id="online-course" xmlns="http://www.w3.org/2000/svg"
                                                                width="51.549" height="56.553"
                                                                viewBox="0 0 51.549 56.553">
                                                                <path id="Path_7050" data-name="Path 7050"
                                                                    d="M220.4,404.2h8.315v8.63H220.4Z"
                                                                    transform="translate(-198.783 -358.613)"
                                                                    fill="#726b93" />
                                                                <path id="Path_7051" data-name="Path 7051"
                                                                    d="M102.177,357.3v1.612a1.535,1.535,0,0,1-1.53,1.53H56.83a1.535,1.535,0,0,1-1.53-1.53V357.3Z"
                                                                    transform="translate(-52.964 -317.19)"
                                                                    fill="#988fc4" />
                                                                <path id="Path_7052" data-name="Path 7052"
                                                                    d="M102.177,77.142v29.021H55.3V77.142a1.535,1.535,0,0,1,1.53-1.53h7.042l-.993.5a1.831,1.831,0,0,0-1.016,1.635,1.81,1.81,0,0,0,1.016,1.635l3.959,1.974v7.661a2.825,2.825,0,0,0,2.242,2.756,47.052,47.052,0,0,0,19.34,0,2.825,2.825,0,0,0,2.242-2.756V81.357l1.144-.572v7.521a1.168,1.168,0,0,0,2.336,0V79.617l.479-.245a1.831,1.831,0,0,0,1.016-1.635A1.81,1.81,0,0,0,94.621,76.1l-.993-.5h7.042A1.548,1.548,0,0,1,102.177,77.142Zm-6.563,25.132a1.171,1.171,0,0,0-1.168-1.168H70.634a1.168,1.168,0,1,0,0,2.336H94.446A1.164,1.164,0,0,0,95.614,102.274ZM83.468,96.656A1.171,1.171,0,0,0,82.3,95.488H70.622a1.168,1.168,0,0,0,0,2.336H82.3A1.157,1.157,0,0,0,83.468,96.656Zm-16.934,0a1.171,1.171,0,0,0-1.168-1.168H63.031a1.168,1.168,0,1,0,0,2.336h2.336A1.157,1.157,0,0,0,66.535,96.656Zm0,5.617a1.171,1.171,0,0,0-1.168-1.168H63.031a1.168,1.168,0,1,0,0,2.336h2.336A1.157,1.157,0,0,0,66.535,102.274Z"
                                                                    transform="translate(-52.964 -68.389)"
                                                                    fill="#e3fbff" />
                                                                <path id="Path_7053" data-name="Path 7053"
                                                                    d="M193.229,134.9v6.493a.491.491,0,0,1-.374.479,44.718,44.718,0,0,1-18.382,0,.479.479,0,0,1-.374-.479V134.9l8.747,4.379a1.882,1.882,0,0,0,1.635,0Z"
                                                                    transform="translate(-157.89 -120.763)"
                                                                    fill="#726b93" />
                                                                <path id="Path_7054" data-name="Path 7054"
                                                                    d="M164.718,41.349l-13.909,6.96L136.9,41.349,150.809,34.4Z"
                                                                    transform="translate(-125.035 -32)"
                                                                    fill="#988fc4" />
                                                                <path id="Path_7055" data-name="Path 7055"
                                                                    d="M86.849,22.6V55.571a3.87,3.87,0,0,1-3.866,3.866H67.568v8.63h4.158a1.168,1.168,0,1,1,0,2.336h-21.3a1.168,1.168,0,1,1,0-2.336h4.158v-8.63H39.166A3.87,3.87,0,0,1,35.3,55.571V22.6a3.87,3.87,0,0,1,3.866-3.866H50.879l9.378-4.695a1.83,1.83,0,0,1,1.635,0l9.378,4.683H82.983A3.88,3.88,0,0,1,86.849,22.6ZM84.513,55.571V53.96H37.636v1.612a1.535,1.535,0,0,0,1.53,1.53H82.983A1.528,1.528,0,0,0,84.513,55.571Zm0-3.947V22.6a1.535,1.535,0,0,0-1.53-1.53H75.941l.993.5A1.831,1.831,0,0,1,77.95,23.21a1.81,1.81,0,0,1-1.016,1.635l-.479.245v8.689a1.168,1.168,0,0,1-2.336,0V26.247l-1.144.572V34.48a2.813,2.813,0,0,1-2.242,2.756,47.533,47.533,0,0,1-9.67,1,47.533,47.533,0,0,1-9.67-1,2.825,2.825,0,0,1-2.242-2.756V26.819l-3.959-1.974a1.831,1.831,0,0,1-1.016-1.635,1.81,1.81,0,0,1,1.016-1.635l.993-.5H39.166a1.535,1.535,0,0,0-1.53,1.53V51.624ZM61.074,30.159,74.983,23.21,61.074,16.25,47.165,23.2Zm9.565,4.309V27.975l-8.747,4.379a1.882,1.882,0,0,1-1.635,0L51.51,27.975v6.493a.491.491,0,0,0,.374.479,44.718,44.718,0,0,0,18.382,0A.479.479,0,0,0,70.639,34.468Zm-5.407,33.6v-8.63H56.917v8.63Z"
                                                                    transform="translate(-35.3 -13.85)" />
                                                                <path id="Path_7056" data-name="Path 7056"
                                                                    d="M201.58,294a1.168,1.168,0,0,1,0,2.336H177.768a1.168,1.168,0,0,1,0-2.336Z"
                                                                    transform="translate(-160.098 -261.283)" />
                                                                <path id="Path_7057" data-name="Path 7057"
                                                                    d="M189.346,245.9a1.168,1.168,0,1,1,0,2.336H177.668a1.168,1.168,0,0,1,0-2.336Z"
                                                                    transform="translate(-160.01 -218.8)" />
                                                                <path id="Path_7058" data-name="Path 7058"
                                                                    d="M115,245.9a1.168,1.168,0,0,1,0,2.336h-2.336a1.168,1.168,0,0,1,0-2.336Z"
                                                                    transform="translate(-102.601 -218.8)" />
                                                                <path id="Path_7059" data-name="Path 7059"
                                                                    d="M115,294a1.168,1.168,0,0,1,0,2.336h-2.336a1.168,1.168,0,0,1,0-2.336Z"
                                                                    transform="translate(-102.601 -261.283)" />
                                                            </svg>
                                                        </div>
                                                        <div class="count-number">
                                                            <span class="counter">2</span>
                                                            <p>Active Courses</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-4 col-lg-6 col-md-4">
                                                <div class="counter-wrapper text-center mb-30">
                                                    <div class="counter-icon">
                                                        <div class="counter-icon-wrap">
                                                            <svg id="teacher_1_" data-name="teacher (1)"
                                                                xmlns="http://www.w3.org/2000/svg" width="55.594"
                                                                height="56.553" viewBox="0 0 55.594 56.553">
                                                                <path id="Path_7060" data-name="Path 7060"
                                                                    d="M174.816,53.749l-.316,2.846-.213,1.917H147.448l-.213-1.917-.316-2.846a14.748,14.748,0,0,1,1.1-7.437,14.762,14.762,0,0,0,1.174-6.545l-.167-3.316a11.854,11.854,0,1,1,23.678,0l-.167,3.316a14.762,14.762,0,0,0,1.174,6.545A14.741,14.741,0,0,1,174.816,53.749Z"
                                                                    transform="translate(-132.111 -24.004)"
                                                                    fill="#8f4d2e" />
                                                                <path id="Path_7061" data-name="Path 7061"
                                                                    d="M256.173,53.743l-.316,2.846H245.1V46.045l1.917-3.834V34.543a10.554,10.554,0,0,0-7.757-10.171,11.867,11.867,0,0,1,14.8,12.073l-.167,3.316a14.762,14.762,0,0,0,1.174,6.545,14.741,14.741,0,0,1,1.1,7.437Z"
                                                                    transform="translate(-213.469 -23.999)"
                                                                    fill="#82462a" />
                                                                <path id="Path_7062" data-name="Path 7062"
                                                                    d="M219.886,223.668a1.341,1.341,0,0,1-1.342-1.342V216h-7.668v6.326a1.341,1.341,0,0,1-1.342,1.342H208v5.751h13.419v-5.751Z"
                                                                    transform="translate(-185.954 -192.995)"
                                                                    fill="#fec9a3" />
                                                                <path id="Path_7063" data-name="Path 7063"
                                                                    d="M236.412,220.793a5.259,5.259,0,0,0,3.256-1.175V216H232v3.617a5.259,5.259,0,0,0,3.256,1.175Z"
                                                                    transform="translate(-207.078 -192.995)"
                                                                    fill="#feb784" />
                                                                <path id="Path_7064" data-name="Path 7064"
                                                                    d="M209.253,85.751v4.793a8.627,8.627,0,1,1-17.253,0V85.751a13,13,0,0,0,4.421-5.008l.371-.743.544.454a23.932,23.932,0,0,0,11.917,5.3Z"
                                                                    transform="translate(-171.871 -73.29)"
                                                                    fill="#fec9a3" />
                                                                <path id="Path_7065" data-name="Path 7065"
                                                                    d="M284.734,121.566v4.793a8.63,8.63,0,0,1-6.979,8.469,10.506,10.506,0,0,0,3.145-7.511V120.69A23.905,23.905,0,0,0,284.734,121.566Z"
                                                                    transform="translate(-247.352 -109.105)"
                                                                    fill="#fec093" />
                                                                <path id="Path_7066" data-name="Path 7066"
                                                                    d="M217.438,138.876a1.438,1.438,0,1,1,1.438-1.438A1.438,1.438,0,0,1,217.438,138.876Z"
                                                                    transform="translate(-192.995 -122.581)"
                                                                    fill="#7a432a" />
                                                                <path id="Path_7067" data-name="Path 7067"
                                                                    d="M289.438,138.876a1.438,1.438,0,1,1,1.438-1.438A1.438,1.438,0,0,1,289.438,138.876Z"
                                                                    transform="translate(-256.369 -122.581)"
                                                                    fill="#7a432a" />
                                                                <path id="Path_7068" data-name="Path 7068"
                                                                    d="M242.876,178.876A2.879,2.879,0,0,1,240,176h1.917a.959.959,0,1,0,1.917,0h1.917A2.879,2.879,0,0,1,242.876,178.876Z"
                                                                    transform="translate(-214.12 -157.788)"
                                                                    fill="#f7a468" />
                                                                <path id="Path_7069" data-name="Path 7069"
                                                                    d="M224,312h9.585v6.71H224Z"
                                                                    transform="translate(-200.037 -277.493)"
                                                                    fill="#e0e0de" />
                                                                <path id="Path_7070" data-name="Path 7070"
                                                                    d="M121.515,304.882a2.909,2.909,0,0,1-3.231-1.93l-6.331-11.877a7.465,7.465,0,0,1-1.337,7.137v7.668H93.362v-7.668a7.477,7.477,0,0,1-1.323-7.226l-6.434,11.966a2.908,2.908,0,1,1-5.522-1.826l7.038-17.518A5.749,5.749,0,0,1,92.458,280h3.78l5.751,10.544L107.74,280h3.766a5.756,5.756,0,0,1,5.344,3.627l6.958,17.5a2.91,2.91,0,0,1-2.292,3.756Z"
                                                                    transform="translate(-73.234 -249.327)"
                                                                    fill="#ec8c8c" />
                                                                <path id="Path_7071" data-name="Path 7071"
                                                                    d="M74.16,392.987,74.851,384H80.6v9.235a3.226,3.226,0,1,1-6.442-.247Z"
                                                                    transform="translate(-68.142 -340.866)"
                                                                    fill="#f59898" />
                                                                <path id="Path_7072" data-name="Path 7072"
                                                                    d="M32.965,266.888a1.865,1.865,0,0,0-1.216,2.643l.878,1.754H29.192a5.751,5.751,0,0,1-2.572-.607l-.955-.478A1.15,1.15,0,0,0,24,271.23v2.705a1.917,1.917,0,0,0,1.06,1.715l1.56.78a5.751,5.751,0,0,0,2.572.607h7.269v-5.751L35.148,268a1.865,1.865,0,0,0-2.184-1.116Z"
                                                                    transform="translate(-24 -237.737)"
                                                                    fill="#fec9a3" />
                                                                <path id="Path_7073" data-name="Path 7073"
                                                                    d="M80,352h5.751v3.834H80Z"
                                                                    transform="translate(-73.29 -312.701)"
                                                                    fill="#e0e0de" />
                                                                <path id="Path_7074" data-name="Path 7074"
                                                                    d="M222.468,308.614a2.909,2.909,0,0,1-3.231-1.93l-6.331-11.877a7.464,7.464,0,0,1-1.337,7.137v7.668H194.63c7.911-5.166,14.586-11.723,20.189-25.372a5.742,5.742,0,0,1,2.983,3.119l6.958,17.5a2.91,2.91,0,0,1-2.292,3.756Z"
                                                                    transform="translate(-174.186 -253.059)"
                                                                    fill="#e07f7f" />
                                                                <path id="Path_7075" data-name="Path 7075"
                                                                    d="M305.585,351.336,296,349.419V336l9.585,1.917Z"
                                                                    transform="translate(-263.41 -298.618)"
                                                                    fill="#a36548" />
                                                                <path id="Path_7076" data-name="Path 7076"
                                                                    d="M408,351.336l9.585-1.917V336L408,337.917Z"
                                                                    transform="translate(-361.991 -298.618)"
                                                                    fill="#8f4d2e" />
                                                                <path id="Path_7077" data-name="Path 7077"
                                                                    d="M376,352h3.834v13.419H376Z"
                                                                    transform="translate(-333.825 -312.701)"
                                                                    fill="#95573a" />
                                                                <path id="Path_7078" data-name="Path 7078"
                                                                    d="M307.5,316.793a3.4,3.4,0,0,0-2.836-3.348L296,312v2.876l9.585,1.917H307.5a3.4,3.4,0,0,1,2.836-3.348L319,312v2.876l-9.585,1.917Z"
                                                                    transform="translate(-263.41 -277.493)"
                                                                    fill="#d4bd81" />
                                                                <path id="Path_7079" data-name="Path 7079"
                                                                    d="M436.95,421.661l-3.834.639a.958.958,0,0,1-1.116-.945v-3.563a1.248,1.248,0,0,1,1.042-1.231l3.256-.543a1.248,1.248,0,0,1,1.453,1.231v3.466A.959.959,0,0,1,436.95,421.661Z"
                                                                    transform="translate(-383.115 -369.034)"
                                                                    fill="#fec9a3" />
                                                            </svg>
                                                        </div>
                                                        <div class="count-number">
                                                            <span class="counter">0</span>
                                                            <p>Completed Courses</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <h4 class='mb-25'>In Progress Courses</h4>
                                                <div class="inprogress-course mb-30">
                                                    <div class="inprogress-course-img">
                                                        <a href="course.jsp"><img src="${pageContext.request.contextPath}/img/blog/blog-01.jpg" alt="" /></a>
                                                    </div>
                                                    <div class="inprogress-course-text">
                                                        <div class="inprogress-course-rating">
                                                            <a href="#"><i class="fas fa-star"></i></a>
                                                            <a href="#"><i class="fas fa-star"></i></a>
                                                            <a href="#"><i class="fas fa-star"></i></a>
                                                            <a href="#"><i class="fas fa-star"></i></a>
                                                            <a href="#"><i class="fas fa-star"></i></a>
                                                            <span>5.00</span>
                                                        </div>
                                                        <h4 class='inprogress-course-title'>
                                                            <a href="course.jsp">WordPress Development Course for Plugins and Themes</a>
                                                        </h4>
                                                        <div class="inprogress-course-lesson mb-15">
                                                            <span>Completed Lessons :</span>
                                                            <h6><span>07</span> of <span>10</span> lessons</h6>
                                                        </div>
                                                        <div class="rating-row mb-10">
                                                            <div class="progress">
                                                                <div class="progress-bar progress-bar1 wow fadeInLeft" style="width: 70%;"></div>
                                                            </div>
                                                            <div class="progress-tittle">
                                                                <h6><span>70%</span> Complete</h6>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="inprogress-course mb-30">
                                                    <div class="inprogress-course-img">
                                                        <a href="course.jsp"><img src="${pageContext.request.contextPath}/img/blog/blog-02.jpg" alt="" /></a>
                                                    </div>
                                                    <div class="inprogress-course-text">
                                                        <div class="inprogress-course-rating">
                                                            <a href="#"><i class="fas fa-star"></i></a>
                                                            <a href="#"><i class="fas fa-star"></i></a>
                                                            <a href="#"><i class="fas fa-star"></i></a>
                                                            <a href="#"><i class="fas fa-star"></i></a>
                                                            <a href="#"><i class="fas fa-star"></i></a>
                                                            <span>5.00</span>
                                                        </div>
                                                        <h4 class='inprogress-course-title'>
                                                            <a href="course.jsp">Data Science Real-Life Data Science Exercises Included</a>
                                                        </h4>
                                                        <div class="inprogress-course-lesson mb-15">
                                                            <span>Completed Lessons :</span>
                                                            <h6><span>08</span> of <span>10</span> lessons</h6>
                                                        </div>
                                                        <div class="rating-row mb-10">
                                                            <div class="progress">
                                                                <div class="progress-bar progress-bar1 wow fadeInLeft"
                                                                    style="width: 80%;"></div>
                                                            </div>
                                                            <div class="progress-tittle">
                                                                <h6><span>80%</span> Complete</h6>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                    <h4 class='mb-25'>My Profile</h4>
                                    <ul class='student-profile-info'>
                                        <li>
                                            <h5>Registration Date :</h5>
                                            <span>October 15, 2022 10:30 am</span>
                                        </li>
                                        <li>
                                            <h5>First Name :</h5>
                                            <span>Steve</span>
                                        </li>
                                        <li>
                                            <h5>Last Name :</h5>
                                            <span>Smith</span>
                                        </li>
                                        <li>
                                            <h5>Username :</h5>
                                            <span>Steve3h</span>
                                        </li>
                                        <li>
                                            <h5>Email :</h5>
                                            <span>adminh@gmail.com</span>
                                        </li>
                                        <li>
                                            <h5>Phone :</h5>
                                            <span>(987) 547587587</span>
                                        </li>
                                        <li>
                                            <h5>Occupation :</h5>
                                            <span>Student</span>
                                        </li>
                                        <li>
                                            <h5>Biography :</h5>
                                            <span>Alison Johnson is finishing her first year at DePaul University where
                                                she is interested in business. Although she has yet to declare a major,
                                                she’s considering finance or marketing. After watching her parents run a
                                                restaurant for years, she knew at a very young age that she also wanted
                                                to go into business.</span>
                                        </li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                                    <h4 class='mb-25'>Enrolled Courses</h4>
                                    <div class="student-profile-enroll">
                                        <ul class="nav mb-30" id="myTab" role="tablist">
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link active" id="enrolled-tab" data-bs-toggle="tab"
                                                    data-bs-target="#enrolled" type="button" role="tab"
                                                    aria-controls="enrolled" aria-selected="true">Enrolled
                                                    Courses (5)</button>
                                            </li>
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link" id="active-tab" data-bs-toggle="tab"
                                                    data-bs-target="#active" type="button" role="tab"
                                                    aria-controls="active" aria-selected="false">Active Courses
                                                    (2)</button>
                                            </li>
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link" id="completed-tab" data-bs-toggle="tab"
                                                    data-bs-target="#completed" type="button" role="tab"
                                                    aria-controls="completed" aria-selected="false">Completed Courses
                                                    (0)</button>
                                            </li>
                                        </ul>
                                        <div class="tab-content" id="myTabContent">
                                            <div class="tab-pane fade show active" id="enrolled" role="tabpanel"
                                                aria-labelledby="enrolled-tab">
                                                <div class="student-profile-enrolled-course">
                                                    <div class="row">
                                                        <div class="col-xl-4 col-lg-6 col-md-6">
                                                            <div class="course-wrapper-2 mb-30">
                                                                <div class="student-course-img">
                                                                    <img src="${pageContext.request.contextPath}/img/course/course-04.jpg"
                                                                        alt="course-img">
                                                                </div>
                                                                <div class="course-cart">
                                                                    <div class="course-info-wrapper">
                                                                        <div class="cart-info-body">
                                                                            <span
                                                                                class="category-color category-color-3"><a
                                                                                    href="course.jsp">Business</a></span>
                                                                            <a href="course-details.jsp">
                                                                                <h3>MySQL Database : Beginner SQL
                                                                                    Database Design</h3>
                                                                            </a>
                                                                            <div class="cart-lavel">
                                                                                <h5>Level : <span>Beginner</span></h5>
                                                                                <p>Knowledge is power. Information is
                                                                                    liberating. Education is the premise
                                                                                    of
                                                                                    progress, in every society, in every
                                                                                    family</p>
                                                                            </div>
                                                                            <div class="info-cart-text">
                                                                                <ul>
                                                                                    <li><i
                                                                                            class="far fa-check"></i>Scratch
                                                                                        to HTML</li>
                                                                                    <li><i
                                                                                            class="far fa-check"></i>Learn
                                                                                        how to code in Python</li>
                                                                                    <li><i
                                                                                            class="far fa-check"></i>Unlimited
                                                                                        backend database creation</li>
                                                                                    <li><i
                                                                                            class="far fa-check"></i>Adobe
                                                                                        XD Tutorials</li>
                                                                                </ul>
                                                                            </div>
                                                                            <div class="course-action">
                                                                                <a href="course-details.jsp"
                                                                                    class="view-details-btn">View
                                                                                    Details</a>
                                                                                <button class="wishlist-btn"><i
                                                                                        class="flaticon-like"></i></button>
                                                                                <a href="course-details.jsp"
                                                                                    class="c-share-btn"><i
                                                                                        class="flaticon-previous"></i></a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="student-course-footer">
                                                                    <div class="student-course-linkter">
                                                                        <div class="course-lessons">
                                                                            <svg xmlns="http://www.w3.org/2000/svg"
                                                                                width="16.471" height="16.471"
                                                                                viewBox="0 0 16.471 16.471">
                                                                                <g id="blackboard-.0"
                                                                                    transform="translate(-0.008)">
                                                                                    <path id="Path_002"
                                                                                        data-name="Path 101"
                                                                                        d="M16,1.222H8.726V.483a.483.483,0,1,0-.965,0v.74H.491A.483.483,0,0,0,.008,1.7V13.517A.483.483,0,0,0,.491,14H5.24L4.23,15.748a.483.483,0,1,0,.836.483L6.354,14H7.761v1.99a.483.483,0,0,0,.965,0V14h1.407l1.288,2.231a.483.483,0,1,0,.836-.483L11.247,14H16a.483.483,0,0,0,.483-.483V1.7A.483.483,0,0,0,16,1.222Zm-.483.965v8.905H.973V2.187Zm0,10.847H.973v-.976H15.514Z"
                                                                                        fill="#575757" />
                                                                                </g>
                                                                            </svg>
                                                                            <span class="ms-2">12 Lessons</span>
                                                                        </div>
                                                                        <div class="portfolio-price">
                                                                            <span>$147.00</span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="student-course-text">
                                                                        <h3><a href="course-details.jsp">MySQL Database
                                                                                : Beginner SQL Database Design</a>
                                                                        </h3>
                                                                    </div>
                                                                    <div class="portfolio-user">
                                                                        <div class="user-icon">
                                                                            <a href="instructor-profile.jsp"><i
                                                                                    class="fas fa-user"></i>Danial</a>
                                                                        </div>
                                                                        <div class="course-icon">
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fal fa-star"></i>
                                                                            <span>(25)</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-4 col-lg-6 col-md-6">
                                                            <div class="course-wrapper-2 mb-30">
                                                                <div class="student-course-img">
                                                                    <img src="${pageContext.request.contextPath}/img/course/course-05.jpg"
                                                                        alt="course-img">
                                                                </div>
                                                                <div class="course-cart">
                                                                    <div class="course-info-wrapper">
                                                                        <div class="cart-info-body">
                                                                            <span
                                                                                class="category-color category-color-1"><a
                                                                                    href="course.jsp">Development</a></span>
                                                                            <a href="course-details.jsp">
                                                                                <h3>Python and Django Full Stack Web
                                                                                    Developer Bootcamp</h3>
                                                                            </a>
                                                                            <div class="cart-lavel">
                                                                                <h5>Level : <span>Beginner</span></h5>
                                                                                <p>Knowledge is power. Information is
                                                                                    liberating. Education is the premise
                                                                                    of
                                                                                    progress, in every society, in every
                                                                                    family</p>
                                                                            </div>
                                                                            <div class="info-cart-text">
                                                                                <ul>
                                                                                    <li><i
                                                                                            class="far fa-check"></i>Scratch
                                                                                        to HTML</li>
                                                                                    <li><i
                                                                                            class="far fa-check"></i>Learn
                                                                                        how to code in Python</li>
                                                                                    <li><i
                                                                                            class="far fa-check"></i>Unlimited
                                                                                        backend database creation</li>
                                                                                    <li><i
                                                                                            class="far fa-check"></i>Adobe
                                                                                        XD Tutorials</li>
                                                                                </ul>
                                                                            </div>
                                                                            <div class="course-action">
                                                                                <a href="course-details.jsp"
                                                                                    class="view-details-btn">View
                                                                                    Details</a>
                                                                                <button class="wishlist-btn"><i
                                                                                        class="flaticon-like"></i></button>
                                                                                <a href="course-details.jsp"
                                                                                    class="c-share-btn"><i
                                                                                        class="flaticon-previous"></i></a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="student-course-footer">
                                                                    <div class="student-course-linkter">
                                                                        <div class="course-lessons">
                                                                            <svg xmlns="http://www.w3.org/2000/svg"
                                                                                width="16.471" height="16.471"
                                                                                viewBox="0 0 16.471 16.471">
                                                                                <g id="blackboard-302"
                                                                                    transform="translate(-0.008)">
                                                                                    <path id="Path_001"
                                                                                        data-name="Path 101"
                                                                                        d="M16,1.222H8.726V.483a.483.483,0,1,0-.965,0v.74H.491A.483.483,0,0,0,.008,1.7V13.517A.483.483,0,0,0,.491,14H5.24L4.23,15.748a.483.483,0,1,0,.836.483L6.354,14H7.761v1.99a.483.483,0,0,0,.965,0V14h1.407l1.288,2.231a.483.483,0,1,0,.836-.483L11.247,14H16a.483.483,0,0,0,.483-.483V1.7A.483.483,0,0,0,16,1.222Zm-.483.965v8.905H.973V2.187Zm0,10.847H.973v-.976H15.514Z"
                                                                                        fill="#575757" />
                                                                                </g>
                                                                            </svg>
                                                                            <span class="ms-2">12 Lessons</span>
                                                                        </div>
                                                                        <div class="portfolio-price">
                                                                            <span>$21.00</span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="student-course-text">
                                                                        <h3><a href="course-details.jsp">Python and
                                                                                Django Full Stack Web Developer
                                                                                Bootcamp</a></h3>
                                                                    </div>
                                                                    <div class="portfolio-user">
                                                                        <div class="user-icon">
                                                                            <a href="instructor-profile.jsp"><i
                                                                                    class="fas fa-user"></i>Junior
                                                                                Lucy</a>
                                                                        </div>
                                                                        <div class="course-icon">
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fal fa-star"></i>
                                                                            <span>(25)</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-4 col-lg-6 col-md-6">
                                                            <div class="course-wrapper-2 mb-30">
                                                                <div class="student-course-img">
                                                                    <img src="${pageContext.request.contextPath}/img/course/course-06.jpg"
                                                                        alt="course-img">
                                                                </div>
                                                                <div class="course-cart">
                                                                    <div class="course-info-wrapper">
                                                                        <div class="cart-info-body">
                                                                            <span
                                                                                class="category-color category-color-1"><a
                                                                                    href="course.jsp">Development</a></span>
                                                                            <a href="course-details.jsp">
                                                                                <h3>Data Science Real-Life Data Science
                                                                                    Exercises Included</h3>
                                                                            </a>
                                                                            <div class="cart-lavel">
                                                                                <h5>Level : <span>Beginner</span></h5>
                                                                                <p>Knowledge is power. Information is
                                                                                    liberating. Education is the premise
                                                                                    of
                                                                                    progress, in every society, in every
                                                                                    family</p>
                                                                            </div>
                                                                            <div class="info-cart-text">
                                                                                <ul>
                                                                                    <li><i
                                                                                            class="far fa-check"></i>Scratch
                                                                                        to HTML</li>
                                                                                    <li><i
                                                                                            class="far fa-check"></i>Learn
                                                                                        how to code in Python</li>
                                                                                    <li><i
                                                                                            class="far fa-check"></i>Unlimited
                                                                                        backend database creation</li>
                                                                                    <li><i
                                                                                            class="far fa-check"></i>Adobe
                                                                                        XD Tutorials</li>
                                                                                </ul>
                                                                            </div>
                                                                            <div class="course-action">
                                                                                <a href="course-details.jsp"
                                                                                    class="view-details-btn">View
                                                                                    Details</a>
                                                                                <button class="wishlist-btn"><i
                                                                                        class="flaticon-like"></i></button>
                                                                                <a href="course-details.jsp"
                                                                                    class="c-share-btn"><i
                                                                                        class="flaticon-previous"></i></a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="student-course-footer">
                                                                    <div class="student-course-linkter">
                                                                        <div class="course-lessons">
                                                                            <svg xmlns="http://www.w3.org/2000/svg"
                                                                                width="16.471" height="16.471"
                                                                                viewBox="0 0 16.471 16.471">
                                                                                <g id="blackboard-303"
                                                                                    transform="translate(-0.008)">
                                                                                    <path id="Path_200"
                                                                                        data-name="Path 101"
                                                                                        d="M16,1.222H8.726V.483a.483.483,0,1,0-.965,0v.74H.491A.483.483,0,0,0,.008,1.7V13.517A.483.483,0,0,0,.491,14H5.24L4.23,15.748a.483.483,0,1,0,.836.483L6.354,14H7.761v1.99a.483.483,0,0,0,.965,0V14h1.407l1.288,2.231a.483.483,0,1,0,.836-.483L11.247,14H16a.483.483,0,0,0,.483-.483V1.7A.483.483,0,0,0,16,1.222Zm-.483.965v8.905H.973V2.187Zm0,10.847H.973v-.976H15.514Z"
                                                                                        fill="#575757" />
                                                                                </g>
                                                                            </svg>
                                                                            <span class="ms-2">12 Lessons</span>
                                                                        </div>
                                                                        <div class="portfolio-price">
                                                                            <span>$12.00</span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="student-course-text">
                                                                        <h3><a href="course-details.jsp">Data Science
                                                                                Real-Life Data Science Exercises
                                                                                Included</a></h3>
                                                                    </div>
                                                                    <div class="portfolio-user">
                                                                        <div class="user-icon">
                                                                            <a href="instructor-profile.jsp"><i
                                                                                    class="fas fa-user"></i>Mark
                                                                                Hanry</a>
                                                                        </div>
                                                                        <div class="course-icon">
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fal fa-star"></i>
                                                                            <span>(25)</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-4 col-lg-6 col-md-6">
                                                            <div class="course-wrapper-2 mb-30">
                                                                <div class="student-course-img">
                                                                    <img src="${pageContext.request.contextPath}/img/course/course-07.jpg"
                                                                        alt="course-img">
                                                                </div>
                                                                <div class="course-cart">
                                                                    <div class="course-info-wrapper">
                                                                        <div class="cart-info-body">
                                                                            <span
                                                                                class="category-color category-color-2"><a
                                                                                    href="course.jsp">Life
                                                                                    Style</a></span>
                                                                            <a href="course-details.jsp">
                                                                                <h3>Become a Super Human: Naturally &
                                                                                    Safely Boost Testosterone</h3>
                                                                            </a>
                                                                            <div class="cart-lavel">
                                                                                <h5>Level : <span>Beginner</span></h5>
                                                                                <p>Knowledge is power. Information is
                                                                                    liberating. Education is the premise
                                                                                    of
                                                                                    progress, in every society, in every
                                                                                    family</p>
                                                                            </div>
                                                                            <div class="info-cart-text">
                                                                                <ul>
                                                                                    <li><i
                                                                                            class="far fa-check"></i>Scratch
                                                                                        to HTML</li>
                                                                                    <li><i
                                                                                            class="far fa-check"></i>Learn
                                                                                        how to code in Python</li>
                                                                                    <li><i
                                                                                            class="far fa-check"></i>Unlimited
                                                                                        backend database creation</li>
                                                                                    <li><i
                                                                                            class="far fa-check"></i>Adobe
                                                                                        XD Tutorials</li>
                                                                                </ul>
                                                                            </div>
                                                                            <div class="course-action">
                                                                                <a href="course-details.jsp"
                                                                                    class="view-details-btn">View
                                                                                    Details</a>
                                                                                <button class="wishlist-btn"><i
                                                                                        class="flaticon-like"></i></button>
                                                                                <a href="course-details.jsp"
                                                                                    class="c-share-btn"><i
                                                                                        class="flaticon-previous"></i></a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="student-course-footer">
                                                                    <div class="student-course-linkter">
                                                                        <div class="course-lessons">
                                                                            <svg xmlns="http://www.w3.org/2000/svg"
                                                                                width="16.471" height="16.471"
                                                                                viewBox="0 0 16.471 16.471">
                                                                                <g id="blackboard-666"
                                                                                    transform="translate(-0.008)">
                                                                                    <path id="Path_10765"
                                                                                        data-name="Path 101"
                                                                                        d="M16,1.222H8.726V.483a.483.483,0,1,0-.965,0v.74H.491A.483.483,0,0,0,.008,1.7V13.517A.483.483,0,0,0,.491,14H5.24L4.23,15.748a.483.483,0,1,0,.836.483L6.354,14H7.761v1.99a.483.483,0,0,0,.965,0V14h1.407l1.288,2.231a.483.483,0,1,0,.836-.483L11.247,14H16a.483.483,0,0,0,.483-.483V1.7A.483.483,0,0,0,16,1.222Zm-.483.965v8.905H.973V2.187Zm0,10.847H.973v-.976H15.514Z"
                                                                                        fill="#575757" />
                                                                                </g>
                                                                            </svg>
                                                                            <span class="ms-2">12 Lessons</span>
                                                                        </div>
                                                                        <div class="portfolio-price">
                                                                            <span>$48.00</span>
                                                                            <del>$24.50</del>
                                                                        </div>
                                                                    </div>
                                                                    <div class="student-course-text">
                                                                        <h3><a href="course-details.jsp">Become a Super
                                                                                Human: Naturally & Safely Boost
                                                                                Testosterone</a></h3>
                                                                    </div>
                                                                    <div class="portfolio-user">
                                                                        <div class="user-icon">
                                                                            <a href="instructor-profile.jsp"><i
                                                                                    class="fas fa-user"></i>Edyal
                                                                                Romel</a>
                                                                        </div>
                                                                        <div class="course-icon">
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fal fa-star"></i>
                                                                            <span>(25)</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-4 col-lg-6 col-md-6">
                                                            <div class="course-wrapper-2 mb-30">
                                                                <div class="student-course-img">
                                                                    <img src="${pageContext.request.contextPath}/img/course/course-08.jpg"
                                                                        alt="course-img">
                                                                </div>
                                                                <div class="course-cart">
                                                                    <div class="course-info-wrapper">
                                                                        <div class="cart-info-body">
                                                                            <span
                                                                                class="category-color category-color-1"><a
                                                                                    href="course.jsp">Development</a></span>
                                                                            <a href="course-details.jsp">
                                                                                <h3>Python and Django Full Stack Web
                                                                                    Developer Bootcamp</h3>
                                                                            </a>
                                                                            <div class="cart-lavel">
                                                                                <h5>Level : <span>Beginner</span></h5>
                                                                                <p>Knowledge is power. Information is
                                                                                    liberating. Education is the premise
                                                                                    of
                                                                                    progress, in every society, in every
                                                                                    family</p>
                                                                            </div>
                                                                            <div class="info-cart-text">
                                                                                <ul>
                                                                                    <li><i
                                                                                            class="far fa-check"></i>Scratch
                                                                                        to HTML</li>
                                                                                    <li><i
                                                                                            class="far fa-check"></i>Learn
                                                                                        how to code in Python</li>
                                                                                    <li><i
                                                                                            class="far fa-check"></i>Unlimited
                                                                                        backend database creation</li>
                                                                                    <li><i
                                                                                            class="far fa-check"></i>Adobe
                                                                                        XD Tutorials</li>
                                                                                </ul>
                                                                            </div>
                                                                            <div class="course-action">
                                                                                <a href="course-details.jsp"
                                                                                    class="view-details-btn">View
                                                                                    Details</a>
                                                                                <button class="wishlist-btn"><i
                                                                                        class="flaticon-like"></i></button>
                                                                                <a href="course-details.jsp"
                                                                                    class="c-share-btn"><i
                                                                                        class="flaticon-previous"></i></a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="student-course-footer">
                                                                    <div class="student-course-linkter">
                                                                        <div class="course-lessons">
                                                                            <svg xmlns="http://www.w3.org/2000/svg"
                                                                                width="16.471" height="16.471"
                                                                                viewBox="0 0 16.471 16.471">
                                                                                <g id="blackboard-633"
                                                                                    transform="translate(-0.008)">
                                                                                    <path id="Path_1000"
                                                                                        data-name="Path 101"
                                                                                        d="M16,1.222H8.726V.483a.483.483,0,1,0-.965,0v.74H.491A.483.483,0,0,0,.008,1.7V13.517A.483.483,0,0,0,.491,14H5.24L4.23,15.748a.483.483,0,1,0,.836.483L6.354,14H7.761v1.99a.483.483,0,0,0,.965,0V14h1.407l1.288,2.231a.483.483,0,1,0,.836-.483L11.247,14H16a.483.483,0,0,0,.483-.483V1.7A.483.483,0,0,0,16,1.222Zm-.483.965v8.905H.973V2.187Zm0,10.847H.973v-.976H15.514Z"
                                                                                        fill="#575757" />
                                                                                </g>
                                                                            </svg>
                                                                            <span class="ms-2">12 Lessons</span>
                                                                        </div>
                                                                        <div class="portfolio-price">
                                                                            <span>FREE</span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="student-course-text">
                                                                        <h3><a href="course-details.jsp">Python and
                                                                                Django Full Stack Web Developer
                                                                                Bootcamp</a></h3>
                                                                    </div>
                                                                    <div class="portfolio-user">
                                                                        <div class="user-icon">
                                                                            <a href="3.jsp"><i
                                                                                    class="fas fa-user"></i>Junior
                                                                                Lucy</a>
                                                                        </div>
                                                                        <div class="course-icon">
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fal fa-star"></i>
                                                                            <span>(25)</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="active" role="tabpanel"
                                                aria-labelledby="active-tab">
                                                <div class="student-profile-enrolled-course">
                                                    <div class="row">
                                                        <div class="col-xl-4 col-lg-6 col-md-6">
                                                            <div class="course-wrapper-2 mb-30">
                                                                <div class="student-course-img">
                                                                    <img src="${pageContext.request.contextPath}/img/course/course-07.jpg"
                                                                        alt="course-img">
                                                                </div>
                                                                <div class="course-cart">
                                                                    <div class="course-info-wrapper">
                                                                        <div class="cart-info-body">
                                                                            <span
                                                                                class="category-color category-color-2"><a
                                                                                    href="course.jsp">Life
                                                                                    Style</a></span>
                                                                            <a href="course-details.jsp">
                                                                                <h3>Become a Super Human: Naturally &
                                                                                    Safely Boost Testosterone</h3>
                                                                            </a>
                                                                            <div class="cart-lavel">
                                                                                <h5>Level : <span>Beginner</span></h5>
                                                                                <p>Knowledge is power. Information is
                                                                                    liberating. Education is the premise
                                                                                    of
                                                                                    progress, in every society, in every
                                                                                    family</p>
                                                                            </div>
                                                                            <div class="info-cart-text">
                                                                                <ul>
                                                                                    <li><i
                                                                                            class="far fa-check"></i>Scratch
                                                                                        to HTML</li>
                                                                                    <li><i
                                                                                            class="far fa-check"></i>Learn
                                                                                        how to code in Python</li>
                                                                                    <li><i
                                                                                            class="far fa-check"></i>Unlimited
                                                                                        backend database creation</li>
                                                                                    <li><i
                                                                                            class="far fa-check"></i>Adobe
                                                                                        XD Tutorials</li>
                                                                                </ul>
                                                                            </div>
                                                                            <div class="course-action">
                                                                                <a href="course-details.jsp"
                                                                                    class="view-details-btn">View
                                                                                    Details</a>
                                                                                <button class="wishlist-btn"><i
                                                                                        class="flaticon-like"></i></button>
                                                                                <a href="course-details.jsp"
                                                                                    class="c-share-btn"><i
                                                                                        class="flaticon-previous"></i></a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="student-course-footer">
                                                                    <div class="student-course-linkter">
                                                                        <div class="course-lessons">
                                                                            <svg xmlns="http://www.w3.org/2000/svg"
                                                                                width="16.471" height="16.471"
                                                                                viewBox="0 0 16.471 16.471">
                                                                                <g id="blackboard-666"
                                                                                    transform="translate(-0.008)">
                                                                                    <path id="Path_10765"
                                                                                        data-name="Path 101"
                                                                                        d="M16,1.222H8.726V.483a.483.483,0,1,0-.965,0v.74H.491A.483.483,0,0,0,.008,1.7V13.517A.483.483,0,0,0,.491,14H5.24L4.23,15.748a.483.483,0,1,0,.836.483L6.354,14H7.761v1.99a.483.483,0,0,0,.965,0V14h1.407l1.288,2.231a.483.483,0,1,0,.836-.483L11.247,14H16a.483.483,0,0,0,.483-.483V1.7A.483.483,0,0,0,16,1.222Zm-.483.965v8.905H.973V2.187Zm0,10.847H.973v-.976H15.514Z"
                                                                                        fill="#575757" />
                                                                                </g>
                                                                            </svg>
                                                                            <span class="ms-2">12 Lessons</span>
                                                                        </div>
                                                                        <div class="portfolio-price">
                                                                            <span>$48.00</span>
                                                                            <del>$24.50</del>
                                                                        </div>
                                                                    </div>
                                                                    <div class="student-course-text">
                                                                        <h3><a href="course-details.jsp">Become a Super
                                                                                Human: Naturally & Safely Boost
                                                                                Testosterone</a></h3>
                                                                    </div>
                                                                    <div class="portfolio-user">
                                                                        <div class="user-icon">
                                                                            <a href="instructor-profile.jsp"><i
                                                                                    class="fas fa-user"></i>Edyal
                                                                                Romel</a>
                                                                        </div>
                                                                        <div class="course-icon">
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fal fa-star"></i>
                                                                            <span>(25)</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-4 col-lg-6 col-md-6">
                                                            <div class="course-wrapper-2 mb-30">
                                                                <div class="student-course-img">
                                                                    <img src="${pageContext.request.contextPath}/img/course/course-08.jpg"
                                                                        alt="course-img">
                                                                </div>
                                                                <div class="course-cart">
                                                                    <div class="course-info-wrapper">
                                                                        <div class="cart-info-body">
                                                                            <span
                                                                                class="category-color category-color-1"><a
                                                                                    href="course.jsp">Development</a></span>
                                                                            <a href="course-details.jsp">
                                                                                <h3>Python and Django Full Stack Web
                                                                                    Developer Bootcamp</h3>
                                                                            </a>
                                                                            <div class="cart-lavel">
                                                                                <h5>Level : <span>Beginner</span></h5>
                                                                                <p>Knowledge is power. Information is
                                                                                    liberating. Education is the premise
                                                                                    of
                                                                                    progress, in every society, in every
                                                                                    family</p>
                                                                            </div>
                                                                            <div class="info-cart-text">
                                                                                <ul>
                                                                                    <li><i
                                                                                            class="far fa-check"></i>Scratch
                                                                                        to HTML</li>
                                                                                    <li><i
                                                                                            class="far fa-check"></i>Learn
                                                                                        how to code in Python</li>
                                                                                    <li><i
                                                                                            class="far fa-check"></i>Unlimited
                                                                                        backend database creation</li>
                                                                                    <li><i
                                                                                            class="far fa-check"></i>Adobe
                                                                                        XD Tutorials</li>
                                                                                </ul>
                                                                            </div>
                                                                            <div class="course-action">
                                                                                <a href="course-details.jsp"
                                                                                    class="view-details-btn">View
                                                                                    Details</a>
                                                                                <button class="wishlist-btn"><i
                                                                                        class="flaticon-like"></i></button>
                                                                                <a href="course-details.jsp"
                                                                                    class="c-share-btn"><i
                                                                                        class="flaticon-previous"></i></a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="student-course-footer">
                                                                    <div class="student-course-linkter">
                                                                        <div class="course-lessons">
                                                                            <svg xmlns="http://www.w3.org/2000/svg"
                                                                                width="16.471" height="16.471"
                                                                                viewBox="0 0 16.471 16.471">
                                                                                <g id="blackboard-633"
                                                                                    transform="translate(-0.008)">
                                                                                    <path id="Path_1000"
                                                                                        data-name="Path 101"
                                                                                        d="M16,1.222H8.726V.483a.483.483,0,1,0-.965,0v.74H.491A.483.483,0,0,0,.008,1.7V13.517A.483.483,0,0,0,.491,14H5.24L4.23,15.748a.483.483,0,1,0,.836.483L6.354,14H7.761v1.99a.483.483,0,0,0,.965,0V14h1.407l1.288,2.231a.483.483,0,1,0,.836-.483L11.247,14H16a.483.483,0,0,0,.483-.483V1.7A.483.483,0,0,0,16,1.222Zm-.483.965v8.905H.973V2.187Zm0,10.847H.973v-.976H15.514Z"
                                                                                        fill="#575757" />
                                                                                </g>
                                                                            </svg>
                                                                            <span class="ms-2">12 Lessons</span>
                                                                        </div>
                                                                        <div class="portfolio-price">
                                                                            <span>FREE</span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="student-course-text">
                                                                        <h3><a href="course-details.jsp">Python and
                                                                                Django Full Stack Web Developer
                                                                                Bootcamp</a></h3>
                                                                    </div>
                                                                    <div class="portfolio-user">
                                                                        <div class="user-icon">
                                                                            <a href="3.jsp"><i
                                                                                    class="fas fa-user"></i>Junior
                                                                                Lucy</a>
                                                                        </div>
                                                                        <div class="course-icon">
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fas fa-star"></i>
                                                                            <i class="fal fa-star"></i>
                                                                            <span>(25)</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="completed" role="tabpanel"
                                                aria-labelledby="completed-tab">
                                                <div class="student-profile-enrolled-course">
                                                    <p>No course completed yet.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="wishlist" role="tabpanel" aria-labelledby="wishlist-tab">
                                    <h4 class='mb-25'>Wishlist</h4>
                                    <div class="student-profile-wishlist">
                                        <div class="row">
                                            <div class="col-xl-4 col-lg-6 col-md-6">
                                                <div class="course-wrapper-2 mb-30">
                                                    <div class="student-course-img">
                                                        <img src="${pageContext.request.contextPath}/img/course/course-01.jpg" alt="courde-img">
                                                    </div>
                                                    <div class="course-cart">
                                                        <div class="course-info-wrapper">
                                                            <div class="cart-info-body">
                                                                <span class="category-color category-color-1"><a
                                                                        href="course.jsp">Development</a></span>
                                                                <a href="course-details.jsp">
                                                                    <h3>WordPress Development Course for Plugins &
                                                                        Themes</h3>
                                                                </a>
                                                                <div class="cart-lavel">
                                                                    <h5>Level : <span>Beginner</span></h5>
                                                                    <p>Knowledge is power. Information is liberating.
                                                                        Education is the premise of
                                                                        progress, in every society, in every family</p>
                                                                </div>
                                                                <div class="info-cart-text">
                                                                    <ul>
                                                                        <li><i class="far fa-check"></i>Scratch to HTML
                                                                        </li>
                                                                        <li><i class="far fa-check"></i>Learn how to
                                                                            code in Python</li>
                                                                        <li><i class="far fa-check"></i>Unlimited
                                                                            backend database creation</li>
                                                                        <li><i class="far fa-check"></i>Adobe XD
                                                                            Tutorials</li>
                                                                    </ul>
                                                                </div>
                                                                <div class="course-action">
                                                                    <a href="course-details.jsp"
                                                                        class="view-details-btn">View Details</a>
                                                                    <button class="wishlist-btn"><i
                                                                            class="flaticon-like"></i></button>
                                                                    <a href="course-details.jsp" class="c-share-btn"><i
                                                                            class="flaticon-previous"></i></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="student-course-footer">
                                                        <div class="student-course-linkter">
                                                            <div class="course-lessons">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="16.471"
                                                                    height="16.471" viewBox="0 0 16.471 16.471">
                                                                    <g id="blackboard-8" transform="translate(-0.008)">
                                                                        <path id="Path_106" data-name="Path 101"
                                                                            d="M16,1.222H8.726V.483a.483.483,0,1,0-.965,0v.74H.491A.483.483,0,0,0,.008,1.7V13.517A.483.483,0,0,0,.491,14H5.24L4.23,15.748a.483.483,0,1,0,.836.483L6.354,14H7.761v1.99a.483.483,0,0,0,.965,0V14h1.407l1.288,2.231a.483.483,0,1,0,.836-.483L11.247,14H16a.483.483,0,0,0,.483-.483V1.7A.483.483,0,0,0,16,1.222Zm-.483.965v8.905H.973V2.187Zm0,10.847H.973v-.976H15.514Z"
                                                                            fill="#575757" />
                                                                    </g>
                                                                </svg>
                                                                <span class="ms-2">12 Lessons</span>
                                                            </div>
                                                            <div class="portfolio-price">
                                                                <span>$12.57</span>
                                                                <del>$24.50</del>
                                                            </div>
                                                        </div>
                                                        <div class="student-course-text">
                                                            <h3><a href="course-details.jsp">WordPress Development
                                                                    Course for Plugins & Themes</a>
                                                            </h3>
                                                        </div>
                                                        <div class="portfolio-user">
                                                            <div class="user-icon">
                                                                <a href="instructor-profile.jsp"><i
                                                                        class="fas fa-user"></i>Danial</a>
                                                            </div>
                                                            <div class="course-icon">
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fal fa-star"></i>
                                                                <span>(25)</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-4 col-lg-6 col-md-6">
                                                <div class="course-wrapper-2 mb-30">
                                                    <div class="student-course-img">
                                                        <img src="${pageContext.request.contextPath}/img/course/course-02.jpg" alt="course-img">
                                                    </div>
                                                    <div class="course-cart">
                                                        <div class="course-info-wrapper">
                                                            <div class="cart-info-body">
                                                                <span class="category-color category-color-3"><a
                                                                        href="course.jsp">Business</a></span>
                                                                <a href="course-details.jsp">
                                                                    <h3>Write Better Emails: Tactics for Smarter Team
                                                                        Communication</h3>
                                                                </a>
                                                                <div class="cart-lavel">
                                                                    <h5>Level : <span>Beginner</span></h5>
                                                                    <p>Knowledge is power. Information is liberating.
                                                                        Education is the premise of
                                                                        progress, in every society, in every family</p>
                                                                </div>
                                                                <div class="info-cart-text">
                                                                    <ul>
                                                                        <li><i class="far fa-check"></i>Scratch to HTML
                                                                        </li>
                                                                        <li><i class="far fa-check"></i>Learn how to
                                                                            code in Python</li>
                                                                        <li><i class="far fa-check"></i>Unlimited
                                                                            backend database creation</li>
                                                                        <li><i class="far fa-check"></i>Adobe XD
                                                                            Tutorials</li>
                                                                    </ul>
                                                                </div>
                                                                <div class="course-action">
                                                                    <a href="course-details.jsp"
                                                                        class="view-details-btn">View Details</a>
                                                                    <button class="wishlist-btn"><i
                                                                            class="flaticon-like"></i></button>
                                                                    <a href="course-details.jsp" class="c-share-btn"><i
                                                                            class="flaticon-previous"></i></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="student-course-footer">
                                                        <div class="student-course-linkter">
                                                            <div class="course-lessons">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="16.471"
                                                                    height="16.471" viewBox="0 0 16.471 16.471">
                                                                    <g id="blackboard-35744"
                                                                        transform="translate(-0.008)">
                                                                        <path id="Path_10001" data-name="Path 101"
                                                                            d="M16,1.222H8.726V.483a.483.483,0,1,0-.965,0v.74H.491A.483.483,0,0,0,.008,1.7V13.517A.483.483,0,0,0,.491,14H5.24L4.23,15.748a.483.483,0,1,0,.836.483L6.354,14H7.761v1.99a.483.483,0,0,0,.965,0V14h1.407l1.288,2.231a.483.483,0,1,0,.836-.483L11.247,14H16a.483.483,0,0,0,.483-.483V1.7A.483.483,0,0,0,16,1.222Zm-.483.965v8.905H.973V2.187Zm0,10.847H.973v-.976H15.514Z"
                                                                            fill="#575757" />
                                                                    </g>
                                                                </svg>
                                                                <span class="ms-2">12 Lessons</span>
                                                            </div>
                                                            <div class="portfolio-price">
                                                                <span>FREE</span>
                                                            </div>
                                                        </div>
                                                        <div class="student-course-text">
                                                            <h3><a href="course-details.jsp">Write Better Emails:
                                                                    Tactics for Smarter Team
                                                                    Communication</a></h3>
                                                        </div>
                                                        <div class="portfolio-user">
                                                            <div class="user-icon">
                                                                <a href="instructor-profile.jsp"><i
                                                                        class="fas fa-user"></i>Eduman</a>
                                                            </div>
                                                            <div class="course-icon">
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fal fa-star"></i>
                                                                <span>(25)</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-4 col-lg-6 col-md-6">
                                                <div class="course-wrapper-2 mb-30">
                                                    <div class="student-course-img">
                                                        <img src="${pageContext.request.contextPath}/img/course/course-03.jpg" alt="course-img">
                                                    </div>
                                                    <div class="course-cart">
                                                        <div class="course-info-wrapper">
                                                            <div class="cart-info-body">
                                                                <span class="category-color category-color-1"><a
                                                                        href="course.jsp">Development</a></span>
                                                                <a href="course-details.jsp">
                                                                    <h3>Data Science Real-Life Data Science Exercises
                                                                        Included</h3>
                                                                </a>
                                                                <div class="cart-lavel">
                                                                    <h5>Level : <span>Beginner</span></h5>
                                                                    <p>Knowledge is power. Information is liberating.
                                                                        Education is the premise of
                                                                        progress, in every society, in every family</p>
                                                                </div>
                                                                <div class="info-cart-text">
                                                                    <ul>
                                                                        <li><i class="far fa-check"></i>Scratch to HTML
                                                                        </li>
                                                                        <li><i class="far fa-check"></i>Learn how to
                                                                            code in Python</li>
                                                                        <li><i class="far fa-check"></i>Unlimited
                                                                            backend database creation</li>
                                                                        <li><i class="far fa-check"></i>Adobe XD
                                                                            Tutorials</li>
                                                                    </ul>
                                                                </div>
                                                                <div class="course-action">
                                                                    <a href="course-details.jsp"
                                                                        class="view-details-btn">View Details</a>
                                                                    <button class="wishlist-btn"><i
                                                                            class="flaticon-like"></i></button>
                                                                    <a href="course-details.jsp" class="c-share-btn"><i
                                                                            class="flaticon-previous"></i></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="student-course-footer">
                                                        <div class="student-course-linkter">
                                                            <div class="course-lessons">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="16.471"
                                                                    height="16.471" viewBox="0 0 16.471 16.471">
                                                                    <g id="blackboard-300"
                                                                        transform="translate(-0.008)">
                                                                        <path id="Path_007" data-name="Path 101"
                                                                            d="M16,1.222H8.726V.483a.483.483,0,1,0-.965,0v.74H.491A.483.483,0,0,0,.008,1.7V13.517A.483.483,0,0,0,.491,14H5.24L4.23,15.748a.483.483,0,1,0,.836.483L6.354,14H7.761v1.99a.483.483,0,0,0,.965,0V14h1.407l1.288,2.231a.483.483,0,1,0,.836-.483L11.247,14H16a.483.483,0,0,0,.483-.483V1.7A.483.483,0,0,0,16,1.222Zm-.483.965v8.905H.973V2.187Zm0,10.847H.973v-.976H15.514Z"
                                                                            fill="#575757" />
                                                                    </g>
                                                                </svg>
                                                                <span class="ms-2">12 Lessons</span>
                                                            </div>
                                                            <div class="portfolio-price">
                                                                <span>$22.14</span>
                                                            </div>
                                                        </div>
                                                        <div class="student-course-text">
                                                            <h3><a href="course-details.jsp">Data Science Real-Life
                                                                    Data Science Exercises
                                                                    Included</a></h3>
                                                        </div>
                                                        <div class="portfolio-user">
                                                            <div class="user-icon">
                                                                <a href="instructor-profile.jsp"><i
                                                                        class="fas fa-user"></i>Mark Hanry</a>
                                                            </div>
                                                            <div class="course-icon">
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fal fa-star"></i>
                                                                <span>(25)</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
                                    <h4 class='mb-25'>Reviews</h4>
                                    <div class="student-profile-reviews">
                                        <div class="student-profile-reviews-item mb-30">
                                            <div class="student-profile-reviews-course-title">
                                                <h5>WordPress Development Course for Plugins and Themes</h5>
                                            </div>
                                            <div class="student-profile-reviews-text">
                                                <div class="student-profile-reviews-text-wrap mb-20">
                                                    <div class="student-profile-review-icon">
                                                        <a href="#"><i class="fas fa-star"></i></a>
                                                        <a href="#"><i class="fas fa-star"></i></a>
                                                        <a href="#"><i class="fas fa-star"></i></a>
                                                        <a href="#"><i class="fas fa-star"></i></a>
                                                        <a href="#"><i class="fas fa-star"></i></a>
                                                    </div>
                                                    <div class="student-profile-review-update">
                                                        <button type='button'
                                                            class='student-profile-review-update-btn'><i
                                                                class="far fa-edit"></i> Edit</button>
                                                        <button type='button'
                                                            class='student-profile-review-update-btn'><i
                                                                class="far fa-trash-alt"></i> Delete</button>
                                                    </div>
                                                </div>
                                                <div class="student-profile-review-content">
                                                    <p>Customer support is very quick, within same day or a few hours
                                                        even. Design and look is excellent for the target industry of
                                                        the Template.</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="student-profile-reviews-item mb-30">
                                            <div class="student-profile-reviews-course-title">
                                                <h5>Data Science Real-Life Data Science Exercises Included</h5>
                                            </div>
                                            <div class="student-profile-reviews-text">
                                                <div class="student-profile-reviews-text-wrap mb-20">
                                                    <div class="student-profile-review-icon">
                                                        <a href="#"><i class="fas fa-star"></i></a>
                                                        <a href="#"><i class="fas fa-star"></i></a>
                                                        <a href="#"><i class="fas fa-star"></i></a>
                                                        <a href="#"><i class="fas fa-star"></i></a>
                                                        <a href="#"><i class="fas fa-star"></i></a>
                                                    </div>
                                                    <div class="student-profile-review-update">
                                                        <button type='button'
                                                            class='student-profile-review-update-btn'><i
                                                                class="far fa-edit"></i> Edit</button>
                                                        <button type='button'
                                                            class='student-profile-review-update-btn'><i
                                                                class="far fa-trash-alt"></i> Delete</button>
                                                    </div>
                                                </div>
                                                <div class="student-profile-review-content">
                                                    <p>Very nice design and awesome design elements</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="quiz" role="tabpanel" aria-labelledby="quiz-tab">
                                    <p>No quiz attempts yet.</p>
                                </div>
                                <div class="tab-pane fade" id="history" role="tabpanel" aria-labelledby="history-tab">
                                    <h4 class='mb-25'>Order History</h4>
                                    <div class="student-profile-orders-wrapper">
                                        <div class="student-profile-orders">
                                            <div class="student-profile-order custom-height-80">
                                                <div class="student-profile-order-name">
                                                    <span>Basic</span>
                                                </div>
                                                <div class="student-profile-order-price">
                                                    <span>$19</span>
                                                </div>
                                                <div class="student-profile-order-duration">
                                                    <span>Quarterly</span>
                                                </div>
                                                <div class="student-profile-order-status">
                                                    <span>verified</span>
                                                </div>
                                                <div class="student-profile-order-method">
                                                    <span>sslcommerz</span>
                                                </div>
                                                <div class="student-profile-order-date">
                                                    <span>20-06-2022</span>
                                                </div>
                                                <div class="student-profile-order-renew">
                                                    <button type='button' class='edu-btn'>Renew</button>
                                                </div>
                                            </div>
                                            <div class="student-profile-order custom-height-80">
                                                <div class="student-profile-order-name">
                                                    <span>Standerd</span>
                                                </div>
                                                <div class="student-profile-order-price">
                                                    <span>$34</span>
                                                </div>
                                                <div class="student-profile-order-duration">
                                                    <span>Half-yearly</span>
                                                </div>
                                                <div class="student-profile-order-status">
                                                    <span>verified</span>
                                                </div>
                                                <div class="student-profile-order-method">
                                                    <span>sslcommerz</span>
                                                </div>
                                                <div class="student-profile-order-date">
                                                    <span>18-06-2022</span>
                                                </div>
                                                <div class="student-profile-order-renew">
                                                    <button type='button' class='edu-btn'>Renew</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="ques" role="tabpanel" aria-labelledby="ques-tab">
                                    <p>No question completed yet.</p>
                                </div>
                                <div class="tab-pane fade" id="setting" role="tabpanel" aria-labelledby="setting-tab">
                                    <h4 class='mb-25'>Settings</h4>
                                    <div class="student-profile-enroll">
                                        <ul class="nav mb-30" id="myTab" role="tablist">
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link active" id="profileA-tab" data-bs-toggle="tab"
                                                    data-bs-target="#profileA" type="button" role="tab"
                                                    aria-controls="profileA" aria-selected="true">Profile</button>
                                            </li>
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link" id="password-tab" data-bs-toggle="tab"
                                                    data-bs-target="#password" type="button" role="tab"
                                                    aria-controls="password" aria-selected="false">Password</button>
                                            </li>
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link" id="completedA-tab" data-bs-toggle="tab"
                                                    data-bs-target="#completedA" type="button" role="tab"
                                                    aria-controls="completedA" aria-selected="false">Social</button>
                                            </li>
                                        </ul>
                                        <div class="tab-content" id="myTabContent">
                                            <div class="tab-pane fade show active" id="profileA" role="tabpanel"
                                                aria-labelledby="profileA-tab">
                                                <div class="student-profile-settings">
                                                    <div class="student-profile-setting-img mb-40">
                                                        <div class="student-profile-setting-cover-img"
                                                            data-background="${pageContext.request.contextPath}/img/slider/course-slider.jpg">
                                                        </div>
                                                        <div class="student-profile-setting-author-img">
                                                            <img src="${pageContext.request.contextPath}/img/course/course-student.png" alt="" />
                                                        </div>
                                                    </div>
                                                    <form action="#">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="contact-from-input mb-20">
                                                                    <label htmlFor="FirstName">First Name</label>
                                                                    <input id='FirstName' type="text"
                                                                        placeholder="First Name" />
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="contact-from-input mb-20">
                                                                    <label htmlFor="LastName">Last Name</label>
                                                                    <input id='LastName' type="text"
                                                                        placeholder="Last Name" />
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="contact-from-input mb-20">
                                                                    <label htmlFor="User">User Name</label>
                                                                    <input id='User' type="text"
                                                                        placeholder="User Name" />
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="contact-from-input mb-20">
                                                                    <label htmlFor="Email">Email</label>
                                                                    <input id='Email' type="email"
                                                                        placeholder="Email" />
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="contact-from-input mb-20">
                                                                    <label htmlFor="Phone">Phone </label>
                                                                    <input id='Phone' type="text" placeholder="Phone" />
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="contact-from-input mb-20">
                                                                    <label htmlFor="Occupation">Occupation </label>
                                                                    <input id='Occupation' type="text"
                                                                        placeholder="Occupation " />
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <div class="contact-from-input mb-20">
                                                                    <label htmlFor="Bio">Biography </label>
                                                                    <textarea id='Bio'
                                                                        placeholder="Biography"></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-12">
                                                                <div class="cont-btn mb-20 mt-10">
                                                                    <button type='button' class="cont-btn">Update
                                                                        Profile</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="password" role="tabpanel"
                                                aria-labelledby="password-tab">
                                                <form action="#">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="contact-from-input mb-20">
                                                                <label htmlFor="Current">Current Password</label>
                                                                <input id='Current' type="password"
                                                                    placeholder="Type password" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="contact-from-input mb-20">
                                                                <label htmlFor="New">New Password</label>
                                                                <input id='New' type="password"
                                                                    placeholder="Type password" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="contact-from-input mb-20">
                                                                <label htmlFor="Retype">Re-type New Password</label>
                                                                <input id='Retype' type="password"
                                                                    placeholder="Type password" />
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-12">
                                                            <div class="cont-btn mb-20 mt-10">
                                                                <button type='button' class="cont-btn">Update
                                                                    Profile</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="tab-pane fade" id="completedA" role="tabpanel"
                                                aria-labelledby="completedA-tab">
                                                <div class="student-social-profile-link">
                                                    <span class='mb-20'>Social Profile Link</span>
                                                    <form action="#">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="contact-from-input mb-20">
                                                                    <input type="text"
                                                                        placeholder="Write Your Facebook URL" />
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="contact-from-input mb-20">
                                                                    <input type="text"
                                                                        placeholder="Write Your Twitter URL" />
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="contact-from-input mb-20">
                                                                    <input type="text"
                                                                        placeholder="Write Your Instagram URL" />
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="contact-from-input mb-20">
                                                                    <input type="text"
                                                                        placeholder="Write Your Linkedin URL" />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-12 ">
                                                                <div class="cont-btn mb-20 mt-10">
                                                                    <button type='button' class="cont-btn">Update
                                                                        Profile</button>
                                                                </div>
                                                            </div>
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
        <!-- User Profile End-->

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
                                        best
                                        plans to knowledge.</p>
                                </div>
                                <div class="footer-icon">
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-instagram"></i></a>
                                    <a href="#"> <i class="fab fa-linkedin-in"></i></a>
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


<!-- Mirrored from codeskdhaka.com/html/eduman-prv/eduman/user-profile.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 May 2024 15:25:29 GMT -->
</html>