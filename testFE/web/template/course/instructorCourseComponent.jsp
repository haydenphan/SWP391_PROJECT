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

    .course-menu {
        position: absolute;
        top: 10px;
        right: 10px;
    }

    .dropdown-toggle::after {
        display: none; /* Remove the default arrow */
    }

    .course-menu .fas {
        color: black; /* Set the icon color to black */
    }

    .dropdown-menu .dropdown-item:hover {
        background-color: #2467EC;
        color: white;
    }
</style>

<div class="col-xl-6 col-lg-6 col-md-6 col-md-6">
    <div class="eduman-course-main-wrapper mb-30 position-relative">
        <div class="eduman-course-img w-img position-relative">
            <a href="course-details.html">
                <img class="fixed-size-img" src="<%= currentCourse.getImageURL()%>" alt="course-img">
            </a>
            <div class="dropdown course-menu">
                <button class="btn btn-link dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-ellipsis-v"></i>
                </button>
                <div style="padding: 0px" class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/edit-course-info-servlet?courseId=<%= currentCourse.getCourseID()%>">Edit Course Info</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/course-section-servlet?courseId=<%= currentCourse.getCourseID()%>">Manage Course Details</a>
                </div>
            </div>
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
                <% if (!currentCourse.IsPublished()) {%>
                <div style="margin: 10px 0px" class="course-deteals-btn">
                    <a href="${pageContext.request.contextPath}/course-approval-servlet/request?courseId=<%= currentCourse.getCourseID()%>&instructorId=<%=user.getUserID()%>">
                        <i class="fas fa-paper-plane"></i>
                        <span class="me-2">Publication Request</span>
                    </a>
                </div>
                <% }%>
            </div>
            <div class="course-deteals-btn">
                <a href="${pageContext.request.contextPath}/view-section-servlet?courseId=<%= currentCourse.getCourseID()%>">
                    <i class="fas fa-eye"></i>
                    <span class="me-2">View</span>
                </a>
            </div>
        </div>
    </div>
</div>
