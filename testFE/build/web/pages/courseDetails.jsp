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

        <%-- Check if the alert flag is set in localStorage and show the alert --%>
        <script>
            window.onload = function () {
                if (localStorage.getItem('showEditCourseRequestAlert') === 'true') {
                    localStorage.removeItem('showEditCourseRequestAlert'); // Remove the flag
                    if (confirm("Do you accept the content edit request?")) {
                        // Handle confirmation (e.g., send a request to the server)
                        fetch('<%= request.getContextPath()%>/edit-request?action=approveEdit&courseId=<%= request.getParameter("id")%>', {
                                            method: 'POST',
                                            headers: {
                                                'Content-Type': 'application/json'
                                            }
                                        })
                                                .then(response => response.json())
                                                .then(data => {
                                                    if (data.success) {
                                                        alert('The edit request has been approved.');
                                                        // Optionally redirect or reload the page
                                                        window.location.reload();
                                                    } else {
                                                        alert('There was an error processing your request.');
                                                    }
                                                })
                                                .catch(error => {
                                                    console.error('Error:', error);
                                                    alert('There was an error processing your request.');
                                                });
                                    } else {
                                        // Handle rejection (e.g., send a request to the server)
                                        fetch('<%= request.getContextPath()%>/edit-request?action=rejectEdit&courseId=<%= request.getParameter("id")%>', {
                                                            method: 'POST',
                                                            headers: {
                                                                'Content-Type': 'application/json'
                                                            }
                                                        })
                                                                .then(response => response.json())
                                                                .then(data => {
                                                                    if (data.success) {
                                                                        alert('The edit request has been rejected.');
                                                                        // Optionally redirect or reload the page
                                                                        window.location.reload();
                                                                    } else {
                                                                        alert('There was an error processing your request.');
                                                                    }
                                                                })
                                                                .catch(error => {
                                                                    console.error('Error:', error);
                                                                    alert('There was an error processing your request.');
                                                                });
                                                    }
                                                }
                                            };
        </script>
        <%-- Include jQuery and Bootstrap JavaScript --%>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>

    <body>
        <%-- PRE LOADER --%>
        <%@ include file="../template/preLoader.jsp" %>

        <%-- SIDE TOGGLE --%>
        <%@ include file="../template/sideToggle.jsp" %>

        <%-- HEADER --%>
        <c:choose>
            <c:when test="${user.getRole() == 3}">
                <%@ include file="../template/adminHeader.jsp" %>
            </c:when>
            <c:otherwise>
                <%@ include file="../template/header.jsp" %>
            </c:otherwise>
        </c:choose>
        <main>

            <%-- Check if the showAlert flag is set in the session --%>
            <c:if test="${not empty sessionScope.showAlert}">
                <script>
                                            alert("Your edit request has been sent successfully!");
                </script>
                <%-- Remove the alert flag from the session after displaying it --%>
                <c:remove var="showAlert" scope="session"/>
            </c:if>

            <%
                InstructorFeedbackDAO iDAO = new InstructorFeedbackDAO();
                int instructorID = (int) request.getAttribute("instructorID");
                int reviewNum = iDAO.getTotalFeedbacksForInstructor(instructorID);
            %>
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
                                        <ul style="display: flex">
                                            <c:set var="rating" value="${course.avgRatingDisplay(1)}" />
                                            <c:forEach var="i" begin="1" end="5">
                                                <li>
                                                    <c:choose>
                                                        <c:when test="${i <= rating}">
                                                            <i class="fas fa-star"></i>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <i class="fal fa-star"></i>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </li>
                                            </c:forEach>
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
                                            <fmt:formatDate value="${lastUpdateDate}" pattern="yyyy-MM-dd" />
                                        </span>
                                    </div>
                                    <div class="course-category">
                                        <p>
                                            <fmt:formatDate value="${createdDate}" pattern="yyyy-MM-dd" />
                                        </p>
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
                                        ${course.getDescription()}
                                    </p>
                                </div>

                                <!-- What you'll learn -->
                                <div class="course-learn-wrapper">
                                    <div class="course-learn">
                                        <div class="course-leranm-tittle">
                                            <h4 class="mb-15">What you'll learn</h4>
                                        </div>
                                        <div class="row">
                                            <div class="col-xl-6">
                                                <div class="course-leran-text f-left">
                                                    <ul>
                                                        <c:forEach var="description" items="${sectionDescriptions}" varStatus="status">
                                                            <c:if test="${status.count <= 3}">
                                                                <li>${description}</li>
                                                                </c:if>
                                                            </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-xl-6">
                                                <div class="course-leran-text">
                                                    <ul>
                                                        <c:forEach var="description" items="${sectionDescriptions}" varStatus="status">
                                                            <c:if test="${status.count > 3 && status.count <= 6}">
                                                                <li>${description}</li>
                                                                </c:if>
                                                            </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Requirements -->
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

                                <!-- CURRICULUM -->
                                <div class="course-curriculum pt-40 pb-50">
                                    <div class="course-curriculam">
                                        <h4>Curriculum</h4>
                                    </div>
                                    <ul>
                                        <li>${CourseDAO.getTotalLecturesByCourseID(course.getCourseID())} lectures</li>
                                    </ul>
                                    <c:set var="sectionList" value="${sectionList}" scope="request" />
                                    <c:set var="hasEnrolled" value="${hasEnrolled}" scope="request" />
                                    <jsp:include page="../template/course/courseCurriculum.jsp" />
                                </div>

                                <!-- INSTRUCTOR INFORMATION -->
                                <div class="course-instructors">
                                    <h3>instructors</h3>
                                    <div class="instructors-heading">
                                        <div class="instructors-img w-img">
                                            <a href="InstructorProfileView?id=${CourseDAO.getInstructor(course.getCreatedBy()).getUserID()}"><img
                                                    src="${CourseDAO.getInstructor(course.getCreatedBy()).getAvatar()}"
                                                    alt="image not found"></a>
                                        </div>
                                        <div class="instructors-body">
                                            <h5><a href="InstructorProfileView?id=${CourseDAO.getInstructor(course.getCreatedBy()).getUserID()}">${CourseDAO.getInstructor(course.getCreatedBy()).getFirstName()} ${CourseDAO.getInstructor(course.getCreatedBy()).getLastName()}</a></h5>
                                            <div class="intructors-review">
                                                <i class="fas fa-star"></i>
                                                <span> <%= InstructorFeedbackDAO.getAverageRatingForInstructor(instructorID)%> (<%=reviewNum%> reviews)</span>
                                            </div>
                                            <div class="instructors-footer">
                                                <i class="fas fa-desktop"></i>
                                                <span><%= CourseDAO.countCoursesByInstructor(instructorID)%> Courses</span>
                                                <i class="far fa-user-friends"></i>
                                                <span><%= CourseDAO.countTotalEnrollmentsByInstructor(instructorID)%> Students</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="intructors-content">
                                        <p>
                                            ${CourseDAO.getInstructor(course.getCreatedBy()).getBio()}
                                        </p>
                                    </div>
                                </div>
                                <div class="student-feedback pt-45 ">
                                    <h3>Student Feedback</h3>
                                    <div class="row">
                                        <div class="col-xl-3">
                                            <div class="reating-point mb-30">
                                                <div class="rating-point-wrapper text-center">
                                                    <h2>${course.averageRating}<i class="fas fa-star"></i></h2>

                                                    <span> ${course.getTotalNumberOfRating()} Rating</span>
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
                                                                 style="width: ${NumberUtils.round(course.getPercentageOfNStarRating(5), 1)}%;" aria-valuenow="25" aria-valuemin="0"
                                                                 aria-valuemax="100" data-wow-duration="1s"
                                                                 data-wow-delay="0.5s"></div>
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
                                                                 style="width: ${NumberUtils.round(course.getPercentageOfNStarRating(4), 1)}%;" aria-valuenow="25" aria-valuemin="0"
                                                                 aria-valuemax="100" data-wow-duration="1s"
                                                                 data-wow-delay="0.5s"></div>
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
                                                                 style="width: ${NumberUtils.round(course.getPercentageOfNStarRating(3), 1)}%;" aria-valuenow="25" aria-valuemin="0"
                                                                 aria-valuemax="100" data-wow-duration="1s"
                                                                 data-wow-delay="0.5s"></div>
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
                                                                 style="width: ${NumberUtils.round(course.getPercentageOfNStarRating(2), 1)}%;" aria-valuenow="25" aria-valuemin="0"
                                                                 aria-valuemax="100" data-wow-duration="1s"
                                                                 data-wow-delay="0.5s"></div>
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
                                                                 style="width: ${NumberUtils.round(course.getPercentageOfNStarRating(1), 1)}%;" aria-valuenow="25" aria-valuemin="0"
                                                                 aria-valuemax="100" data-wow-duration="1s"
                                                                 data-wow-delay="0.5s"></div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- View Reviews -->
                                <div class="course-detalis-reviews pt-15" id="feedbacks">
                                    <div class="course-detalis-reviews-tittle">
                                        <h3>Reviews</h3>
                                    </div>
                                    <div class="course-review-item mb-30">

                                    </div>

                                </div>

                                <button id="prevBtn" class="pagination-btn" onclick="prevPage()">Back</button>
                                <button id="nextBtn" class="pagination-btn" onclick="nextPage()">Next</button>

                                <%
                                    boolean hasEnrolled = (request.getAttribute("hasEnrolled") == null) ? false : (boolean) request.getAttribute("hasEnrolled");
                                    boolean hasSubmittedFeedback = (request.getAttribute("hasSubmittedFeedback") == null) ? false : (boolean) request.getAttribute("hasSubmittedFeedback");
                                %>

                                <% if (hasEnrolled) { %>
                                <div class="col-xl-12">
                                    <div class="course-review-btn">
                                        <% if (!hasSubmittedFeedback) {%>
                                        <a id="show-review-box" class="edu-btn" href="javascript:void(0)">Write a Review</a>
                                        <div id="review-box" class="review-comment mt-45" style="display: none;">
                                            <div class="comment-title mb-20">
                                                <p>Leave your rating and comment</p>
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
                                                    <input type="hidden" id="courseID" name="courseID" value="${course.getCourseID()}">
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
                                        <% } else { %>
                                        <p>You have already submitted feedback for this course.</p>
                                        <% } %>
                                    </div>
                                </div>
                                <% } else { %>
                                <p>Only those enrolling in the course can leave their feedbacks</p>
                                <% } %>
                            </div>
                        </div>
                        <div class="col-xxl-4 col-xl-4 col-lg-8 col-md-8">
                            <div class="course-video-widget">
                                <div class="course-widget-wrapper mb-30">
                                    <div class="course-video-thumb w-img">
                                        <img src="${course.getImageURL()}" alt="image not found">
                                    </div>

                                    <%
                                        if ((boolean) request.getAttribute("hasEnrolled")) {
                                    %>

                                    <%
                                    } else {
                                    %>
                                    <div class="course-video-price">
                                        <span>${course.price}$</span>
                                    </div>
                                    <%
                                        }
                                    %>     

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
                                                    <i class="flaticon-award"></i>
                                                    <span>Certificate</span>
                                                </div>
                                                <div class="video-corse-info">
                                                    <span>Yes </span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="course-vide-icon">
                                                    <i class="flaticon-list"></i>
                                                    <span>Resourses</span>
                                                </div>
                                                <div class="video-corse-info">
                                                    <span>${materialNum} Downloadable Files </span>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>

                                    <%
                                        if ((User) session.getAttribute("user") == null) {
                                    %>
                                    <p>Register for a learner account to purchase the course! <span style="color: blue; text-decoration: underline"><a href="${pageContext.request.contextPath}/pages/registration.jsp">Sign Up<a/></span></p>
                                    <%
                                    } else if (((User) session.getAttribute("user") != null) && (boolean) request.getAttribute("hasEnrolled")) {
                                    %>
                                    <%%>
                                    <%
                                    } else {
                                    %>
                                    <div class="button-container" style="display: flex; justify-content: flex-start;">
                                        <form style="width: 50%" action="${pageContext.request.contextPath}/Cart/add-to-cart" method="GET">
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
                                    <%
                                        }
                                    %>                

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </main>

        <%-- FOOTER --%>
        <c:choose>
            <c:when test="${user.getRole() == 3}">
            </c:when>
            <c:otherwise>
                <%@ include file="../template/footer.jsp" %>
            </c:otherwise>
        </c:choose>

        <%-- BACK TO TOP --%>
        <%@ include file="../template/backToTop.jsp" %>

        <!-- JS here -->
        <%@ include file="../template/script.jsp" %>

        <c:if test="${courseCompleted}">
            <script>
                $(document).ready(function () {
                    $('#completionModal').modal('show');
                });
            </script>


        </c:if>

        <div class="modal fade" id="completionModal" tabindex="-1" role="dialog" aria-labelledby="completionModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="completionModalLabel">Course Completed</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Congratulations! You have completed the course.
                        <c:if test="${!certificateGenerated}">
                            <form action="${pageContext.request.contextPath}/completeCourse" method="get">
                                <input type="hidden" name="userId" value="${user.userID}">
                                <input type="hidden" name="courseId" value="${course.courseID}">
                                <button type="submit" class="btn btn-primary">Generate Certificate</button>
                            </form>
                        </c:if>
                        <c:if test="${certificateGenerated}">
                            <a href="${pageContext.request.contextPath}/user-profile" class="btn btn-primary">View Certificate</a>
                        </c:if>
                    </div>

                </div>
            </div>
        </div>



    </body>
</html>
