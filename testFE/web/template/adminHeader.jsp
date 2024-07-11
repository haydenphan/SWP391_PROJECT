<header>
    <div class="header-area header-transparent sticky-header">
        <div class="container-fluid">
            <div class="header-main-wrapper">
                <div class="row align-items-center">
                    <div class="col-xl-7 col-lg-7 col-md-5 col-sm-9 col-9">
                        <div class="header-left d-flex align-items-center">
                            <div class="header-logo">
                                <a href="${pageContext.request.contextPath}/admin/adminHome.jsp"><img src="${pageContext.request.contextPath}/img/logo/logo-black.png" alt="logo"></a>
                            </div>

                            <div class="main-menu d-none d-xl-block">
                                <nav id="mobile-menu">
                                    <ul>
                                        <li class="menu-item-has-children"><a href="#">User</a>
                                            <ul class="sub-menu">
                                                <li><a href="${pageContext.request.contextPath}/manageuser?action=viewList">View User List</a></li>
                                                <li><a href="${pageContext.request.contextPath}/manageuser?action=viewList">View User Report</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children"><a href="#">Course</a>
                                            <ul class="sub-menu">
                                                <li><a href="${pageContext.request.contextPath}/pending-course-list">Pending Courses</a></li>
                                                <li><a href="${pageContext.request.contextPath}/AdminCategory">Category Management</a></li>
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
                                        <li class="nav-item">
                                            <a class="nav-link" href="#" id="walletIcon">
                                                <i class="fas fa-wallet"></i> Wallet
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>

                        </div>
                    </div>
                    <div class="col-xl-5 col-lg-5 col-md-7 col-sm-3 col-3">
                        <div class="header-right d-flex align-items-center justify-content-end">

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

                            <!-- Display user avatar if logged in, otherwise display Sign In and Sign Up buttons -->
                            <c:choose>
                                <c:when test="${user != null}">


                                    <div class="user-avatar-wrapper mr-30">
                                        <a href="#" 
                                           class="user-avatar-btn">
                                            <div class="header__user-avatar p-relative">
                                                <img src="${user.getAvatar()}" alt="User Avatar" style="width: 40px; height: 40px; border-radius: 50%;">
                                            </div>
                                        </a>
                                    </div>


                                    <div class="user-logout-wrapper mr-30">
                                        <a href="${pageContext.request.contextPath}/LogoutServlet" class="user-logout-btn">
                                            <i class="fas fa-sign-out-alt"></i>
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