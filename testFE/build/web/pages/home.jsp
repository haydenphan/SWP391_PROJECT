<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>
<!doctype html>
<html class="no-js" lang="zxx">

    <head>
        <%-- HEAD --%>
        <%@ include file="../template/head.jsp" %>
        <style>
            .course-main-items .course-item {
                display: none;
            }

            .course-main-items .course-item.active {
                display: block;
            }
        </style>
    </head>

    <body>
        <%-- PRE LOADER --%>
        <%@ include file="../template/preLoader.jsp" %>
        <%-- SIDE TOGGLE --%>
        <%@ include file="../template/sideToggle.jsp" %>
        <%-- HEADER --%>
        <%@ include file="../template/header.jsp" %>

        <main>
            <!-- BANNER -->
            <%@ include file="../template/homeBanner.jsp" %>
            <!-- TOP CATEGORIES -->
            <%@ include file="../template/categoryArea.jsp" %>
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
                                <h2>Discover<br> World's Best <span class="down-mark-line">Courses</span></h2>
                            </div>
                        </div>
                        <div class="col-xl-7 col-lg-7">
                            <div class="portfolio-button mt-60">
                                <button class="filter-button active" data-filter="*">View All<span class="port-red">[06]</span></button>
                                <button class="filter-button" data-filter=".c-1">Data Science<span class="port-red">[01]</span></button>
                                <button class="filter-button" data-filter=".c-2">Development<span class="port-red">[03]</span></button>
                                <button class="filter-button" data-filter=".c-3">Business<span class="port-red">[01]</span></button>
                                <button class="filter-button" data-filter=".c-4">Life Styles<span class="port-red">[01]</span></button>
                            </div>
                        </div>
                    </div>
                    <div class="row grid course-main-items">
                        <c:forEach var="course" items="<%=CourseDAO.getCoursesSortedByEnrollment()%>" begin="0" end="5">
                            <c:set var="currentCourse" value="${course}" scope="request" />
                            <jsp:include page="../template/course/homeCourseComponent.jsp" />
                        </c:forEach>
                    </div>
                </div>
            </section>
            <!-- portfolio main area end -->
        </main>

        <%-- FOOTER --%>
        <%@ include file="../template/footer.jsp" %>
        <%-- BACK TO TOP --%>
        <%@ include file="../template/backToTop.jsp" %>

        <!-- JS here -->
        <%@ include file="../template/script.jsp" %>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const buttons = document.querySelectorAll(".filter-button");
                const courses = document.querySelectorAll(".course-item");

                buttons.forEach(button => {
                    button.addEventListener("click", () => {
                        buttons.forEach(btn => btn.classList.remove("active"));
                        button.classList.add("active");

                        const filter = button.getAttribute("data-filter");

                        courses.forEach(course => {
                            if (filter === "*" || course.classList.contains(filter.substring(1))) {
                                course.classList.add("active");
                            } else {
                                course.classList.remove("active");
                            }
                        });
                    });
                });

                // Initially display all courses
                document.querySelector('.filter-button.active').click();
            });
        </script>
    </body>

</html>
