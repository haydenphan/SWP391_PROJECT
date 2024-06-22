<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>
<%@ page import="DAO.*" %>

<%
    Course course = (Course) request.getAttribute("course");
    User instructor = (User) request.getAttribute("instructor");
%>

<!DOCTYPE html>
<html>
    <head>
        <%-- HEAD --%>
        <%@ include file="../template/head.jsp" %>
        <style>
            body {
                background-color: #f0f8ff;
            }

            .card {
                border: 1px solid #d3d3d3;
                border-radius: 15px;
                background-color: #fff;
                transition: transform 0.3s ease-in-out;
            }

            .card-header {
                background: #2467EC;
                color: white;
                border-top-left-radius: 15px;
                border-top-right-radius: 15px;
                padding: 1.5rem;
                text-align: center;
            }

            .card-title {
                margin-bottom: 0;
                font-size: 1.75rem;
                color: white;
            }

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

            .btn-back {
                border: none;
                border-radius: 50%;
                padding: 0.5rem;
                font-size: 1.5rem;
                transition: background-color 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            }

            .container-full {
                padding: 2rem 1rem;
            }

            .btn-container {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 1rem; /* Space between the buttons */
                margin-top: 20px;
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
                                        <h5 class="card-title">Publication Request Form</h5>
                                        <p class="mb-0 card-subtitle text-light">Upload certificates and submit the information below.</p>
                                    </div>
                                    <div class="card-body p-4">
                                        <form id="submitReviewForm" action="${pageContext.request.contextPath}/course-approval-servlet/submit" method="post" enctype="multipart/form-data">
                                            <input type="hidden" name="courseId" value="<%= course.getCourseID()%>">
                                            <input type="hidden" name="instructorId" value="<%= instructor.getUserID()%>">

                                            <div class="form-group mb-4">
                                                <label for="certificate">Upload Certificate:</label>
                                                <input type="file" class="form-control-file" name="certificate" id="certificate" accept="image/*,application/pdf" required>
                                            </div>

                                            <div class="btn-container">
                                                <button type="button" class="btn btn-back" onclick="history.back()">
                                                    <i class="fas fa-arrow-left"></i>
                                                </button>
                                                <button type="submit" class="btn btn-primary">Submit</button>
                                            </div>
                                        </form>

                                        <%-- Display the current review status here if needed --%>
                                        <h4>Status</h4>
                                        <p>Current Status: <%= course.IsPublished() ? "Published" : "Pending"%></p>
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
