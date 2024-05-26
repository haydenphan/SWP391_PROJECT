<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>


<% 
           // String userName = (String)request.getAttribute("UserName");
            User user = (User)session.getAttribute("user");
            
%>

<!-- header-area-start  -->
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
                                                        <!--                                             <li><a href="course.jsp">All Development</a></li>
                                                                                                     <li><a href="course.jsp">Mobile App</a></li>
                                                                                                     <li><a href="course.jsp">Web Development</a></li>
                                                                                                     <li><a href="course.jsp">Development tools</a></li>
                                                                                                     <li><a href="course.jsp">Database</a></li>
                                                                                                     <li><a href="course.jsp">Programming language</a></li>-->
                                                    </ul>
                                                </li>
                                                <li class="item-has-children"><a href="course.jsp">Art & Design</a>
                                                    <ul class="category-submenu">
                                                        <!--                                             <li><a href="course.jsp">Web Design</a></li>
                                                                                                     <li><a href="course.jsp">Graphic Design</a></li>
                                                                                                     <li><a href="course.jsp">Design tools</a></li>
                                                                                                     <li><a href="course.jsp">All Art</a></li>
                                                                                                     <li><a href="course.jsp">Marketing</a></li>-->
                                                    </ul>
                                                </li>
                                                <li class="item-has-children"><a href="course.jsp">Business</a>
                                                    <ul class="category-submenu">
                                                        <!--                                             <li><a href="course.jsp">All Business</a></li>
                                                                                                     <li><a href="course.jsp">Communications</a></li>
                                                                                                     <li><a href="course.jsp">Finance</a></li>
                                                                                                     <li><a href="course.jsp">Management</a></li>
                                                                                                     <li><a href="course.jsp">Sales</a></li>-->
                                                    </ul>
                                                </li>
                                                <li class="item-has-children"><a href="course.jsp">Life Style</a>
                                                    <ul class="category-submenu">
                                                        <!--                                             <li><a href="course.jsp">Life Style</a></li>
                                                                                                     <li><a href="course.jsp">Mental Health</a></li>
                                                                                                     <li><a href="course.jsp">Dieting</a></li>
                                                                                                     <li><a href="course.jsp">All Art</a></li>
                                                                                                     <li><a href="course.jsp">Nutrition</a></li>-->
                                                    </ul>
                                                </li>
                                                <li class="item-has-children"><a href="course.jsp">Health & Fitness</a>
                                                    <ul class="category-submenu">
                                                        <!--                                             <li><a href="course.jsp">All Health & Fitness</a></li>
                                                                                                     <li><a href="course.jsp">Beauty & Makeup</a></li>
                                                                                                     <li><a href="course.jsp">Food & Beverages</a></li>
                                                                                                     <li><a href="course.jsp">Good Food</a></li>-->
                                                    </ul>
                                                    <!--                                       </li>
                                                                                           <li><a href="course.jsp">Data Science</a></li>
                                                                                           <li><a href="course.jsp">Marketing</a></li>
                                                                                           <li><a href="course.jsp">Photography</a></li>-->
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
                                                <!--                                       <li><a href="index.jsp">Home 1</a></li>
                                                                                       <li><a href="index-2.jsp">Home 2</a></li>
                                                                                       <li><a href="index-3.jsp">Home 3</a></li>-->
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children"><a href="course.jsp">Course</a>
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
                            <div class="header-search d-none d-xxl-block mr-30">
                                <form action="#">
                                    <div class="search-icon p-relative">
                                        <input type="text" placeholder="Search courses...">
                                            <button type="submit"><i class="fas fa-search"></i></button>
                                    </div>
                                </form>
                            </div>

                            <!-- Display user avatar if logged in, otherwise display Sign In and Sign Up buttons -->
                            <c:choose>
                                <c:when test="${user!=null}">
                                    <div class="user-avatar-wrapper mr-30">
                                        <a href="${pageContext.request.contextPath}/pages/user-profile.jsp" class="user-avatar-btn">
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
<!-- header-area-end -->
