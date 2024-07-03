<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>
<%@ page import="DAO.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<script src="<c:url value='/js/notifications.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/css/notifications.css'/>">

    <%
        // String userName = (String)request.getAttribute("UserName");
        User user = (User) session.getAttribute("user");
        int role = (user != null) ? user.getRole() : 0;
        request.setAttribute("role", role);
    %>

    <c:choose>
        <c:when test="${role == 1}">
            <div>
                <%@ include file="../template/cartMini.jsp" %>
            </div>

        </c:when>
        <c:otherwise>
        </c:otherwise>
    </c:choose>

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
                                                    <%
                                                        List<Course> courses = null;
                                                        ArrayList<Category> categories = CategoryDAO.selectAllWithSubCategories();
                                                        if (categories != null) {
                                                            for (Category category : categories) {
                                                    %>
                                                    <li class="item-has-children">
                                                        <a href="${pageContext.request.contextPath}/CourseList?categoryID=<%=category.getCategoryID()%>"><%=category.getName()%></a>
                                                        <ul class="category-submenu">
                                                            <li><a href="${pageContext.request.contextPath}/CourseList?categoryID=<%=category.getCategoryID()%>"> All <%=category.getName()%></a></li>
                                                                <%
                                                                    for (SubCategory subCategory : category.getSubCategories()) {
                                                                %>
                                                            <li><a href="${pageContext.request.contextPath}/CourseList?subcategoryID=<%=subCategory.getSubCategoryID()%>"><%=subCategory.getName()%></a></li>
                                                                <%
                                                                    }
                                                                %>
                                                        </ul>
                                                    </li>
                                                    <%
                                                            }
                                                        }
                                                    %>
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
                                            <li class="menu-item-has-children"><a href="${pageContext.request.contextPath}/CourseList">Course</a>
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
                                    <form action="${pageContext.request.contextPath}/search" method="get">
                                        <div class="search-icon p-relative">
                                            <input name="txt" type="text" placeholder="Search courses...">
                                                <button type="submit"><i class="fas fa-search"></i></button>
                                        </div>
                                    </form>
                                </div>

                                <c:choose>
                                    <c:when test="${user != null}">
                                        <div class="notification-bell">
                                            <i class="fa fa-bell" onclick="toggleNotificationPopup()"></i>
                                            <div class="notification-popup" id="notificationPopup">
                                                <div class="notification-header">Notifications</div>
                                                <div id="notification-list"></div>
                                                <div id="load-all" class="load-all" onclick="toggleLoadAll()">Load All</div>
                                                <!-- Notifications will be dynamically added here -->
                                            </div>
                                        </div>

                                    </c:when>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${role == 1}">
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
                                                    <span class="item-number">
                                                        ${cartDetails != null && !cartDetails.isEmpty() ? cartDetails.size() : 0}
                                                    </span>
                                                </div>
                                            </a>
                                        </div>

                                    </c:when>
                                    <c:otherwise>
                                    </c:otherwise>
                                </c:choose>

                                <!-- Display user avatar if logged in, otherwise display Sign In and Sign Up buttons -->
                                <c:choose>
                                    <c:when test="${user != null}">


                                        <div class="user-avatar-wrapper mr-30">
                                            <a href="

                                               <% if (role == 2) { %>
                                               ${pageContext.request.contextPath}/pages/instructor-profile.jsp
                                               <% } else if (role == 1) { %>
                                               ${pageContext.request.contextPath}/user-profile"
                                               <% }%>

                                               " 
                                               class="user-avatar-btn">
                                                <div class="header__user-avatar p-relative">
                                                    <img src="${user.getAvatar()}" alt="User Avatar" style="width: 40px; height: 40px; border-radius: 50%;">
                                                </div>
                                            </a>
                                        </div>


                                        <div class="user-logout-wrapper mr-30">
                                            <a href="${pageContext.request.contextPath}/LogoutServlet" class="user-logout-btn">
                                                <i style="font-size: larger" class="fas fa-sign-out-alt"></i>
                                            </a>
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