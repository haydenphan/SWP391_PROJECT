<%-- 
    Document   : AdminCourseDetail
    Created on : Jun 18, 2024, 8:21:34 PM
    Author     : quanhd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="model.*" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<!doctype html>
<html class="no-js" lang="zxx">

    <head>
        <%-- HEAD --%>
        <%@ include file="../template/head.jsp" %>
        <style>
            .pagination-btn {
                padding: 10px 20px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .pagination-btn:disabled {
                background-color: #cccccc;
                cursor: not-allowed;
            }

            .pagination-btn:hover {
                background-color: #0056b3;
            }
            .rating li.selected i {
                color: gold;
            }
            .firstStar{
                color: gold;
            }
            .rating li i {
                cursor: pointer;
            }
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            var currentPage = 1;

            $(document).ready(function () {
                loadFeedbacks(currentPage);
            });
            function updatePaginationButtons() {
                $("#prevBtn").prop("disabled", currentPage === 1);
            }
            function loadFeedbacks(page) {
                var urlParams = new URLSearchParams(window.location.search);
                var courseID = urlParams.get('id');
                $.ajax({
                    type: "GET",
                    url: "/testFE/courseFeedbacks?courseID=" + courseID + "&page=" + page,
                    success: function (data) {
                        $("#feedbacks").html(data);
                        updatePaginationButtons();
                    }
                });
            }

            function nextPage() {
                currentPage++;
                loadFeedbacks(currentPage);
            }

            function prevPage() {
                if (currentPage > 1) {
                    currentPage--;
                    loadFeedbacks(currentPage);
                }
            }
            document.addEventListener('DOMContentLoaded', function () {
                const starRating = document.getElementById('star-rating');
                const stars = starRating.querySelectorAll('li');
                const ratingInput = document.getElementById('rating');

                stars.forEach(star => {
                    star.addEventListener('click', function () {
                        const rating = this.getAttribute('data-value');
                        ratingInput.value = rating;
                        stars.forEach(s => s.classList.remove('selected'));
                        for (let i = 0; i < rating; i++) {
                            stars[i].classList.add('selected');
                        }
                    });
                });
            });
        </script>
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
                <jsp:param name="title" value="Course Details For Admin" />
            </jsp:include>  

            <!-- course-details-area-start -->
            <section class="course-detalis-area pb-90">
                <div class="container">
                    <div class="row">
                        <div class=" col-xxl-8 col-xl-8">
                            <div class="course-detalis-wrapper mb-30">
                                <div class="course-heading mb-20">
                                    <h2>
                                        ${course.courseName}
                                    </h2>                                   
                                </div>
                                <div class="course-detelis-meta">
                                    <div class="course-meta-wrapper border-line-meta">
                                        <div class="course-meta-img">
                                            <a href="instructor-profile.html"><img src="${CourseDAO.getInstructor(course.getCreatedBy()).getAvatar()}"
                                                                                   alt="course-meta"></a>
                                        </div>
                                        <div class="course-meta-text">
                                            <span>Created by</span>
                                            <h6><a href="instructor-profile.html">${CourseDAO.getInstructor(course.getCreatedBy()).getFirstName()} ${CourseDAO.getInstructor(course.getCreatedBy()).getLastName()}</a></h6>
                                        </div>
                                    </div>
                                    <div class="course-Enroll border-line-meta">
                                        <p>Total Enrolled</p>
                                        <span>
                                            ${course.totalEnrolled}
                                        </span>
                                    </div>
                                    <div class="course-update border-line-meta">
                                        <p>Last Update</p>
                                        <span>
                                            ${course.lastUpdate}
                                        </span>
                                    </div>
                                    <div class="course-category">
                                        <p>${course.createdDate}</p>
                                        <span>
                                            <a href="${pageContext.request.contextPath}/CourseList?subcategory=${course.subcategoryID}">
                                                ${course.subcategoryName}
                                            </a>
                                        </span>
                                    </div>
                                </div>
                                <div class="course-description pt-45 pb-30">
                                    <div class="course-Description">
                                        <h4>Description</h4>
                                    </div>
                                    <p>
                                        Description here
                                    </p>
                                </div>
                                <div class="course-learn-wrapper">
                                    <div class="course-learn">
                                        <div class="course-leranm-tittle">
                                            <h4 class="mb-15">Content Summary</h4>
                                        </div>
                                        <div class="row">
                                            <div class="col-xl-6">
                                                <div class="course-leran-text f-left">
                                                    <ul>
                                                        <li>Handle advanced techniques like Dimensionality Reduction</li>
                                                        <li>Handle specific topics like Reinforcement Learning best</li>
                                                        <li>Know which Machine Learning model to choose for each type of
                                                            problem</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-xl-6">
                                                <div class="course-leran-text">
                                                    <ul>
                                                        <li>Reinforcement learning upper
                                                            confidence bound Thompson sampling</li>
                                                        <li>Model Selection & Boosting fold cross
                                                            validation parameter</li>
                                                        <li>Use Machine Learning for personal
                                                            purpose of machine</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="course-requirements pt-45">
                                    <h4>Requirements</h4>
                                    <div class="course-requirements-text">
                                        <ul>
                                            <c:forEach items="${course.getRequirementsList()}" var="requirement">
                                                <li><i class="far fa-check"></i> <c:out value="${fn:trim(requirement)}"/></li>
                                                </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <div class="course-curriculum pt-40 pb-50">
                                    <div class="course-curriculam">
                                        <h4>Curriculum</h4>
                                    </div>
                                    <ul>
                                        <li>15 lectures ? 2h 29m 12s total length</li>
                                    </ul>
                                    <div class="course-curriculam-accodion mt-30">
                                        <div class="accordion" id="accordionExample">
                                            <div class="accordion-item">
                                                <div class="accordion-body" id="headingOne">
                                                    <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                                            data-bs-target="#collapseOne" aria-expanded="true"
                                                            aria-controls="collapseOne">
                                                        <span class="accordion-header">
                                                            <span class="accordion-tittle">
                                                                <span>Welcome to the Course & Overview</span>
                                                            </span>
                                                            <span class="accordion-tittle-inner">
                                                                <span>8 lectures ? 47m</span>
                                                            </span>
                                                        </span>
                                                    </button>
                                                </div>
                                                <div id="collapseOne" class="accordion-collapse collapse show"
                                                     aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                                    <div class="accordion-body">
                                                        <div
                                                            class="course-curriculum-content d-sm-flex justify-content-between align-items-center">
                                                            <div class="course-curriculum-info">
                                                                <i class="flaticon-youtube"></i>
                                                                <h4>Importing the libraries</h4>
                                                            </div>
                                                            <div class="course-curriculum-meta">
                                                                <span>5:30</span>
                                                                <span class="time"> <i class="flaticon-lock"></i></span>
                                                            </div>
                                                        </div>
                                                        <div
                                                            class="course-curriculum-content d-sm-flex justify-content-between align-items-center">
                                                            <div class="course-curriculum-info">
                                                                <i class="flaticon-youtube"></i>
                                                                <h4>Importing the libraries</h4>
                                                            </div>
                                                            <div class="course-curriculum-meta">
                                                                <span>7:30</span>
                                                                <span class="time"> <i class="flaticon-lock"></i></span>
                                                            </div>
                                                        </div>
                                                        <div
                                                            class="course-curriculum-content d-sm-flex justify-content-between align-items-center">
                                                            <div class="course-curriculum-info">
                                                                <i class="flaticon-youtube"></i>
                                                                <h4>Importing the libraries</h4>
                                                            </div>
                                                            <div class="course-curriculum-meta">
                                                                <span>3:30</span>
                                                                <span class="time"> <i class="flaticon-lock"></i></span>
                                                            </div>
                                                        </div>
                                                        <div
                                                            class="course-curriculum-content d-sm-flex justify-content-between align-items-center">
                                                            <div class="course-curriculum-info">
                                                                <i class="flaticon-youtube"></i>
                                                                <h4>Importing the libraries</h4>
                                                            </div>
                                                            <div class="course-curriculum-meta">
                                                                <span>8:30</span>
                                                                <span class="time"> <i class="flaticon-lock"></i></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="accordion-item">
                                                <div class="accordion-header" id="headingTwo">
                                                    <button class="accordion-button collapsed" type="button"
                                                            data-bs-toggle="collapse" data-bs-target="#collapseTwo"
                                                            aria-expanded="true" aria-controls="collapseTwo">
                                                        <span class="accordion-header">
                                                            <span class="accordion-tittle">
                                                                <span>Python Application Engine</span>
                                                            </span>
                                                            <span class="accordion-tittle-inner">
                                                                <span>2 lectures ? 12m</span>
                                                            </span>
                                                        </span>
                                                    </button>
                                                </div>
                                                <div id="collapseTwo" class="accordion-collapse collapse"
                                                     aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                                                    <div class="accordion-body">
                                                        <div
                                                            class="course-curriculum-content d-sm-flex justify-content-between align-items-center">
                                                            <div class="course-curriculum-info">
                                                                <i class="flaticon-youtube"></i>
                                                                <h4>Data Manipulation Tools</h4>
                                                            </div>
                                                            <div class="course-curriculum-meta">
                                                                <span>6:30</span>
                                                                <span class="time"> <i class="flaticon-lock"></i></span>
                                                            </div>
                                                        </div>
                                                        <div
                                                            class="course-curriculum-content d-sm-flex justify-content-between align-items-center">
                                                            <div class="course-curriculum-info">
                                                                <i class="flaticon-youtube"></i>
                                                                <h4>Importing the libraries</h4>
                                                            </div>
                                                            <div class="course-curriculum-meta">
                                                                <span>8:30</span>
                                                                <span class="time"> <i class="flaticon-lock"></i></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="accordion-item">
                                                <h2 class="accordion-header" id="headingThree">
                                                    <button class="accordion-button collapsed" type="button"
                                                            data-bs-toggle="collapse" data-bs-target="#collapseThree"
                                                            aria-expanded="true" aria-controls="collapseThree">
                                                        <span class="accordion-header">
                                                            <span class="accordion-tittle">
                                                                <span>Algorithm Comparison</span>
                                                            </span>
                                                            <span class="accordion-tittle-inner">
                                                                <span>3 lectures ? 13m</span>
                                                            </span>
                                                        </span>
                                                    </button>
                                                </h2>
                                                <div id="collapseThree" class="accordion-collapse collapse"
                                                     aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                                                    <div class="accordion-body">
                                                        <div
                                                            class="course-curriculum-content d-sm-flex justify-content-between align-items-center">
                                                            <div class="course-curriculum-info">
                                                                <i class="flaticon-youtube"></i>
                                                                <h4>Importing the libraries</h4>
                                                            </div>
                                                            <div class="course-curriculum-meta">
                                                                <span>3:30</span>
                                                                <span class="time"> <i class="flaticon-lock"></i></span>
                                                            </div>
                                                        </div>
                                                        <div
                                                            class="course-curriculum-content d-sm-flex justify-content-between align-items-center">
                                                            <div class="course-curriculum-info">
                                                                <i class="flaticon-youtube"></i>
                                                                <h4>Importing the libraries</h4>
                                                            </div>
                                                            <div class="course-curriculum-meta">
                                                                <span>5:30</span>
                                                                <span class="time"> <i class="flaticon-lock"></i></span>
                                                            </div>
                                                        </div>
                                                        <div
                                                            class="course-curriculum-content d-sm-flex justify-content-between align-items-center">
                                                            <div class="course-curriculum-info">
                                                                <i class="flaticon-youtube"></i>
                                                                <h4>Importing the libraries</h4>
                                                            </div>
                                                            <div class="course-curriculum-meta">
                                                                <span>7:30</span>
                                                                <span class="time"> <i class="flaticon-lock"></i></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="accordion-item">
                                                <h2 class="accordion-header" id="headingFour">
                                                    <button class="accordion-button collapsed" type="button"
                                                            data-bs-toggle="collapse" data-bs-target="#collapseFour"
                                                            aria-expanded="true" aria-controls="collapseFour">
                                                        <span class="accordion-header">
                                                            <span class="accordion-tittle">
                                                                <span>Data Manipulation Tools</span>
                                                            </span>
                                                            <span class="accordion-tittle-inner">
                                                                <span>7 lectures ? 35m</span>
                                                            </span>
                                                        </span>
                                                    </button>
                                                </h2>
                                                <div id="collapseFour" class="accordion-collapse collapse"
                                                     aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                                                    <div class="accordion-body">
                                                        <div
                                                            class="course-curriculum-content d-sm-flex justify-content-between align-items-center">
                                                            <div class="course-curriculum-info">
                                                                <i class="flaticon-youtube"></i>
                                                                <h4>Importing the libraries</h4>
                                                            </div>
                                                            <div class="course-curriculum-meta">
                                                                <span>2:30</span>
                                                                <span class="time"> <i class="flaticon-lock"></i></span>
                                                            </div>
                                                        </div>
                                                        <div
                                                            class="course-curriculum-content d-sm-flex justify-content-between align-items-center">
                                                            <div class="course-curriculum-info">
                                                                <i class="flaticon-youtube"></i>
                                                                <h4>Importing the libraries</h4>
                                                            </div>
                                                            <div class="course-curriculum-meta">
                                                                <span>4:30</span>
                                                                <span class="time"> <i class="flaticon-lock"></i></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="accordion-item">
                                                <div class="accordion-header" id="headingFive">
                                                    <button class="accordion-button collapsed" type="button"
                                                            data-bs-toggle="collapse" data-bs-target="#collapseFive"
                                                            aria-expanded="true" aria-controls="collapseFive">
                                                        <span class="accordion-header">
                                                            <span class="accordion-tittle">
                                                                <span>Sorting- the Bubble Sort Algorithm</span>
                                                            </span>
                                                            <span class="accordion-tittle-inner">
                                                                <span>10 lectures ? 55m</span>
                                                            </span>
                                                        </span>
                                                    </button>
                                                </div>
                                                <div id="collapseFive" class="accordion-collapse collapse"
                                                     aria-labelledby="headingFive" data-bs-parent="#accordionExample">
                                                    <div class="accordion-body">
                                                        <div
                                                            class="course-curriculum-content d-sm-flex justify-content-between align-items-center">
                                                            <div class="course-curriculum-info">
                                                                <i class="flaticon-youtube"></i>
                                                                <h4>Importing the libraries</h4>
                                                            </div>
                                                            <div class="course-curriculum-meta">
                                                                <span>6:30</span>
                                                                <span class="time"> <i class="flaticon-lock"></i></span>
                                                            </div>
                                                        </div>
                                                        <div
                                                            class="course-curriculum-content d-sm-flex justify-content-between align-items-center">
                                                            <div class="course-curriculum-info">
                                                                <i class="flaticon-youtube"></i>
                                                                <h4>Importing the libraries</h4>
                                                            </div>
                                                            <div class="course-curriculum-meta">
                                                                <span>8:30</span>
                                                                <span class="time"> <i class="flaticon-lock"></i></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <button id="prevBtn" class="pagination-btn" onclick="prevPage()">Back</button>
                                <button id="nextBtn" class="pagination-btn" onclick="nextPage()">Approve</button>

                            </div>
                        </div>
                        <div class="col-xxl-4 col-xl-4 col-lg-8 col-md-8">
                            <div class="course-video-widget">
                                <div class="course-widget-wrapper mb-30">
                                    <div class="course-video-thumb w-img">
                                        <img src="${pageContext.request.contextPath}/img/course/course-video.png" alt="image not found">
                                        <div class="sidber-video-btn">
                                            <a class="popup-video" href="https://www.youtube.com/watch?v=F68sQYaS9XA"><i
                                                    class="fas fa-play"></i></a>
                                        </div>
                                    </div>
                                    <div class="course-video-price">
                                        <span>${course.price}$</span>
                                    </div>
                                    <div class="course-video-body">
                                        <ul>
                                            <li>
                                                <div class="course-vide-icon">
                                                    <i class="flaticon-filter"></i>
                                                    <span>Level</span>
                                                </div>
                                                <div class="video-corse-info">
                                                    <span>${course.levelName}</span>
                                                </div>
                                            </li>
                                            <!--                                        <li>
                                                                                            <div class="course-vide-icon">
                                                                                                <i class="flaticon-computer"></i>
                                                                                                <span>Lectures</span>
                                                                                            </div>
                                                                                            <div class="video-corse-info">
                                                                                                <span>8 Lectures</span>
                                                                                            </div>
                                                                                        </li>-->
                                            <!--                                            <li>
                                                                                            <div class="course-vide-icon">
                                                                                                <i class="flaticon-clock"></i>
                                                                                                <span>Duration</span>
                                                                                            </div>
                                                                                            <div class="video-corse-info">
                                                                                                <span>1h 30m 12s</span>
                                                                                            </div>
                                                                                        </li>-->
                                            <li>
                                                <div class="course-vide-icon">
                                                    <i class="flaticon-menu-2"></i>
                                                    <span>Category</span>
                                                </div>
                                                <div class="video-corse-info">
                                                    <span>${course.subcategoryName}</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="course-vide-icon">
                                                    <i class="flaticon-global"></i>
                                                    <span>Laguage</span>
                                                </div>
                                                <div class="video-corse-info">
                                                    <span>${course.languageName}</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="course-vide-icon">
                                                    <i class="flaticon-bookmark-white"></i>
                                                    <span>Access</span>
                                                </div>
                                                <div class="video-corse-info">
                                                    <span>Full Lifetime</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="course-vide-icon">
                                                    <i class="flaticon-award"></i>
                                                    <span>Certificate</span>
                                                </div>
                                                <div class="video-corse-info">
                                                    <span>Yes </span>
                                                </div>
                                            </li>
                                            <!--                                            <li>
                                                                                            <div class="course-vide-icon">
                                                                                                <i class="flaticon-list"></i>
                                                                                                <span>Recourse</span>
                                                                                            </div>
                                                                                            <div class="video-corse-info">
                                                                                                <span>5 Downloadable Files </span>
                                                                                            </div>
                                                                                        </li>-->
                                        </ul>
                                    </div>                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </main>

        <%-- FOOTER --%>
        <%@ include file="../template/footer.jsp" %>

        <%-- BACK TO TOP --%>
        <%@ include file="../template/backToTop.jsp" %>

        <!-- JS here -->
        <%@ include file="../template/script.jsp" %>
    </body>

</html>