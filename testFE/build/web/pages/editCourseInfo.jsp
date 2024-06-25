<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>
<%@ page import="DAO.*" %>

<%
    Course currentCourse = (Course) request.getAttribute("currentCourse");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <%@ include file="../template/head.jsp" %>

        <style>
            body {
                background-color: #f0f8ff;
                font-family: 'Roboto', sans-serif;
            }

            .card {
                border: 1px solid #d3d3d3;
                border-radius: 15px;
                background-color: #fff;
                transition: transform 0.3s ease-in-out;
            }

            .card:hover {
                transform: translateY(-5px);
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

            .card-subtitle {
                margin-top: 0.5rem;
                font-size: 1rem;
                opacity: 0.8;
            }

            .form-group {
                position: relative;
            }

            .form-group label {
                font-weight: bold;
                color: #333;
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
                padding: 0.5rem;
                font-size: 1.5rem;
                transition: background-color 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            }

            .img-thumbnail {
                border: 1px solid #d3d3d3;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                margin-top: 0.75rem;
            }

            h4 {
                color: black;
                margin-top: 1.5rem;
                font-size: 1.5rem;
                font-weight: bold;
                text-align: center;
            }

            .container-full {
                padding: 2rem 1rem;
            }

            @media (max-width: 768px) {
                .card {
                    margin: 1rem;
                }

                .btn-primary {
                    width: 100%;
                }

                .form-control {
                    padding: 0.75rem;
                }

                .btn-back {
                    top: 10px;
                    left: 10px;
                    padding: 0.25rem;
                    font-size: 1rem;
                }
            }

            .btn-container {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 1rem;
                position: relative;
            }

            .btn-container .btn-back {
                position: absolute;
                left: 0;
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
                                        <h5 class="card-title">Edit Course Info</h5>
                                        <p class="mb-0 card-subtitle text-light">Edit course details below.</p>
                                    </div>
                                    <div class="card-body p-4">
                                        <form id="editCourseForm" action="${pageContext.request.contextPath}/edit-course-info-servlet" method="post" enctype="multipart/form-data">
                                            <input type="hidden" name="action" value="save">
                                            <input type="hidden" name="courseId" value="<%= currentCourse.getCourseID()%>">

                                            <h4>Course Details</h4>
                                            <div class="form-group mb-4">
                                                <label for="courseName">Course Name:</label>
                                                <input type="text" class="form-control" name="courseName" id="courseName" value="<%= currentCourse.getCourseName()%>" required>
                                            </div>
                                            <div class="form-group mb-4">
                                                <label for="courseDescription">Course Description:</label>
                                                <textarea class="form-control" name="courseDescription" id="courseDescription" rows="3" required><%= currentCourse.getDescription()%></textarea>
                                            </div>
                                            <div class="form-group mb-4">
                                                <label for="courseImage">Course Image:</label>
                                                <input type="file" class="form-control-file" name="courseImage" id="courseImage" accept="image/*">
                                                <img src="<%= currentCourse.getImageURL()%>" alt="Course Image" class="img-thumbnail mt-2" width="200">
                                                <input type="hidden" name="currentCourseImage" value="<%= currentCourse.getImageURL()%>">
                                            </div>
                                            <div class="form-group mb-4">
                                                <label for="coursePrice">Course Price:</label>
                                                <input type="number" class="form-control" name="coursePrice" id="coursePrice" value="<%= currentCourse.getPrice()%>" required>
                                            </div>

                                            <div class="text-center btn-container">
                                                <button type="button" class="btn btn-back" onclick="history.back()">
                                                    <i class="fas fa-arrow-left"></i>
                                                </button>
                                                <button type="submit" class="btn btn-primary">Save Changes</button>
                                            </div>
                                        </form>
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