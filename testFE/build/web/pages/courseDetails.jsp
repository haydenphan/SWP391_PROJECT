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
                <jsp:param name="title" value="Courses" />
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
                                    <div class="course-star">
                                        <ul>
                                            <li><i class="fas fa-star"></i></li>
                                        </ul>
                                        <ul>
                                            <li><i class="fas fa-star"></i></li>
                                        </ul>
                                        <ul>
                                            <li><i class="fas fa-star"></i></li>
                                        </ul>
                                        <ul>
                                            <li><i class="fas fa-star"></i></li>
                                        </ul>
                                        <ul>
                                            <li><i class="fal fa-star"></i></li>
                                        </ul>
                                    </div>
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
                                            <h4 class="mb-15">What you'll learn</h4>
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
                                <div class="course-instructors">
                                    <h3>instructors</h3>
                                    <div class="instructors-heading">
                                        <div class="instructors-img w-img">
                                            <a href="instructor-profile.html"><img
                                                    src="${CourseDAO.getInstructor(course.getCreatedBy()).getAvatar()}"
                                                    alt="image not found"></a>
                                        </div>
                                        <div class="instructors-body">
                                            <h5><a href="instructor-profile.html">${CourseDAO.getInstructor(course.getCreatedBy()).getFirstName()} ${CourseDAO.getInstructor(course.getCreatedBy()).getLastName()}</a></h5>
                                            <span>Data Scientist, BDevs Ltd.</span>
                                            <div class="intructors-review">
                                                <i class="fas fa-star"></i>
                                                <span>4.7 (54 reviews)</span>
                                            </div>
                                            <div class="instructors-footer">
                                                <i class="fas fa-desktop"></i>
                                                <span>3 Courses</span>
                                                <i class="far fa-user-friends"></i>
                                                <span>78,742 Students</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="intructors-content">
                                        <p>Professionally, I come from the Data Science consulting space with experience in
                                            finance, retail, transport and other industries. I was trained by the best
                                            analytics mentors at Deloitte Australia and since starting on Udemy I have
                                            passed on my knowledge to spread around the world</p>
                                    </div>
                                </div>
                                <div class="student-feedback pt-45 ">
                                    <h3>Student Feedback</h3>
                                    <div class="row">
                                        <div class="col-xl-3">
                                            <div class="reating-point mb-30">
                                                <div class="rating-point-wrapper text-center">
                                                    <h2>${course.averageRating}<i class="fas fa-star"></i></h2>

                                                    <span> ${coStats.getTotalNumberOfRating()} Rating</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-9">
                                            <div class="student-reating-bar">
                                                <div class="reating-bar-wrapper">
                                                    <div class="rating-row mb-10">
                                                        <div class="rating-star">
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                        </div>
                                                        <div class="progress">
                                                            <div class="progress-bar wow fadeInLeft" role="progressbar"
                                                                 style="width: ${coStats.getPercentageOfNStarRating(5)}%;" aria-valuenow="25" aria-valuemin="0"
                                                                 aria-valuemax="100" data-wow-duration="1s"
                                                                 data-wow-delay="0.5s"></div>
                                                        </div>
                                                        <div class="progress-tittle">
                                                            <span>${coStats.getPercentageOfNStarRating(5)}%</span>
                                                        </div>
                                                    </div>
                                                    <div class="rating-row mb-10">
                                                        <div class="rating-star">
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fal fa-star"></i>
                                                        </div>
                                                        <div class="progress">
                                                            <div class="progress-bar wow fadeInLeft" role="progressbar"
                                                                 style="width: ${coStats.getPercentageOfNStarRating(4)}%;" aria-valuenow="25" aria-valuemin="0"
                                                                 aria-valuemax="100" data-wow-duration="1s"
                                                                 data-wow-delay="0.5s"></div>
                                                        </div>
                                                        <div class="progress-tittle">
                                                            <span>${coStats.getPercentageOfNStarRating(4)}%</span>
                                                        </div>
                                                    </div>
                                                    <div class="rating-row mb-10">
                                                        <div class="rating-star">
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fal fa-star"></i>
                                                            <i class="fal fa-star"></i>
                                                        </div>
                                                        <div class="progress">
                                                            <div class="progress-bar wow fadeInLeft" role="progressbar"
                                                                 style="width: ${coStats.getPercentageOfNStarRating(3)}%;" aria-valuenow="25" aria-valuemin="0"
                                                                 aria-valuemax="100" data-wow-duration="1s"
                                                                 data-wow-delay="0.5s"></div>
                                                        </div>
                                                        <div class="progress-tittle">
                                                            <span>${coStats.getPercentageOfNStarRating(3)}%</span>
                                                        </div>
                                                    </div>
                                                    <div class="rating-row mb-10">
                                                        <div class="rating-star">
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fal fa-star"></i>
                                                            <i class="fal fa-star"></i>
                                                            <i class="fal fa-star"></i>
                                                        </div>
                                                        <div class="progress">
                                                            <div class="progress-bar wow fadeInLeft" role="progressbar"
                                                                 style="width: ${coStats.getPercentageOfNStarRating(2)}%;" aria-valuenow="25" aria-valuemin="0"
                                                                 aria-valuemax="100" data-wow-duration="1s"
                                                                 data-wow-delay="0.5s"></div>
                                                        </div>
                                                        <div class="progress-tittle">
                                                            <span>${coStats.getPercentageOfNStarRating(2)}%</span>
                                                        </div>
                                                    </div>
                                                    <div class="rating-row mb-10">
                                                        <div class="rating-star">
                                                            <i class="fas fa-star"></i>
                                                            <i class="fal fa-star"></i>
                                                            <i class="fal fa-star"></i>
                                                            <i class="fal fa-star"></i>
                                                            <i class="fal fa-star"></i>
                                                        </div>
                                                        <div class="progress">
                                                            <div class="progress-bar wow fadeInLeft" role="progressbar"
                                                                 style="width: ${coStats.getPercentageOfNStarRating(1)}%;" aria-valuenow="25" aria-valuemin="0"
                                                                 aria-valuemax="100" data-wow-duration="1s"
                                                                 data-wow-delay="0.5s"></div>
                                                        </div>
                                                        <div class="progress-tittle">
                                                            <span>${coStats.getPercentageOfNStarRating(1)}%</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="course-detalis-reviews pt-15" id="feedbacks">
                                    <div class="course-detalis-reviews-tittle">
                                        <h3>Reviews</h3>
                                    </div>
                                    <div class="course-review-item mb-30">
                                        <div class="course-reviews-img">
                                            <a href="#"><img src="${pageContext.request.contextPath}/img/course/course-reviews-1.png"
                                                             alt="image not found"></a>
                                        </div>
                                        <div class="course-review-list">
                                            <h5><a href="#">Sotapdi Kunda</a></h5>
                                            <div class="course-start-icon">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <span>55 min ago</span>
                                            </div>
                                            <p>Very clean and organized with easy to follow tutorials, Exercises, and
                                                solutions.
                                                This course does start from the beginning with very little knowledge and
                                                gives a
                                                great overview of common tools used for data science and progresses into
                                                more
                                                complex concepts and ideas.</p>
                                        </div>
                                    </div>
                                </div>
                                <button id="prevBtn" class="pagination-btn" onclick="prevPage()">Back</button>
                                <button id="nextBtn" class="pagination-btn" onclick="nextPage()">Next</button>


                                <%                                   
                                    if ((boolean)request.getAttribute("hasEnrolled")) {
                                %>
                                <div class="col-xl-12">
                                    <div class="course-review-btn">
                                        <a id="show-review-box" class="edu-btn" href="javascript:void(0)">Write a Review</a>
                                        <div id="review-box" class="review-comment mt-45">
                                            <div class="comment-title mb-20">
                                                <p>
                                                    leave your rating and comment
                                                </p>
                                            </div>
                                            <div class="comment-rating mb-20">
                                                <span>Overall ratings</span>
                                                <ul id="star-rating" class="rating">
                                                    <li data-value="1"><i class="fas fa-star firstStar"></i></li>
                                                    <li data-value="2"><i class="fas fa-star"></i></li>
                                                    <li data-value="3"><i class="fas fa-star"></i></li>
                                                    <li data-value="4"><i class="fas fa-star"></i></li>
                                                    <li data-value="5"><i class="fas fa-star"></i></li>
                                                </ul>
                                            </div>
                                            <div class="comment-input-box mb-15">
                                                <form id="feedbackForm" action="courseFeedbacks" method="Post">
                                                    <input type="hidden" id="rating" name="rating" value="1">
                                                    <input type="hidden" id="courseID" name="courseID" value="<%= request.getParameter("id") %>">
                                                    <div class="row">
                                                        <div class="col-xxl-12">
                                                            <textarea id="content" name="content" placeholder="Your review" class="comment-input comment-textarea mb-20"></textarea>
                                                        </div>
                                                        <div class="col-xxl-12">
                                                            <div class="comment-submit">
                                                                <button type="submit" class="edu-btn">Submit</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <%
                                    } else {
                                %>
                                <p>Only those enrolling in the course can leave their feedbacks</p>
                                <%
                                    }
                                %>
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
                                    <div class="button-container" style="display: flex; justify-content: flex-start;">
                                        <form style="width: 50%" action="${pageContext.request.contextPath}/Cart/add-to-cart" method="POST">
                                            <div class="video-wishlist" style="margin-right: 10px">
                                                <input type="hidden" name="CourseID" value="${course.getCourseID()}">
                                                <button type="submit" class="video-cart-btn"><i class="fal fa-shopping-cart"></i> Add to cart</button>
                                            </div>
                                        </form>
                                        <form style="width: 50%" action="${pageContext.request.contextPath}/Wishlist/add-to-wishlist" method="POST">
                                            <div class="video-wishlist">
                                                <input type="hidden" name="CourseID" value="${course.getCourseID()}">
                                                <button type="submit" style="width: 100%; padding: 0px" class="video-wishlist-btn"><i class="far fa-heart"></i> Add to Wishlist</button>
                                            </div>
                                        </form>
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