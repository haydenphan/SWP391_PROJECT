<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="model.*" %>
<%@ page import="utils.NumberUtils" %>
<%@ page import="DAO.*" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.ZoneId" %>
<%@ page import="java.util.Date" %>

<%
    CourseSection currentSection = (CourseSection) request.getAttribute("currentSection");
    User user = (User) session.getAttribute("user");

    Date createdDate = Date.from(currentSection.getCreatedDate().atZone(ZoneId.systemDefault()).toInstant());
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

    .course-menu .fas {
        color: black; /* Set the icon color to black */
    }

    .eduman-course-main-wrapper {
        border: 1px solid #d3d3d3;
        border-radius: 15px;
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 20px;
        transition: transform 0.3s ease-in-out;
    }

    .eduman-course-main-wrapper:hover {
        transform: translateY(-5px);
    }

    .eduman-course-meta {
        margin-bottom: 20px;
    }

    .course-deteals-btn a, .course-lessson-svg a {
        color: #2467EC;
        text-decoration: none;
        font-weight: bold;
        display: flex;
        align-items: center;
        transition: color 0.3s ease-in-out;
    }

    .course-deteals-btn a:hover, .course-lessson-svg a:hover {
        color: #1b53bb;
    }

    .course-deteals-btn a .fas, .course-lessson-svg a .fas {
        margin-right: 5px;
    }
</style>

<div class="col-xl-12 col-lg-12 col-md-12 col-md-12">
    <div class="eduman-course-main-wrapper mb-30 position-relative">
        <div class="eduman-course-wraper">
            <div class="eduman-course-meta">
                <div style="margin-bottom: 20px">
                    <span>Created Date: <fmt:formatDate value="<%= createdDate%>" pattern="dd MMM yyyy"/> </span>
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
        <div class="eduman-course-footer d-flex justify-content-between">
            <div class="course-lessson-svg">
                <a href="${pageContext.request.contextPath}/edit-section-info?sectionId=<%= currentSection.getSectionID()%>">
                    <i class="fas fa-edit"></i>
                    <span class="me-2">Edit Section Info</span>
                </a>
            </div>
            <div class="course-deteals-btn">
                <a href="${pageContext.request.contextPath}/view-section-servlet?courseId=<%= currentSection.getCourseID()%>">
                    <i class="fas fa-eye"></i>
                    <span class="me-2">View Details</span>
                </a>
            </div>
        </div>
    </div>
</div>
