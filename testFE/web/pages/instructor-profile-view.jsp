<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>
<%@ page import="DAO.*" %>
<!doctype html>
<html class="no-js" lang="zxx">


    <head>
        <%-- HEAD --%>
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
        <%@ include file="../template/head.jsp" %>
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
                var instructorID = urlParams.get('id');
                $.ajax({
                    type: "GET",
                    url: "/testFE/instructorFeedbacks?instructorID=" + instructorID + "&page=" + page,
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

        <%
            InstructorFeedbackDAO iDAO = new InstructorFeedbackDAO();
            User instructor = (User) request.getAttribute("instructor");
            int reviewNum = iDAO.getTotalFeedbacksForInstructor(instructor.getUserID());
        %>

        <!-- hero-area -->
        <jsp:include page="../template/heroArea.jsp">
            <jsp:param name="title" value="Instructor profile" />
        </jsp:include>

        <!-- course-details-area-start -->
        <div class="course-details-area pt-120 pb-100">
            <div class="container">
                <div class="row">
                    <div class="col-xl-3 col-lg-3">
                        <div class="course-instructors-img mb-30">
                            <img class="mb-20" src="${pageContext.request.contextPath}/img/course/course-instructors.png" alt="instructors-img">
                            <div class="course-details-tittle mb-30">
                                <h3>${instructor.getFirstName()} ${instructor.getLastName()}</h3>
                                <span class="d-block mb-15"></span>
                                <ul>
                                    <li><a href="mailto:${instructor.getEmail()}"><i class="fal fa-envelope"></i>${instructor.getEmail()}</a>
                                    </li>
                                    <li></li>
                                    <li><a href="#"><i class="far fa-map-marker-alt"></i>Address</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-8 col-lg-9">
                        <div class="course-details-wrapper">
                            <div class="course-details-meta">
                                <div class="total-course">
                                    <span>Total Courses</span>
                                    <label>${ CourseDAO.countCoursesByInstructor(instructor.getUserID())}</label>
                                </div>
                                <div class="student course">
                                    <span>Students</span>
                                    <label>${ CourseDAO.countTotalEnrollmentsByInstructor(instructor.getUserID())}</label>
                                </div>
                                <div class="review-course">
                                    <span>Review</span>
                                    <div class="review-course-inner d-flex">
                                        <ul>
                                            <li><a href="#"><i class="fas fa-star"></i></a></li>
                                        </ul>
                                        <p>${InstructorFeedbackDAO.getAverageRatingForInstructor(instructor.getUserID())} (<%=reviewNum%>)</p>
                                    </div>
                                </div>
                                <div class="course-details-action">
                                    <div class="course-follow">
                                        <span class="d-block">Follow</span>
                                        <div class="member-social">
                                            <ul>
                                                <li>
                                                    <a href="#"><i class="fab fa-facebook"></i></a>
                                                </li>
                                                <li>
                                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                                </li>
                                                <li>
                                                    <a href="#"><i class="fab fa-vimeo-v"></i></a>
                                                </li>
                                                <li>
                                                    <a href="#"><i class="fab fa-linkedin"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="course-bio-text pt-45 pb-20">
                                <h3>Biography</h3>
                                <p>
                                    ${instructor.getBio()}
                                </p>
                            </div>

                            <h3>Student Feedback</h3>
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
                                                     style="width: ${instStats.getPercentageOfNStarRating(5)}%;" aria-valuenow="25" aria-valuemin="0"
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
                                                     style="width: ${instStats.getPercentageOfNStarRating(4)}%;" aria-valuenow="25" aria-valuemin="0"
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
                                                     style="width: ${instStats.getPercentageOfNStarRating(3)}%;" aria-valuenow="25" aria-valuemin="0"
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
                                                     style="width: ${instStats.getPercentageOfNStarRating(2)}%;" aria-valuenow="25" aria-valuemin="0"
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
                                                     style="width: ${instStats.getPercentageOfNStarRating(1)}%;" aria-valuenow="25" aria-valuemin="0"
                                                     aria-valuemax="100" data-wow-duration="1s"
                                                     data-wow-delay="0.5s"></div>
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

                                    </div>
                                </div>

                            </div>
                            <button id="prevBtn" class="pagination-btn" onclick="prevPage()">Back</button>
                            <button id="nextBtn" class="pagination-btn" onclick="nextPage()">Next</button>

                            <%
                                boolean hasEnrolled = (request.getAttribute("hasEnrolled") == null) ? false : (boolean) request.getAttribute("hasEnrolled");
                                boolean hasSubmittedFeedback = (request.getAttribute("hasSubmittedFeedback") == null) ? false : (boolean) request.getAttribute("hasSubmittedFeedback");
                            %>

                            <!-- Review Form Section -->
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
                                            <form id="feedbackForm" action="instructorFeedbacks" method="Post">
                                                <input type="hidden" id="rating" name="rating" value="1">
                                                <input type="hidden" id="instructorID" name="instructorID" value="<%= request.getParameter("instructorID")%>">
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
                                    <p>You have already submitted feedback for this instructor.</p>
                                    <% } %>
                                </div>
                            </div>
                            <% } else { %>
                            <p>Only those enrolling in the course can leave their feedbacks</p>
                            <% }%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- course-details-area- end -->
    </main>

    <%-- FOOTER --%>
    <%@ include file="../template/footer.jsp" %>

    <%-- BACK TO TOP --%>
    <%@ include file="../template/backToTop.jsp" %>

    <!-- JS here -->
    <%@ include file="../template/script.jsp" %>
</body>
</html>