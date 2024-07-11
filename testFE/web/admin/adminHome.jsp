<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>
<%@ page import="DAO.*" %>
<%@ page import="java.util.List" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <%
        User user = (User) session.getAttribute("user");
        int role = (user != null) ? user.getRole() : 0;
        CourseDAO courseDAO = new CourseDAO();
        List<Course> topEnroll = courseDAO.listPopularCourse();
    %>

    <head>
        <%-- HEAD --%>
        <!-- Modal CSS -->
        <style>
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0, 0, 0, 0.4);
                padding-top: 60px;
            }

            .modal-content {
                background-color: #fefefe;
                margin: 5% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
            }

            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
        </style>

        <!-- Vendors Style-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/adminCSS/css/vendors_css.css">

        <!-- Style-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/adminCSS/css/horizontal-menu.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/adminCSS/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/adminCSS/css/skin_color.css">

        <%@ include file="../template/head.jsp" %>

        <script src="<c:url value='/js/notifications.js'/>"></script>
        <link rel="stylesheet" href="<c:url value='/css/notifications.css'/>">
    </head>

    <body class="layout-top-nav light-skin theme-primary fixed">

        <%-- PRE LOADER --%>
        <%@ include file="../template/preLoader.jsp" %>

        <%-- SIDE TOGGLE --%>
        <%@ include file="../template/sideToggle.jsp" %>

        <%-- HEADER --%>
        <%@ include file="../template/adminHeader.jsp" %>

        <div class="wrapper">
            <div class="content-wrapper">
                <div class="container-full">
                    <!-- Main content -->
                    <section class="content">
                        <div class="row">
                            <div class="col-xl-9 col-12">
                                <div class="box bg-success">
                                    <div class="box-body d-flex p-0">
                                        <div class="flex-grow-1 p-30 flex-grow-1 bg-img bg-none-md"
                                             style="background-position: right bottom; background-size: auto 100%; background-image: url(https://edulearn-lms-admin-template.multipurposethemes.com/images/svg-icon/color-svg/custom-30.svg)">
                                            <div class="row">
                                                <div class="col-12 col-xl-7">
                                                    <h1 class="mb-0 fw-600">Learn With Effectively With Us!</h1>
                                                    <p class="my-10 fs-16 text-white-70">Get 30% off every course on January.</p>
                                                    <div class="mt-45 d-md-flex align-items-center">
                                                        <div class="me-30 mb-30 mb-md-0">
                                                            <div class="d-flex align-items-center">
                                                                <div
                                                                    class="me-15 text-center fs-24 w-50 h-50 l-h-50 bg-danger b-1 border-white rounded-circle">
                                                                    <i class="fa fa-graduation-cap"></i>
                                                                </div>
                                                                <div>
                                                                    <h5 class="mb-0">Students</h5>
                                                                    <p class="mb-0 text-white-70">75,000+</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <div class="d-flex align-items-center">
                                                                <div
                                                                    class="me-15 text-center fs-24 w-50 h-50 l-h-50 bg-warning b-1 border-white rounded-circle">
                                                                    <i class="fa fa-user"></i>
                                                                </div>
                                                                <div>
                                                                    <h5 class="mb-0">Expert Mentors</h5>
                                                                    <p class="mb-0 text-white-70">200+</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-xl-5"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-12">
                                <div class="box bg-transparent no-shadow">
                                    <div class="box-body p-xl-0 text-center">
                                        <h3 class="px-30 mb-20">Have More<br>knowledge to share?</h3>
                                        <a href="course.html" class="waves-effect waves-light w-p100 btn btn-primary"><i
                                                class="fa fa-plus me-15"></i> Create New Course</a>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <a class="box box-link-shadow text-center pull-up" href="javascript:void(0)">
                                            <div class="box-body py-5 bg-primary-light px-5">
                                                <p class="fw-500 text-primary text-overflow">Courses in Progress</p>
                                            </div>
                                            <div class="box-body p-10">
                                                <h1 class="countnm fs-40 m-0">5</h1>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-6">
                                        <a class="box box-link-shadow text-center pull-up" href="javascript:void(0)">
                                            <div class="box-body py-5 bg-primary-light px-5">
                                                <p class="fw-500 text-primary text-overflow">Forum Discussion</p>
                                            </div>
                                            <div class="box-body p-10">
                                                <h1 class="countnm fs-40 m-0">25</h1>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 col-12">
                                <div class="box no-shadow mb-0 bg-transparent">
                                    <div class="box-header no-border px-0">
                                        <h3 class="fw-500 box-title">Popular Courses</h3>
                                        <div class="box-controls pull-right d-md-flex d-none">
                                            <a href="./PendingCourseList">All Courses</a>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <c:forEach var="c" items="<%=topEnroll%>">
                                        <div class="box mb-15 pull-up" style="width: 100%; max-width: 500px;">
                                            <div class="box-body" style="padding: 15px;">
                                                <div class="d-flex align-items-center justify-content-between">
                                                    <div class="d-flex align-items-center">
                                                        <div class="me-15 bg-warning h-90 w-100 l-h-100 rounded text-center">
                                                            <span style="padding: 0px 10px" class="fs-50">C</span>
                                                        </div>
                                                        <div class="d-flex flex-column fw-500" style="min-width: 200px;">
                                                            <a href="course.html" class="text-dark hover-warning mb-1 fs-16">${c.getCourseName()}</a>
                                                            <span class="text-fade">${c.getTotalEnrolled()} ENROLLED</span>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex align-items-center">
                                                        <a href="${pageContext.request.contextPath}/AdminCourseDetail?id=${c.getCourseID()}" class="waves-effect waves-light btn btn-sm btn-warning-light me-10" style="min-width: 120px; text-align: center;">
                                                            View Courses
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>

                                </div>
                            </div>

                            <div class="col-xl-4 col-12">
                                <div class="box no-shadow mb-0 bg-transparent">
                                    <div class="box-header no-border px-0">
                                        <h3 class="fw-500 box-title">Best Instructors</h3>
                                        <div class="box-controls pull-right d-md-flex d-none">
                                            <a href="#">See All</a>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <div class="box mb-15 pull-up">
                                        <div class="box-body">
                                            <div class="d-flex align-items-center justify-content-between">
                                                <div class="d-flex align-items-center">
                                                    <div class="me-15 mb-1">
                                                        <img src="${pageContext.request.contextPath}/images/avatar/avatar-1.png"
                                                             class="bg-primary-light avatar avatar-lg rounded-circle" alt="">
                                                    </div>
                                                    <div class="d-flex flex-column fw-500">
                                                        <a href="extra_profile.html"
                                                           class="text-dark hover-primary mb-1 fs-16">Nil Yeager</a>
                                                        <span class="text-fade">5 Design Course</span>
                                                    </div>
                                                </div>

                                                <div class="d-flex align-items-center">
                                                    <a href="course.html"
                                                       class="waves-effect waves-light btn btn-sm btn-secondary">Courses</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box mb-15 pull-up">
                                        <div class="box-body">
                                            <div class="d-flex align-items-center justify-content-between">
                                                <div class="d-flex align-items-center">
                                                    <div class="me-15 mb-1">
                                                        <img src="${pageContext.request.contextPath}/images/avatar/avatar-2.png"
                                                             class="bg-primary-light avatar avatar-lg rounded-circle" alt="">
                                                    </div>
                                                    <div class="d-flex flex-column fw-500">
                                                        <a href="extra_profile.html"
                                                           class="text-dark hover-primary mb-1 fs-16">Theron Trump</a>
                                                        <span class="text-fade">5 Design Course</span>
                                                    </div>
                                                </div>

                                                <div class="d-flex align-items-center">
                                                    <a href="course.html"
                                                       class="waves-effect waves-light btn btn-sm btn-secondary">Courses</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box mb-15 pull-up">
                                        <div class="box-body">
                                            <div class="d-flex align-items-center justify-content-between">
                                                <div class="d-flex align-items-center">
                                                    <div class="me-15" style="margin-bottom: 1px;">
                                                        <img src="${pageContext.request.contextPath}/images/avatar/avatar-3.png"
                                                             class="bg-primary-light avatar avatar-lg rounded-circle" alt="">
                                                    </div>
                                                    <div class="d-flex flex-column fw-500">
                                                        <a href="extra_profile.html"
                                                           class="text-dark hover-primary mb-1 fs-16">Tyler Mark</a>
                                                        <span class="text-fade">5 Design Course</span>
                                                    </div>
                                                </div>

                                                <div class="d-flex align-items-center">
                                                    <a href="course.html"
                                                       class="waves-effect waves-light btn btn-sm btn-secondary">Courses</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box mb-15 pull-up">
                                        <div class="box-body">
                                            <div class="d-flex align-items-center justify-content-between">
                                                <div class="d-flex align-items-center">
                                                    <div class="me-15">
                                                        <img src="${pageContext.request.contextPath}/images/avatar/avatar-4.png"
                                                             class="bg-primary-light avatar avatar-lg rounded-circle" alt="">
                                                    </div>
                                                    <div class="d-flex flex-column fw-500">
                                                        <a href="extra_profile.html"
                                                           class="text-dark hover-primary mb-1 fs-16">Johen Mark</a>
                                                        <span class="text-fade">5 Design Course</span>
                                                    </div>
                                                </div>

                                                <div class="d-flex align-items-center">
                                                    <a href="course.html"
                                                       class="waves-effect waves-light btn btn-sm btn-secondary">Courses</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <div class="col-xl-4 col-12">
                                <div class="box no-shadow mb-0 bg-transparent">
                                    <div class="box-header no-border px-0">
                                        <h3 class="fw-500 box-title">Current Activity</h3>
                                    </div>
                                </div>
                                <div class="box">
                                    <div class="box-body pb-0">
                                        <div class="mb-15 w-p100 d-flex align-items-center justify-content-between">
                                            <div>
                                                <h3 class="my-0">Monthly Progress</h3>
                                                <p class="mb-0 text-fade">This is the latest Improvement</p>
                                            </div>
                                            <div class="input-group w-auto">
                                                <button type="button" class="btn btn-primary-light btn-circle"
                                                        id="daterange-btn">
                                                    <p><i class="fa fa-calendar"></i></p>
                                                </button>
                                            </div>
                                        </div>
                                        <div id="charts_widget_2_chart"></div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-7">
                                        <div class="box bg-warning">
                                            <div class="box-body">
                                                <h2 class="my-0 fw-600 text-white">450K+</h2>
                                                <p class="mb-10 text-white-80">Completed Course</p>
                                                <div class="d-flex align-items-center justify-content-between">
                                                    <p class="mb-0 text-white-70">This is the latest Data</p>
                                                    <button type="button"
                                                            class="waves-effect waves-circle btn btn-circle btn-warning-light"><i
                                                            class="mdi mdi-arrow-top-right"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-5">
                                        <div class="box bg-danger">
                                            <div class="box-body">
                                                <h2 class="my-0 fw-600 text-white">200K+</h2>
                                                <p class="mb-10 text-white-80">Video Course</p>
                                                <div class="d-flex align-items-center justify-content-end">
                                                    <button type="button"
                                                            class="waves-effect waves-circle btn btn-circle btn-danger-light"
                                                            data-bs-toggle="modal" data-bs-target="#exampleModal"><i
                                                            class="mdi mdi-play"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-hidden="true">
                                            <div class="modal-dialog modal-xl modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="ratio ratio-16x9">
                                                        <iframe
                                                            src="http://player.vimeo.com/video/473177594?title=0&amp;portrait=0&amp;byline=0&amp;autoplay=1"
                                                            title="video" allowfullscreen></iframe>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </section>
                    <!-- Modal HTML -->
                    <div id="walletModal" class="modal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Wallet Balance</h5>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <p id="walletBalance">Loading...</p>
                                    <form id="withdrawForm" action="${pageContext.request.contextPath}/withdraw" method="post">
                                        <div class="form-group">
                                            <label for="accountNumber">Account Number:</label>
                                            <input type="text" class="form-control" id="accountNumber" name="accountNumber" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="bankName">Bank Name:</label>
                                            <input type="text" class="form-control" id="bankName" name="bankName" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="amount">Amount:</label>
                                            <input type="number" class="form-control" id="amount" name="amount" required>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Withdraw</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                        
                                        <%@ include file="statisticalCourseEnrolled.jsp" %>

        <%-- FOOTER --%>
        <%@ include file="../template/footer.jsp" %>

        <%-- BACK TO TOP --%>
        <%@ include file="../template/backToTop.jsp" %>

        <!-- JS here -->
        <%@ include file="../template/script.jsp" %>

        <!-- Vendor JS -->
        <script src="${pageContext.request.contextPath}/adminCSS/js/vendors.min.js"></script>
        <script src="${pageContext.request.contextPath}/adminCSS/js/pages/chat-popup.js"></script>
        <script src="${pageContext.request.contextPath}/assets/icons/feather-icons/feather.min.js"></script>

        <script src="${pageContext.request.contextPath}/assets/vendor_components/apexcharts-bundle/dist/apexcharts.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor_components/moment/min/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor_components/bootstrap-daterangepicker/daterangepicker.js"></script>

        <script src="${pageContext.request.contextPath}/adminCSS/js/demo.js"></script>
        <script src="${pageContext.request.contextPath}/adminCSS/js/jquery.smartmenus.js"></script>
        <script src="${pageContext.request.contextPath}/adminCSS/js/menus.js"></script>
        <script src="${pageContext.request.contextPath}/adminCSS/js/template.js"></script>
        <script src="${pageContext.request.contextPath}/adminCSS/js/pages/dashboard.js"></script>
        <!-- Modal JavaScript -->
        <script type="text/javascript">
            var contextPath = '<%= request.getContextPath()%>';
        </script>
        <script src="${pageContext.request.contextPath}/adminCSS/js/adminWallet.js"></script>

    </body>
</html>