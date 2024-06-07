<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.*" %>

<!doctype html>
<html class="no-js" lang="zxx">


    <head>
        <%-- HEAD --%>
        <%@ include file="../template/head.jsp" %>
    </head>

    <body>


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


                            <form action="filter-categories" method="get">
                                <div class="course-sidebar-widget mb-20">
                                    <div class="course-sidebar-info">
                                        <h3 class="drop-btn">Categories</h3>
                                        <ul>
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="radio" id="e-bus" name="categories" value="1" required>
                                                    <label class="edu-check-label" for="e-bus">Mobile app (12)</label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="radio" id="e-dev" name="categories" value="2">
                                                    <label class="edu-check-label" for="e-dev">Web Development (9)</label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="radio" id="e-data" name="categories" value="3">
                                                    <label class="edu-check-label" for="e-data">Development Tools(25)</label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="radio" id="e-art" name="categories" value="4">
                                                    <label class="edu-check-label" for="e-art">Database(10)</label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="radio" id="e-fin" name="categories" value="5">
                                                    <label class="edu-check-label" for="e-fin">Progamming League (8)</label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="radio" id="e-mark" name="categories" value="6">
                                                    <label class="edu-check-label" for="e-mark">Web design (22)</label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="radio" id="e-per" name="categories" value="7">
                                                    <label class="edu-check-label" for="e-per">Graphic Design (12)</label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="radio" id="e-heal" name="categories" value="8">
                                                    <label class="edu-check-label" for="e-heal">Design Tool (5)</label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="radio" id="e-photo" name="categories" value="9">
                                                    <label class="edu-check-label" for="e-photo">Communications (18)</label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="radio" id="e-music" name="categories" value="10">
                                                    <label class="edu-check-label" for="e-music">Finance (21)</label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="radio" id="e-acad" name="categories" value="11">
                                                    <label class="edu-check-label" for="e-acad">Management (16)</label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="radio" id="e-acad" name="categories" value="12">
                                                    <label class="edu-check-label" for="e-acad">Sales (16)</label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="radio" id="e-acad" name="categories" value="13">
                                                    <label class="edu-check-label" for="e-acad">Nutrition (16)</label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="radio" id="e-acad" name="categories" value="14">
                                                    <label class="edu-check-label" for="e-acad">Dieting (16)</label>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <button type="submit" class="view-details-btn">Lọc</button>
                                </div>

                            </form>
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
                            <form action="filter-price" method="get">

                                <div class="course-sidebar-widget mb-20">
                                    <div class="course-sidebar-info">
                                        <h3 class="drop-btn">Price</h3>
                                        <ul>
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="radio" id="e-85" name="price" value="1" required>
                                                    <label class="edu-check-label" for="e-85">All (85)</label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="radio" id="e-all" name="price" value="2" >
                                                    <label class="edu-check-label" for="e-all">Free (21)</label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="radio" id="f-all" name="price" value="3">
                                                    <label class="edu-check-label" for="f-all">Paid (54)</label>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <button type="submit" class="view-details-btn">Lọc</button>

                                </div>
                            </form>
                            <form action="filter-level" method="get">

                                <div class="course-sidebar-widget mb-20">
                                    <div class="course-sidebar-info">
                                        <h3 class="drop-btn">Level</h3>
                                        <ul>
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="radio" id="e-lave" name="level" value="4" required>
                                                    <label class="edu-check-label" for="e-lave">All levels (5)</label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="radio" id="e-beg" name="level" value="1">
                                                    <label class="edu-check-label" for="e-beg">Beginner (36)</label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="radio" id="e-inter" name="level" value="2">
                                                    <label class="edu-check-label" for="e-inter">Intermediate (25)</label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="radio" id="e-exp" name="level" value="3"  >
                                                    <label class="edu-check-label" for="e-exp">Expert (32)</label>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <button type="submit" class="view-details-btn">Lọc</button>

                                </div>
                            </form>
                            <form action="filter-language" method="get">

                                <div class="course-sidebar-widget mb-20">
                                    <div class="course-sidebar-info">
                                        <h3 class="drop-btn">Language</h3>
                                        <ul>
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="radio" id="e-eng" name="language" value="1"  required>
                                                    <label class="edu-check-label" for="e-eng">English (21)</label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="radio" id="e-span" name="language" value="2">
                                                    <label class="edu-check-label" for="e-span">Spanish (14)</label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="radio" id="e-span" name="language" value="3">
                                                    <label class="edu-check-label" for="e-fren">French (7)</label>
                                                </div>
                                            </li>
                                            
                                        </ul>
                                    </div>
                                    <button type="submit" class="view-details-btn">Lọc</button>

                                </div>
                            </form>
<!--                            <form action="filter-duration" method="get">

                                <div class="course-sidebar-widget mb-20">
                                    <div class="course-sidebar-info">
                                        <h3 class="drop-btn">Duration</h3>
                                        <ul>
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="radio" id="e-less" name="duration" value="1"  required>
                                                    <label class="edu-check-label" for="e-less">Less than 1 Hours (24)</label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="radio" id="e-36" name="duration" value="2">
                                                    <label class="edu-check-label" for="e-36">1-2 Hours (36)</label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="radio" id="m-25" name="duration" value="3">
                                                    <label class="edu-check-label" for="m-25">2-5 Hours (25)</label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="radio" id="m-32" name="duration" value="4">
                                                    <label class="edu-check-label" for="m-32">6-7 Hours (32)</label>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <button type="submit" class="view-details-btn">Lọc</button>
                                </div>
                            </form>-->

                        </div>
                        <%
                            // Retrieve the categoryID and subcategoryID from the request parameters
                            String categoryID = request.getParameter("category");
                            String subCategoryID = request.getParameter("subcategory");
                            courses = (List<Course>)request.getAttribute("courses");
                            System.out.println(courses);
                            if (categoryID != null) {
                                // Fetch courses based on the categoryID
                                courses = CourseDAO.selectByCategoryID(Integer.parseInt(categoryID));
                            } else if (subCategoryID != null) {
                                // Fetch courses based on the subcategoryID
                                courses = CourseDAO.selectBySubCategoryID(Integer.parseInt(subCategoryID));
                            } else if (courses == null){
                                // Fetch all courses if no categoryID or subcategoryID is provided
                                courses = CourseDAO.getAllCourses();
                            }

                            // Set the courses attribute for the page context
                            request.setAttribute("courses", courses);
                        %>

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