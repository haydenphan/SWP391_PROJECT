<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>
<%@ page import="DAO.*" %>
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
            <%@ include file="../template/portfolio.jsp" %>
            <!-- features-area-start-->
            <%@ include file="../template/featureArea.jsp" %>
            <!-- student-choose-area start -->
            <%@ include file="../template/studentChoose.jsp" %>
            <!-- browser-area start -->
            <%@ include file="../template/browser.jsp" %>

            <div class="testimonial-area pb-120">

            </div>

            <!-- education-area start -->
            <%@ include file="../template/education.jsp" %>

            <div class="brand-area theme-bg pt-90 pb-120">

            </div>
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
