<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="model.*" %>
<%@ page import="utils.NumberUtils" %>
<%@ page import="DAO.*" %>

<%
    Course currentCourse = (Course) request.getAttribute("currentCourse");
    User user = (User) session.getAttribute("user");
%>

<style>
    .fixed-size-img {
        width: 300px; /* Set the desired width */
        height: 200px; /* Set the desired height */
        object-fit: cover; /* Ensure the image covers the area while maintaining aspect ratio */
        display: block; /* Ensure images are block-level elements */
    }

    .eduman-course-img {
        overflow: hidden; /* Hide overflow to ensure no extra parts of the image are shown */
    }
</style>

<div class="col-xl-6 col-lg-6 col-md-6 col-md-6">
    <div class="eduman-course-main-wrapper mb-30">
        <div class="eduman-course-img w-img">
            <a href="course-details.html">
                <img class="fixed-size-img" src="<%= currentCourse.getImageURL()%>" alt="course-img">
            </a>
        </div>
        <div class="eduman-course-wraper">
            <div class="eduman-course-heading">
                <a href="${pageContext.request.contextPath}/CourseList?subcategoryID=${currentCourse.subcategoryID}" class="course-link-color-4">
                    <%= SubcategoryDAO.getCategoryNameBySubId(currentCourse.getSubcategoryID())%>
                </a>
                <div class="course-icon">
                    (${currentCourse.avgRatingDisplay(1)})
                    <i class="fas fa-star"></i>
                    avg
                </div>
            </div>
            <div class="eduman-course-text">
                <h3><%= currentCourse.getCourseName()%></h3>
            </div>
            <div class="eduman-course-meta">
                <div class="eduman-course-price">
                    <span class="price-now">$<%= currentCourse.getPrice()%> </span>
                </div>
                <div class="eduman-course-tutor">
                    <a href="instructor-profile.html">
                        <img width="35" style="border-radius: 30px" src="<%= user != null ? user.getAvatar() : ""%>" alt="tutor-img">
                    </a>
                    <a href="instructor-profile.html">
                        <span>
                            <%= user != null ? user.getFirstName() + " " + user.getLastName() : ""%>
                        </span>
                    </a>
                </div>
            </div>
        </div>
        <div class="eduman-course-footer">
            <div class="course-lessson-svg">
                <span class="course-link-color-<%= currentCourse.IsPublished() ? "1" : "5"%>">
                    <%= currentCourse.IsPublished() ? "Published" : "Pending"%>
                </span>
            </div>
            <div class="course-deteals-btn">
                <a href="${pageContext.request.contextPath}/edit-course-servlet?courseId=<%= currentCourse.getCourseID()%>">
                    <span class="me-2">Edit</span>
                </a>
            </div>
        </div>
    </div>
</div>
