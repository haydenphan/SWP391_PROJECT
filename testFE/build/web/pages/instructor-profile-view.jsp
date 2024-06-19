<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>
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
        <!-- hero-area -->
        <jsp:include page="../template/heroArea.jsp">
            <jsp:param name="title" value="My profile" />
        </jsp:include>

        <!-- course-details-area-start -->
        <div class="course-details-area pt-120 pb-100">
            <div class="container">
                <div class="row">
                    <div class="col-xl-3 col-lg-3">
                        <div class="course-instructors-img mb-30">
                            <img class="mb-20" src="${pageContext.request.contextPath}/img/course/course-instructors.png" alt="instructors-img">
                            <div class="course-details-tittle mb-30">
                                <h3>David Allberto</h3>
                                <span class="d-block mb-15">Software Developer</span>
                                <ul>
                                    <li><a href="mailto:info@example.com"><i class="fal fa-envelope"></i> info@example.com</a>
                                    </li>
                                    <li><a href="tel:987547587587"><i class="far fa-phone-alt"></i> (987) 547587587</a></li>
                                    <li><a href="#"><i class="far fa-map-marker-alt"></i> North Helenavile, FV77 8WS</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-8 col-lg-9">
                        <div class="course-details-wrapper">
                            <div class="course-details-meta">
                                <div class="total-course">
                                    <span>Total Courses</span>
                                    <label>22</label>
                                </div>
                                <div class="student course">
                                    <span>Students</span>
                                    <label>5,230</label>
                                </div>
                                <div class="review-course">
                                    <span>Review</span>
                                    <div class="review-course-inner d-flex">
                                        <ul>
                                            <li><a href="#"><i class="fas fa-star"></i></a></li>
                                        </ul>
                                        <p>4.9 (540)</p>
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
                                <p>David Allberto is a Software Developer and Instructor having enjoyed his courses to date. He
                                    is the creator of Codexpand, a place of learning and growth to help people move into and be
                                    successful within the Helping Industry. One of Graham's key driving forces is to remove the
                                    barriers to the Helping Industry by producing high quality, accredited courses at affordable
                                    prices.</p>
                            </div>
                            <div class="course-bio-text pb-20">
                                <h3>Skill</h3>
                                <div class="student-reating-bar">
                                    <div class="reating-bar-wrapper">
                                        <div class="rating-row mb-10">
                                            <div class="instructor-rating-star">
                                                <span>HTML5</span>
                                            </div>
                                            <div class="progress">
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar1 wow fadeInLeft" style="width: 98%;"></div>
                                                </div>
                                            </div>
                                            <div class="progress-tittle">
                                                <span>98%</span>
                                            </div>
                                        </div>
                                        <div class="rating-row mb-10">
                                            <div class="instructor-rating-star">
                                                <span>CSS3</span>
                                            </div>
                                            <div class="progress">
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar1 wow fadeInLeft" style="width: 85%;"></div>
                                                </div>
                                            </div>
                                            <div class="progress-tittle">
                                                <span>85%</span>
                                            </div>
                                        </div>
                                        <div class="rating-row mb-10">
                                            <div class="instructor-rating-star">
                                                <span>Javascript</span>
                                            </div>
                                            <div class="progress">
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar1 wow fadeInLeft" style="width: 75%;"></div>
                                                </div>
                                            </div>
                                            <div class="progress-tittle">
                                                <span>75%</span>
                                            </div>
                                        </div>
                                        <div class="rating-row mb-10">
                                            <div class="instructor-rating-star">
                                                <span>React</span>
                                            </div>
                                            <div class="progress">
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar1 wow fadeInLeft" style="width: 70%;"></div>
                                                </div>
                                            </div>
                                            <div class="progress-tittle">
                                                <span>70%</span>
                                            </div>
                                        </div>
                                        <div class="rating-row mb-10">
                                            <div class="instructor-rating-star">
                                                <span>Mongodb</span>
                                            </div>
                                            <div class="progress">
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar1 wow fadeInLeft" style="width: 65%;"></div>
                                                </div>
                                            </div>
                                            <div class="progress-tittle">
                                                <span>65%</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="course-bio-text pb-20">
                                <h3>Experience</h3>
                                <p class="pb-10">This is to certify that Ms. Kanza Faisal worked as Manager Software
                                    Development for NetSole Soft Limited in software development department.</p>

                                <div class="student-reating-bar">
                                    <div class="reating-bar-wrapper">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="counter-wrapper text-center mb-30">
                                                    <div class="counter-icon">
                                                        <div class="counter-icon-wrap">
                                                            <svg id="layer2" xmlns="http://www.w3.org/2000/svg" width="50.897"
                                                                 height="56.553" viewBox="0 0 50.897 56.553">
                                                            <path id="path3518"
                                                                  d="M26.3.646,1.793,13.689a.834.834,0,0,0,.048,1.522L16.07,21.734h21.4L51.7,15.211a.834.834,0,0,0,.05-1.522L27.244.647a.9.9,0,0,0-.473-.117A1.023,1.023,0,0,0,26.3.646Z"
                                                                  transform="translate(-1.323 -0.529)" fill="#5299d3" />
                                                            <path id="path3534"
                                                                  d="M16.66,2.911a35.363,35.363,0,0,0-7.55.718,9.782,9.782,0,0,0-2.456.841,3.065,3.065,0,0,0-.858.648,1.7,1.7,0,0,0-.451,1.106v7.4l-.077.893a17.977,17.977,0,0,1,22.781,0l-.077-.891v-7.4a1.7,1.7,0,0,0-.451-1.106,3.056,3.056,0,0,0-.856-.648,9.78,9.78,0,0,0-2.456-.841,35.363,35.363,0,0,0-7.55-.718Z"
                                                                  transform="translate(8.788 5.574)" fill="#a0c7e7" />
                                                            <path id="path3604"
                                                                  d="M9.111,3.629a9.782,9.782,0,0,0-2.456.841,3.065,3.065,0,0,0-.858.648,1.7,1.7,0,0,0-.451,1.106v7.4l-.077.893a17.891,17.891,0,0,1,1.962-1.388V6.225a1.7,1.7,0,0,1,.451-1.106A3.066,3.066,0,0,1,8.54,4.47,9.782,9.782,0,0,1,11,3.629a34,34,0,0,1,6.607-.7c-.316-.006-.62-.02-.943-.02a35.363,35.363,0,0,0-7.55.718Z"
                                                                  transform="translate(8.788 5.574)" fill="#74addc" />
                                                            <path id="rect3599"
                                                                  d="M18.372,4.5h1.885A14.107,14.107,0,0,1,34.395,18.636V33.67H4.233V18.636A14.107,14.107,0,0,1,18.372,4.5Z"
                                                                  transform="translate(6.135 9.64)" fill="#356287" />
                                                            <path id="path3610"
                                                                  d="M18.372,4.5A14.107,14.107,0,0,0,4.233,18.636V33.669H6.118V18.636A14.107,14.107,0,0,1,20.257,4.5Z"
                                                                  transform="translate(6.135 9.64)" fill="#2c5170" />
                                                            <path id="path3506"
                                                                  d="M15.317,11.649a14.343,14.343,0,0,0-13.2,14.545v1.451a.943.943,0,0,0,.939.946H46.418a.943.943,0,0,0,.939-.946V26.193a14.341,14.341,0,0,0-13.2-14.545H15.317Z"
                                                                  transform="translate(0.711 27.962)" fill="#5299d3" />
                                                            <path id="path3508"
                                                                  d="M7.827,9.922a.943.943,0,0,0-.948.939v8.909a.943.943,0,0,0,.948.939h9.42a.943.943,0,0,0,.946-.939V10.861a.943.943,0,0,0-.946-.939Z"
                                                                  transform="translate(12.912 23.538)" fill="#fca" />
                                                            <path id="path3510"
                                                                  d="M7.827,9.922a.943.943,0,0,0-.948.939v2.723a9.605,9.605,0,0,0,11.314,0V10.861a.943.943,0,0,0-.946-.939Z"
                                                                  transform="translate(12.913 23.538)" fill="#ffb889" />
                                                            <path id="path3512"
                                                                  d="M15.318,11.648a14.345,14.345,0,0,0-13.2,14.546v1.451a.943.943,0,0,0,.939.946H4.941A.943.943,0,0,1,4,27.645V26.194A14.345,14.345,0,0,1,17.2,11.648H15.318Z"
                                                                  transform="translate(0.711 27.961)" fill="#3385c8" />
                                                            <path id="path3514"
                                                                  d="M8.661,11.126,5.83,13.95a.943.943,0,0,0,0,1.329l6.6,6.6a.943.943,0,0,0,1.329,0l2.163-2.158,2.165,2.158a.943.943,0,0,0,1.329,0l6.6-6.6a.943.943,0,0,0,0-1.329L23.19,11.126a.942.942,0,0,0-1.337,0l-5.928,5.928L9.99,11.126a.933.933,0,0,0-1.329,0Z"
                                                                  transform="translate(9.523 25.911)" fill="#a0c7e7" />
                                                            <path id="path3520"
                                                                  d="M8.387,7.087a3.625,3.625,0,0,0-3.514,3.7A3.63,3.63,0,0,0,8.387,14.5a3.252,3.252,0,0,0,.808-.114c0-.007,0-.013,0-.02V7.189a3.341,3.341,0,0,0-.8-.1Z"
                                                                  transform="translate(7.773 16.275)" fill="#ffb889" />
                                                            <path id="path3522"
                                                                  d="M15.171,10.79A3.63,3.63,0,0,1,11.656,14.5a3.252,3.252,0,0,1-.808-.114c0-.007,0-.013,0-.02V7.189a3.341,3.341,0,0,1,.8-.1,3.625,3.625,0,0,1,3.514,3.7Z"
                                                                  transform="translate(23.084 16.275)" fill="#fca" />
                                                            <path id="path3528"
                                                                  d="M13.067,5.316a.943.943,0,0,0-.954.933A3.829,3.829,0,0,1,8.28,10.055H6.7a.943.943,0,0,0-.939.939v4.732a9.637,9.637,0,0,0,19.273,0V10.994a.943.943,0,0,0-.939-.939h-5.54a4.624,4.624,0,0,1-4.571-3.938.943.943,0,0,0-.919-.8Z"
                                                                  transform="translate(10.051 11.736)" fill="#fca" />
                                                            <path id="path3530" d="M4.8,3.167l-1.887,1v13.16H4.8Z"
                                                                  transform="translate(2.743 6.23)" fill="#eee" />
                                                            <path id="path3532"
                                                                  d="M3.592,6.614a.943.943,0,0,0-.946.939v8.511a.943.943,0,0,0,.946.946H5.473a.943.943,0,0,0,.939-.946V7.553a.943.943,0,0,0-.939-.939Z"
                                                                  transform="translate(2.067 15.063)" fill="#ffca28" />
                                                            <path id="path3537"
                                                                  d="M3.592,6.614a.943.943,0,0,0-.946.939v8.512a.943.943,0,0,0,.946.946H5.473a.943.943,0,0,1-.943-.946V7.553a.943.943,0,0,1,.943-.939Z"
                                                                  transform="translate(2.067 15.063)" fill="#ecb200" />
                                                            <path id="path3542"
                                                                  d="M6.7,6.646a.943.943,0,0,0-.939.939v4.731a9.613,9.613,0,0,0,6.526,9.1,10.337,10.337,0,0,1-5.374-9.068V7.255a1.014,1.014,0,0,1,.206-.609Z"
                                                                  transform="translate(10.051 15.145)" fill="#ffb889" />
                                                            <g id="Group_2872" data-name="Group 2872"
                                                               transform="translate(11.311 50.9)">
                                                            <path id="path3544"
                                                                  d="M5.483,14.818A.943.943,0,0,0,4.5,15.84v4.62H6.379V15.84A.943.943,0,0,0,5.483,14.818Z"
                                                                  transform="translate(-4.498 -14.817)" fill="#3385c8" />
                                                            <path id="path3547"
                                                                  d="M12.891,14.818a.943.943,0,0,0-.981,1.022v4.62h1.878V15.84a.943.943,0,0,0-.9-1.022Z"
                                                                  transform="translate(14.485 -14.817)" fill="#3385c8" />
                                                            </g>
                                                            </svg>
                                                        </div>
                                                        <div class="count-number">
                                                            <span class="counter">18</span>
                                                            <p>Online Courses</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="counter-wrapper text-center mb-30">
                                                    <div class="counter-icon">
                                                        <div class="counter-icon-wrap">
                                                            <svg id="online-course" xmlns="http://www.w3.org/2000/svg" width="51.549"
                                                                 height="56.553" viewBox="0 0 51.549 56.553">
                                                            <path id="Path_7050" data-name="Path 7050"
                                                                  d="M220.4,404.2h8.315v8.63H220.4Z"
                                                                  transform="translate(-198.783 -358.613)" fill="#726b93" />
                                                            <path id="Path_7051" data-name="Path 7051"
                                                                  d="M102.177,357.3v1.612a1.535,1.535,0,0,1-1.53,1.53H56.83a1.535,1.535,0,0,1-1.53-1.53V357.3Z"
                                                                  transform="translate(-52.964 -317.19)" fill="#988fc4" />
                                                            <path id="Path_7052" data-name="Path 7052"
                                                                  d="M102.177,77.142v29.021H55.3V77.142a1.535,1.535,0,0,1,1.53-1.53h7.042l-.993.5a1.831,1.831,0,0,0-1.016,1.635,1.81,1.81,0,0,0,1.016,1.635l3.959,1.974v7.661a2.825,2.825,0,0,0,2.242,2.756,47.052,47.052,0,0,0,19.34,0,2.825,2.825,0,0,0,2.242-2.756V81.357l1.144-.572v7.521a1.168,1.168,0,0,0,2.336,0V79.617l.479-.245a1.831,1.831,0,0,0,1.016-1.635A1.81,1.81,0,0,0,94.621,76.1l-.993-.5h7.042A1.548,1.548,0,0,1,102.177,77.142Zm-6.563,25.132a1.171,1.171,0,0,0-1.168-1.168H70.634a1.168,1.168,0,1,0,0,2.336H94.446A1.164,1.164,0,0,0,95.614,102.274ZM83.468,96.656A1.171,1.171,0,0,0,82.3,95.488H70.622a1.168,1.168,0,0,0,0,2.336H82.3A1.157,1.157,0,0,0,83.468,96.656Zm-16.934,0a1.171,1.171,0,0,0-1.168-1.168H63.031a1.168,1.168,0,1,0,0,2.336h2.336A1.157,1.157,0,0,0,66.535,96.656Zm0,5.617a1.171,1.171,0,0,0-1.168-1.168H63.031a1.168,1.168,0,1,0,0,2.336h2.336A1.157,1.157,0,0,0,66.535,102.274Z"
                                                                  transform="translate(-52.964 -68.389)" fill="#e3fbff" />
                                                            <path id="Path_7053" data-name="Path 7053"
                                                                  d="M193.229,134.9v6.493a.491.491,0,0,1-.374.479,44.718,44.718,0,0,1-18.382,0,.479.479,0,0,1-.374-.479V134.9l8.747,4.379a1.882,1.882,0,0,0,1.635,0Z"
                                                                  transform="translate(-157.89 -120.763)" fill="#726b93" />
                                                            <path id="Path_7054" data-name="Path 7054"
                                                                  d="M164.718,41.349l-13.909,6.96L136.9,41.349,150.809,34.4Z"
                                                                  transform="translate(-125.035 -32)" fill="#988fc4" />
                                                            <path id="Path_7055" data-name="Path 7055"
                                                                  d="M86.849,22.6V55.571a3.87,3.87,0,0,1-3.866,3.866H67.568v8.63h4.158a1.168,1.168,0,1,1,0,2.336h-21.3a1.168,1.168,0,1,1,0-2.336h4.158v-8.63H39.166A3.87,3.87,0,0,1,35.3,55.571V22.6a3.87,3.87,0,0,1,3.866-3.866H50.879l9.378-4.695a1.83,1.83,0,0,1,1.635,0l9.378,4.683H82.983A3.88,3.88,0,0,1,86.849,22.6ZM84.513,55.571V53.96H37.636v1.612a1.535,1.535,0,0,0,1.53,1.53H82.983A1.528,1.528,0,0,0,84.513,55.571Zm0-3.947V22.6a1.535,1.535,0,0,0-1.53-1.53H75.941l.993.5A1.831,1.831,0,0,1,77.95,23.21a1.81,1.81,0,0,1-1.016,1.635l-.479.245v8.689a1.168,1.168,0,0,1-2.336,0V26.247l-1.144.572V34.48a2.813,2.813,0,0,1-2.242,2.756,47.533,47.533,0,0,1-9.67,1,47.533,47.533,0,0,1-9.67-1,2.825,2.825,0,0,1-2.242-2.756V26.819l-3.959-1.974a1.831,1.831,0,0,1-1.016-1.635,1.81,1.81,0,0,1,1.016-1.635l.993-.5H39.166a1.535,1.535,0,0,0-1.53,1.53V51.624ZM61.074,30.159,74.983,23.21,61.074,16.25,47.165,23.2Zm9.565,4.309V27.975l-8.747,4.379a1.882,1.882,0,0,1-1.635,0L51.51,27.975v6.493a.491.491,0,0,0,.374.479,44.718,44.718,0,0,0,18.382,0A.479.479,0,0,0,70.639,34.468Zm-5.407,33.6v-8.63H56.917v8.63Z"
                                                                  transform="translate(-35.3 -13.85)" />
                                                            <path id="Path_7056" data-name="Path 7056"
                                                                  d="M201.58,294a1.168,1.168,0,0,1,0,2.336H177.768a1.168,1.168,0,0,1,0-2.336Z"
                                                                  transform="translate(-160.098 -261.283)" />
                                                            <path id="Path_7057" data-name="Path 7057"
                                                                  d="M189.346,245.9a1.168,1.168,0,1,1,0,2.336H177.668a1.168,1.168,0,0,1,0-2.336Z"
                                                                  transform="translate(-160.01 -218.8)" />
                                                            <path id="Path_7058" data-name="Path 7058"
                                                                  d="M115,245.9a1.168,1.168,0,0,1,0,2.336h-2.336a1.168,1.168,0,0,1,0-2.336Z"
                                                                  transform="translate(-102.601 -218.8)" />
                                                            <path id="Path_7059" data-name="Path 7059"
                                                                  d="M115,294a1.168,1.168,0,0,1,0,2.336h-2.336a1.168,1.168,0,0,1,0-2.336Z"
                                                                  transform="translate(-102.601 -261.283)" />
                                                            </svg>
                                                        </div>
                                                        <div class="count-number">
                                                            <span class="counter">5,740</span>
                                                            <p>Enrolled Students</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="my-course-info">
                                <h3>My Courses</h3>
                            </div>
                            <div class="row">
                                <div class="col-xl-6 col-lg-6 col-md-6 col-md-6">
                                    <div class="eduman-course-main-wrapper mb-30">
                                        <div class="eduman-course-img w-img">
                                            <a href="course-details.html"><img src="assets/img/portfilo/course-img-01.jpg"
                                                                               alt="course-img"></a>
                                        </div>
                                        <div class="eduman-course-wraper">
                                            <div class="eduman-course-heading">
                                                <a href="course.html" class="course-link-color-1">Development</a>
                                                <span class="couse-star"><i class="fas fa-star"></i>4.9 (25)</span>
                                            </div>
                                            <div class="eduman-course-text">
                                                <h3><a href="course-details.html">WordPress Development Course for Plugins &amp;
                                                        Themes</a></h3>
                                            </div>
                                            <div class="eduman-course-meta">
                                                <div class="eduman-course-price">
                                                    <span class="price-now">$25.00 </span>
                                                    <del class="price-old">$36.00</del>
                                                </div>
                                                <div class="eduman-course-tutor">
                                                    <a href="instructor-profile.html"><img
                                                            src="assets/img/portfilo/course-tutor-01.png" alt="tutor-img"></a>
                                                    <a href="instructor-profile.html"><span>Eduman</span></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="eduman-course-footer">
                                            <div class="course-lessson-svg">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16.471" height="16.471"
                                                     viewBox="0 0 16.471 16.471">
                                                <g id="blackboard-52441" transform="translate(-0.008)">
                                                <path id="Path_101-65441" data-name="Path 101"
                                                      d="M16,1.222H8.726V.483a.483.483,0,1,0-.965,0v.74H.491A.483.483,0,0,0,.008,1.7V13.517A.483.483,0,0,0,.491,14H5.24L4.23,15.748a.483.483,0,1,0,.836.483L6.354,14H7.761v1.99a.483.483,0,0,0,.965,0V14h1.407l1.288,2.231a.483.483,0,1,0,.836-.483L11.247,14H16a.483.483,0,0,0,.483-.483V1.7A.483.483,0,0,0,16,1.222Zm-.483.965v8.905H.973V2.187Zm0,10.847H.973v-.976H15.514Z"
                                                      fill="#575757" />
                                                </g>
                                                </svg>
                                                <span class="ms-2">12 Lessons</span>
                                            </div>
                                            <div class="course-deteals-btn">
                                                <a href="course-details.html"><span class="me-2">View Details</span><i
                                                        class="far fa-arrow-right"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6">
                                    <div class="eduman-course-main-wrapper mb-30">
                                        <div class="eduman-course-img w-img">
                                            <a href="course-details.html"><img src="assets/img/portfilo/course-img-02.jpg"
                                                                               alt="course-img"></a>
                                        </div>
                                        <div class="eduman-course-wraper">
                                            <div class="eduman-course-heading">
                                                <a href="course.html" class="course-link-color-2">Life Style</a>
                                                <span class="couse-star"><i class="fas fa-star"></i>4.9 (25)</span>
                                            </div>
                                            <div class="eduman-course-text">
                                                <h3><a href="course-details.html">Master Google Docs: Free online documents for
                                                        personal use</a></h3>
                                            </div>
                                            <div class="eduman-course-meta">
                                                <div class="eduman-course-price">
                                                    <span class="price-now">$22.00 </span>
                                                    <del class="price-old">$31.00</del>
                                                </div>
                                                <div class="eduman-course-tutor">
                                                    <a href="instructor-profile.html"><img
                                                            src="assets/img/portfilo/course-tutor-02.png" alt="image not found"></a>
                                                    <a href="instructor-profile.html"><span>Eduman</span></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="eduman-course-footer">
                                            <div class="course-lessson-svg">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16.471" height="16.471"
                                                     viewBox="0 0 16.471 16.471">
                                                <g id="blackboard-1244" transform="translate(-0.008)">
                                                <path id="Path_10154542" data-name="Path 101"
                                                      d="M16,1.222H8.726V.483a.483.483,0,1,0-.965,0v.74H.491A.483.483,0,0,0,.008,1.7V13.517A.483.483,0,0,0,.491,14H5.24L4.23,15.748a.483.483,0,1,0,.836.483L6.354,14H7.761v1.99a.483.483,0,0,0,.965,0V14h1.407l1.288,2.231a.483.483,0,1,0,.836-.483L11.247,14H16a.483.483,0,0,0,.483-.483V1.7A.483.483,0,0,0,16,1.222Zm-.483.965v8.905H.973V2.187Zm0,10.847H.973v-.976H15.514Z"
                                                      fill="#575757" />
                                                </g>
                                                </svg>
                                                <span class="ms-2">12 Lessons</span>
                                            </div>
                                            <div class="course-deteals-btn">
                                                <a href="course-details.html"><span class="me-2">View Details</span><i
                                                        class="far fa-arrow-right"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6">
                                    <div class="eduman-course-main-wrapper mb-30">
                                        <div class="eduman-course-img w-img">
                                            <a href="course-details.html"><img src="assets/img/portfilo/course-img-03.jpg"
                                                                               alt="course-img"></a>
                                        </div>
                                        <div class="eduman-course-wraper">
                                            <div class="eduman-course-heading">
                                                <a href="course.html" class="course-link-color-3">Business</a>
                                                <span class="couse-star"><i class="fas fa-star"></i>4.9 (25)</span>
                                            </div>
                                            <div class="eduman-course-text">
                                                <h3><a href="course-details.html">Write Better Emails: Tactics for Smarter Team
                                                        Communication</a></h3>
                                            </div>
                                            <div class="eduman-course-meta">
                                                <div class="eduman-course-price">
                                                    <span class="price-now">$21.00 </span>
                                                    <del class="price-old">$32.00</del>
                                                </div>
                                                <div class="eduman-course-tutor">
                                                    <a href="instructor-profile.html"><img
                                                            src="assets/img/portfilo/course-tutor-04.png" alt="image not found"></a>
                                                    <a href="instructor-profile.html"><span>Eduman</span></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="eduman-course-footer">
                                            <div class="course-lessson-svg">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16.471" height="16.471"
                                                     viewBox="0 0 16.471 16.471">
                                                <g id="blackboard" transform="translate(-0.008)">
                                                <path id="Path_101" data-name="Path 101"
                                                      d="M16,1.222H8.726V.483a.483.483,0,1,0-.965,0v.74H.491A.483.483,0,0,0,.008,1.7V13.517A.483.483,0,0,0,.491,14H5.24L4.23,15.748a.483.483,0,1,0,.836.483L6.354,14H7.761v1.99a.483.483,0,0,0,.965,0V14h1.407l1.288,2.231a.483.483,0,1,0,.836-.483L11.247,14H16a.483.483,0,0,0,.483-.483V1.7A.483.483,0,0,0,16,1.222Zm-.483.965v8.905H.973V2.187Zm0,10.847H.973v-.976H15.514Z"
                                                      fill="#575757" />
                                                </g>
                                                </svg>
                                                <span class="ms-2">12 Lessons</span>
                                            </div>
                                            <div class="course-deteals-btn">
                                                <a href="course-details.html"><span class="me-2">View Details</span><i
                                                        class="far fa-arrow-right"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6">
                                    <div class="eduman-course-main-wrapper mb-30">
                                        <div class="eduman-course-img w-img">
                                            <a href="course-details.html"><img src="assets/img/portfilo/course-img-06.jpg"
                                                                               alt="course-img"></a>
                                        </div>
                                        <div class="eduman-course-wraper">
                                            <div class="eduman-course-heading">
                                                <a href="course.html" class="course-link-color-4">Health & Fitness</a>
                                                <span class="couse-star"><i class="fas fa-star"></i>4.9 (25)</span>
                                            </div>
                                            <div class="eduman-course-text">
                                                <h3><a href="course-details.html">Become a Super Human: Naturally & Safely Boost
                                                        Testosterone</a></h3>
                                            </div>
                                            <div class="eduman-course-meta">
                                                <div class="eduman-course-price">
                                                    <span class="price-now">$27.00 </span>
                                                </div>
                                                <div class="eduman-course-tutor">
                                                    <a href="instructor-profile.html"><img
                                                            src="assets/img/portfilo/course-tutor-05.png" alt="image not found"></a>
                                                    <a href="instructor-profile.html"><span>Eduman</span></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="eduman-course-footer">
                                            <div class="course-lessson-svg">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16.471" height="16.471"
                                                     viewBox="0 0 16.471 16.471">
                                                <g id="blackboard-2004" transform="translate(-0.008)">
                                                <path id="Path_1012055" data-name="Path 101"
                                                      d="M16,1.222H8.726V.483a.483.483,0,1,0-.965,0v.74H.491A.483.483,0,0,0,.008,1.7V13.517A.483.483,0,0,0,.491,14H5.24L4.23,15.748a.483.483,0,1,0,.836.483L6.354,14H7.761v1.99a.483.483,0,0,0,.965,0V14h1.407l1.288,2.231a.483.483,0,1,0,.836-.483L11.247,14H16a.483.483,0,0,0,.483-.483V1.7A.483.483,0,0,0,16,1.222Zm-.483.965v8.905H.973V2.187Zm0,10.847H.973v-.976H15.514Z"
                                                      fill="#575757" />
                                                </g>
                                                </svg>
                                                <span class="ms-2">12 Lessons</span>
                                            </div>
                                            <div class="course-deteals-btn">
                                                <a href="course-details.html"><span class="me-2">View Details</span><i
                                                        class="far fa-arrow-right"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="edu-pagination mt-30 mb-20">
                                <ul>
                                    <li><a href="#"><i class="fal fa-angle-left"></i></a></li>
                                    <li class="active"><a href="#"><span>01</span></a> </li>
                                    <li><a href="#"><span>02</span></a></li>
                                    <li><a href="#"><i class="fal fa-angle-right"></i></a></li>
                                </ul>
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
                                            <div class="progress-tittle">
                                                <span>${instStats.getPercentageOfNStarRating(5)}%</span>
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
                                            <div class="progress-tittle">
                                                <span>${instStats.getPercentageOfNStarRating(4)}%</span>
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
                                            <div class="progress-tittle">
                                                <span>${instStats.getPercentageOfNStarRating(3)}%</span>
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
                                            <div class="progress-tittle">
                                                <span>${instStats.getPercentageOfNStarRating(2)}%</span>
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
                                            <div class="progress-tittle">
                                                <span>${instStats.getPercentageOfNStarRating(1)}%</span>
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
                                if ((boolean) request.getAttribute("hasEnrolled")) {
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
                                            <form id="feedbackForm" action="instructorFeedbacks" method="Post">
                                                <input type="hidden" id="rating" name="rating" value="1">
                                                <input type="hidden" id="instructorID" name="instructorID" value="<%= request.getParameter("id")%>">
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