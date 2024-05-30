<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="zxx">


    <head>
        <%-- HEAD --%>
        <%@ include file="../template/head.jsp" %>
    </head>

    <body>
        <%-- PRE LOADER --%>
        <%@ include file="../template/preLoader.jsp" %>

        <%-- SIDE TOGGLE --%>
        <%@ include file="../template/sideToggle.jsp" %>

        <%-- HEADER --%>
        <%@ include file="../template/header.jsp" %>

        <main>

            <!-- hero-area -->
            <jsp:include page="../template/heroArea.jsp">
                <jsp:param name="title" value="Courses" />
            </jsp:include>

            <!-- course-bar up-area -->
            <%@ include file="../template/course/courseBarUpArea.jsp" %>

            <!-- course-content-start -->
            <section class="course-content-area pb-90">
                <div class="container">
                    <div class="row mb-10">
                        <div class="col-xl-3 col-lg-4 col-md-8">
                            <div class="course-sidebar-widget mb-20">
                                <div class="course-sidebar-info">
                                    <h3 class="drop-btn">Categories</h3>
                                    <ul>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="checkbox" id="e-bus">
                                                <label class="edu-check-label" for="e-bus">Business (12)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="checkbox" id="e-dev">
                                                <label class="edu-check-label" for="e-dev">Development (9)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="checkbox" id="e-data">
                                                <label class="edu-check-label" for="e-data">Data Science (25)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="checkbox" id="e-art">
                                                <label class="edu-check-label" for="e-art">Arts & Design (10)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="checkbox" id="e-fin">
                                                <label class="edu-check-label" for="e-fin">Finance (8)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="checkbox" id="e-mark">
                                                <label class="edu-check-label" for="e-mark">Marketing (22)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="checkbox" id="e-per">
                                                <label class="edu-check-label" for="e-per">Management (12)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="checkbox" id="e-heal">
                                                <label class="edu-check-label" for="e-heal">Health & Fitness (5)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="checkbox" id="e-photo">
                                                <label class="edu-check-label" for="e-photo">Photography (18)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="checkbox" id="e-music">
                                                <label class="edu-check-label" for="e-music">Music (21)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="checkbox" id="e-acad">
                                                <label class="edu-check-label" for="e-acad">Academic (16)</label>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="course-sidebar-widget mb-20">
                                <div class="course-sidebar-info">
                                    <h3 class="drop-btn">Ratings</h3>
                                    <ul>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="radio" id="e-25" name="rating">
                                                <label class="edu-check-star" for="e-25">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    (25)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="radio" id="e-24" name="rating">
                                                <label class="edu-check-star" for="e-24">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fal fa-star"></i>
                                                    (25)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="radio" id="e-12" name="rating">
                                                <label class="edu-check-star" for="e-12">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fal fa-star"></i>
                                                    <i class="fal fa-star"></i>
                                                    (12)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="radio" id="e-28" name="rating">
                                                <label class="edu-check-star" for="e-28">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fal fa-star"></i>
                                                    <i class="fal fa-star"></i>
                                                    <i class="fal fa-star"></i>
                                                    (28)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="radio" id="e-14" name="rating">
                                                <label class="edu-check-star" for="e-14">
                                                    <i class="fas fa-star">
                                                    </i> <i class="fal fa-star">
                                                    </i> <i class="fal fa-star">
                                                    </i><i class="fal fa-star">
                                                    </i><i class="fal fa-star"></i>
                                                    (14)</label>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="course-sidebar-widget mb-20">
                                <div class="course-sidebar-info">
                                    <h3 class="drop-btn">Price</h3>
                                    <ul>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="radio" id="e-85" name="price">
                                                <label class="edu-check-label" for="e-85">All (85)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="radio" id="e-all" name="price">
                                                <label class="edu-check-label" for="e-all">Free (21)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="radio" id="f-all" name="price">
                                                <label class="edu-check-label" for="f-all">Paid (54)</label>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="course-sidebar-widget mb-20">
                                <div class="course-sidebar-info">
                                    <h3 class="drop-btn">Level</h3>
                                    <ul>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="checkbox" id="e-lave">
                                                <label class="edu-check-label" for="e-lave">All levels (5)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="checkbox" id="e-beg">
                                                <label class="edu-check-label" for="e-beg">Beginner (36)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="checkbox" id="e-inter">
                                                <label class="edu-check-label" for="e-inter">Intermediate (25)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="checkbox" id="e-exp">
                                                <label class="edu-check-label" for="e-exp">Expert (32)</label>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="course-sidebar-widget mb-20">
                                <div class="course-sidebar-info">
                                    <h3 class="drop-btn">Language</h3>
                                    <ul>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="checkbox" id="e-eng">
                                                <label class="edu-check-label" for="e-eng">English (21))</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="checkbox" id="e-hin">
                                                <label class="edu-check-label" for="e-hin">Hindi (12)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="checkbox" id="e-fren">
                                                <label class="edu-check-label" for="e-fren">French (7)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="checkbox" id="e-japa">
                                                <label class="edu-check-label" for="e-japa">Japanese (10)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="checkbox" id="e-kore">
                                                <label class="edu-check-label" for="e-kore">Korean (5)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="checkbox" id="m-japa">
                                                <label class="edu-check-label" for="m-japa">Japanese (10))</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="checkbox" id="e-span">
                                                <label class="edu-check-label" for="e-span">Spanish (14)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="checkbox" id="e-ita">
                                                <label class="edu-check-label" for="e-ita">Italian (8)</label>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="course-sidebar-widget mb-20">
                                <div class="course-sidebar-info">
                                    <h3 class="drop-btn">Duration</h3>
                                    <ul>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="checkbox" id="e-less">
                                                <label class="edu-check-label" for="e-less">Less than 1 Hours (24)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="checkbox" id="e-36">
                                                <label class="edu-check-label" for="e-36">1-2 Hours (36)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="checkbox" id="m-25">
                                                <label class="edu-check-label" for="m-25">2-5 Hours (25)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="checkbox" id="m-32">
                                                <label class="edu-check-label" for="m-32">6-7 Hours (32)</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="checkbox" id="m-11">
                                                <label class="edu-check-label" for="m-11">7-10 Hours (11)</label>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-9 col-lg-8 col-md-12">
                            <div class="row">
                                <c:forEach var="course" items="${courses}">
                                    <jsp:include page="../template/course/courseComponent.jsp">
                                        <jsp:param name="courseID" value="${course.getCourseID()}" />
                                    </jsp:include>
                                </c:forEach>                                
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- course-content-end -->

        </main>

        <%-- FOOTER --%>
        <%@ include file="../template/footer.jsp" %>

        <%-- BACK TO TOP --%>
        <%@ include file="../template/backToTop.jsp" %>

        <!-- JS here -->
        <%@ include file="../template/script.jsp" %>
    </body>

</html>
