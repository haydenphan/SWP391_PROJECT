<%-- 
    Document   : home
    Created on : May 16, 2024, 10:28:15 PM
    Author     : tuan6
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">


<!-- Mirrored from codeskdhaka.com/html/eduman-prv/eduman/index.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 May 2024 15:24:17 GMT -->
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
               <img class="loading-logo" src="assets/img/logo/preloader.svg" alt="">
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
                        
                     </a>
                  </div>
                  <div class="col-3 text-end"><button class="side-info-close"><i class="fal fa-times"></i></button>
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


   <!-- header note area start  -->
   <div class="header-note-area p-relative d-none d-md-block">
      <div class="container-fluid">
         <div class="note-text text-center">
            <p>Enroll now and get <span>40% off</span> any course. Courses from <span>$5. 99</span>.</p>
         </div>
      </div>
      <div class="eduman-header-notice-action-close">
         <button><i class="fal fa-times"></i></button>
      </div>
   </div>
   <!-- header note area end -->

   <!-- header-area-start  -->
   <header>
      <div class="header-area header-transparent sticky-header">
         <div class="container-fluid">
            <div class="header-main-wrapper">
               <div class="row align-items-center">
                  <div class="col-xl-7 col-lg-7 col-md-5 col-sm-9 col-9">
                     <div class="header-left d-flex align-items-center">
                        <div class="header-logo">
                           
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
                                       <li class="item-has-children"><a href="course.jsp">Health & Fitness</a>
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
      <!-- hero-area-sart -->
      <section class="slider-area hero-height position-relative fix" data-background="assets/img/slider/Image.jpg">
         <img class="shape-3 d-none d-xxl-block" src="${pageContext.request.contextPath}/img/shape/shape-03.png" alt="image not found">
         <div class="container">
            <div class="row">
               <div class="col-xl-6 col-lg-6 col-md-6">
                  <div class="hero-text pt-95">
                     <h5>Discover your journey</h5>
                     <h2>Discover <span class="down-mark-line">4500+</span> Courses
                        from top Instructors
                        Around the World</h2>
                     <p>Take your learning organization to the next level. to the next level. Who'll
                        share their knowledge to people around the world.</p>
                     <div class="hero-btn">
                        <a class="edu-btn" href="course.jsp">View all course</a>
                     </div>
                  </div>
               </div>
               <div class="col-xl-6 col-lg-6 col-md-6">
                  <div class="hero-right position-relative">
                     <img data-depth="0.2" class="shape shape-1" src="${pageContext.request.contextPath}/img/shape/shape-01.png" alt="shape">
                     <img data-depth="0.2" class="shape-2" src="${pageContext.request.contextPath}/img/shape/shape-02.png" alt="shape">
                     <img class="shape-6" src="${pageContext.request.contextPath}/img/shape/slider-shape-6.png" alt="shape">
                     <div class="shape-4">
                        <img class="" src="${pageContext.request.contextPath}/img/shape/shape-04.png" alt="shape">
                        <h5 class="hero-shape-text">Top Rated
                           Instructors</h5>
                     </div>
                     <div class="shape-5">
                        <div class="course-card">
                           <img src="${pageContext.request.contextPath}/img/shape/slider-card-1.png" alt="image not found">
                           <img src="${pageContext.request.contextPath}/img/shape/slider-card-2.png" alt="image not found">
                           <img src="${pageContext.request.contextPath}/img/shape/slider-card-3.png" alt="image not found">
                           <img src="${pageContext.request.contextPath}/img/shape/slider-card-4.png" alt="image not found">
                           <span><i class="far fa-plus"></i></span>
                        </div>
                        <h5>More than <span>21,500+</span> students
                           enrolled around the world</h5>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- slider-area-end -->

      <!-- catagory-area-start -->
      <div class="top-catagory-area pt-110 pb-90">
         <div class="container">
            <div class="row">
               <div class="col-xl-4 offset-xl-4 col-lg-6 offset-lg-3 col-md-12 col-sm justify-content-center mb-30">
                  <div class="section-title mb-20 text-center">
                     <h2>Explore <br> Our Top <span class="down-mark-line">Categories</span></h2>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-xl-4 col-lg-6 col-md-6">
                  <a href="course.jsp">

                     <div class="catagory-wrapper mb-30">
                        <div class="catagory-thumb">
                           <svg xmlns="http://www.w3.org/2000/svg" width="45" height="45.01" viewBox="0 0 45 45.01">
                              <g id="code" transform="translate(-0.061)">
                                 <path id="Path_8754" data-name="Path 8754"
                                    d="M29.775,60.8a8.79,8.79,0,0,1-5.352-8.1V28.787A8.777,8.777,0,0,1,33.19,20H27.852a8.791,8.791,0,0,0-8.791,8.791V52.7a8.791,8.791,0,0,0,8.791,8.791h1.886C29.746,61.262,29.758,61.032,29.775,60.8Z"
                                    transform="translate(-17.33 -18.242)" fill="#c8d6f0" />
                                 <path id="Path_8755" data-name="Path 8755"
                                    d="M11.753,45.01H10.61A10.561,10.561,0,0,1,.061,34.461V10.549A10.561,10.561,0,0,1,10.61,0H26.786A10.561,10.561,0,0,1,37.335,10.549V22.5a1.758,1.758,0,0,1-3.516,0V10.549a7.041,7.041,0,0,0-7.033-7.033H10.61a7.041,7.041,0,0,0-7.033,7.033V34.461a7.041,7.041,0,0,0,7.033,7.033h1.143A1.758,1.758,0,0,1,11.753,45.01ZM30.214,16.175a1.758,1.758,0,0,0-1.758-1.758H25.467A2.64,2.64,0,0,1,22.83,11.78V8.791a1.758,1.758,0,0,0-3.516,0V11.78a6.161,6.161,0,0,0,6.154,6.154h2.989A1.758,1.758,0,0,0,30.214,16.175Z"
                                    transform="translate(0)" fill="#2467ec" />
                                 <path id="Path_8756" data-name="Path 8756"
                                    d="M181.9,329.576a1.758,1.758,0,0,1-1.233-3.011l4.592-4.519a1.747,1.747,0,0,0,0-2.462l-4.6-4.586a1.758,1.758,0,1,1,2.483-2.489l4.6,4.586a5.28,5.28,0,0,1,0,7.446l-.008.008-4.6,4.524A1.753,1.753,0,0,1,181.9,329.576Zm-15.1-.525a1.758,1.758,0,0,0-.02-2.486l-4.592-4.519a1.747,1.747,0,0,1,0-2.463l4.6-4.586a1.758,1.758,0,1,0-2.483-2.489l-4.6,4.585a5.28,5.28,0,0,0,0,7.446l.008.008,4.6,4.524a1.758,1.758,0,0,0,2.486-.02Zm6.59-.747,4.044-14.066a1.758,1.758,0,0,0-3.38-.972l-4.044,14.066a1.758,1.758,0,1,0,3.38.972Z"
                                    transform="translate(-144.217 -284.566)" fill="#ffb013" />
                              </g>
                           </svg>
                        </div>
                        <div class="catagory-content">
                           <h3>Development</h3>
                           <span>Take your journey with this course</span>
                        </div>
                     </div>
                  </a>
               </div>
               <div class="col-xl-4 col-lg-6 col-md-6">
                  <a href="course.jsp">

                     <div class="catagory-wrapper mb-30">
                        <div class="catagory-thumb">
                           <svg id="briefcase" xmlns="http://www.w3.org/2000/svg" width="45" height="45"
                              viewBox="0 0 45 45">
                              <path id="Path_8750" data-name="Path 8750"
                                 d="M25.273,163.906V147.031A7.031,7.031,0,0,1,32.3,140H27.031A7.031,7.031,0,0,0,20,147.031v16.875a7.031,7.031,0,0,0,7.031,7.031H32.3A7.031,7.031,0,0,1,25.273,163.906Z"
                                 transform="translate(-18.242 -127.695)" fill="#c9d7f1" />
                              <path id="Path_8751" data-name="Path 8751"
                                 d="M171.82,7.031a1.758,1.758,0,0,1-1.758-1.758A1.76,1.76,0,0,0,168.3,3.516h-7.031a1.76,1.76,0,0,0-1.758,1.758,1.758,1.758,0,0,1-3.516,0A5.279,5.279,0,0,1,161.273,0H168.3a5.279,5.279,0,0,1,5.273,5.273A1.758,1.758,0,0,1,171.82,7.031Z"
                                 transform="translate(-142.289)" fill="#ffb013" />
                              <g id="Group_4443" data-name="Group 4443" transform="translate(0 10.547)">
                                 <path id="Path_8752" data-name="Path 8752"
                                    d="M36.211,154.453H8.789A8.8,8.8,0,0,1,0,145.664V128.789A8.8,8.8,0,0,1,8.789,120H36.211A8.8,8.8,0,0,1,45,128.789v16.875A8.8,8.8,0,0,1,36.211,154.453ZM8.789,123.516a5.279,5.279,0,0,0-5.273,5.273v16.875a5.279,5.279,0,0,0,5.273,5.273H36.211a5.279,5.279,0,0,0,5.273-5.273V128.789a5.279,5.279,0,0,0-5.273-5.273Z"
                                    transform="translate(0 -120)" fill="#2467ec" />
                                 <path id="Path_8753" data-name="Path 8753"
                                    d="M109.18,196a1.758,1.758,0,0,0-1.758,1.758,5.279,5.279,0,0,1-5.273,5.273H88.789a5.279,5.279,0,0,1-5.273-5.273,1.758,1.758,0,0,0-3.516,0,8.8,8.8,0,0,0,8.789,8.789h4.922V208.3a1.758,1.758,0,1,0,3.516,0v-1.758h4.922a8.8,8.8,0,0,0,8.789-8.789A1.758,1.758,0,0,0,109.18,196Z"
                                    transform="translate(-72.969 -189.32)" fill="#2467ec" />
                              </g>
                           </svg>

                        </div>
                        <div class="catagory-content">
                           <h3>Business</h3>
                           <span>Take your journey with this course</span>
                        </div>
                     </div>
                  </a>
               </div>
               <div class="col-xl-4 col-lg-6 col-md-6">
                  <a href="course.jsp">

                     <div class="catagory-wrapper mb-30">
                        <div class="catagory-thumb">
                           <svg id="collection" xmlns="http://www.w3.org/2000/svg" width="44.998" height="44.998"
                              viewBox="0 0 44.998 44.998">
                              <path id="Path_8761" data-name="Path 8761"
                                 d="M25.273,341.834v-.439A4.394,4.394,0,0,1,29.668,337H24.394A4.394,4.394,0,0,0,20,341.394v.439a8.789,8.789,0,0,0,8.789,8.789h5.273A8.789,8.789,0,0,1,25.273,341.834Z"
                                 transform="translate(-18.242 -307.382)" fill="#c9d7f1" />
                              <path id="Path_8762" data-name="Path 8762"
                                 d="M39.725,24.433a1.758,1.758,0,0,1-1.758-1.758V10.546a7.039,7.039,0,0,0-7.031-7.031H14.062a7.039,7.039,0,0,0-7.031,7.031V22.675a1.758,1.758,0,0,1-3.515,0V10.546A10.558,10.558,0,0,1,14.062,0H30.936A10.558,10.558,0,0,1,41.483,10.546V22.675A1.758,1.758,0,0,1,39.725,24.433Zm-13.271-12.3a2.2,2.2,0,1,0-2.2-2.2A2.2,2.2,0,0,0,26.454,12.128ZM45,34.452v-.439a6.159,6.159,0,0,0-6.152-6.152h-5.7a7.041,7.041,0,0,0-6.3,3.883,4.85,4.85,0,0,1-8.687,0,7.041,7.041,0,0,0-6.3-3.883h-5.7A6.159,6.159,0,0,0,0,34.012v.439A10.558,10.558,0,0,0,10.546,45H34.452A10.558,10.558,0,0,0,45,34.452ZM11.854,31.376A3.5,3.5,0,0,1,15,33.291a8.352,8.352,0,0,0,15,0,3.5,3.5,0,0,1,3.145-1.915h5.7a2.64,2.64,0,0,1,2.637,2.637v.439a7.039,7.039,0,0,1-7.031,7.031H10.546a7.039,7.039,0,0,1-7.031-7.031v-.439a2.64,2.64,0,0,1,2.637-2.637Z"
                                 fill="#2467ec" />
                              <path id="Path_8763" data-name="Path 8763"
                                 d="M123.758,157.5a1.758,1.758,0,0,1-1.293-2.948s3.5-3.8,3.537-3.834a6.137,6.137,0,0,1,7.93-.251l.023.018,2.673,2.186c1.263.994,2.255.93,3.311-.214l2.528-2.964a1.758,1.758,0,1,1,2.675,2.281s-2.575,3.018-2.588,3.033a5.778,5.778,0,0,1-4.115,2.079,6.174,6.174,0,0,1-4-1.466l-.022-.018-2.673-2.186a2.63,2.63,0,0,0-3.334.067l-3.355,3.648A1.753,1.753,0,0,1,123.758,157.5Z"
                                 transform="translate(-111.278 -135.796)" fill="#ffb013" />
                           </svg>
                        </div>
                        <div class="catagory-content">
                           <h3>Data Science</h3>
                           <span>Discover the data science</span>
                        </div>
                     </div>
                  </a>
               </div>
               <div class="col-xl-4 col-lg-6 col-md-6">
                  <a href="course.jsp">

                     <div class="catagory-wrapper mb-30">
                        <div class="catagory-thumb">
                           <svg id="content-marketing" xmlns="http://www.w3.org/2000/svg" width="45" height="45"
                              viewBox="0 0 45 45">
                              <path id="Path_8764" data-name="Path 8764"
                                 d="M54.784,57.956l-1.251,1.251L47.37,53.046a10.955,10.955,0,0,1-3-5.6l-1-4.98,4.98,1c.168.034.334.072.5.114l1.316,7.169a10.955,10.955,0,0,0,3,5.6Zm-29.51-6.173V27.877a8.789,8.789,0,0,1,8.789-8.789l18.628-.068,0-.019-23.906.088A8.789,8.789,0,0,0,20,27.877V51.783a8.789,8.789,0,0,0,8.789,8.789l4.575-.028A8.79,8.79,0,0,1,25.273,51.783Z"
                                 transform="translate(-18.242 -17.33)" fill="#c9d7f1" />
                              <path id="Path_8765" data-name="Path 8765"
                                 d="M27.246,45h-16.7A10.559,10.559,0,0,1,0,34.453V10.547A10.559,10.559,0,0,1,10.547,0H34.453A10.559,10.559,0,0,1,45,10.547V27.378a1.758,1.758,0,1,1-3.516,0V10.547a7.039,7.039,0,0,0-7.031-7.031H10.547a7.039,7.039,0,0,0-7.031,7.031V34.453a7.039,7.039,0,0,0,7.031,7.031h16.7a1.758,1.758,0,1,1,0,3.516Zm15.875-1.879a6.423,6.423,0,0,0,0-9.074l-6.162-6.162a12.672,12.672,0,0,0-6.5-3.477l-4.98-1a1.758,1.758,0,0,0-2.068,2.068l1,4.98a12.673,12.673,0,0,0,3.477,6.5l6.162,6.162a6.416,6.416,0,0,0,9.074,0ZM29.772,27.856a9.167,9.167,0,0,1,4.7,2.515l6.162,6.162a2.9,2.9,0,1,1-4.1,4.1l-6.162-6.162a9.168,9.168,0,0,1-2.515-4.7l-.479-2.4Z"
                                 fill="#2467ec" />
                              <path id="Path_8766" data-name="Path 8766"
                                 d="M125.664,103.131H109.58a1.758,1.758,0,0,1,0-3.516h16.084a1.758,1.758,0,0,1,0,3.516Zm1.758,5.273a1.758,1.758,0,0,0-1.758-1.758H101.758a1.758,1.758,0,0,0,0,3.516h23.906A1.758,1.758,0,0,0,127.422,108.4Zm-17.578,7.031a1.758,1.758,0,0,0-1.758-1.758h-6.328a1.758,1.758,0,0,0,0,3.516h6.328A1.758,1.758,0,0,0,109.844,115.436ZM100,101.2a2.2,2.2,0,1,0,2.2-2.2A2.2,2.2,0,0,0,100,101.2Z"
                                 transform="translate(-91.211 -90.299)" fill="#ffb013" />
                           </svg>

                        </div>
                        <div class="catagory-content">
                           <h3>Marketing</h3>
                           <span>Take up your self in the next level</span>
                        </div>
                     </div>
                  </a>
               </div>
               <div class="col-xl-4 col-lg-6 col-md-6">
                  <a href="course.jsp">

                     <div class="catagory-wrapper mb-30">
                        <div class="catagory-thumb">
                           <svg id="Swimming_Pool" xmlns="http://www.w3.org/2000/svg" width="45" height="45"
                              viewBox="0 0 45 45">
                              <g id="Group_4446" data-name="Group 4446" transform="translate(1.758 12.305)">
                                 <path id="Path_8767" data-name="Path 8767"
                                    d="M25.273,163.906V147.031A7.031,7.031,0,0,1,32.3,140H27.031A7.031,7.031,0,0,0,20,147.031v16.875a7.031,7.031,0,0,0,7.031,7.031H32.3A7.031,7.031,0,0,1,25.273,163.906Z"
                                    transform="translate(-20 -140)" fill="#c9d7f1" />
                              </g>
                              <path id="Path_8768" data-name="Path 8768"
                                 d="M36.211,10.547H31.289V5.273a1.758,1.758,0,0,1,3.516,0,1.758,1.758,0,0,0,3.516,0,5.273,5.273,0,0,0-10.547,0v5.273H17.227V5.273a1.758,1.758,0,0,1,3.516,0,1.758,1.758,0,0,0,3.516,0,5.273,5.273,0,0,0-10.547,0v5.273H8.789A8.8,8.8,0,0,0,0,19.336V36.211A8.8,8.8,0,0,0,8.789,45H36.211A8.8,8.8,0,0,0,45,36.211V19.336A8.8,8.8,0,0,0,36.211,10.547Zm-8.437,3.516v3.516H17.227V14.063ZM41.484,36.211a5.279,5.279,0,0,1-5.273,5.273H8.789a5.279,5.279,0,0,1-5.273-5.273V19.336a5.279,5.279,0,0,1,5.273-5.273h4.922v11.6a1.758,1.758,0,0,0,3.516,0v-4.57H27.773v4.57a1.758,1.758,0,0,0,3.516,0v-11.6h4.922a5.279,5.279,0,0,1,5.273,5.273Z"
                                 fill="#2467ec" />
                              <path id="Path_8769" data-name="Path 8769"
                                 d="M105.883,352a1.758,1.758,0,0,0-1.758,1.758,1.758,1.758,0,0,1-3.516,0,1.758,1.758,0,0,0-3.516,0,1.758,1.758,0,0,1-3.516,0,1.758,1.758,0,0,0-3.516,0,1.758,1.758,0,0,1-3.516,0,1.758,1.758,0,0,0-3.516,0,1.758,1.758,0,0,1-3.516,0,1.758,1.758,0,0,0-3.516,0,5.27,5.27,0,0,0,8.789,3.926,5.261,5.261,0,0,0,7.031,0,5.261,5.261,0,0,0,7.031,0,5.27,5.27,0,0,0,8.789-3.926A1.758,1.758,0,0,0,105.883,352Z"
                                 transform="translate(-69.32 -321.063)" fill="#ffb013" />
                           </svg>
                        </div>
                        <div class="catagory-content">
                           <h3>Life Styles</h3>
                           <span>Improved your life style course</span>
                        </div>
                     </div>
                  </a>
               </div>
               <div class="col-xl-4 col-lg-6 col-md-6">
                  <a href="course.jsp">

                     <div class="catagory-wrapper mb-30">
                        <div class="catagory-thumb">
                           <svg xmlns="http://www.w3.org/2000/svg" width="45" height="44.991" viewBox="0 0 45 44.991">
                              <g id="no-photo" transform="translate(0 -0.049)">
                                 <path id="Path_8770" data-name="Path 8770"
                                    d="M41.972,125.675l-.773.881a8.788,8.788,0,1,1,1.983-17.129A8.81,8.81,0,0,0,41.972,125.675Zm-11.035-23.8-4.15.015A8.787,8.787,0,0,0,18,110.679v14.148a8.787,8.787,0,0,0,8.787,8.787l4.575-.027a8.788,8.788,0,0,1-8.089-8.76V110.679A8.885,8.885,0,0,1,30.937,101.876Z"
                                    transform="translate(-16.418 -92.879)" fill="#c9d7f1" />
                                 <path id="Path_8771" data-name="Path 8771"
                                    d="M23.9,42.316H10.545A10.557,10.557,0,0,1,0,31.771V17.624A10.557,10.557,0,0,1,10.545,7.079h1.718l.682-2.106A7.1,7.1,0,0,1,19.714.049h8.647a7.1,7.1,0,0,1,6.77,4.924l.713,2.2a10.6,10.6,0,0,1,9.147,10.453V23.6a1.758,1.758,0,0,1-3.515,0V17.624a7.051,7.051,0,0,0-6.957-7.029A1.757,1.757,0,0,1,32.866,9.38L31.787,6.057a3.591,3.591,0,0,0-3.426-2.493H19.714a3.591,3.591,0,0,0-3.425,2.492L15.213,9.378a1.757,1.757,0,0,1-1.672,1.216h-3a7.038,7.038,0,0,0-7.03,7.03V31.772a7.038,7.038,0,0,0,7.03,7.03H23.9A1.757,1.757,0,0,1,23.9,42.316Zm1.017-6.887a1.758,1.758,0,0,0-.277-3.5,7.047,7.047,0,0,1-7.594-7.008c.289-9.081,13.321-9.412,14.051-.353a1.757,1.757,0,0,0,3.511-.173c-1.1-13.6-20.643-13.093-21.077.526A10.557,10.557,0,0,0,24.077,35.462c.28,0,.564-.011.842-.033Z"
                                    fill="#2467ec" />
                                 <path id="Path_8772" data-name="Path 8772"
                                    d="M219.527,83.564h-7.654a1.758,1.758,0,0,1,0-3.515h7.654A1.758,1.758,0,0,1,219.527,83.564Zm11.528,26.362,5.084-5.084a1.758,1.758,0,0,0-2.485-2.486l-5.084,5.084-5.084-5.084A1.758,1.758,0,0,0,221,104.842l5.084,5.084L221,115.01a1.757,1.757,0,0,0,2.485,2.486l5.084-5.084,5.084,5.084a1.757,1.757,0,1,0,2.485-2.486Z"
                                    transform="translate(-191.662 -72.97)" fill="#ffb013" />
                              </g>
                           </svg>
                        </div>
                        <div class="catagory-content">
                           <h3>Photography</h3>
                           <span>Become the great photographer</span>
                        </div>
                     </div>
                  </a>
               </div>
               <div class="col-xl-4 col-lg-6 col-md-6">
                  <a href="course.jsp">

                     <div class="catagory-wrapper mb-30">
                        <div class="catagory-thumb">
                           <svg id="Vector" xmlns="http://www.w3.org/2000/svg" width="45" height="45"
                              viewBox="0 0 45 45">
                              <g id="Group_4444" data-name="Group 4444" transform="translate(8.437 5.273)">
                                 <path id="Path_8757" data-name="Path 8757"
                                    d="M102.3,82.877a3.516,3.516,0,0,1-.531-4.292l10.547-16.875a3.526,3.526,0,0,1,.38-.518,3.515,3.515,0,0,0-5.653.518L96.5,78.584a3.515,3.515,0,0,0,.531,4.292l7.031,7.031a3.5,3.5,0,0,0,2.486,1.03h5.273a3.5,3.5,0,0,1-2.486-1.03Z"
                                    transform="translate(-95.997 -60)" fill="#c9d7f1" />
                              </g>
                              <g id="Group_4445" data-name="Group 4445" transform="translate(0)">
                                 <path id="Path_8758" data-name="Path 8758"
                                    d="M171.82,472H157.758a1.758,1.758,0,0,0,0,3.516H171.82a1.758,1.758,0,0,0,0-3.516Z"
                                    transform="translate(-142.289 -430.516)" fill="#2467ec" />
                                 <path id="Path_8759" data-name="Path 8759"
                                    d="M39.727,0a5.282,5.282,0,0,0-4.971,3.516H10.245a5.273,5.273,0,1,0,0,3.516H17.38l-9.934,15.9-.017.027a5.271,5.271,0,0,0,.8,6.439l7.031,7.031a5.239,5.239,0,0,0,3.729,1.545h7.031a5.239,5.239,0,0,0,3.729-1.545l7.031-7.031a5.272,5.272,0,0,0,.8-6.439l-.017-.027L27.62,7.031h7.136A5.273,5.273,0,1,0,39.727,0ZM5.273,7.031A1.758,1.758,0,1,1,7.031,5.273,1.76,1.76,0,0,1,5.273,7.031Zm18.736.856c.017.029-.47-.752,10.554,16.886a1.758,1.758,0,0,1-.273,2.133l-7.031,7.031a1.747,1.747,0,0,1-1.243.515H18.984a1.746,1.746,0,0,1-1.243-.515L10.71,26.907a1.758,1.758,0,0,1-.273-2.133C21.474,7.114,20.968,7.924,20.991,7.887a1.759,1.759,0,0,1,3.019,0Zm15.717-.856a1.758,1.758,0,1,1,1.758-1.758A1.76,1.76,0,0,1,39.727,7.031Z"
                                    transform="translate(0)" fill="#2467ec" />
                              </g>
                              <path id="Path_8760" data-name="Path 8760"
                                 d="M204.789,162.547h-1.758v-8.789a1.758,1.758,0,1,0-3.516,0v8.789h-1.758a1.758,1.758,0,1,0,0,3.516h7.031a1.758,1.758,0,0,0,0-3.516Z"
                                 transform="translate(-178.773 -138.641)" fill="#ffb013" />
                           </svg>

                        </div>
                        <div class="catagory-content">
                           <h3>Art & Design</h3>
                           <span>Grow your design skills</span>
                        </div>
                     </div>
                  </a>
               </div>
               <div class="col-xl-4 col-lg-6 col-md-6">
                  <a href="course.jsp">

                     <div class="catagory-wrapper mb-30">
                        <div class="catagory-thumb">
                           <svg id="make" xmlns="http://www.w3.org/2000/svg" width="45" height="45" viewBox="0 0 45 45">
                              <path id="Path_8773" data-name="Path 8773"
                                 d="M42.061,119.6a4.834,4.834,0,0,1-4.834-4.834V99.834A4.834,4.834,0,0,1,42.071,95l1.376.7a4.809,4.809,0,0,0-1.035,2.988v16.084a4.834,4.834,0,0,0,4.834,4.834Zm-16.655,1.988v.4a5.274,5.274,0,0,1,4.114-5.144l-.2-.129H25.273A5.273,5.273,0,0,0,20,121.982v-.4a4.79,4.79,0,0,0,4.79,4.79H30.2A4.79,4.79,0,0,1,25.405,121.587Z"
                                 transform="translate(-18.242 -86.65)" fill="#c9d7f1" />
                              <path id="Path_8774" data-name="Path 8774"
                                 d="M7.91,83.426A5.713,5.713,0,1,0,2.2,77.713,5.719,5.719,0,0,0,7.91,83.426Zm0-7.91a2.2,2.2,0,1,1-2.2,2.2A2.2,2.2,0,0,1,7.91,75.516Zm35.332,6.416a1.758,1.758,0,0,0-1.758,1.758v16.875a3.08,3.08,0,0,1-3.076,3.076H6.592a3.076,3.076,0,0,1,0-6.152h5.977a1.757,1.757,0,0,0,.572-3.418,5.713,5.713,0,1,0-9.983.871,6.59,6.59,0,0,0,2.116,12.083v1.89a1.758,1.758,0,0,0,3.516,0v-1.758H36.738v1.758a1.758,1.758,0,0,0,3.516,0v-2.023A6.6,6.6,0,0,0,45,100.564V83.689A1.758,1.758,0,0,0,43.242,81.932ZM7.91,89.578a2.2,2.2,0,1,1-2.2,2.2A2.2,2.2,0,0,1,7.91,89.578Zm9.316,3.955V78.6a6.592,6.592,0,0,1,6.591-6.592h.015a1.758,1.758,0,0,1,0,3.516h-.011A3.076,3.076,0,0,0,20.742,78.6V93.533a3.08,3.08,0,0,0,3.076,3.076H36.211a1.758,1.758,0,0,1,0,3.516H23.818A6.6,6.6,0,0,1,17.227,93.533Z"
                                 transform="translate(0 -65.672)" fill="#2467ec" />
                              <path id="Path_8775" data-name="Path 8775"
                                 d="M320.789,15.854a5.148,5.148,0,0,1-3.088-1.021c-3.659-2.74-5.631-6.029-5.7-9.513,0-.012,0-.024,0-.036a5.271,5.271,0,0,1,8.789-3.938,5.271,5.271,0,0,1,8.789,3.938c0,.012,0,.024,0,.036-.07,3.483-2.042,6.773-5.7,9.513A5.148,5.148,0,0,1,320.789,15.854ZM315.516,5.268c.07,2.974,2.372,5.312,4.293,6.75a1.645,1.645,0,0,0,1.961,0c1.921-1.438,4.223-3.776,4.293-6.75a1.758,1.758,0,0,0-3.516.005,1.758,1.758,0,0,1-3.516,0,1.758,1.758,0,0,0-3.516-.005Z"
                                 transform="translate(-284.578)" fill="#ffb013" />
                           </svg>
                        </div>
                        <div class="catagory-content">
                           <h3>Health & Fitness</h3>
                           <span>Enjoy the health life with fitness</span>
                        </div>
                     </div>
                  </a>
               </div>
               <div class="col-xl-4 col-lg-6 col-md-6">
                  <a href="course.jsp">

                     <div class="catagory-wrapper mb-30">
                        <div class="catagory-thumb">
                           <svg xmlns="http://www.w3.org/2000/svg" width="45" height="42.172" viewBox="0 0 45 42.172">
                              <g id="electric-guitar" transform="translate(0 -18.851)">
                                 <path id="Path_8776" data-name="Path 8776"
                                    d="M30.011,203.348a15.8,15.8,0,0,1-4.5-11.3c0-5.045,3.023-7.333,6.337-8.894v-1.913C27.529,183.452,20,184.548,20,192.511a15.385,15.385,0,0,0,15.8,15.8,9.708,9.708,0,0,0,3.461-.584A15.272,15.272,0,0,1,30.011,203.348Z"
                                    transform="translate(-18.163 -149.122)" fill="#c9d7f1" />
                                 <g id="Group_4447" data-name="Group 4447" transform="translate(0 18.851)">
                                    <path id="Path_8777" data-name="Path 8777"
                                       d="M44.41,20.885l-1.136-1.051a3.658,3.658,0,0,0-5.109.116L28.5,30.005a1.059,1.059,0,0,1-1.15.251,1.034,1.034,0,0,1-.7-.915,7.077,7.077,0,0,1,.207-2.56,4.725,4.725,0,0,0-.6-4.154,4.909,4.909,0,0,0-3.755-2.1,5.3,5.3,0,0,0-4.264,2.068A18.642,18.642,0,0,0,16.036,26.5a11.708,11.708,0,0,1-1.7,2.981l-.025.025a13.884,13.884,0,0,1-4.136,2.139A22.873,22.873,0,0,0,3.593,35.2,10.327,10.327,0,0,0,0,43.389c0,2.327.492,8.207,5.038,12.6,4.389,4.546,10.269,5.038,12.6,5.038a10.327,10.327,0,0,0,8.185-3.593,22.871,22.871,0,0,0,3.558-6.586,14.063,14.063,0,0,1,2.162-4.159l0,0,0,0a11.735,11.735,0,0,1,2.979-1.694,18.639,18.639,0,0,0,3.908-2.206A5.3,5.3,0,0,0,40.5,38.518a4.909,4.909,0,0,0-2.1-3.755,4.726,4.726,0,0,0-4.154-.6,1.837,1.837,0,0,0,1.115,3.5,1.038,1.038,0,0,1,.949.118,1.245,1.245,0,0,1,.524.924,1.629,1.629,0,0,1-.71,1.218,16.156,16.156,0,0,1-3.143,1.729,13.5,13.5,0,0,0-4.07,2.469,15.954,15.954,0,0,0-2.937,5.349c-1.915,4.758-3.53,7.877-8.335,7.877a14.043,14.043,0,0,1-9.972-3.936l-.052-.052a14.043,14.043,0,0,1-3.936-9.972c0-4.806,3.119-6.42,7.877-8.335a15.951,15.951,0,0,0,5.35-2.938,13.5,13.5,0,0,0,2.468-4.07A16.163,16.163,0,0,1,21.1,24.9a1.633,1.633,0,0,1,1.218-.71,1.246,1.246,0,0,1,.924.523,1.038,1.038,0,0,1,.118.949,10.613,10.613,0,0,0-.369,3.953,4.754,4.754,0,0,0,8.117,2.972L40.78,22.531l1.136,1.051a1.837,1.837,0,1,0,2.494-2.7Z"
                                       transform="translate(0 -18.851)" fill="#2467ec" />
                                    <path id="Path_8778" data-name="Path 8778"
                                       d="M202.537,204.451a1.837,1.837,0,0,0,0,2.6l4.592,4.592a1.837,1.837,0,1,0,2.6-2.6l-4.592-4.592A1.837,1.837,0,0,0,202.537,204.451Z"
                                       transform="translate(-183.447 -188.559)" fill="#2467ec" />
                                 </g>
                                 <path id="Path_8779" data-name="Path 8779"
                                    d="M101.573,269.179a1.832,1.832,0,0,1-1.3-.538l-4.592-4.592a1.837,1.837,0,0,1,2.6-2.6l4.592,4.592a1.837,1.837,0,0,1-1.3,3.136Zm-3.844,4.605a1.837,1.837,0,0,0,0-2.6l-4.592-4.592a1.837,1.837,0,1,0-2.6,2.6l4.592,4.592a1.837,1.837,0,0,0,2.6,0Z"
                                    transform="translate(-81.734 -221.473)" fill="#ffb013" />
                              </g>
                           </svg>

                        </div>
                        <div class="catagory-content">
                           <h3>Music</h3>
                           <span>Improve your self with music</span>
                        </div>
                     </div>
                  </a>
               </div>
            </div>
         </div>
      </div>
      <!-- catagory-area-end -->

      <!-- portfolio main area start  -->
      <section class="course-area p-relative pt-110 pb-90">
         <div class="course-shape-1">
            <img src="${pageContext.request.contextPath}/img/shape/portfolio-shap-1.png" alt="shape">
         </div>
         <div class="course-shape-2">
            <img src="${pageContext.request.contextPath}/img/shape/portfolio-shap-2.png" alt="shape">
         </div>
         <div class="course-shape-3">
            <img src="${pageContext.request.contextPath}/img/shape/portfolio-shap-3.png" alt="shape">
         </div>
         <div class="container">
            <div class="row">
               <div class="col-xl-5 col-lg-5 f-left">
                  <div class="section-title mb-50">
                     <h2>Discover<br>
                        World's Best <span class="down-mark-line">Courses</span></h2>
                  </div>
               </div>
               <div class="col-xl-7 col-lg-7">
                  <div class="portfolio-button mt-60">
                     <button class="active" data-filter="*">View All<span class="port-red">[06]</span></button>
                     <button data-filter=".c-1">Data Science<span class="port-red">[01]</span></button>
                     <button data-filter=".c-2">Development<span class="port-red">[03]</span></button>
                     <button data-filter=".c-3">Business<span class="port-red">[01]</span></button>
                     <button data-filter=".c-4">Life Styles<span class="port-red">[01]</span></button>
                  </div>
               </div>
            </div>
            <div class="row grid course-main-items">
               <div class="col-xl-4 col-lg-4 col-md-6 grid-item c-2">
                  <div class="eduman-course-main-wrapper mb-30">
                     <div class="course-cart">
                        <div class="course-info-wrapper">
                           <div class="cart-info-body">
                              <span class="category-color category-color-1"><a href="course.jsp">Development</a></span>
                              <a href="course-details.jsp">
                                 <h3>WordPress Development Course for Plugins &amp;
                                    Themes</h3>
                              </a>
                              <div class="cart-lavel">
                                 <h5>Level : <span>Beginner</span></h5>
                                 <p>Knowledge is power. Information is liberating. Education is the premise of
                                    progress, in every society, in every family</p>
                              </div>
                              <div class="info-cart-text">
                                 <ul>
                                    <li><i class="far fa-check"></i>Scratch to HTML</li>
                                    <li><i class="far fa-check"></i>Learn how to code in Python</li>
                                    <li><i class="far fa-check"></i>Unlimited backend database creation</li>
                                    <li><i class="far fa-check"></i>Adobe XD Tutorials</li>
                                 </ul>
                              </div>
                              <div class="course-action">
                                 <a href="course-details.jsp" class="view-details-btn">View Details</a>
                                 <button class="wishlist-btn"><i class="flaticon-like"></i></button>
                                 <a href="course-details.jsp" class="c-share-btn"><i class="flaticon-previous"></i></a>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="eduman-course-thumb w-img">
                        <a href="course-details.jsp"><img src="${pageContext.request.contextPath}/img/portfilo/course-img-01.jpg"
                              alt="course-img"></a>
                     </div>
                     <div class="eduman-course-wraper">
                        <div class="eduman-course-heading">
                           <a href="course.jsp" class="course-link-color-1">Development</a>
                           <span class="couse-star"><i class="fas fa-star"></i>4.9 (25)</span>
                        </div>
                        <div class="eduman-course-text">
                           <h3><a href="course-details.jsp">WordPress Development Course for Plugins &amp; Themes</a>
                           </h3>
                        </div>
                        <div class="eduman-course-meta">
                           <div class="eduman-course-price">
                              <span class="price-now">$47.00 </span>
                              <del class="price-old">$75.50</del>
                           </div>
                           <div class="eduman-course-tutor"><img src="${pageContext.request.contextPath}/img/portfilo/course-tutor-01.png"
                                 alt="image not found">
                              <a href="instructor-profile.jsp"><span>Danial</span></a>
                           </div>
                        </div>
                     </div>
                     <div class="eduman-course-footer">
                        <div class="course-lessson-svg">
                           <svg xmlns="http://www.w3.org/2000/svg" width="16.471" height="16.471"
                              viewBox="0 0 16.471 16.471">
                              <g id="blackboar09" transform="translate(-0.008)">
                                 <path id="Path_01" data-name="Path 101"
                                    d="M16,1.222H8.726V.483a.483.483,0,1,0-.965,0v.74H.491A.483.483,0,0,0,.008,1.7V13.517A.483.483,0,0,0,.491,14H5.24L4.23,15.748a.483.483,0,1,0,.836.483L6.354,14H7.761v1.99a.483.483,0,0,0,.965,0V14h1.407l1.288,2.231a.483.483,0,1,0,.836-.483L11.247,14H16a.483.483,0,0,0,.483-.483V1.7A.483.483,0,0,0,16,1.222Zm-.483.965v8.905H.973V2.187Zm0,10.847H.973v-.976H15.514Z"
                                    fill="#575757" />
                              </g>
                           </svg>
                           <span class="ms-2">12 Lessons</span>
                        </div>
                        <div class="course-deteals-btn">
                           <a href="course-details.jsp"><span class="me-2">View Details</span><i
                                 class="far fa-arrow-right"></i></a>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-xl-4 col-lg-4 col-md-6 grid-item c-2">
                  <div class="eduman-course-main-wrapper mb-30">
                     <div class="course-cart">
                        <div class="course-info-wrapper">
                           <div class="cart-info-body">
                              <span class="category-color category-color-1"><a href="course.jsp">Development</a></span>
                              <a href="course-details.jsp">
                                 <h3>Master Google Docs: Free online documents for
                                    personal use</h3>
                              </a>
                              <div class="cart-lavel">
                                 <h5>Level : <span>Beginner</span></h5>
                                 <p>Knowledge is power. Information is liberating. Education is the premise of
                                    progress, in every society, in every family</p>
                              </div>
                              <div class="info-cart-text">
                                 <ul>
                                    <li><i class="far fa-check"></i>Scratch to HTML</li>
                                    <li><i class="far fa-check"></i>Learn how to code in Python</li>
                                    <li><i class="far fa-check"></i>Unlimited backend database creation</li>
                                    <li><i class="far fa-check"></i>Adobe XD Tutorials</li>
                                 </ul>
                              </div>
                              <div class="course-action">
                                 <a href="course-details.jsp" class="view-details-btn">View Details</a>
                                 <button class="wishlist-btn"><i class="flaticon-like"></i></button>
                                 <a href="course-details.jsp" class="c-share-btn"><i class="flaticon-previous"></i></a>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="eduman-course-thumb w-img">
                        <a href="course-details.jsp"><img src="${pageContext.request.contextPath}/img/portfilo/course-img-02.jpg"
                              alt="course-img"></a>
                     </div>
                     <div class="eduman-course-wraper">
                        <div class="eduman-course-heading">
                           <a href="course.jsp" class="course-link-color-1">Development</a>
                           <span class="couse-star"><i class="fas fa-star"></i>4.9 (25)</span>
                        </div>
                        <div class="eduman-course-text">
                           <h3><a href="course-details.jsp">Master Google Docs: Free online documents for personal
                                 use</a></h3>
                        </div>
                        <div class="eduman-course-meta">
                           <div class="eduman-course-price">
                              <span class="price-now">$47.00 </span>
                           </div>
                           <div class="eduman-course-tutor">
                              <img src="${pageContext.request.contextPath}/img/portfilo/course-tutor-02.png" alt="image not found">
                              <a href="instructor-profile.jsp"><span>Mark Hanry</span></a>
                           </div>
                        </div>
                     </div>
                     <div class="eduman-course-footer">
                        <div class="course-lessson-svg">
                           <svg xmlns="http://www.w3.org/2000/svg" width="16.471" height="16.471"
                              viewBox="0 0 16.471 16.471">
                              <g id="blackboar09154" transform="translate(-0.008)">
                                 <path id="Path_2501" data-name="Path 101"
                                    d="M16,1.222H8.726V.483a.483.483,0,1,0-.965,0v.74H.491A.483.483,0,0,0,.008,1.7V13.517A.483.483,0,0,0,.491,14H5.24L4.23,15.748a.483.483,0,1,0,.836.483L6.354,14H7.761v1.99a.483.483,0,0,0,.965,0V14h1.407l1.288,2.231a.483.483,0,1,0,.836-.483L11.247,14H16a.483.483,0,0,0,.483-.483V1.7A.483.483,0,0,0,16,1.222Zm-.483.965v8.905H.973V2.187Zm0,10.847H.973v-.976H15.514Z"
                                    fill="#575757" />
                              </g>
                           </svg>
                           <span class="ms-2">12 Lessons</span>
                        </div>
                        <div class="course-deteals-btn">
                           <a href="course-details.jsp"><span class="me-2">View Details</span><i
                                 class="far fa-arrow-right"></i></a>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-xl-4 col-lg-4 col-md-6 grid-item c-3">
                  <div class="eduman-course-main-wrapper mb-30">
                     <div class="course-cart">
                        <div class="course-info-wrapper">
                           <div class="cart-info-body">
                              <span class="category-color category-color-3"><a href="course.jsp">Business</a></span>
                              <a href="course-details.jsp">
                                 <h3>Write Better Emails: Tactics for Smarter Team
                                    Communication</h3>
                              </a>
                              <div class="cart-lavel">
                                 <h5>Level : <span>Beginner</span></h5>
                                 <p>Knowledge is power. Information is liberating. Education is the premise of
                                    progress, in every society, in every family</p>
                              </div>
                              <div class="info-cart-text">
                                 <ul>
                                    <li><i class="far fa-check"></i>Scratch to HTML</li>
                                    <li><i class="far fa-check"></i>Learn how to code in Python</li>
                                    <li><i class="far fa-check"></i>Unlimited backend database creation</li>
                                    <li><i class="far fa-check"></i>Adobe XD Tutorials</li>
                                 </ul>
                              </div>
                              <div class="course-action">
                                 <a href="course-details.jsp" class="view-details-btn">View Details</a>
                                 <button class="wishlist-btn"><i class="flaticon-like"></i></button>
                                 <a href="course-details.jsp" class="c-share-btn"><i class="flaticon-previous"></i></a>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="eduman-course-thumb w-img">
                        <a href="course-details.jsp"><img src="${pageContext.request.contextPath}/img/portfilo/course-img-03.jpg"
                              alt="course-img"></a>
                     </div>
                     <div class="eduman-course-wraper">
                        <div class="eduman-course-heading">
                           <a href="course.jsp" class="course-link-color-3">Business</a>
                           <span class="couse-star"><i class="fas fa-star"></i>4.9 (25)</span>
                        </div>
                        <div class="eduman-course-text">
                           <h3><a href="course-details.jsp">Write Better Emails: Tactics for Smarter Team
                                 Communication</a></h3>
                        </div>
                        <div class="eduman-course-meta">
                           <div class="eduman-course-price">
                              <span class="price-now">FREE </span>
                           </div>
                           <div class="eduman-course-tutor">
                              <img src="${pageContext.request.contextPath}/img/portfilo/course-tutor-03.png" alt="image not found">
                              <a href="instructor-profile.jsp"><span>Junior Lucy</span></a>
                           </div>
                        </div>
                     </div>
                     <div class="eduman-course-footer">
                        <div class="course-lessson-svg">
                           <svg xmlns="http://www.w3.org/2000/svg" width="16.471" height="16.471"
                              viewBox="0 0 16.471 16.471">
                              <g id="blackboard-11" transform="translate(-0.008)">
                                 <path id="Path_00001" data-name="Path 101"
                                    d="M16,1.222H8.726V.483a.483.483,0,1,0-.965,0v.74H.491A.483.483,0,0,0,.008,1.7V13.517A.483.483,0,0,0,.491,14H5.24L4.23,15.748a.483.483,0,1,0,.836.483L6.354,14H7.761v1.99a.483.483,0,0,0,.965,0V14h1.407l1.288,2.231a.483.483,0,1,0,.836-.483L11.247,14H16a.483.483,0,0,0,.483-.483V1.7A.483.483,0,0,0,16,1.222Zm-.483.965v8.905H.973V2.187Zm0,10.847H.973v-.976H15.514Z"
                                    fill="#575757" />
                              </g>
                           </svg>
                           <span class="ms-2">12 Lessons</span>
                        </div>
                        <div class="course-deteals-btn">
                           <a href="course-details.jsp"><span class="me-2">View Details</span><i
                                 class="far fa-arrow-right"></i></a>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-xl-4 col-lg-4 col-md-6 grid-item c-2">
                  <div class="eduman-course-main-wrapper mb-30">
                     <div class="course-cart">
                        <div class="course-info-wrapper">
                           <div class="cart-info-body">
                              <span class="category-color category-color-1"><a href="course.jsp">Development</a></span>
                              <a href="course-details.jsp">
                                 <h3>Python and Django Full Stack Web Developer
                                    Bootcamp</h3>
                              </a>
                              <div class="cart-lavel">
                                 <h5>Level : <span>Beginner</span></h5>
                                 <p>Knowledge is power. Information is liberating. Education is the premise of
                                    progress, in every society, in every family</p>
                              </div>
                              <div class="info-cart-text">
                                 <ul>
                                    <li><i class="far fa-check"></i>Scratch to HTML</li>
                                    <li><i class="far fa-check"></i>Learn how to code in Python</li>
                                    <li><i class="far fa-check"></i>Unlimited backend database creation</li>
                                    <li><i class="far fa-check"></i>Adobe XD Tutorials</li>
                                 </ul>
                              </div>
                              <div class="course-action">
                                 <a href="course-details.jsp" class="view-details-btn">View Details</a>
                                 <button class="wishlist-btn"><i class="flaticon-like"></i></button>
                                 <a href="course-details.jsp" class="c-share-btn"><i class="flaticon-previous"></i></a>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="eduman-course-thumb w-img">
                        <a href="course-details.jsp"><img src="${pageContext.request.contextPath}/img/portfilo/course-img-05.jpg"
                              alt="course-img"></a>
                     </div>
                     <div class="eduman-course-wraper">
                        <div class="eduman-course-heading">
                           <a href="course.jsp" class="course-link-color-1">Development</a>
                           <span class="couse-star"><i class="fas fa-star"></i>4.9 (25)</span>
                        </div>
                        <div class="eduman-course-text">
                           <h3><a href="course-details.jsp">Python and Django Full Stack Web Developer Bootcamp</a>
                           </h3>
                        </div>
                        <div class="eduman-course-meta">
                           <div class="eduman-course-price">
                              <span class="price-now">$47.00 </span>
                              <del class="price-old">$75.50</del>
                           </div>
                           <div class="eduman-course-tutor">
                              <img src="${pageContext.request.contextPath}/img/portfilo/course-tutor-05.png" alt="image not found">
                              <a href="instructor-profile.jsp"><span>Edyal Romel</span></a>
                           </div>
                        </div>
                     </div>
                     <div class="eduman-course-footer">
                        <div class="course-lessson-svg">
                           <svg xmlns="http://www.w3.org/2000/svg" width="16.471" height="16.471"
                              viewBox="0 0 16.471 16.471">
                              <g id="blackboard" transform="translate(-0.008)">
                                 <path id="Path_101" data-name="Path 101"
                                    d="M16,1.222H8.726V.483a.483.483,0,1,0-.965,0v.74H.491A.483.483,0,0,0,.008,1.7V13.517A.483.483,0,0,0,.491,14H5.24L4.23,15.748a.483.483,0,1,0,.836.483L6.354,14H7.761v1.99a.483.483,0,0,0,.965,0V14h1.407l1.288,2.231a.483.483,0,1,0,.836-.483L11.247,14H16a.483.483,0,0,0,.483-.483V1.7A.483.483,0,0,0,16,1.222Zm-.483.965v8.905H.973V2.187Zm0,10.847H.973v-.976H15.514Z"
                                    fill="#575757" />
                              </g>
                           </svg>
                           <span class="ms-2">12 Lessons</span>
                        </div>
                        <div class="course-deteals-btn">
                           <a href="course-details.jsp"><span class="me-2">View Details</span><i
                                 class="far fa-arrow-right"></i></a>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-xl-4 col-lg-4 col-md-6 grid-item c-1">
                  <div class="eduman-course-main-wrapper mb-30">
                     <div class="course-cart">
                        <div class="course-info-wrapper">
                           <div class="cart-info-body">
                              <span class="category-color category-color-5"><a href="course.jsp">Data
                                    Science</a></span>
                              <a href="course-details.jsp">
                                 <h3>Data Science Real-Life Data Science Exercises
                                    Included</h3>
                              </a>
                              <div class="cart-lavel">
                                 <h5>Level : <span>Beginner</span></h5>
                                 <p>Knowledge is power. Information is liberating. Education is the premise of
                                    progress, in every society, in every family</p>
                              </div>
                              <div class="info-cart-text">
                                 <ul>
                                    <li><i class="far fa-check"></i>Scratch to HTML</li>
                                    <li><i class="far fa-check"></i>Learn how to code in Python</li>
                                    <li><i class="far fa-check"></i>Unlimited backend database creation</li>
                                    <li><i class="far fa-check"></i>Adobe XD Tutorials</li>
                                 </ul>
                              </div>
                              <div class="course-action">
                                 <a href="course-details.jsp" class="view-details-btn">View Details</a>
                                 <button class="wishlist-btn"><i class="flaticon-like"></i></button>
                                 <a href="course-details.jsp" class="c-share-btn"><i class="flaticon-previous"></i></a>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="eduman-course-thumb w-img">
                        <a href="course-details.jsp"><img src="${pageContext.request.contextPath}/img/portfilo/course-img-06.jpg"
                              alt="course-img"></a>
                     </div>
                     <div class="eduman-course-wraper">
                        <div class="eduman-course-heading">
                           <a href="course.jsp" class="course-link-color-5">Data Science</a>
                           <span class="couse-star"><i class="fas fa-star"></i>4.9 (25)</span>
                        </div>
                        <div class="eduman-course-text">
                           <h3><a href="course-details.jsp">Data Science Real-Life Data Science Exercises
                                 Included</a>
                           </h3>
                        </div>
                        <div class="eduman-course-meta">
                           <div class="eduman-course-price">
                              <span class="price-now">$47.00 </span>
                           </div>
                           <div class="eduman-course-tutor">
                              <img src="${pageContext.request.contextPath}/img/portfilo/course-tutor-06.png" alt="image not found">
                              <a href="instructor-profile.jsp"><span>Mark Hanry</span></a>
                           </div>
                        </div>
                     </div>
                     <div class="eduman-course-footer">
                        <div class="course-lessson-svg">
                           <svg xmlns="http://www.w3.org/2000/svg" width="16.471" height="16.471"
                              viewBox="0 0 16.471 16.471">
                              <g id="blackboard-13" transform="translate(-0.008)">
                                 <path id="Path_000" data-name="Path 101"
                                    d="M16,1.222H8.726V.483a.483.483,0,1,0-.965,0v.74H.491A.483.483,0,0,0,.008,1.7V13.517A.483.483,0,0,0,.491,14H5.24L4.23,15.748a.483.483,0,1,0,.836.483L6.354,14H7.761v1.99a.483.483,0,0,0,.965,0V14h1.407l1.288,2.231a.483.483,0,1,0,.836-.483L11.247,14H16a.483.483,0,0,0,.483-.483V1.7A.483.483,0,0,0,16,1.222Zm-.483.965v8.905H.973V2.187Zm0,10.847H.973v-.976H15.514Z"
                                    fill="#575757" />
                              </g>
                           </svg>
                           <span class="ms-2">12 Lessons</span>
                        </div>
                        <div class="course-deteals-btn">
                           <a href="course-details.jsp"><span class="me-2">View Details</span><i
                                 class="far fa-arrow-right"></i></a>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-xl-4 col-lg-4 col-md-6 grid-item c-4">
                  <div class="eduman-course-main-wrapper mb-30">
                     <div class="course-cart">
                        <div class="course-info-wrapper">
                           <div class="cart-info-body">
                              <span class="category-color category-color-4"><a href="course.jsp">Life Style</a></span>
                              <a href="course-details.jsp">
                                 <h3>Become a Super Human: Naturally & Safely Boost</h3>
                              </a>
                              <div class="cart-lavel">
                                 <h5>Level : <span>Beginner</span></h5>
                                 <p>Knowledge is power. Information is liberating. Education is the premise of
                                    progress, in every society, in every family</p>
                              </div>
                              <div class="info-cart-text">
                                 <ul>
                                    <li><i class="far fa-check"></i>Scratch to HTML</li>
                                    <li><i class="far fa-check"></i>Learn how to code in Python</li>
                                    <li><i class="far fa-check"></i>Unlimited backend database creation</li>
                                    <li><i class="far fa-check"></i>Adobe XD Tutorials</li>
                                 </ul>
                              </div>
                              <div class="course-action">
                                 <a href="course-details.jsp" class="view-details-btn">View Details</a>
                                 <button class="wishlist-btn"><i class="flaticon-like"></i></button>
                                 <a href="course-details.jsp" class="c-share-btn"><i class="flaticon-previous"></i></a>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="eduman-course-thumb w-img">
                        <a href="course-details.jsp"><img src="${pageContext.request.contextPath}/img/portfilo/course-img-04.jpg"
                              alt="course-img"></a>
                     </div>
                     <div class="eduman-course-wraper">
                        <div class="eduman-course-heading">
                           <a href="course.jsp" class="course-link-color-4">Life Style</a>
                           <span class="couse-star"><i class="fas fa-star"></i>4.9 (25)</span>
                        </div>
                        <div class="eduman-course-text">
                           <h3><a href="course-details.jsp">Become a Super Human: Naturally & Safely Boost</a></h3>
                        </div>
                        <div class="eduman-course-meta">
                           <div class="eduman-course-price">
                              <span class="price-now">$47.00</span>
                           </div>
                           <div class="eduman-course-tutor">
                              <img src="${pageContext.request.contextPath}/img/portfilo/course-tutor-04.png" alt="image not found">
                              <a href="instructor-profile.jsp"><span>Danial</span></a>
                           </div>
                        </div>
                     </div>
                     <div class="eduman-course-footer">
                        <div class="course-lessson-svg">
                           <svg xmlns="http://www.w3.org/2000/svg" width="16.471" height="16.471"
                              viewBox="0 0 16.471 16.471">
                              <g id="blackboard-10" transform="translate(-0.008)">
                                 <path id="Path_100000" data-name="Path 101"
                                    d="M16,1.222H8.726V.483a.483.483,0,1,0-.965,0v.74H.491A.483.483,0,0,0,.008,1.7V13.517A.483.483,0,0,0,.491,14H5.24L4.23,15.748a.483.483,0,1,0,.836.483L6.354,14H7.761v1.99a.483.483,0,0,0,.965,0V14h1.407l1.288,2.231a.483.483,0,1,0,.836-.483L11.247,14H16a.483.483,0,0,0,.483-.483V1.7A.483.483,0,0,0,16,1.222Zm-.483.965v8.905H.973V2.187Zm0,10.847H.973v-.976H15.514Z"
                                    fill="#575757" />
                              </g>
                           </svg>
                           <span class="ms-2">12 Lessons</span>
                        </div>
                        <div class="course-deteals-btn">
                           <a href="course-details.jsp"><span class="me-2">View Details</span><i
                                 class="far fa-arrow-right"></i></a>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- portfolio main area end -->

      <!-- features-area-start-->
      <div class="features-area pt-45 pb-15" data-background="assets/img/fact/fact.png">
         <div class="container">
            <div class="row">
               <div class="col-xl-4 col-lg-4 col-md-6">
                  <div class="features-wrapper d-flex align-items-center mb-30">
                     <div class="features-icon">
                        <i class="flaticon-online-course"></i>
                     </div>
                     <div class="features-content">
                        <h3>Learn with skills
                           over 2,420 courses</h3>
                     </div>
                  </div>
               </div>
               <div class="col-xl-4 col-lg-4 col-md-6">
                  <div class="features-wrapper d-flex align-items-center mb-30">
                     <div class="features-icon">
                        <i class="flaticon-certificate"></i>
                     </div>
                     <div class="features-content">
                        <h3>Earn certificates
                           and degrees</h3>
                     </div>
                  </div>
               </div>
               <div class="col-xl-4 col-lg-4 col-md-6">
                  <div class="features-wrapper d-flex align-items-center mb-30">
                     <div class="features-icon">
                        <i class="flaticon-laptop"></i>
                     </div>
                     <div class="features-content">
                        <h3>Learn from
                           anywhere, any time</h3>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- fact-area-end-->

      <!-- student-choose-area start -->
      <div class="student-choose-area fix pt-120 pb-110">
         <div class="container">
            <div class="row">
               <div class="col-xl-5 col-lg-5">
                  <div class="student-wrapper">
                     <div class="section-title mb-30">
                        <h2>Why Students <span class="down-mark-line">Choose</span> Us for Gain Their Knowledge</h2>
                     </div>
                     <div class="sitdent-choose-content">
                        <p>Helping employees gain skills and providing career development often take a back seat to
                           business priorities but workplace better right now. Seventy percent of workers think that.
                        </p>
                     </div>
                     <div class="student-choose-list">
                        <ul>
                           <li><i class="fas fa-check-circle"></i>Free for physically handcraft </li>
                           <li><i class="fas fa-check-circle"></i>Easy to enroll courses</li>
                           <li><i class="fas fa-check-circle"></i>Course certificate for particular course</li>
                        </ul>
                     </div>
                     <div class="student-btn">
                        <a class="edu-sec-btn" href="about.jsp">More about us</a>
                     </div>
                  </div>
               </div>
               <div class="col-xl-2 col-lg-2">
                  <div class="student-wrapper position-relative">
                     <div class="shap-01">
                     </div>
                  </div>
               </div>
               <div class="col-xl-5 col-lg-5">
                  <div class="student-choose-wrapper position-relative">
                     <div class="shap-02">
                     </div>
                     <div class="shap-03">
                        <img src="${pageContext.request.contextPath}/img/shape/student-shape-03.png" alt="image not found">
                     </div>
                     <div class="shap-04">
                        <img src="${pageContext.request.contextPath}/img/shape/student-shape-04.png" alt="image not found">
                     </div>
                     <div class="shap-05">
                        <img src="${pageContext.request.contextPath}/img/shape/student-shape-05.png" alt="image not found">
                     </div>
                     <div class="shap-06">
                        <img src="${pageContext.request.contextPath}/img/shape/student-shape-06.png" alt="image not found">
                     </div>
                     <div class="shap-07">
                        <img src="${pageContext.request.contextPath}/img/shape/student-shape-07.png" alt="image not found">
                     </div>

                     <div class="student-choose-thumb">
                        <img src="${pageContext.request.contextPath}/img/student-choose/student.png" alt="image not found">
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- student-choose-area end -->

      <!-- testimonial-area-start -->
      <div class="testimonial-area pb-120">
         <div class="container">
            <div class="row">
               <div class="col-lg-6 offset-lg-3">
                  <div class="section-title text-center mb-55">
                     <h2>What Students<br>
                        Think and Say About <span class="down-mark-line">Eduman</span></h2>
                  </div>
               </div>
            </div>
            <!-- Slider main container -->
            <div class="swiper-container testimonial-active">
               <!-- Additional required wrapper -->
               <div class="swiper-wrapper">
                  <!-- Slides -->
                  <div class="swiper-slide">
                     <div class="testimonial-items position-relative">
                        <div class="testimonial-header">
                           <div class="testimonial-img">
                              <img src="${pageContext.request.contextPath}/img/testimonial/Image.png" alt="image not found">
                           </div>
                           <div class="testimonial-title">
                              <h4>David Johnson</h4>
                              <span>Student</span>
                           </div>
                        </div>
                        <div class="testimoni-quotes">
                           <img src="${pageContext.request.contextPath}/img/testimonial/quotes.png" alt="image not found">

                        </div>
                        <div class="testimonial-body">
                           <h3>Great Course !</h3>
                           <p>Thanks to our marketplace model, our content keeps pace with market changes. You’ll find
                              courses on the latest technologies and business practice and more!</p>
                        </div>
                        <div class="testimonial-icon">
                           <i class="fas fa-star"></i>
                           <i class="fas fa-star"></i>
                           <i class="fas fa-star"></i>
                           <i class="fas fa-star"></i>
                        </div>
                     </div>
                  </div>
                  <div class="swiper-slide">
                     <div class="testimonial-items position-relative">
                        <div class="testimonial-header">
                           <div class="testimonial-img">
                              <img src="${pageContext.request.contextPath}/img/testimonial/testimonial-02.png" alt="image not found">
                           </div>
                           <div class="testimonial-title">
                              <h4>Brandon Tylor</h4>
                              <span>Student</span>
                           </div>
                        </div>
                        <div class="testimoni-quotes">
                           <img src="${pageContext.request.contextPath}/img/testimonial/quotes.png" alt="image not found">
                        </div>
                        <div class="testimonial-body">
                           <h3>Best Experience !</h3>
                           <p>In every software-as-a-service solution, user billing and payments are key aspects in the
                              sale of services rendered. Let’s learn about Stripe the metal mates.</p>
                        </div>
                        <div class="testimonial-icon">
                           <i class="fas fa-star"></i>
                           <i class="fas fa-star"></i>
                           <i class="fas fa-star"></i>
                           <i class="fas fa-star"></i>
                        </div>
                     </div>
                  </div>
                  <div class="swiper-slide">
                     <div class="testimonial-items position-relative">
                        <div class="testimonial-header">
                           <div class="testimonial-img">
                              <img src="${pageContext.request.contextPath}/img/testimonial/testimonial.png" alt="image not found">
                           </div>
                           <div class="testimonial-title">
                              <h4>Richard Joseph</h4>
                              <span>Student</span>
                           </div>
                        </div>
                        <div class="testimoni-quotes">
                           <img src="${pageContext.request.contextPath}/img/testimonial/quotes.png" alt="image not found">
                        </div>
                        <div class="testimonial-body">
                           <h3>Helpful Instructors !</h3>
                           <p>There are so many websites out there that have not considered the overall usability of
                              their visually impaired users. When it comes to designing better links.</p>
                        </div>
                        <div class="testimonial-icon">
                           <i class="fas fa-star"></i>
                           <i class="fas fa-star"></i>
                           <i class="fas fa-star"></i>
                           <i class="fas fa-star"></i>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- If we need pagination -->
               <div class="testimonial-pagination text-center"></div>
            </div>
         </div>
      </div>
      <!-- testimonial-area-end -->

      <!-- browser-course-area-start -->
      <div class="browser-course-area">
         <div class="container">
            <div class="row">
               <div class="col-xl-6 col-lg-6 col-md-12 mb-30">
                  <div class="browser-course-wrapper course-height" data-background="">
                     <div class="browser-course-bg">
                        <img src="${pageContext.request.contextPath}/img/browser-course/browser-course-01.jpg" alt="image not found">
                     </div>
                     <div class="browser-course-content">
                        <span>Start from today</span>
                        <div class="browser-course-tittle">
                           <a href="instructor.jsp">Become an instructor
                              and spread your knowledge</a>
                        </div>
                        <div class="browser-btn">
                           <a class="course-btn" href="become-instructor.jsp">View details</a>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-xl-6 col-lg-6 col-md-12 mb-30">
                  <div class="browser-course-wrapper course-height" data-background="">
                     <div class="browser-course-bg">
                        <img src="${pageContext.request.contextPath}/img/browser-course/browser-course-02.jpg" alt="image not found">
                     </div>
                     <div class="row">
                        <div class="col-xl-7 col-lg-7">
                           <div class="browser-course-content">
                              <span>Discover your gain</span>
                              <div class="browser-course-tittle">
                                 <a href="course-details.jsp">Keep your skilled centers of
                                    excellence competitive</a>
                              </div>
                              <div class="browser-btn">
                                 <a class="course-btn" href="course.jsp">Browse courses</a>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- browser-course-area-end -->

      <!-- education-area-start -->
      <section class="education-area position-relative pt-85">
         <div class="container">
            <img class="education-shape-2" src="${pageContext.request.contextPath}/img/shape/education-shape-04.png" alt="shape">
            <img class="education-shape-3" src="${pageContext.request.contextPath}/img/shape/education-shape-01.png" alt="shape">
            <img class="education-shape-4" src="${pageContext.request.contextPath}/img/shape/education-shape-03.png" alt="shape">
            <div class="row">
               <div class="col-xl-4 col-lg-4 offset-xl-2 offset-lg-2">
                  <div class="education-img mb-30">
                     <img src="${pageContext.request.contextPath}/img/teacher/education.png" alt="image not found">
                  </div>
               </div>
               <div class="col-xl-4 col-lg-4">
                  <div class="section-title mb-30">
                     <h2>Transform Your
                        Life Through <span class="down-mark-line">Education</span></h2>
                  </div>
                  <div class="education-content mb-30">
                     <p>Helping employees gain skills and providing career development often take a back seat to
                        business priorities but workplace.</p>
                     <a class="edu-sec-btn" href="about.jsp">Watch how to start</a>
                  </div>
               </div>
            </div>
         </div>

      </section>
      <!-- education-area-end -->

      <!-- brand-area-start -->
      <div class="brand-area theme-bg pt-90 pb-120">
         <div class="container">
            <div class="row">
               <div class="col-xl-12">
                  <div class="brand-wrapper text-center">
                     <div class="brand-wrapper text-center">
                        <div class="swiper-container brand-active">
                           <!-- Additional required wrapper -->
                           <div class="swiper-wrapper">
                              <!-- Slides -->
                              <div class="swiper-slide">
                                 <div class="singel-brand">
                                    <img src="${pageContext.request.contextPath}/img/brand/brand-01.png" alt="image not found">
                                 </div>
                              </div>
                              <div class="swiper-slide">
                                 <div class="singel-brand">
                                    <img src="${pageContext.request.contextPath}/img/brand/brand-02.png" alt="image not found">
                                 </div>
                              </div>
                              <div class="swiper-slide">
                                 <div class="singel-brand">
                                    <img src="${pageContext.request.contextPath}/img/brand/brand-03.png" alt="image not found">
                                 </div>
                              </div>
                              <div class="swiper-slide">
                                 <div class="singel-brand">
                                    <img src="${pageContext.request.contextPath}/img/brand/brand-04.png" alt="image not found">
                                 </div>
                              </div>
                              <div class="swiper-slide">
                                 <div class="singel-brand">
                                    <img src="${pageContext.request.contextPath}/img/brand/brand-05.png" alt="image not found">
                                 </div>
                              </div>
                              <div class="swiper-slide">
                                 <div class="singel-brand">
                                    <img src="${pageContext.request.contextPath}/img/brand/brand-06.png" alt="image not found">
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
      <!-- brand-area-end -->
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
                           <a href="index.jsp"> <img src="${pageContext.request.contextPath}/img/logo/footer-logo.png" alt="footer-logo"></a>
                           <p>Great lesson ideas and lesson plans for ESL teachers! Educators can customize lessons as
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
                                    <g id="Group_2171" data-name="Group 2171" transform="translate(36.859 20.508)">
                                       <g id="Group_2170" data-name="Group 2170">
                                          <path id="Path_2983" data-name="Path 2983"
                                             d="M95.395,210A4.4,4.4,0,0,0,91,214.395v11.914a4.395,4.395,0,1,0,8.789,0V214.395A4.4,4.4,0,0,0,95.395,210Z"
                                             transform="translate(-91 -210)" fill="#2467ec" />
                                       </g>
                                    </g>
                                    <g id="Group_2173" data-name="Group 2173" transform="translate(31 23.669)">
                                       <g id="Group_2172" data-name="Group 2172">
                                          <path id="Path_2984" data-name="Path 2984"
                                             d="M33.93,243.6a7.268,7.268,0,0,1,.125-1.234A4.386,4.386,0,0,0,31,246.529v6.055a4.386,4.386,0,0,0,3.054,4.163,7.268,7.268,0,0,1-.125-1.234Z"
                                             transform="translate(-31 -242.366)" fill="#2467ec" />
                                       </g>
                                    </g>
                                    <g id="Group_2175" data-name="Group 2175" transform="translate(48.578 20.508)">
                                       <g id="Group_2174" data-name="Group 2174">
                                          <path id="Path_2985" data-name="Path 2985"
                                             d="M227.113,210a4.4,4.4,0,0,0-4.395,4.395v11.914a4.4,4.4,0,0,0,4.395,4.395,4.335,4.335,0,0,0,1.259-.206,4.386,4.386,0,0,1-4.189,3.136h-4.664a4.395,4.395,0,1,0,0,2.93h4.664a7.333,7.333,0,0,0,7.324-7.324V214.395A4.4,4.4,0,0,0,227.113,210Z"
                                             transform="translate(-211 -210)" fill="#2467ec" />
                                       </g>
                                    </g>
                                    <g id="Group_2177" data-name="Group 2177" transform="translate(71.891 23.669)">
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


<!-- Mirrored from codeskdhaka.com/html/eduman-prv/eduman/index.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 May 2024 15:24:44 GMT -->
</html>