<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>
<%@ page import="DAO.*" %>

<%
    Course course = (Course) request.getAttribute("course");
    User instructor = (User) request.getAttribute("instructor");
    InstructorCertificates certificate = (InstructorCertificates) request.getAttribute("certificate");
%>

<!DOCTYPE html>
<html>
    <head>
        <%-- HEAD --%>
        <%@ include file="../template/head.jsp" %>
        <style>
            /* Add your CSS styling here */
            /* Body styling */
            body {
                background-color: #f0f8ff;
            }

            /* Card styling */
            .card {
                border: 1px solid #d3d3d3;
                border-radius: 15px;
                background-color: #fff;
                transition: transform 0.3s ease-in-out;
            }

            /* Card header styling */
            .card-header {
                background: #2467EC;
                color: white;
                border-top-left-radius: 15px;
                border-top-right-radius: 15px;
                padding: 1.5rem;
                text-align: center;
                position: relative;
            }

            .card-title {
                margin-bottom: 0;
                font-size: 1.75rem;
                color: white;
            }

            /* Form group styling */
            .form-group {
                position: relative;
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 1rem; /* Space between the buttons */
                margin-top: 20px;
            }

            .form-control {
                border: 1px solid #d3d3d3;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                transition: box-shadow 0.3s ease-in-out, border-color 0.3s ease-in-out;
                padding: 0.75rem 1rem;
            }

            .form-control:focus {
                border-color: #1b53bb;
                box-shadow: 0 0 10px rgba(36, 103, 236, 0.2);
            }

            /* Primary button styling */
            .btn-primary {
                background-color: #2467EC;
                border: 1px solid #d3d3d3;
                border-radius: 20px;
                padding: 0.5rem 2rem;
                font-size: 1rem;
                transition: background-color 0.3s ease-in-out, box-shadow 0.3s ease-in-out, border-color 0.3s ease-in-out;
            }

            .btn-primary:hover {
                background-color: #1b53bb;
                border-color: #1b53bb;
                box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            }

            /* Back button styling */
            .btn-back {
                border: none;
                padding: 0.5rem;
                font-size: 1.5rem;
                transition: background-color 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
                position: absolute;
                left: 10px;
                top: 10px;
                background-color: transparent;
                color: white;
            }

            .btn-back:hover {
                background-color: #1b53bb;
            }

            .container-full {
                padding: 2rem 1rem;
            }

            .btn-container {
                display: flex;
                justify-content: center;
                align-items: center;
                position: relative;
                margin-top: 20px;
            }

            /* Status container styling */
            .status-container {
                margin-top: 30px;
                padding: 20px;
                border-radius: 10px;
                background-color: #e6f0ff;
                font-size: 1.2rem;
                font-weight: bold;
            }

            .status-pending {
                color: #ff0000;
            }

            .status-cancelled {
                color: #ff6347;
            }

            /* Delete icon styling */
            .delete-icon {
                background: none;
                border: none;
                font-size: 1.5rem;
                cursor: pointer;
                padding: 0;
                margin-left: 10px;
            }

            .delete-icon:hover {
                color: #ff6347;
            }

            .viewcer:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body class="layout-top-nav light-skin theme-primary">

        <div class="wrapper">
            <div class="content-wrapper">
                <div class="container-full">
                    <section class="content">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="card">
                                    <div class="card-header">
                                        <button type="button" class="btn btn-back" onclick="window.location.href = '${pageContext.request.contextPath}/pages/instructor-profile.jsp';">
                                            <i class="fas fa-arrow-left"></i>
                                        </button>
                                        <h5 class="card-title">Publication Request Form</h5>
                                        <p class="mb-0 card-subtitle text-light">Upload certificates and submit the information below.</p>
                                    </div>
                                    <div class="card-body p-4">
                                        <% if (certificate == null) {%>
                                        <form id="submitReviewForm" action="${pageContext.request.contextPath}/course-approval-servlet/submit" method="post" enctype="multipart/form-data">
                                            <input type="hidden" name="courseId" value="<%= course.getCourseID()%>">
                                            <input type="hidden" name="instructorId" value="<%= instructor.getUserID()%>">

                                            <div class="form-group mb-4">
                                                <label for="certificate">Upload Certificate:</label>
                                                <input type="file" class="form-control-file" name="certificate" id="certificate" accept="image/*,application/pdf" required>
                                            </div>

                                            <div class="btn-container">
                                                <button type="submit" class="btn btn-primary">Submit</button>
                                            </div>
                                        </form>
                                        <% } else {%>
                                        <div class="mt-4">
                                            <h4>Uploaded Certificate</h4>
                                            <div style="display: flex; align-items: center;">
                                                <a class="viewcer" href="<%= certificate.getCertificateUrl()%>" target="_blank">View Certificate</a>
                                                <form id="deleteReviewForm" action="${pageContext.request.contextPath}/course-approval-servlet/delete" method="post">
                                                    <input type="hidden" name="courseId" value="<%= course.getCourseID()%>">
                                                    <input type="hidden" name="instructorId" value="<%= instructor.getUserID()%>">
                                                    <button type="submit" class="delete-icon">
                                                        <i class="fas fa-times"></i>
                                                    </button>
                                                </form>
                                            </div>
                                            <form id="updateReviewForm" action="${pageContext.request.contextPath}/course-approval-servlet/update" method="post" enctype="multipart/form-data" class="mt-2">
                                                <input type="hidden" name="courseId" value="<%= course.getCourseID()%>">
                                                <input type="hidden" name="instructorId" value="<%= instructor.getUserID()%>">
                                                <div class="form-group mb-4">
                                                    <label for="certificate">Update Certificate:</label>
                                                    <input type="file" class="form-control-file" name="certificate" id="certificate" accept="image/*,application/pdf" required>
                                                </div>
                                                <div class="btn-container">
                                                    <button type="submit" class="btn btn-primary">Update</button>
                                                </div>
                                            </form>
                                        </div>
                                        <% }%>

                                        <%-- Display the current review status here if needed --%>
                                        <div class="status-container">
                                            <b>Current Status: <span class="<%= course.IsPublished() || !course.isIsCancelled() ? "status-pending" : "status-cancelled"%>"><%= course.IsPublished() || !course.isIsCancelled() ? "Pending" : "Cancelled"%></span></b>
                                        </div>

                                        <% if (!course.IsPublished()) {%>
                                        <div class="btn-container">
                                            <form id="resubmitRequestForm" action="${pageContext.request.contextPath}/course-approval-servlet/resubmit" method="post" enctype="multipart/form-data">
                                                <input type="hidden" name="courseId" value="<%= course.getCourseID()%>">
                                                <input type="hidden" name="instructorId" value="<%= instructor.getUserID()%>">
                                                <div class="form-group mb-4">
                                                    <label for="certificate">Upload Certificate (optional):</label>
                                                    <input type="file" class="form-control-file" name="certificate" id="certificate" accept="image/*,application/pdf">
                                                </div>
                                                <div class="btn-container">
                                                    <button type="submit" class="btn btn-primary">Resubmit Request</button>
                                                </div>
                                            </form>
                                        </div>
                                        <% }%>
                                    </div>
                                </div>
                            </div>
                    </section>
                </div>
            </div>
        </div>

        <%-- BACK TO TOP --%>
        <%@ include file="../template/backToTop.jsp" %>

        <!-- JS here -->
        <%@ include file="../template/script.jsp" %>
    </body>
</html>