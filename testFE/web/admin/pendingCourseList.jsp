<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>
<%@ page import="DAO.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <% 
           // String userName = (String)request.getAttribute("UserName");
            User user = (User)session.getAttribute("user");
            int role = (user != null) ? user.getRole() : 0;
    %>

    <head>
        <%-- HEAD --%>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/adminCSS/css/assets.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/adminCSS/vendors/calendar/fullcalendar.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/adminCSS/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/adminCSS/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/adminCSS/css/styles.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/adminCSS/css/dashboard.css">
        <link class="skin" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/adminCSS/css/color/color-1.css">
        <%@ include file="../template/head.jsp" %>
    </head>

    <body>

        <%-- PRE LOADER --%>
        <%@ include file="../template/preLoader.jsp" %>

        <%-- SIDE TOGGLE --%>
        <%@ include file="../template/sideToggle.jsp" %>

        <%-- HEADER --%>
        <header>
            <div class="header-area header-transparent sticky-header">
                <div class="container-fluid">
                    <div class="header-main-wrapper">
                        <div class="row align-items-center">
                            <div class="col-xl-7 col-lg-7 col-md-5 col-sm-9 col-9">
                                <div class="header-left d-flex align-items-center">
                                    <div class="header-logo">
                                        <a href="${pageContext.request.contextPath}/pages/home.jsp"><img src="${pageContext.request.contextPath}/img/logo/logo-black.png" alt="logo"></a>
                                    </div>

                                    <div class="main-menu d-none d-xl-block">
                                        <nav id="mobile-menu">
                                            <ul>
                                                <li class="menu-item-has-children"><a href="index.jsp">Dashboard</a>

                                                </li>
                                                <li class="menu-item-has-children"><a href="${pageContext.request.contextPath}/get-course-info">Course</a>
                                                    <ul class="sub-menu">
                                                        <!--                                       <li><a href="course.jsp">Course 1</a></li>
                                                                                               <li><a href="course-2.jsp">Course 2</a></li>
                                                                                               <li><a href="course-3.jsp">Course 3</a></li>
                                                                                               <li><a href="course-4.jsp">Course 4</a></li>
                                                                                               <li><a href="course-details.jsp">course details</a></li>
                                                                                               <li><a href="webinars.jsp">Webinars</a></li>
                                                                                               <li><a href="webinar-details.jsp">Webinar Details</a></li>-->
                                                    </ul>
                                                </li>
                                                <li class="menu-item-has-children"><a href="shop.jsp">shop</a>
                                                    <ul class="sub-menu">
                                                        <!--                                       <li><a href="shop.jsp">shop</a></li>
                                                                                               <li><a href="shop-details.jsp">shop details</a></li>
                                                                                               <li><a href="wishlist.jsp">wishlist</a></li>
                                                                                               <li><a href="cart.jsp">cart</a></li>
                                                                                               <li><a href="checkout.jsp">checkout</a></li>-->
                                                    </ul>
                                                </li>
                                                <li class="menu-item-has-children"><a href="#!">Pages</a>
                                                    <!--                                    <ul class="sub-menu">
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
                                                                                        </ul>-->
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>

                                </div>
                            </div>
                            <div class="col-xl-5 col-lg-5 col-md-7 col-sm-3 col-3">
                                <div class="header-right d-flex align-items-center justify-content-end">
                                    <!-- Display user avatar if logged in, otherwise display Sign In and Sign Up buttons -->
                                    <c:choose>
                                        <c:when test="${user != null}">


                                            <div class="user-avatar-wrapper mr-30">
                                                <a href="" 
                                                   class="user-avatar-btn">
                                                    <div class="header__user-avatar p-relative">
                                                        <img src="${user.getAvatar()}" alt="User Avatar" style="width: 40px; height: 40px; border-radius: 50%;">
                                                    </div>
                                                </a>
                                            </div>


                                            <div class="user-logout-wrapper mr-30">
                                                <a href="${pageContext.request.contextPath}/LogoutServlet" class="user-logout-btn">Logout</a>
                                            </div>

                                        </c:when>
                                        <c:otherwise>
                                            <div class="user-btn-inner p-relative d-none d-md-block">
                                                <div class="user-btn-wrapper">
                                                    <div class="user-btn-content">
                                                        <a class="user-btn-sign-in" href="${pageContext.request.contextPath}/pages/login.jsp">Sign In</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="d-none d-md-block">
                                                <a class="user-btn-sign-up edu-btn" href="${pageContext.request.contextPath}/pages/registration.jsp">Sign Up</a>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>

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

        <!--Main container start -->
        <!-- hero-area -->
        <jsp:include page="../template/heroArea.jsp">
            <jsp:param name="title" value="Pending Courses" />
        </jsp:include>

        <main class="ttr-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            
                            <div class="widget-inner">
                                <div class="card-courses-list admin-courses">
                                    <div class="card-courses-media">
                                        <img src="${pageContext.request.contextPath}/images/courses/pic1.jpg" alt=""/>
                                    </div>
                                    <div class="card-courses-full-dec">
                                        <div class="card-courses-title">
                                            <h4>Become a PHP Master and Make Money</h4>
                                        </div>
                                        <div class="card-courses-list-bx">
                                            <ul class="card-courses-view">
                                                <li class="card-courses-user">
                                                    <div class="card-courses-user-pic">
                                                        <img src="${pageContext.request.contextPath}/images/testimonials/pic3.jpg" alt=""/>
                                                    </div>
                                                    <div class="card-courses-user-info">
                                                        <h5>Teacher</h5>
                                                        <h4>Keny White</h4>
                                                    </div>
                                                </li>
                                                <li class="card-courses-categories">
                                                    <h5>3 Categories</h5>
                                                    <h4>Backend</h4>
                                                </li>
                                                <li class="card-courses-review">
                                                    <h5>3 Review</h5>
                                                    <ul class="cours-star">
                                                        <li class="active"><i class="fa fa-star"></i></li>
                                                        <li class="active"><i class="fa fa-star"></i></li>
                                                        <li class="active"><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                    </ul>
                                                </li>
                                                <li class="card-courses-stats">
                                                    <a href="#" class="btn button-sm green radius-xl">Pending</a>
                                                </li>
                                                <li class="card-courses-price">
                                                    <del>$190</del>
                                                    <h5 class="text-primary">$120</h5>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="row card-courses-dec">
                                            <div class="col-md-12">
                                                <h6 class="m-b10">Course Description</h6>
                                                <p>Lorem ipsum dolor sit amet, est ei idque voluptua copiosae, pro detracto disputando reformidans at, ex vel suas eripuit. Vel alii zril maiorum ex, mea id sale eirmod epicurei. Sit te possit senserit, eam alia veritus maluisset ei, id cibo vocent ocurreret per. Te qui doming doctus referrentur, usu debet tamquam et. Sea ut nullam aperiam, mei cu tollit salutatus delicatissimi. </p>	
                                            </div>
                                            <div class="col-md-12">
                                                <a href="#" class="btn blue outline radius-xl ">View details</a>
                                                <a href="#" class="btn green radius-xl outline">Approve</a>
                                                <a href="#" class="btn red outline radius-xl ">Cancel</a>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="card-courses-list admin-courses">
                                    <div class="card-courses-media">
                                        <img src="${pageContext.request.contextPath}/images/courses/pic2.jpg" alt=""/>
                                    </div>
                                    <div class="card-courses-full-dec">
                                        <div class="card-courses-title">
                                            <h4>Become a PHP Master and Make Money</h4>
                                        </div>
                                        <div class="card-courses-list-bx">
                                            <ul class="card-courses-view">
                                                <li class="card-courses-user">
                                                    <div class="card-courses-user-pic">
                                                        <img src="assets/images/testimonials/pic3.jpg" alt=""/>
                                                    </div>
                                                    <div class="card-courses-user-info">
                                                        <h5>Teacher</h5>
                                                        <h4>Keny White</h4>
                                                    </div>
                                                </li>
                                                <li class="card-courses-categories">
                                                    <h5>3 Categories</h5>
                                                    <h4>Backend</h4>
                                                </li>
                                                <li class="card-courses-review">
                                                    <h5>3 Review</h5>
                                                    <ul class="cours-star">
                                                        <li class="active"><i class="fa fa-star"></i></li>
                                                        <li class="active"><i class="fa fa-star"></i></li>
                                                        <li class="active"><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                    </ul>
                                                </li>
                                                <li class="card-courses-stats">
                                                    <a href="#" class="btn button-sm green radius-xl">Pending</a>
                                                </li>
                                                <li class="card-courses-price">
                                                    <del>$190</del>
                                                    <h5 class="text-primary">$120</h5>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="row card-courses-dec">
                                            <div class="col-md-12">
                                                <h6 class="m-b10">Course Description</h6>
                                                <p>Lorem ipsum dolor sit amet, est ei idque voluptua copiosae, pro detracto disputando reformidans at, ex vel suas eripuit. Vel alii zril maiorum ex, mea id sale eirmod epicurei. Sit te possit senserit, eam alia veritus maluisset ei, id cibo vocent ocurreret per. Te qui doming doctus referrentur, usu debet tamquam et. Sea ut nullam aperiam, mei cu tollit salutatus delicatissimi. </p>	
                                            </div>
                                            <div class="col-md-12">
                                                <a href="#" class="btn blue outline radius-xl ">View details</a>
                                                <a href="#" class="btn green radius-xl outline">Approve</a>
                                                <a href="#" class="btn red outline radius-xl ">Cancel</a>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="card-courses-list admin-courses">
                                    <div class="card-courses-media">
                                        <img src="${pageContext.request.contextPath}/images/courses/pic3.jpg" alt=""/>
                                    </div>
                                    <div class="card-courses-full-dec">
                                        <div class="card-courses-title">
                                            <h4>Become a PHP Master and Make Money</h4>
                                        </div>
                                        <div class="card-courses-list-bx">
                                            <ul class="card-courses-view">
                                                <li class="card-courses-user">
                                                    <div class="card-courses-user-pic">
                                                        <img src="assets/images/testimonials/pic3.jpg" alt=""/>
                                                    </div>
                                                    <div class="card-courses-user-info">
                                                        <h5>Teacher</h5>
                                                        <h4>Keny White</h4>
                                                    </div>
                                                </li>
                                                <li class="card-courses-categories">
                                                    <h5>3 Categories</h5>
                                                    <h4>Backend</h4>
                                                </li>
                                                <li class="card-courses-review">
                                                    <h5>3 Review</h5>
                                                    <ul class="cours-star">
                                                        <li class="active"><i class="fa fa-star"></i></li>
                                                        <li class="active"><i class="fa fa-star"></i></li>
                                                        <li class="active"><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                    </ul>
                                                </li>
                                                <li class="card-courses-stats">
                                                    <a href="#" class="btn button-sm green radius-xl">Pending</a>
                                                </li>
                                                <li class="card-courses-price">
                                                    <del>$190</del>
                                                    <h5 class="text-primary">$120</h5>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="row card-courses-dec">
                                            <div class="col-md-12">
                                                <h6 class="m-b10">Course Description</h6>
                                                <p>Lorem ipsum dolor sit amet, est ei idque voluptua copiosae, pro detracto disputando reformidans at, ex vel suas eripuit. Vel alii zril maiorum ex, mea id sale eirmod epicurei. Sit te possit senserit, eam alia veritus maluisset ei, id cibo vocent ocurreret per. Te qui doming doctus referrentur, usu debet tamquam et. Sea ut nullam aperiam, mei cu tollit salutatus delicatissimi. </p>	
                                            </div>
                                            <div class="col-md-12">
                                                <a href="#" class="btn blue outline radius-xl ">View details</a>
                                                <a href="#" class="btn green radius-xl outline">Approve</a>
                                                <a href="#" class="btn red outline radius-xl ">Cancel</a>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="card-courses-list admin-courses">
                                    <div class="card-courses-media">
                                        <img src="${pageContext.request.contextPath}/images/courses/pic4.jpg" alt=""/>
                                    </div>
                                    <div class="card-courses-full-dec">
                                        <div class="card-courses-title">
                                            <h4>Become a PHP Master and Make Money</h4>
                                        </div>
                                        <div class="card-courses-list-bx">
                                            <ul class="card-courses-view">
                                                <li class="card-courses-user">
                                                    <div class="card-courses-user-pic">
                                                        <img src="assets/images/testimonials/pic3.jpg" alt=""/>
                                                    </div>
                                                    <div class="card-courses-user-info">
                                                        <h5>Teacher</h5>
                                                        <h4>Keny White</h4>
                                                    </div>
                                                </li>
                                                <li class="card-courses-categories">
                                                    <h5>3 Categories</h5>
                                                    <h4>Backend</h4>
                                                </li>
                                                <li class="card-courses-review">
                                                    <h5>3 Review</h5>
                                                    <ul class="cours-star">
                                                        <li class="active"><i class="fa fa-star"></i></li>
                                                        <li class="active"><i class="fa fa-star"></i></li>
                                                        <li class="active"><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                    </ul>
                                                </li>
                                                <li class="card-courses-stats">
                                                    <a href="#" class="btn button-sm green radius-xl">Pending</a>
                                                </li>
                                                <li class="card-courses-price">
                                                    <del>$190</del>
                                                    <h5 class="text-primary">$120</h5>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="row card-courses-dec">
                                            <div class="col-md-12">
                                                <h6 class="m-b10">Course Description</h6>
                                                <p>Lorem ipsum dolor sit amet, est ei idque voluptua copiosae, pro detracto disputando reformidans at, ex vel suas eripuit. Vel alii zril maiorum ex, mea id sale eirmod epicurei. Sit te possit senserit, eam alia veritus maluisset ei, id cibo vocent ocurreret per. Te qui doming doctus referrentur, usu debet tamquam et. Sea ut nullam aperiam, mei cu tollit salutatus delicatissimi. </p>	
                                            </div>
                                            <div class="col-md-12">
                                                <a href="#" class="btn blue outline radius-xl ">View details</a>
                                                <a href="#" class="btn green radius-xl outline">Approve</a>
                                                <a href="#" class="btn red outline radius-xl ">Cancel</a>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Your Profile Views Chart END-->
                </div>
            </div>
        </main>
        <div class="ttr-overlay"></div>

        <%-- FOOTER --%>
        <%@ include file="../template/footer.jsp" %>

        <%-- BACK TO TOP --%>
        <%@ include file="../template/backToTop.jsp" %>

        <!-- JS here -->
        <%@ include file="../template/script.jsp" %>

        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src='assets/vendors/scroll/scrollbar.min.js'></script>
        <script src="assets/vendors/chart/chart.min.js"></script>
        <script src="assets/js/admin.js"></script>
    </body>
</html>