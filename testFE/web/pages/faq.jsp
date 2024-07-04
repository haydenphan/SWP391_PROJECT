<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>
<%@ page import="DAO.*" %>
<!doctype html>
<html class="no-js" lang="zxx">

    <head>
        <%-- HEAD --%>
        <%@ include file="../template/head.jsp" %>
    </head>

    <body>
        <%-- PRE LOADER --%>
        <%@ include file="../template/preLoader.jsp" %>
        <%-- SIDE TOGGLE --%>
        <%@ include file="../template/sideToggle.jsp" %>
        <%-- HEADER --%>
        <%@ include file="../template/header.jsp" %>

        <main>
            <!-- baner-area-start -->
            <div class="banner-area faq position-relative">
                <div class="banner-img">
                    <img src="assets/img/banner/banner.png" alt="image not found">
                </div>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-8">
                            <div class="banner-tiitle-wrapper text-center">
                                <div class="banner-tittle">
                                    <h2>Welcome to help and support center!<br>How may we help you?</h2>
                                </div>
                                <div class="banner-search-box">
                                    <form action="#">
                                        <div class="slider-faq-search">
                                            <input type="text" placeholder="Search courses...">
                                            <button type="submit"><i class="fal fa-search"></i></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- banner-arera-end -->

            <!-- faq-area-start -->
            <div class="faq-topic-area pb-90">
                <div class="container">
                    <div class="faq-tabs-area mt-50">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="faq-nav-tab">
                                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home"
                                                    type="button" role="tab" aria-controls="home" aria-selected="true">Student</button>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile"
                                                    type="button" role="tab" aria-controls="profile"
                                                    aria-selected="false">Instructor</button>
                                        </li>
                                    </ul>
                                </div>
                                <div class="faq-nav-content">
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                            <div class="faq-area pt-30 pb-30">
                                                <div class="row">
                                                    <div class="col-xl-12">
                                                        <div class="faq-tittle-info text-center pt-55 mb-50">
                                                            <h3>Frequently Asked Queastions</h3>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-4 col-lg-6">
                                                        <div class="faq-wrapper mb-30">
                                                            <div class="faq-question-item">
                                                                <div class="faq-queastion-text">
                                                                    <a href="faq-details.html">Life time access for course</a>
                                                                </div>
                                                                <div class="faqicon-arrow">
                                                                    <a href="faq-details.html"><i class="far fa-chevron-right"></i></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-4 col-lg-6">
                                                        <div class="faq-wrapper mb-30">
                                                            <div class="faq-question-item">
                                                                <div class="faq-queastion-text">
                                                                    <a href="faq-details.html">How to find missing course</a>
                                                                </div>
                                                                <div class="faqicon-arrow">
                                                                    <a href="faq-details.html"><i class="far fa-chevron-right"></i></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-4 col-lg-6">
                                                        <div class="faq-wrapper mb-30">
                                                            <div class="faq-question-item">
                                                                <div class="faq-queastion-text">
                                                                    <a href="faq-details.html">How to download course certificate</a>
                                                                </div>
                                                                <div class="faqicon-arrow">
                                                                    <a href="faq-details.html"><i class="far fa-chevron-right"></i></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-4 col-lg-6">
                                                        <div class="faq-wrapper mb-30">
                                                            <div class="faq-question-item">
                                                                <div class="faq-queastion-text">
                                                                    <a href="faq-details.html">Life time access for course</a>
                                                                </div>
                                                                <div class="faqicon-arrow">
                                                                    <a href="faq-details.html"><i class="far fa-chevron-right"></i></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-4 col-lg-6">
                                                        <div class="faq-wrapper mb-30">
                                                            <div class="faq-question-item">
                                                                <div class="faq-queastion-text">
                                                                    <a href="faq-details.html">How to refund a course</a>
                                                                </div>
                                                                <div class="faqicon-arrow">
                                                                    <a href="faq-details.html"><i class="far fa-chevron-right"></i></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-4 col-lg-6">
                                                        <div class="faq-wrapper mb-30">
                                                            <div class="faq-question-item">
                                                                <div class="faq-queastion-text">
                                                                    <a href="faq-details.html">Payment method on Eduman</a>
                                                                </div>
                                                                <div class="faqicon-arrow">
                                                                    <a href="faq-details.html"><i class="far fa-chevron-right"></i></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-4 col-lg-6">
                                                        <div class="faq-wrapper mb-30">
                                                            <div class="faq-question-item">
                                                                <div class="faq-queastion-text">
                                                                    <a href="faq-details.html">How to start course on Mobile</a>
                                                                </div>
                                                                <div class="faqicon-arrow">
                                                                    <a href="faq-details.html"><i class="far fa-chevron-right"></i></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-4 col-lg-6">
                                                        <div class="faq-wrapper mb-30">
                                                            <div class="faq-question-item">
                                                                <div class="faq-queastion-text">
                                                                    <a href="faq-details.html">How to gift course to friend</a>
                                                                </div>
                                                                <div class="faqicon-arrow">
                                                                    <a href="faq-details.html"><i class="far fa-chevron-right"></i></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-4 col-lg-6">
                                                        <div class="faq-wrapper mb-30">
                                                            <div class="faq-question-item">
                                                                <div class="faq-queastion-text">
                                                                    <a href="faq-details.html">How edit your profile</a>
                                                                </div>
                                                                <div class="faqicon-arrow">
                                                                    <a href="faq-details.html"><i class="far fa-chevron-right"></i></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                            <div class="faq-area pt-30 pb-30">
                                                <div class="row">
                                                    <div class="col-xl-12">
                                                        <div class="faq-tittle-info text-center pt-55 mb-50">
                                                            <h2>Frequently Asked Queastions</h2>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-4">
                                                        <div class="faq-wrapper mb-30">
                                                            <div class="faq-question-item">
                                                                <div class="faq-queastion-text">
                                                                    <a href="faq-details.html">How to find missing course</a>
                                                                </div>
                                                                <div class="faqicon-arrow">
                                                                    <a href="faq-details.html"><i class="far fa-chevron-right"></i></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-4">
                                                        <div class="faq-wrapper mb-30">
                                                            <div class="faq-question-item">
                                                                <div class="faq-queastion-text">
                                                                    <a href="faq-details.html">How to download course certificate</a>
                                                                </div>
                                                                <div class="faqicon-arrow">
                                                                    <a href="faq-details.html"><i class="far fa-chevron-right"></i></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-4">
                                                        <div class="faq-wrapper mb-30">
                                                            <div class="faq-question-item">
                                                                <div class="faq-queastion-text">
                                                                    <a href="faq-details.html">Life time access for course</a>
                                                                </div>
                                                                <div class="faqicon-arrow">
                                                                    <a href="faq-details.html"><i class="far fa-chevron-right"></i></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-4">
                                                        <div class="faq-wrapper mb-30">
                                                            <div class="faq-question-item">
                                                                <div class="faq-queastion-text">
                                                                    <a href="faq-details.html">Life time access for course</a>
                                                                </div>
                                                                <div class="faqicon-arrow">
                                                                    <a href="faq-details.html"><i class="far fa-chevron-right"></i></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-4">
                                                        <div class="faq-wrapper mb-30">
                                                            <div class="faq-question-item">
                                                                <div class="faq-queastion-text">
                                                                    <a href="faq-details.html">How to refund a course</a>
                                                                </div>
                                                                <div class="faqicon-arrow">
                                                                    <a href="faq-details.html"><i class="far fa-chevron-right"></i></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-4">
                                                        <div class="faq-wrapper mb-30">
                                                            <div class="faq-question-item">
                                                                <div class="faq-queastion-text">
                                                                    <a href="faq-details.html">Payment method on Eduman</a>
                                                                </div>
                                                                <div class="faqicon-arrow">
                                                                    <a href="faq-details.html"><i class="far fa-chevron-right"></i></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-4">
                                                        <div class="faq-wrapper mb-30">
                                                            <div class="faq-question-item">
                                                                <div class="faq-queastion-text">
                                                                    <a href="faq-details.html">How to start course on Mobile</a>
                                                                </div>
                                                                <div class="faqicon-arrow">
                                                                    <a href="faq-details.html"><i class="far fa-chevron-right"></i></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-4">
                                                        <div class="faq-wrapper mb-30">
                                                            <div class="faq-question-item">
                                                                <div class="faq-queastion-text">
                                                                    <a href="faq-details.html">How to gift course to friend</a>
                                                                </div>
                                                                <div class="faqicon-arrow">
                                                                    <a href="faq-details.html"><i class="far fa-chevron-right"></i></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-4">
                                                        <div class="faq-wrapper mb-30">
                                                            <div class="faq-question-item">
                                                                <div class="faq-queastion-text">
                                                                    <a href="faq-details.html">How edit your profile</a>
                                                                </div>
                                                                <div class="faqicon-arrow">
                                                                    <a href="faq-details.html"><i class="far fa-chevron-right"></i></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="faq-topic-title text-center pt-55 mb-45">
                            <h3>FAQ Help Topic</h3>
                        </div>
                        <div class="col-xl-3 col-lg-4 col-md-6">
                            <div class="topic-wrapper text-center mb-30">
                                <div class="topic-items">
                                    <div class="topic-svg">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="70.797" height="70.797"
                                             viewBox="0 0 70.797 70.797">
                                        <g id="Icons" transform="translate(-4 -4)">
                                        <g id="Group_4118" data-name="Group 4118" transform="translate(4 4)">
                                        <g id="Group_4081" data-name="Group 4081" transform="translate(0 15.171)">
                                        <path id="Path_8186" data-name="Path 8186"
                                              d="M52.314,16H4V56.455H27.458a5.015,5.015,0,0,0,8.711,0h3.537a7.514,7.514,0,0,1-.217-.922l-2.351-1.176a5.028,5.028,0,0,1-2.8-4.522V48.87a5.06,5.06,0,0,1,2.57-4.4,5.341,5.341,0,0,1-.042-.655V37.57l-7.585-1.9V29.2l22.756-5.689,1.166.292a12.287,12.287,0,0,1-.893-7.8Z"
                                              transform="translate(-4 -16)" fill="#fa6450" />
                                        </g>
                                        <g id="Group_4082" data-name="Group 4082" transform="translate(5.057 45.512)">
                                        <path id="Path_8187" data-name="Path 8187"
                                              d="M33.285,42.528A5.018,5.018,0,0,1,33.967,40H8v5.057H33.539a5.07,5.07,0,0,1-.254-1.563Z"
                                              transform="translate(-8 -40)" fill="#be2814" />
                                        </g>
                                        <g id="Group_4083" data-name="Group 4083" transform="translate(5.057 10.114)">
                                        <path id="Path_8188" data-name="Path 8188"
                                              d="M53.512,12.039V12H38.955a7.59,7.59,0,0,0-5.364,2.221l-2.834,2.836L27.92,14.221A7.584,7.584,0,0,0,22.558,12H8V47.4H22.558a7.59,7.59,0,0,1,5.364,2.221l2.834,2.836,2.528-2.528a5.06,5.06,0,0,1,2.57-4.4,5.342,5.342,0,0,1-.042-.655V38.627l-7.585-1.9V30.254l22.756-5.689,1.166.292a12.517,12.517,0,0,1,1.363-12.818Z"
                                              transform="translate(-8 -12)" fill="#f0f0f0" />
                                        </g>
                                        <g id="Group_4084" data-name="Group 4084" transform="translate(5.057 10.114)">
                                        <path id="Path_8189" data-name="Path 8189" d="M8,12h5.057V47.4H8Z"
                                              transform="translate(-8 -12)" fill="#d2d2d2" />
                                        </g>
                                        <g id="Group_4085" data-name="Group 4085" transform="translate(0 15.171)">
                                        <path id="Path_8190" data-name="Path 8190" d="M4,16H9.057V56.455H4Z"
                                              transform="translate(-4 -16)" fill="#dc4632" />
                                        </g>
                                        <g id="Group_4086" data-name="Group 4086" transform="translate(12.642 22.756)">
                                        <path id="Path_8191" data-name="Path 8191" d="M14,22H24.114v2.528H14Z"
                                              transform="translate(-14 -22)" fill="#d2d2d2" />
                                        </g>
                                        <g id="Group_4087" data-name="Group 4087" transform="translate(12.642 17.699)">
                                        <path id="Path_8192" data-name="Path 8192" d="M14,18H24.114v2.528H14Z"
                                              transform="translate(-14 -18)" fill="#d2d2d2" />
                                        </g>
                                        <g id="Group_4088" data-name="Group 4088" transform="translate(12.642 27.813)">
                                        <path id="Path_8193" data-name="Path 8193" d="M14,26H24.114v2.528H14Z"
                                              transform="translate(-14 -26)" fill="#d2d2d2" />
                                        </g>
                                        <g id="Group_4089" data-name="Group 4089" transform="translate(12.642 32.87)">
                                        <path id="Path_8194" data-name="Path 8194" d="M14,30H24.114v2.528H14Z"
                                              transform="translate(-14 -30)" fill="#d2d2d2" />
                                        </g>
                                        <g id="Group_4090" data-name="Group 4090" transform="translate(12.642 37.927)">
                                        <path id="Path_8195" data-name="Path 8195" d="M14,34H24.114v2.528H14Z"
                                              transform="translate(-14 -34)" fill="#d2d2d2" />
                                        </g>
                                        <g id="Group_4091" data-name="Group 4091" transform="translate(32.87 17.699)">
                                        <path id="Path_8196" data-name="Path 8196" d="M30,18H40.114v2.528H30Z"
                                              transform="translate(-30 -18)" fill="#d2d2d2" />
                                        </g>
                                        <g id="Group_4092" data-name="Group 4092" transform="translate(42.984 57.721)">
                                        <path id="Path_8197" data-name="Path 8197"
                                              d="M38,55.148V49.657H48.114v5.491L43.057,60.2Z"
                                              transform="translate(-38 -49.657)" fill="#d2aa82" />
                                        </g>
                                        <g id="Group_4093" data-name="Group 4093" transform="translate(32.87 35.398)">
                                        <path id="Path_8198" data-name="Path 8198"
                                              d="M57.813,42.114H55.285V34.528A2.528,2.528,0,0,0,52.756,32H37.585a2.528,2.528,0,0,0-2.528,2.528v7.585H32.528A2.528,2.528,0,0,0,30,44.642v.966a2.528,2.528,0,0,0,1.4,2.262L35.057,49.7v.434a5.051,5.051,0,0,0,1.482,3.575L38.633,55.8a5.059,5.059,0,0,0,3.575,1.482h5.924A5.051,5.051,0,0,0,51.708,55.8L53.8,53.708a5.059,5.059,0,0,0,1.482-3.575V49.7l3.659-1.829a2.529,2.529,0,0,0,1.4-2.262v-.966a2.528,2.528,0,0,0-2.528-2.528Z"
                                              transform="translate(-30 -32)" fill="#f0c8a0" />
                                        </g>
                                        <g id="Group_4094" data-name="Group 4094" transform="translate(55.626 35.398)">
                                        <path id="Path_8199" data-name="Path 8199"
                                              d="M53.057,44.642A5.057,5.057,0,0,1,48,39.585V32h2.528a2.528,2.528,0,0,1,2.528,2.528Z"
                                              transform="translate(-48 -32)" fill="#dc9600" />
                                        </g>
                                        <g id="Group_4095" data-name="Group 4095" transform="translate(35.398 30.342)">
                                        <path id="Path_8200" data-name="Path 8200"
                                              d="M49.7,28H39.585A7.585,7.585,0,0,0,32,35.585v5.057a2.528,2.528,0,0,0,2.528,2.528h6.358a15.165,15.165,0,0,0,10.727-4.444l1.661-1.661a5.059,5.059,0,0,0,1.482-3.575v-.434A5.057,5.057,0,0,0,49.7,28Z"
                                              transform="translate(-32 -28)" fill="#fab400" />
                                        </g>
                                        <g id="Group_4096" data-name="Group 4096" transform="translate(39.823 47.409)">
                                        <path id="Path_8201" data-name="Path 8201"
                                              d="M41.189,42.764H36.132a.632.632,0,0,1,0-1.264h5.057a.632.632,0,0,1,0,1.264Z"
                                              transform="translate(-35.5 -41.5)" fill="#be7800" />
                                        </g>
                                        <g id="Group_4097" data-name="Group 4097" transform="translate(42.984 48.041)">
                                        <circle id="Ellipse_110" data-name="Ellipse 110" cx="1" cy="1" r="1"
                                                transform="translate(0.415 0.357)" fill="#be7800" />
                                        </g>
                                        <g id="Group_4098" data-name="Group 4098" transform="translate(49.937 47.409)">
                                        <path id="Path_8202" data-name="Path 8202"
                                              d="M49.189,42.764H44.132a.632.632,0,0,1,0-1.264h5.057a.632.632,0,1,1,0,1.264Z"
                                              transform="translate(-43.5 -41.5)" fill="#be7800" />
                                        </g>
                                        <g id="Group_4099" data-name="Group 4099" transform="translate(50.569 48.041)">
                                        <ellipse id="Ellipse_111" data-name="Ellipse 111" cx="1.5" cy="1" rx="1.5" ry="1"
                                                 transform="translate(-0.171 0.357)" fill="#be7800" />
                                        </g>
                                        <g id="Group_4100" data-name="Group 4100" transform="translate(44.88 53.515)">
                                        <path id="Path_8203" data-name="Path 8203"
                                              d="M42.661,49.072a3.153,3.153,0,0,1-2.235-.924l-.741-.74a.632.632,0,0,1,.894-.894l.741.74a1.9,1.9,0,0,0,2.681,0l.741-.74a.632.632,0,0,1,.894.894l-.741.74A3.15,3.15,0,0,1,42.661,49.072Z"
                                              transform="translate(-39.5 -46.33)" fill="#be7800" />
                                        </g>
                                        <g id="Group_4101" data-name="Group 4101" transform="translate(32.87 63.211)">
                                        <path id="Path_8204" data-name="Path 8204"
                                              d="M60.342,61.585v-1.4a2.528,2.528,0,0,0-1.4-2.262L50.228,54l-5.057,5.057L40.114,54,31.4,57.924A2.528,2.528,0,0,0,30,60.186v1.4Z"
                                              transform="translate(-30 -54)" fill="#fa6450" />
                                        </g>
                                        <g id="Group_4102" data-name="Group 4102" transform="translate(32.87 63.211)">
                                        <path id="Path_8205" data-name="Path 8205"
                                              d="M35.057,61.585v-1.4a2.528,2.528,0,0,1,1.4-2.262l5.229-2.354L40.114,54,31.4,57.924A2.528,2.528,0,0,0,30,60.186v1.4Z"
                                              transform="translate(-30 -54)" fill="#dc4632" />
                                        </g>
                                        <g id="Group_4103" data-name="Group 4103" transform="translate(42.984 63.211)">
                                        <path id="Path_8206" data-name="Path 8206"
                                              d="M38,54v7.585H48.114V54l-5.057,5.057Z" transform="translate(-38 -54)"
                                              fill="#f0f0f0" />
                                        </g>
                                        <g id="Group_4104" data-name="Group 4104" transform="translate(45.512 68.268)">
                                        <path id="Path_8207" data-name="Path 8207" d="M42.528,58,40,60.528h5.057Z"
                                              transform="translate(-40 -58)" fill="#505050" />
                                        </g>
                                        <g id="Group_4105" data-name="Group 4105" transform="translate(64.476 32.87)">
                                        <path id="Path_8208" data-name="Path 8208"
                                              d="M58.793,37.936V30H56.264v7.936a2.528,2.528,0,1,0,2.528,0Z"
                                              transform="translate(-55 -30)" fill="#fa6450" />
                                        </g>
                                        <g id="Group_4106" data-name="Group 4106" transform="translate(65.74 45.512)">
                                        <path id="Path_8209" data-name="Path 8209"
                                              d="M56,45.057h2.528V41.264a1.264,1.264,0,0,0-2.528,0Z"
                                              transform="translate(-56 -40)" fill="#fa6450" />
                                        </g>
                                        <g id="Group_4107" data-name="Group 4107" transform="translate(35.398 30.342)">
                                        <path id="Path_8210" data-name="Path 8210" d="M32,28H57.285V38.114H32Z"
                                              transform="translate(-32 -28)" fill="#505050" />
                                        </g>
                                        <g id="Group_4108" data-name="Group 4108" transform="translate(35.398 30.342)">
                                        <path id="Path_8211" data-name="Path 8211" d="M32,28h5.057V38.114H32Z"
                                              transform="translate(-32 -28)" fill="#3c3c3c" />
                                        </g>
                                        <g id="Group_4109" data-name="Group 4109" transform="translate(27.813 30.342)">
                                        <path id="Path_8212" data-name="Path 8212"
                                              d="M26,28v2.528l20.228,5.057,20.228-5.057V28Z" transform="translate(-26 -28)"
                                              fill="#3c3c3c" />
                                        </g>
                                        <g id="Group_4110" data-name="Group 4110" transform="translate(32.87 22.756)">
                                        <path id="Path_8213" data-name="Path 8213"
                                              d="M40.114,22H30v2.528h4.746l5.368-1.343Z" transform="translate(-30 -22)"
                                              fill="#d2d2d2" />
                                        </g>
                                        <g id="Group_4111" data-name="Group 4111" transform="translate(26.549 13.907)">
                                        <path id="Path_8214" data-name="Path 8214"
                                              d="M27.528,15l-1.264,1.264L25,15V29.144l2.528-.632Z"
                                              transform="translate(-25 -15)" fill="#d2d2d2" />
                                        </g>
                                        <g id="Group_4112" data-name="Group 4112" transform="translate(26.549 35.161)">
                                        <path id="Path_8215" data-name="Path 8215"
                                              d="M25,45.956l1.264,1.264,1.264-1.264V32.444L25,31.812Z"
                                              transform="translate(-25 -31.812)" fill="#d2d2d2" />
                                        </g>
                                        <g id="Group_4113" data-name="Group 4113" transform="translate(27.813 25.285)">
                                        <path id="Path_8216" data-name="Path 8216"
                                              d="M58.87,29.057A12.6,12.6,0,0,1,49.438,24.8l-3.21-.8L26,29.057l20.228,5.057,20.228-5.057-3.2-.8A12.554,12.554,0,0,1,58.87,29.057Z"
                                              transform="translate(-26 -24)" fill="#505050" />
                                        </g>
                                        <g id="Group_4114" data-name="Group 4114" transform="translate(50.569)">
                                        <path id="Path_8217" data-name="Path 8217"
                                              d="M56.642,11.917V9.057h2.528L54.114,4,49.057,9.057h2.528v2.86a10.114,10.114,0,1,0,5.057,0Z"
                                              transform="translate(-44 -4)" fill="#3cc8b4" />
                                        </g>
                                        <g id="Group_4115" data-name="Group 4115" transform="translate(50.569 5.057)">
                                        <path id="Path_8218" data-name="Path 8218"
                                              d="M46.528,20.642a10.109,10.109,0,0,1,7.585-9.783V8H51.585v2.86a10.1,10.1,0,0,0,3.793,19.809A10.11,10.11,0,0,1,46.528,20.642Z"
                                              transform="translate(-44 -8)" fill="#1eaa96" />
                                        </g>
                                        <g id="Group_4116" data-name="Group 4116" transform="translate(55.626)">
                                        <path id="Path_8219" data-name="Path 8219"
                                              d="M53.057,4,48,9.057h2.528l3.793-3.793Z" transform="translate(-48 -4)"
                                              fill="#1eaa96" />
                                        </g>
                                        <g id="Group_4117" data-name="Group 4117" transform="translate(54.362 12.642)">
                                        <path id="Path_8220" data-name="Path 8220"
                                              d="M59.642,16.528l-7.585,7.585L47,19.057l2.528-2.528,2.528,2.528L57.114,14Z"
                                              transform="translate(-47 -14)" fill="#f0f0f0" />
                                        </g>
                                        </g>
                                        </g>
                                        </svg>
                                    </div>
                                    <div class="topic-content">
                                        <h4><a href="faq-page.html">Mobile & Tab</a></h4>
                                        <p>Control and browse courses on
                                            mobile and tab device</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-4 col-md-6">
                            <div class="topic-wrapper text-center mb-30">
                                <div class="topic-items">
                                    <div class="topic-svg">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="70.788" height="70.796"
                                             viewBox="0 0 70.788 70.796">
                                        <g id="smartphone" transform="translate(0 0)">
                                        <path id="Path_8221" data-name="Path 8221"
                                              d="M47.611,10H14.425A4.425,4.425,0,0,0,10,14.425V73.606a4.425,4.425,0,0,0,4.425,4.425H47.611a4.425,4.425,0,0,0,4.425-4.425V14.425A4.425,4.425,0,0,0,47.611,10Zm0,0"
                                              transform="translate(-8.617 -8.617)" fill="#cff1fb" />
                                        <path id="Path_8222" data-name="Path 8222" d="M10,74H52.035v50.331H10Zm0,0"
                                              transform="translate(-8.617 -63.768)" fill="#fff" />
                                        <path id="Path_8223" data-name="Path 8223"
                                              d="M175.214,208.615a3.563,3.563,0,0,0,0,5.04l-2-2a3.564,3.564,0,1,0-5.04,5.041,3.564,3.564,0,0,0-5.041,5.04l-11.138-11.138a3.564,3.564,0,1,0-5.04,5.04l9.51,9.511L168.8,237.484l-8.03-1.948a3.741,3.741,0,0,0-2.114,7.168l13.2,4.6a17.519,17.519,0,0,0,18.156-28.93l-9.761-9.761a3.563,3.563,0,0,0-5.04,0Zm0,0"
                                              transform="translate(-125.732 -178.869)" fill="#ffd4be" />
                                        <path id="Path_8224" data-name="Path 8224"
                                              d="M153.116,460a1.384,1.384,0,1,0,.979.405A1.394,1.394,0,0,0,153.116,460Zm0,0"
                                              transform="translate(-130.754 -396.39)" />
                                        <path id="Path_8225" data-name="Path 8225"
                                              d="M65.26,38.528l-9.76-9.76a4.95,4.95,0,0,0-8.258,2.145,4.953,4.953,0,0,0-2.441-.55V5.808A5.814,5.814,0,0,0,38.993,0H5.807A5.814,5.814,0,0,0,0,5.808V29.176a1.382,1.382,0,1,0,2.765,0V11.615h39.27v19.7A4.918,4.918,0,0,0,40.014,35.4a4.941,4.941,0,0,0-4.779,3.347l-8-8a4.947,4.947,0,0,0-7,7L38.608,56.109l-3.243-.787a5.155,5.155,0,0,0-6.158,3.653c-.018.069-.034.137-.05.206H2.765V41.62A1.383,1.383,0,1,0,0,41.62V64.988A5.814,5.814,0,0,0,5.807,70.8H38.993a5.8,5.8,0,0,0,4.284-1.889l2.395.836A18.9,18.9,0,0,0,65.26,38.528ZM2.765,8.85V5.808A3.045,3.045,0,0,1,5.807,2.766H38.993a3.045,3.045,0,0,1,3.042,3.042V8.85ZM38.993,68.031H5.807a3.045,3.045,0,0,1-3.042-3.042V61.946H29.313a5.132,5.132,0,0,0,3.157,3.193l7.659,2.67a3.044,3.044,0,0,1-1.136.221ZM63.3,63.3a16.226,16.226,0,0,1-16.723,3.827l-13.2-4.6a2.358,2.358,0,0,1,.785-4.584,2.328,2.328,0,0,1,.548.066l8.03,1.949a1.383,1.383,0,0,0,1.3-2.321L22.2,35.787A2.181,2.181,0,1,1,25.281,32.7L36.419,43.839h0l6.847,6.847a1.383,1.383,0,1,0,1.955-1.955l-6.848-6.848h0A2.181,2.181,0,0,1,41.459,38.8l7.2,7.2a1.383,1.383,0,1,0,1.956-1.956l-7.2-7.2A2.181,2.181,0,1,1,46.5,33.76l2,2,5.266,5.265a1.383,1.383,0,0,0,1.955-1.955L50.46,33.808a2.181,2.181,0,1,1,3.084-3.085L63.3,40.484a16.154,16.154,0,0,1,0,22.82Zm0,0"
                                              transform="translate(0)" />
                                        <path id="Path_8226" data-name="Path 8226"
                                              d="M110.805,124.649a1.383,1.383,0,0,0,.978-2.36,14.508,14.508,0,0,0-20.494,0,1.383,1.383,0,0,0,1.956,1.955,11.739,11.739,0,0,1,16.583,0,1.378,1.378,0,0,0,.978.405Zm0,0"
                                              transform="translate(-78.317 -101.728)" />
                                        <path id="Path_8227" data-name="Path 8227"
                                              d="M124.338,167.112a1.383,1.383,0,0,0,1.956,1.956,5.267,5.267,0,0,1,7.442,0,1.383,1.383,0,0,0,1.956-1.956,8.038,8.038,0,0,0-11.354,0Zm0,0"
                                              transform="translate(-106.797 -141.982)" />
                                        <path id="Path_8228" data-name="Path 8228"
                                              d="M1.387,248.765A1.383,1.383,0,1,0,0,247.383a1.384,1.384,0,0,0,1.383,1.383Zm0,0"
                                              transform="translate(-0.003 -211.984)" />
                                        </g>
                                        </svg>
                                    </div>
                                    <div class="topic-content">
                                        <h4><a href="faq-page.html">Account / Profile</a></h4>
                                        <p>Manage your account and profile
                                            easily smoothly</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-4 col-md-6">
                            <div class="topic-wrapper text-center mb-30">
                                <div class="topic-items">
                                    <div class="topic-svg">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="70.795" height="70.797"
                                             viewBox="0 0 70.795 70.797">
                                        <g id="resume" transform="translate(-0.007)">
                                        <path id="Path_8229" data-name="Path 8229"
                                              d="M63.1,78.031H12.772a2.765,2.765,0,0,1-2.766-2.766v-62.5A2.765,2.765,0,0,1,12.772,10H63.1a2.765,2.765,0,0,1,2.766,2.766v62.5A2.765,2.765,0,0,1,63.1,78.031Z"
                                              transform="translate(-8.617 -8.617)" fill="#fff" />
                                        <circle id="Ellipse_112" data-name="Ellipse 112" cx="11.442" cy="11.442" r="11.442"
                                                transform="translate(17.885 8.581)" fill="#fe6663" />
                                        <path id="Path_8230" data-name="Path 8230"
                                              d="M193.2,113.1v.9a3.6,3.6,0,0,1-3.6,3.6h0a3.6,3.6,0,0,1-3.6-3.6v-.9a3.6,3.6,0,0,1,3.6-3.6h0A3.6,3.6,0,0,1,193.2,113.1Z"
                                              transform="translate(-160.281 -94.359)" fill="#ffcdac" />
                                        <path id="Path_8231" data-name="Path 8231"
                                              d="M163.9,168h0a8.3,8.3,0,0,0-7.72,5.259,11.33,11.33,0,0,0,15.44,0A8.3,8.3,0,0,0,163.9,168Z"
                                              transform="translate(-134.574 -144.77)" fill="#a5ddff" />
                                        <path id="Path_8232" data-name="Path 8232"
                                              d="M333.058,138.269l.79-1.368a4.425,4.425,0,0,1,6.044-1.62h0a4.425,4.425,0,0,1,1.62,6.044l-17.4,30.139-7.664-4.425,7.506-13Z"
                                              transform="translate(-272.684 -116.064)" fill="#ffbc53" />
                                        <path id="Path_8233" data-name="Path 8233"
                                              d="M435.531,135.281h0a4.425,4.425,0,0,0-6.044,1.62l-2.054,3.558,7.664,4.425,2.054-3.558A4.425,4.425,0,0,0,435.531,135.281Z"
                                              transform="translate(-368.323 -116.063)" fill="#fe6663" />
                                        <path id="Path_8234" data-name="Path 8234"
                                              d="M316.478,373.081l-8.889,6.547,1.225-10.971Z"
                                              transform="translate(-265.051 -317.68)" fill="#9ad8ff" />
                                        <path id="Path_8235" data-name="Path 8235"
                                              d="M57.253,55.079a1.383,1.383,0,0,0-1.383,1.383V66.649a1.384,1.384,0,0,1-1.383,1.383H4.155a1.384,1.384,0,0,1-1.383-1.383V4.148A1.384,1.384,0,0,1,4.155,2.766H54.487A1.384,1.384,0,0,1,55.87,4.148V19.186a1.383,1.383,0,0,0,2.766,0V4.148A4.153,4.153,0,0,0,54.487,0H4.155A4.153,4.153,0,0,0,.007,4.148v62.5A4.153,4.153,0,0,0,4.155,70.8H54.487a4.153,4.153,0,0,0,4.148-4.148V56.462A1.383,1.383,0,0,0,57.253,55.079Z" />
                                        <path id="Path_8236" data-name="Path 8236"
                                              d="M145.45,66.721A12.721,12.721,0,1,0,124,75.968a1.367,1.367,0,0,0,.148.138,12.7,12.7,0,0,0,17.158,0,1.382,1.382,0,0,0,.149-.138A12.686,12.686,0,0,0,145.45,66.721Zm-12.721-9.956a9.95,9.95,0,0,1,8.012,15.858,9.593,9.593,0,0,0-4.074-3.415,4.952,4.952,0,0,0,1.04-3.04v-.9a4.978,4.978,0,0,0-9.956,0v.9a4.952,4.952,0,0,0,1.04,3.04,9.593,9.593,0,0,0-4.074,3.415,9.95,9.95,0,0,1,8.012-15.858Zm-2.212,9.4v-.9a2.212,2.212,0,0,1,4.425,0v.9a2.212,2.212,0,0,1-4.425,0Zm-3.8,8.481a6.914,6.914,0,0,1,12.027,0,9.93,9.93,0,0,1-12.027,0Z"
                                              transform="translate(-103.407 -46.533)" />
                                        <path id="Path_8237" data-name="Path 8237"
                                              d="M210.857,438H203.39a1.383,1.383,0,1,0,0,2.766h7.467a1.383,1.383,0,0,0,0-2.766Z"
                                              transform="translate(-174.068 -377.435)" />
                                        <path id="Path_8238" data-name="Path 8238"
                                              d="M135.025,382H115.39a1.383,1.383,0,0,0,0,2.766h19.635a1.383,1.383,0,0,0,0-2.766Z"
                                              transform="translate(-98.237 -329.179)" />
                                        <path id="Path_8239" data-name="Path 8239"
                                              d="M135.025,326H115.39a1.383,1.383,0,0,0,0,2.766h19.635a1.383,1.383,0,0,0,0-2.766Z"
                                              transform="translate(-98.237 -280.922)" />
                                        <path id="Path_8240" data-name="Path 8240"
                                              d="M73.649,270.405a1.382,1.382,0,1,0,.405.978A1.394,1.394,0,0,0,73.649,270.405Z"
                                              transform="translate(-61.424 -232.666)" />
                                        <path id="Path_8241" data-name="Path 8241"
                                              d="M73.649,326.405a1.382,1.382,0,1,0,.405.978A1.4,1.4,0,0,0,73.649,326.405Z"
                                              transform="translate(-61.424 -280.922)" />
                                        <path id="Path_8242" data-name="Path 8242"
                                              d="M72.67,382a1.383,1.383,0,1,0,.979.405A1.4,1.4,0,0,0,72.67,382Z"
                                              transform="translate(-61.424 -329.179)" />
                                        <path id="Path_8243" data-name="Path 8243"
                                              d="M135.025,270H115.39a1.383,1.383,0,0,0,0,2.766h19.635a1.383,1.383,0,0,0,0-2.766Z"
                                              transform="translate(-98.237 -232.666)" />
                                        <path id="Path_8244" data-name="Path 8244"
                                              d="M324.333,125.456a5.807,5.807,0,0,0-7.933,2.126L299,157.72a1.385,1.385,0,0,0-.177.538L297.6,169.23a1.383,1.383,0,0,0,2.194,1.267l8.889-6.546a1.381,1.381,0,0,0,.378-.422l17.4-30.139A5.814,5.814,0,0,0,324.333,125.456Zm-23,35.211,4,2.311L300.7,166.4Zm6.018.281-5.269-3.042,13.964-24.186,5.269,3.042Zm16.709-28.941-1.363,2.361-5.269-3.042,1.363-2.361a3.042,3.042,0,0,1,5.269,3.042Z"
                                              transform="translate(-256.434 -107.436)" />
                                        </g>
                                        </svg>

                                    </div>
                                    <div class="topic-content">
                                        <h4><a href="faq-page.html">Troubleshooting</a></h4>
                                        <p>If you experiencing the technical
                                            browsing issue </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-4 col-md-6">
                            <div class="topic-wrapper text-center mb-30">
                                <div class="topic-items">
                                    <div class="topic-svg">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="70.152" height="70.797"
                                             viewBox="0 0 70.152 70.797">
                                        <g id="engineer" transform="translate(-7.82 -6.715)">
                                        <g id="Group_4168" data-name="Group 4168" transform="translate(10.09 12.337)">
                                        <circle id="Ellipse_113" data-name="Ellipse 113" cx="2.656" cy="2.656" r="2.656"
                                                transform="translate(31.36 13.304)" fill="#f8af23" />
                                        <circle id="Ellipse_114" data-name="Ellipse 114" cx="2.656" cy="2.656" r="2.656"
                                                transform="translate(12.973 13.304)" fill="#f87023" />
                                        <path id="Path_8310" data-name="Path 8310"
                                              d="M71.736,150.783H31.193V137.359a14.884,14.884,0,0,1,14.884-14.884H56.852a14.884,14.884,0,0,1,14.884,14.884v13.424Z"
                                              transform="translate(-26.641 -94.312)" fill="#63bce7" />
                                        <g id="Group_4162" data-name="Group 4162" transform="translate(4.552 28.164)">
                                        <path id="Path_8311" data-name="Path 8311"
                                              d="M50.357,122.476h-4.28A14.884,14.884,0,0,0,31.193,137.36v13.423h4.281V137.36a14.884,14.884,0,0,1,14.884-14.884Z"
                                              transform="translate(-31.193 -122.476)" fill="#6377e7" />
                                        </g>
                                        <path id="Path_8312" data-name="Path 8312"
                                              d="M91.088,104.9a3.94,3.94,0,0,1-3.94-3.94v-3.21a3.94,3.94,0,1,1,7.88,0v3.21A3.94,3.94,0,0,1,91.088,104.9Z"
                                              transform="translate(-66.265 -74.014)" fill="#f8af23" />
                                        <path id="Path_8313" data-name="Path 8313"
                                              d="M87.148,98.394v3.21a3.938,3.938,0,0,0,2.53,3.675V94.719A3.938,3.938,0,0,0,87.148,98.394Z"
                                              transform="translate(-66.265 -74.656)" fill="#f87023" />
                                        <path id="Path_8314" data-name="Path 8314" d="M27.1,142.312h42.93v24.463H27.1Z"
                                              transform="translate(-23.745 -108.359)" fill="#cecece" />
                                        <g id="Group_4163" data-name="Group 4163" transform="translate(3.358 33.953)">
                                        <path id="Path_8315" data-name="Path 8315" d="M27.1,142.312h4.281v24.463H27.1Z"
                                              transform="translate(-27.103 -142.312)" fill="#afafaf" />
                                        </g>
                                        <path id="Path_8316" data-name="Path 8316"
                                              d="M60.874,229.247H19.969a4,4,0,0,1-3.174-1.563l-1.2-1.555H65.245l-1.2,1.555a4.005,4.005,0,0,1-3.174,1.563Z"
                                              transform="translate(-15.599 -167.713)" fill="#cecece" />
                                        <g id="Group_4164" data-name="Group 4164" transform="translate(0 58.416)">
                                        <path id="Path_8317" data-name="Path 8317"
                                              d="M21.075,227.684l-1.2-1.555H15.6l1.2,1.555a4,4,0,0,0,3.174,1.563h4.281A4.005,4.005,0,0,1,21.075,227.684Z"
                                              transform="translate(-15.598 -226.129)" fill="#afafaf" />
                                        </g>
                                        <circle id="Ellipse_115" data-name="Ellipse 115" cx="2.279" cy="2.279" r="2.279"
                                                transform="translate(22.544 43.786)" fill="#afafaf" />
                                        <path id="Path_8318" data-name="Path 8318"
                                              d="M78.342,59.869a9.194,9.194,0,0,1-9.194-9.194v-4.67a9.194,9.194,0,0,1,18.387,0v4.67a9.194,9.194,0,0,1-9.194,9.194Z"
                                              transform="translate(-53.519 -33.65)" fill="#f8af23" />
                                        <g id="Group_4165" data-name="Group 4165" transform="translate(15.629 3.162)">
                                        <path id="Path_8319" data-name="Path 8319"
                                              d="M73.429,50.675v-4.67a9.2,9.2,0,0,1,7.053-8.941,9.192,9.192,0,0,0-11.334,8.941v4.67a9.192,9.192,0,0,0,11.334,8.941A9.2,9.2,0,0,1,73.429,50.675Z"
                                              transform="translate(-69.149 -36.812)" fill="#f87023" />
                                        </g>
                                        <path id="Path_8320" data-name="Path 8320"
                                              d="M69.148,40.669h1.386l2.517-3.94,14.484,2.882V35.173a9.194,9.194,0,0,0-18.387,0Z"
                                              transform="translate(-53.519 -25.979)" fill="#707070" />
                                        <g id="Group_4166" data-name="Group 4166" transform="translate(15.629 0)">
                                        <path id="Path_8321" data-name="Path 8321"
                                              d="M80.483,26.232a9.192,9.192,0,0,0-11.334,8.941v5.5h1.386l2.517-3.94.377.075V35.173A9.2,9.2,0,0,1,80.483,26.232Z"
                                              transform="translate(-69.149 -25.979)" fill="#5b5b5b" />
                                        </g>
                                        <g id="Group_4167" data-name="Group 4167" transform="translate(20.196 16.555)">
                                        <circle id="Ellipse_116" data-name="Ellipse 116" cx="0.906" cy="0.906" r="0.906"
                                                fill="#3f3679" />
                                        <circle id="Ellipse_117" data-name="Ellipse 117" cx="0.906" cy="0.906" r="0.906"
                                                transform="translate(7.442)" fill="#3f3679" />
                                        </g>
                                        </g>
                                        <path id="Path_8322" data-name="Path 8322"
                                              d="M173.39,53.955h-23.17a1.845,1.845,0,0,1-1.845-1.845V32.791a1.845,1.845,0,0,1,1.845-1.845h23.17a1.845,1.845,0,0,1,1.845,1.845v19.32A1.845,1.845,0,0,1,173.39,53.955Z"
                                              transform="translate(-99.533 -17.159)" fill="#cecece" />
                                        <g id="Group_4169" data-name="Group 4169" transform="translate(69.576 13.787)">
                                        <path id="Path_8323" data-name="Path 8323"
                                              d="M223.7,30.946h-4.281a1.845,1.845,0,0,1,1.845,1.845v19.32a1.845,1.845,0,0,1-1.845,1.845H223.7a1.845,1.845,0,0,0,1.845-1.845V32.791A1.845,1.845,0,0,0,223.7,30.946Z"
                                              transform="translate(-219.415 -30.946)" fill="#e2e2e2" />
                                        </g>
                                        <path id="Path_8324" data-name="Path 8324"
                                              d="M175.235,32.789a1.843,1.843,0,0,0-1.843-1.843H150.22a1.843,1.843,0,0,0-1.843,1.843V36h26.859V32.789Z"
                                              transform="translate(-99.534 -17.159)" fill="#f8af23" />
                                        <g id="Group_4170" data-name="Group 4170" transform="translate(69.577 13.787)">
                                        <path id="Path_8325" data-name="Path 8325"
                                              d="M223.7,30.946h-4.281a1.843,1.843,0,0,1,1.843,1.843V36h4.281V32.789A1.843,1.843,0,0,0,223.7,30.946Z"
                                              transform="translate(-219.419 -30.946)" fill="#f8d323" />
                                        </g>
                                        <g id="Group_4172" data-name="Group 4172" transform="translate(51.291 15.471)">
                                        <g id="Group_4171" data-name="Group 4171">
                                        <circle id="Ellipse_118" data-name="Ellipse 118" cx="0.842" cy="0.842" r="0.842"
                                                fill="#f46275" />
                                        <circle id="Ellipse_119" data-name="Ellipse 119" cx="0.842" cy="0.842" r="0.842"
                                                transform="translate(3.242)" fill="#f46275" />
                                        <circle id="Ellipse_120" data-name="Ellipse 120" cx="0.842" cy="0.842" r="0.842"
                                                transform="translate(6.485)" fill="#f46275" />
                                        </g>
                                        <path id="Path_8326" data-name="Path 8326"
                                              d="M202.536,38.873H191.642a.522.522,0,0,1-.52-.52v-.242a.522.522,0,0,1,.52-.52h10.894a.522.522,0,0,1,.52.52v.242A.522.522,0,0,1,202.536,38.873Z"
                                              transform="translate(-181.095 -37.335)" fill="#f46275" />
                                        </g>
                                        <path id="Path_8327" data-name="Path 8327"
                                              d="M80.974,63.962H58.715a1.566,1.566,0,1,1,0-3.132h22.26a1.566,1.566,0,1,1,0,3.132Z"
                                              transform="translate(-34.932 -38.321)" fill="#f46275" />
                                        <g id="Group_4173" data-name="Group 4173" transform="translate(22.217 22.509)">
                                        <path id="Path_8328" data-name="Path 8328"
                                              d="M61.429,62.4A1.566,1.566,0,0,1,63,60.83h-4.28a1.566,1.566,0,1,0,0,3.132H63A1.566,1.566,0,0,1,61.429,62.4Z"
                                              transform="translate(-57.149 -60.83)" fill="#f43075" />
                                        </g>
                                        <path id="Path_8329" data-name="Path 8329"
                                              d="M74.986,13.632A10.576,10.576,0,0,0,64.41,24.208v3.2H85.563v-3.2A10.576,10.576,0,0,0,74.986,13.632Z"
                                              transform="translate(-40.074 -4.898)" fill="#f46275" />
                                        <g id="Group_4174" data-name="Group 4174" transform="translate(24.337 8.734)">
                                        <path id="Path_8330" data-name="Path 8330"
                                              d="M77.128,13.849a10.585,10.585,0,0,0-12.717,10.36v3.2h4.281v-3.2A10.579,10.579,0,0,1,77.128,13.849Z"
                                              transform="translate(-64.411 -13.632)" fill="#f43075" />
                                        </g>
                                        <path id="Path_8331" data-name="Path 8331"
                                              d="M97.214,18.071H92.4V10.623a2.408,2.408,0,0,1,4.816,0Z"
                                              transform="translate(-59.893 -1.062)" fill="#63bce7" />
                                        <g id="Group_4179" data-name="Group 4179" transform="translate(7.82 6.715)">
                                        <circle id="Ellipse_121" data-name="Ellipse 121" cx="9.089" cy="9.089" r="9.089"
                                                transform="translate(45.362 15.794)" fill="#63bce7" />
                                        <g id="Group_4178" data-name="Group 4178" transform="translate(0 0)">
                                        <g id="Group_4175" data-name="Group 4175">
                                        <path id="Path_8332" data-name="Path 8332"
                                              d="M13.512,246.285H8.258a.438.438,0,1,0,0,.876h5.254a.438.438,0,1,0,0-.876Z"
                                              transform="translate(-7.82 -176.364)" fill="#3f3679" />
                                        <path id="Path_8333" data-name="Path 8333"
                                              d="M232.869,246.285h-5.254a.438.438,0,1,0,0,.876h5.254a.438.438,0,1,0,0-.876Z"
                                              transform="translate(-163.155 -176.364)" fill="#3f3679" />
                                        <path id="Path_8334" data-name="Path 8334"
                                              d="M89.273,246.285H36.459a.438.438,0,1,0,0,.876H89.274a.438.438,0,1,0,0-.876Z"
                                              transform="translate(-27.79 -176.364)" fill="#3f3679" />
                                        <path id="Path_8335" data-name="Path 8335"
                                              d="M77.534,74.309a.438.438,0,0,0,0-.876H58a4.4,4.4,0,0,0,.888-.858l1.2-1.555a.438.438,0,0,0-.347-.7h-2.92V58.96h5.456a.438.438,0,0,0,.438-.438V41.115a9.522,9.522,0,0,0,7.238-3.88h3.909a2.285,2.285,0,0,0,2.282-2.282V15.632h0a2.283,2.283,0,0,0-2.281-2.281H50.686a2.283,2.283,0,0,0-2.281,2.281h0v19.32a2.285,2.285,0,0,0,2.282,2.282H54.6a9.521,9.521,0,0,0,7.238,3.88v16.97H56.816V46.29a.438.438,0,0,0-.438-.438H52.295l-.009-.014A15.255,15.255,0,0,0,40.3,40.063H39.218a4.377,4.377,0,0,0,.073-.778V37.937A9.662,9.662,0,0,0,44.33,31.38a3.094,3.094,0,0,0,1.925-5.313,2,2,0,0,0-.212-4h-.116V19.31A10.981,10.981,0,0,0,37.6,8.627a2.841,2.841,0,0,0-5.37,0A10.982,10.982,0,0,0,23.9,19.31v2.761h-.116a2,2,0,0,0-.207,4,3.09,3.09,0,0,0,1.92,5.312,9.665,9.665,0,0,0,5.039,6.557v1.349a4.377,4.377,0,0,0,.073.778H29.526a15.239,15.239,0,0,0-11.993,5.789H13.448a.438.438,0,0,0-.438.438V70.316H10.09a.438.438,0,0,0-.347.7l1.2,1.555a4.4,4.4,0,0,0,.888.858H8.258a.438.438,0,1,0,0,.876H77.534ZM73.857,14.225a1.408,1.408,0,0,1,1.407,1.406V18.4H49.281V15.631a1.408,1.408,0,0,1,1.407-1.406ZM50.687,36.358a1.408,1.408,0,0,1-1.407-1.407V19.276H75.264V34.952a1.408,1.408,0,0,1-1.407,1.407H70.519a9.527,9.527,0,1,0-16.495,0Zm2.933-4.76a8.652,8.652,0,1,1,8.652,8.652A8.662,8.662,0,0,1,53.621,31.6Zm-9.143-1.116a9.66,9.66,0,0,0,.067-1.12V26.122a2.218,2.218,0,0,1-.067,4.361ZM32.943,9.561a1.97,1.97,0,1,1,3.94,0v7.011h-3.94ZM24.775,19.31a10.109,10.109,0,0,1,7.293-9.734v7.433a.438.438,0,0,0,.438.438h4.816a.438.438,0,0,0,.438-.438V9.576a10.107,10.107,0,0,1,7.293,9.734v2.761H24.775Zm-2.12,4.765a1.129,1.129,0,0,1,1.128-1.128h22.26a1.128,1.128,0,1,1,0,2.256H23.783a1.13,1.13,0,0,1-1.129-1.128Zm3.5,2h1.035l-.326.511h-.709ZM23.5,28.3a2.221,2.221,0,0,1,1.781-2.173v3.238a9.721,9.721,0,0,0,.067,1.12A2.22,2.22,0,0,1,23.5,28.3Zm2.656,1.065v-1.9h.949a.438.438,0,0,0,.369-.2l.757-1.184H42.46a.434.434,0,0,0,.086.026l1.123.224v3.034a8.756,8.756,0,0,1-17.512,0Zm8.756,9.631a9.575,9.575,0,0,0,3.5-.662v.954a3.5,3.5,0,1,1-7,0v-.954A9.577,9.577,0,0,0,34.913,38.994Zm-5.387,1.945h1.336a4.374,4.374,0,0,0,8.1,0H40.3a14.373,14.373,0,0,1,10.851,4.914H18.671A14.361,14.361,0,0,1,29.525,40.939Zm-15.64,5.789H55.94V70.316H13.886Zm.575,26.705a3.589,3.589,0,0,1-2.827-1.392l-.654-.85H58.847l-.654.85a3.589,3.589,0,0,1-2.827,1.392Z"
                                              transform="translate(-7.82 -6.715)" fill="#3f3679" />
                                        <path id="Path_8336" data-name="Path 8336"
                                              d="M94.057,174.5a2.716,2.716,0,1,0,2.716,2.716A2.719,2.719,0,0,0,94.057,174.5Zm0,4.557a1.841,1.841,0,1,1,1.841-1.841A1.843,1.843,0,0,1,94.057,179.06Z"
                                              transform="translate(-66.964 -125.532)" fill="#3f3679" />
                                        <path id="Path_8337" data-name="Path 8337"
                                              d="M99.586,90.589a.438.438,0,0,0,.438-.438V88.634a.438.438,0,1,0-.876,0v1.517A.438.438,0,0,0,99.586,90.589Z"
                                              transform="translate(-72.493 -64.415)" fill="#3f3679" />
                                        <path id="Path_8338" data-name="Path 8338"
                                              d="M97.936,100.82a.438.438,0,1,0-.658-.577,1.4,1.4,0,0,1-2.117,0,.438.438,0,1,0-.658.577,2.279,2.279,0,0,0,3.433,0Z"
                                              transform="translate(-69.126 -72.84)" fill="#3f3679" />
                                        <path id="Path_8339" data-name="Path 8339"
                                              d="M85.007,78.1H82.439a.438.438,0,0,0,0,.876h2.568a.438.438,0,0,0,0-.876Z"
                                              transform="translate(-60.35 -57.266)" fill="#3f3679" />
                                        <path id="Path_8340" data-name="Path 8340"
                                              d="M107.936,78.977H110.5a.438.438,0,1,0,0-.876h-2.568a.438.438,0,0,0,0,.876Z"
                                              transform="translate(-78.406 -57.266)" fill="#3f3679" />
                                        <path id="Path_8341" data-name="Path 8341"
                                              d="M156.545,37.773a1.28,1.28,0,1,0-1.28-1.28A1.281,1.281,0,0,0,156.545,37.773Zm0-1.683a.4.4,0,1,1-.4.4A.4.4,0,0,1,156.545,36.09Z"
                                              transform="translate(-112.232 -26.896)" fill="#3f3679" />
                                        <path id="Path_8342" data-name="Path 8342"
                                              d="M167.654,37.773a1.28,1.28,0,1,0-1.28-1.28A1.281,1.281,0,0,0,167.654,37.773Zm0-1.683a.4.4,0,1,1-.4.4A.4.4,0,0,1,167.654,36.09Z"
                                              transform="translate(-120.098 -26.896)" fill="#3f3679" />
                                        <path id="Path_8343" data-name="Path 8343"
                                              d="M178.764,37.773a1.28,1.28,0,1,0-1.28-1.28A1.281,1.281,0,0,0,178.764,37.773Zm0-1.683a.4.4,0,1,1-.4.4A.4.4,0,0,1,178.764,36.09Z"
                                              transform="translate(-127.966 -26.896)" fill="#3f3679" />
                                        <path id="Path_8344" data-name="Path 8344"
                                              d="M190.58,38.248h10.894a.959.959,0,0,0,.958-.958v-.242a.959.959,0,0,0-.958-.958H190.58a.959.959,0,0,0-.958.958v.242A.959.959,0,0,0,190.58,38.248Zm-.083-1.2a.085.085,0,0,1,.083-.083h10.894a.085.085,0,0,1,.083.083v.242a.085.085,0,0,1-.083.083H190.58a.085.085,0,0,1-.083-.083Z"
                                              transform="translate(-136.561 -27.517)" fill="#3f3679" />
                                        </g>
                                        <g id="Group_4177" data-name="Group 4177" transform="translate(47.648 20.634)">
                                        <path id="Path_8345" data-name="Path 8345"
                                              d="M190.666,77.475a.938.938,0,0,0-1.208.548l-2.49,6.621a.938.938,0,1,0,1.756.66l2.49-6.621A.938.938,0,0,0,190.666,77.475Z"
                                              transform="translate(-182.287 -77.414)" fill="#3f3679" />
                                        <g id="Group_4176" data-name="Group 4176" transform="translate(0 1.44)">
                                        <path id="Path_8346" data-name="Path 8346"
                                              d="M174.548,82.621a.938.938,0,0,0-1.327,0l-1.871,1.871a.938.938,0,0,0,0,1.327l1.871,1.871a.938.938,0,1,0,1.327-1.327l-1.208-1.208,1.208-1.208a.938.938,0,0,0,0-1.326Z"
                                              transform="translate(-171.076 -82.347)" fill="#3f3679" />
                                        <path id="Path_8347" data-name="Path 8347"
                                              d="M208.334,84.493l-1.871-1.871a.938.938,0,0,0-1.327,1.327l1.208,1.208-1.208,1.208a.938.938,0,0,0,1.327,1.327l1.871-1.871a.939.939,0,0,0,0-1.327Z"
                                              transform="translate(-195.001 -82.347)" fill="#3f3679" />
                                        </g>
                                        </g>
                                        </g>
                                        </g>
                                        </g>
                                        </svg>

                                    </div>
                                    <div class="topic-content">
                                        <h4><a href="faq-page.html">Getting Started</a></h4>
                                        <p>Learn how Eduman works and
                                            how to start learning.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-4 col-md-6">
                            <div class="topic-wrapper text-center mb-30">
                                <div class="topic-items">
                                    <div class="topic-svg">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="62.747" height="70.797"
                                             viewBox="0 0 62.747 70.797">
                                        <g id="location-mark" transform="translate(-3.5 0.1)">
                                        <g id="Group_4184" data-name="Group 4184" transform="translate(21.696 54.707)">
                                        <g id="Group_4180" data-name="Group 4180" transform="translate(4.301 1.213)">
                                        <path id="Path_8348" data-name="Path 8348" d="M23.9,50.7H41.875V64.264H23.9Z"
                                              transform="translate(-23.9 -50.7)" fill="#c9d8ef" />
                                        </g>
                                        <g id="Group_4181" data-name="Group 4181" transform="translate(4.301 1.213)">
                                        <path id="Path_8349" data-name="Path 8349"
                                              d="M41.765,50.7V64.264H23.9v-2.1h5.955a9.836,9.836,0,0,0,9.815-9.815V50.81Z"
                                              transform="translate(-23.9 -50.7)" fill="#b2cbea" />
                                        </g>
                                        <g id="Group_4182" data-name="Group 4182" transform="translate(3.088)">
                                        <path id="Path_8350" data-name="Path 8350"
                                              d="M41.988,65.59H24.013A1.224,1.224,0,0,1,22.8,64.377V50.813A1.224,1.224,0,0,1,24.013,49.6H41.988A1.224,1.224,0,0,1,43.2,50.813V64.377A1.224,1.224,0,0,1,41.988,65.59ZM25.226,63.164H40.885V52.026H25.226Z"
                                              transform="translate(-22.8 -49.6)" fill="#2b3c65" />
                                        </g>
                                        <g id="Group_4183" data-name="Group 4183" transform="translate(0 13.564)">
                                        <path id="Path_8351" data-name="Path 8351"
                                              d="M45.253,64.326H21.213a1.213,1.213,0,1,1,0-2.426h24.04a1.213,1.213,0,0,1,0,2.426Z"
                                              transform="translate(-20 -61.9)" fill="#2b3c65" />
                                        </g>
                                        </g>
                                        <g id="Group_4185" data-name="Group 4185" transform="translate(4.713 17.434)">
                                        <path id="Path_8352" data-name="Path 8352"
                                              d="M60.4,59.139H9.232A4.66,4.66,0,0,1,4.6,54.507V20.432A4.66,4.66,0,0,1,9.232,15.8H60.289a4.66,4.66,0,0,1,4.632,4.632V54.507A4.5,4.5,0,0,1,60.4,59.139Z"
                                              transform="translate(-4.6 -15.8)" fill="#c9d8ef" />
                                        </g>
                                        <g id="Group_4186" data-name="Group 4186" transform="translate(3.5 16.221)">
                                        <path id="Path_8353" data-name="Path 8353"
                                              d="M60.4,60.465H9.345A5.883,5.883,0,0,1,3.5,54.62V20.545A5.883,5.883,0,0,1,9.345,14.7h5.073a1.213,1.213,0,1,1,0,2.426H9.345a3.436,3.436,0,0,0-3.419,3.419V54.62a3.436,3.436,0,0,0,3.419,3.419H60.4a3.436,3.436,0,0,0,3.419-3.419V20.545A3.436,3.436,0,0,0,60.4,17.126H55.33a1.213,1.213,0,0,1,0-2.426H60.4a5.883,5.883,0,0,1,5.845,5.845V54.62A5.883,5.883,0,0,1,60.4,60.465Z"
                                              transform="translate(-3.5 -14.7)" fill="#2b3c65" />
                                        </g>
                                        <g id="Group_4187" data-name="Group 4187" transform="translate(10.558 23.168)">
                                        <path id="Path_8354" data-name="Path 8354" d="M9.9,21H58.642V49.231H9.9Z"
                                              transform="translate(-9.9 -21)" fill="#45c8f5" />
                                        </g>
                                        <g id="Group_4188" data-name="Group 4188" transform="translate(9.345 21.955)">
                                        <path id="Path_8355" data-name="Path 8355"
                                              d="M58.755,50.667H10.013A1.224,1.224,0,0,1,8.8,49.454V21.113A1.224,1.224,0,0,1,10.013,19.9H15.2a1.213,1.213,0,1,1,0,2.426h-3.97V48.351H57.542V22.326h-3.97a1.213,1.213,0,0,1,0-2.426h5.183a1.224,1.224,0,0,1,1.213,1.213V49.454a1.224,1.224,0,0,1-1.213,1.213Z"
                                              transform="translate(-8.8 -19.9)" fill="#2b3c65" />
                                        </g>
                                        <g id="Group_4189" data-name="Group 4189" transform="translate(18.939 1.113)">
                                        <path id="Path_8356" data-name="Path 8356"
                                              d="M49.26,16.769c0,6.947-9.925,21.394-14.115,27.128a2.166,2.166,0,0,1-3.529,0C27.535,38.163,17.5,23.717,17.5,16.769A16.1,16.1,0,0,1,33.49,1,15.766,15.766,0,0,1,49.26,16.769Z"
                                              transform="translate(-17.5 -1)" fill="#62c3a6" />
                                        </g>
                                        <g id="Group_4190" data-name="Group 4190" transform="translate(25.004 2.657)">
                                        <path id="Path_8357" data-name="Path 8357"
                                              d="M39.762,2.4V14.53A16.755,16.755,0,0,1,23,31.292c2.867,4.962,6.286,9.7,8.271,12.461a2.166,2.166,0,0,0,3.529,0c4.08-5.734,14.115-20.181,14.115-27.128A16.329,16.329,0,0,0,39.762,2.4Z"
                                              transform="translate(-23 -2.4)" fill="#4fbd96" />
                                        </g>
                                        <g id="Group_4191" data-name="Group 4191" transform="translate(17.836 -0.1)">
                                        <path id="Path_8358" data-name="Path 8358"
                                              d="M33.483,46.106a3.1,3.1,0,0,1-2.647-1.434C21.352,31.329,16.5,21.955,16.5,16.883A17.3,17.3,0,0,1,33.593-.1,16.99,16.99,0,0,1,50.575,16.883c0,7.389-10.035,21.945-14.336,27.79A3.448,3.448,0,0,1,33.483,46.106Zm.11-43.78A14.973,14.973,0,0,0,18.816,16.993c0,3.088,2.426,10.256,13.895,26.466a1.033,1.033,0,0,0,1.654,0C41.092,34.306,48.26,22.507,48.26,16.993A14.731,14.731,0,0,0,33.593,2.326Z"
                                              transform="translate(-16.5 0.1)" fill="#2b3c65" />
                                        </g>
                                        <g id="Group_4192" data-name="Group 4192" transform="translate(23.129 5.083)">
                                        <circle id="Ellipse_122" data-name="Ellipse 122" cx="10.587" cy="10.587" r="10.587"
                                                transform="translate(1.213 1.213)" fill="#fff" />
                                        <path id="Path_8359" data-name="Path 8359"
                                              d="M33.1,28.2A11.8,11.8,0,1,1,44.9,16.4,11.813,11.813,0,0,1,33.1,28.2Zm0-21.173A9.373,9.373,0,1,0,42.473,16.4,9.366,9.366,0,0,0,33.1,7.026Z"
                                              transform="translate(-21.3 -4.6)" fill="#2b3c65" />
                                        </g>
                                        </g>
                                        </svg>

                                    </div>
                                    <div class="topic-content">
                                        <h4><a href="faq-page.html">Course Tracking</a></h4>
                                        <p>Track your course and manage
                                            easily at anywhere</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-4 col-md-6">
                            <div class="topic-wrapper text-center mb-30">
                                <div class="topic-items">
                                    <div class="topic-svg">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="70.797" height="70.797"
                                             viewBox="0 0 70.797 70.797">
                                        <g id="Group_4196" data-name="Group 4196" transform="translate(-954 -1965)">
                                        <rect id="Rectangle_577" data-name="Rectangle 577" width="52" height="38" rx="2"
                                              transform="translate(955 1996.398)" fill="#f1f5fe" />
                                        <g id="ecommerce" transform="translate(954 1965)">
                                        <g id="Group_4193" data-name="Group 4193" transform="translate(34.257 15.986)">
                                        <path id="Path_8360" data-name="Path 8360" d="M30,14h9.135V24.277H30Z"
                                              transform="translate(-30 -14)" fill="#ffb013" />
                                        </g>
                                        <g id="Group_4194" data-name="Group 4194" transform="translate(45.675 13.703)">
                                        <path id="Path_8361" data-name="Path 8361"
                                              d="M63.588,27.986h1.534V21.135H63.588a1.142,1.142,0,0,1-.808-1.949L63.864,18.1,59.02,13.257l-1.085,1.085a1.142,1.142,0,0,1-1.949-.808V12H49.135v1.534a1.142,1.142,0,0,1-1.949.808L46.1,13.257,41.257,18.1l1.085,1.085a1.142,1.142,0,0,1-.808,1.949H40v6.851h1.534a1.142,1.142,0,0,1,.808,1.949L41.257,31.02,46.1,35.864l1.085-1.085a1.142,1.142,0,0,1,1.949.808v1.534h6.851V35.588a1.142,1.142,0,0,1,1.949-.808l1.085,1.085,4.844-4.844-1.085-1.085a1.142,1.142,0,0,1,.808-1.949ZM52.561,29.128a4.568,4.568,0,1,1,4.568-4.568A4.568,4.568,0,0,1,52.561,29.128Z"
                                              transform="translate(-40 -12)" fill="#ffb013" />
                                        </g>
                                        <g id="Group_4195" data-name="Group 4195" transform="translate(0 0)">
                                        <path id="Path_8362" data-name="Path 8362"
                                              d="M38,55.426A3.426,3.426,0,1,0,41.426,52,3.43,3.43,0,0,0,38,55.426Zm4.568,0a1.142,1.142,0,1,1-1.142-1.142A1.142,1.142,0,0,1,42.568,55.426Z"
                                              transform="translate(5.392 7.378)" fill="#ffb013" />
                                        <path id="Path_8363" data-name="Path 8363"
                                              d="M33.426,52a3.426,3.426,0,1,0,3.426,3.426A3.43,3.43,0,0,0,33.426,52Zm0,4.568a1.142,1.142,0,1,1,1.142-1.142A1.142,1.142,0,0,1,33.426,56.568Z"
                                              transform="translate(4.257 7.378)" fill="#ffb013" />
                                        <path id="Path_8364" data-name="Path 8364"
                                              d="M35.98,30a3.417,3.417,0,0,0-1.142,6.641v.21a9.135,9.135,0,1,1-18.27,0v-.21a3.426,3.426,0,1,0-2.284,0v.21a11.419,11.419,0,1,0,22.838,0v-.21A3.417,3.417,0,0,0,35.98,30ZM15.426,32.284a1.142,1.142,0,1,1-1.142,1.142A1.142,1.142,0,0,1,15.426,32.284ZM35.98,34.568a1.142,1.142,0,1,1,1.142-1.142A1.142,1.142,0,0,1,35.98,34.568Z"
                                              transform="translate(1.703 4.257)" fill="#ffb013" />
                                        <path id="Path_8365" data-name="Path 8365" d="M8,4h2.284V6.284H8Z"
                                              transform="translate(1.135 0.568)" fill="#091b4b" />
                                        <path id="Path_8366" data-name="Path 8366" d="M12,4h2.284V6.284H12Z"
                                              transform="translate(1.703 0.568)" fill="#091b4b" />
                                        <path id="Path_8367" data-name="Path 8367" d="M16,4h2.284V6.284H16Z"
                                              transform="translate(2.27 0.568)" fill="#091b4b" />
                                        <path id="Path_8368" data-name="Path 8368" d="M30,14h4.568v2.284H30Z"
                                              transform="translate(4.257 1.986)" fill="#091b4b" />
                                        <path id="Path_8369" data-name="Path 8369" d="M36,14h6.851v2.284H36Z"
                                              transform="translate(5.108 1.986)" fill="#091b4b" />
                                        <path id="Path_8370" data-name="Path 8370"
                                              d="M66.229,36.034V66.9l-4.568-4.568V38.824H59.378V62.331L54.81,66.9V37.291a1.142,1.142,0,0,0-1.949-.808l-.335.335v31.7H3.426a1.142,1.142,0,0,1-1.142-1.142V33.115a1.142,1.142,0,0,1,1.142-1.142H47.683l.335-.335a1.142,1.142,0,0,0-.808-1.949H31.973v-13.7A2.286,2.286,0,0,0,29.689,13.7H11.419a2.286,2.286,0,0,0-2.284,2.284v13.7H6.851V11.419H52.527V15.71l.335.335a1.142,1.142,0,0,0,1.949-.808V2.284A2.286,2.286,0,0,0,52.527,0H6.851A2.286,2.286,0,0,0,4.568,2.284V29.689H3.426A3.43,3.43,0,0,0,0,33.115V67.371A3.43,3.43,0,0,0,3.426,70.8H65.087a3.43,3.43,0,0,0,3.426-3.426V33.751ZM52.527,2.284V9.135H6.851V2.284Zm-41.108,13.7h18.27v13.7H11.419Zm53.2,52.527h-8.19l4.095-4.095Z"
                                              transform="translate(0 0)" fill="#2467ec" />
                                        <path id="Path_8371" data-name="Path 8371"
                                              d="M46,23.709A5.709,5.709,0,1,0,51.709,18,5.716,5.716,0,0,0,46,23.709Zm5.709-3.426a3.426,3.426,0,1,1-3.426,3.426A3.43,3.43,0,0,1,51.709,20.284Z"
                                              transform="translate(6.527 2.554)" fill="#091b4b" />
                                        <path id="Path_8372" data-name="Path 8372" d="M30,18h9.135v2.284H30Z"
                                              transform="translate(4.257 2.554)" fill="#091b4b" />
                                        <path id="Path_8373" data-name="Path 8373" d="M30,22h9.135v2.284H30Z"
                                              transform="translate(4.257 3.121)" fill="#091b4b" />
                                        </g>
                                        </g>
                                        </g>
                                        </svg>

                                    </div>
                                    <div class="topic-content">
                                        <h4><a href="faq-page.html">Purchase Course</a></h4>
                                        <p>You'll be knowing our purchase
                                            policy for course</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-4 col-md-6">
                            <div class="topic-wrapper text-center mb-30">
                                <div class="topic-items">
                                    <div class="topic-svg">
                                        <svg id="cashback" xmlns="http://www.w3.org/2000/svg" width="70.797" height="70.797"
                                             viewBox="0 0 70.797 70.797">
                                        <g id="Group_4199" data-name="Group 4199" transform="translate(44.534 37.682)">
                                        <g id="Group_4198" data-name="Group 4198">
                                        <path id="Path_8386" data-name="Path 8386"
                                              d="M48.135,51.27a9.135,9.135,0,1,1,9.135-9.135A9.146,9.146,0,0,1,48.135,51.27Z"
                                              transform="translate(-39 -33)" fill="#ffb013" />
                                        </g>
                                        </g>
                                        <g id="Group_4200" data-name="Group 4200" transform="translate(0 6.85)">
                                        <path id="Path_8387" data-name="Path 8387"
                                              d="M22.846,6H18.029A18.051,18.051,0,0,0,0,24.018v2.363A17.928,17.928,0,0,0,9.965,42.514a21.934,21.934,0,0,0,4.608,1.693l.272.066.009-10.87H13.711a3.426,3.426,0,0,1,0-6.851h1.142V24.269a2.283,2.283,0,0,1,2.284-2.284h13.7A2.277,2.277,0,0,1,32.8,23.127h.319A3.43,3.43,0,0,0,36.548,19.7,13.718,13.718,0,0,0,22.846,6Z"
                                              transform="translate(0 -5.999)" fill="#3b4b6b" />
                                        </g>
                                        <g id="Group_4201" data-name="Group 4201" transform="translate(9.143)">
                                        <path id="Path_8388" data-name="Path 8388"
                                              d="M22.576,25.283a2.286,2.286,0,0,1,2.284,2.284h2.284a4.568,4.568,0,0,0-9.135,0h2.284A2.286,2.286,0,0,1,22.576,25.283Z"
                                              transform="translate(-6.588 3.263)" fill="#13275e" />
                                        <path id="Path_8389" data-name="Path 8389"
                                              d="M35.4,50.041a3.387,3.387,0,0,0-1.142-.21H28.2l-1.671-4.456a7.159,7.159,0,0,0-1.7-2.592,10.29,10.29,0,0,0,8.3-10.082V22.425A3.43,3.43,0,0,0,29.7,19H16a3.43,3.43,0,0,0-3.426,3.426v1.142a4.568,4.568,0,0,0,0,9.135l-.008,9.448.871.214c.468.114.941.209,1.417.291a7.193,7.193,0,0,0-2.288,5.258,13.26,13.26,0,0,0,2.284,7.455V68.1H30.837V61.25h5.709v0h4.568a5.716,5.716,0,0,0,5.709-5.709,3.387,3.387,0,0,0-.21-1.142l23.048,0V33.845H35.4Zm-7.38-11.259c-.327-.1-.657-.2-.968-.322a4.9,4.9,0,0,1-2.931-3.475h6.382a8.008,8.008,0,0,1-2.482,3.8Zm-15.45-8.364a2.284,2.284,0,0,1,0-4.568h2.284V22.425A1.143,1.143,0,0,1,16,21.283H29.7a1.143,1.143,0,0,1,1.142,1.142V32.7H21.711v1.142a7.278,7.278,0,0,0,3.789,6.39,7.93,7.93,0,0,1-2.65.461H18.573a19.371,19.371,0,0,1-3.721-.36l.009-9.918Zm15.978,35.4H17.134V57.936A13.268,13.268,0,0,0,25.9,61.25h2.649ZM35.4,58.966H25.9A11.067,11.067,0,0,1,14.85,47.908a4.928,4.928,0,0,1,9.543-1.73l1.744,4.649-1.959,2.939,1.9,1.266,1.945-2.918h6.24A1.143,1.143,0,0,1,35.4,53.257v5.709ZM43.4,54.4a1.143,1.143,0,0,1,1.142,1.142,3.43,3.43,0,0,1-3.426,3.426H37.688V53.729l1.281-1.279a1.134,1.134,0,0,1,.807-.333h.2a1.143,1.143,0,0,1,1.142,1.142V54.4Zm23.98-2.286h-13.7V49.831a3.426,3.426,0,0,0,0-6.851H51.391a1.142,1.142,0,1,1,0-2.284h2.284a1.143,1.143,0,0,1,1.142,1.142H57.1a3.43,3.43,0,0,0-3.426-3.426V36.128h13.7ZM51.391,36.128v2.284a3.426,3.426,0,0,0,0,6.851h2.284a1.142,1.142,0,1,1,0,2.284H51.391a1.143,1.143,0,0,1-1.142-1.142H47.965a3.43,3.43,0,0,0,3.426,3.426v2.285H43.2a3.432,3.432,0,0,0-3.23-2.284h-.2a3.38,3.38,0,0,0-2.087.729V36.128Z"
                                              transform="translate(-8.007 2.696)" fill="#2467ec" />
                                        <path id="Path_8390" data-name="Path 8390"
                                              d="M60.664,4.568l-3.52-2.817A8.029,8.029,0,0,0,52.151,0H41.993a2.286,2.286,0,0,0-2.284,2.284,4.521,4.521,0,0,0,.635,2.284H37.426a3.417,3.417,0,0,0-.891,6.719,3.4,3.4,0,0,0,2.284,4.568,3.415,3.415,0,0,0,3.174,4.7H52.656a8,8,0,0,0,4.113-1.14l3.81-2.286h5.393V4.568Zm-5.07,12.888a5.707,5.707,0,0,1-2.938.814H41.993a1.142,1.142,0,0,1,0-2.284h6.851V13.7H39.709a1.142,1.142,0,0,1,0-2.284h9.135V9.135H37.426a1.142,1.142,0,0,1,0-2.284h11.95l.589.883a5.691,5.691,0,0,0,4.75,2.543H55.7V7.993h-.981a3.417,3.417,0,0,1-2.85-1.526L50.6,4.568h-6.32a2.286,2.286,0,0,1-2.284-2.284H52.151a5.733,5.733,0,0,1,3.567,1.252l3.4,2.723V15.34Zm8.095-2.611H61.405V6.851h2.284Z"
                                              transform="translate(-4.319 0)" fill="#2467ec" />
                                        <path id="Path_8391" data-name="Path 8391" d="M40,20h2.284V31.419H40Z"
                                              transform="translate(-3.468 2.838)" fill="#13275e" />
                                        <path id="Path_8392" data-name="Path 8392" d="M44,28h2.284v2.284H44Z"
                                              transform="translate(-2.9 3.973)" fill="#13275e" />
                                        <path id="Path_8393" data-name="Path 8393" d="M44,20h2.284v6.851H44Z"
                                              transform="translate(-2.9 2.838)" fill="#13275e" />
                                        <path id="Path_8394" data-name="Path 8394" d="M52,28h2.284v2.284H52Z"
                                              transform="translate(-1.765 3.973)" fill="#13275e" />
                                        <path id="Path_8395" data-name="Path 8395" d="M52,20h2.284v6.851H52Z"
                                              transform="translate(-1.765 2.838)" fill="#13275e" />
                                        <path id="Path_8396" data-name="Path 8396" d="M48,20h2.284V31.419H48Z"
                                              transform="translate(-2.333 2.838)" fill="#13275e" />
                                        </g>
                                        </svg>

                                    </div>
                                    <div class="topic-content">
                                        <h4><a href="faq-page.html">Refund Method</a></h4>
                                        <p>Manage your course refund policy
                                            easily smoothly</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-4 col-md-6">
                            <div class="topic-wrapper text-center mb-30">
                                <div class="topic-items">
                                    <div class="topic-svg">
                                        <svg id="kyc" xmlns="http://www.w3.org/2000/svg" width="70.797" height="70.797"
                                             viewBox="0 0 70.797 70.797">
                                        <path id="Path_8397" data-name="Path 8397"
                                              d="M148.438,34a8.038,8.038,0,0,1-8.048-8.048,8.126,8.126,0,0,1,.3-2.157H120.81a1.416,1.416,0,0,0-1.41,1.41V69.956a1.416,1.416,0,0,0,1.41,1.41h30.559a1.416,1.416,0,0,0,1.41-1.41V32.733A8.04,8.04,0,0,1,148.438,34Z"
                                              transform="translate(-86.38 -17.218)" fill="#edf4fc" />
                                        <path id="Path_8398" data-name="Path 8398"
                                              d="M60.728,28.474h-.3a6.048,6.048,0,0,0-3.07.857A5.976,5.976,0,0,0,52.21,26.4h-3.07A10.894,10.894,0,0,0,38.3,37.241v4.84a4.325,4.325,0,0,1,3.4-.913v-.5a.555.555,0,0,1,.553-.553h.111c1.908.387,7.55,1.079,11.394-3.733a.57.57,0,0,1,.8-.083c.028,0,.028.028.055.028a10.277,10.277,0,0,0,6.112,2.627Z"
                                              transform="translate(-27.708 -19.099)" fill="#818182" />
                                        <path id="Path_8399" data-name="Path 8399"
                                              d="M69.7,64.493a10.185,10.185,0,0,1-6.112-2.627.568.568,0,0,0-.8,0c-.028.028-.028.028-.028.055-3.844,4.812-9.486,4.148-11.394,3.733a.567.567,0,0,0-.664.442v8.545a10.47,10.47,0,0,0,19,6.084Z"
                                              transform="translate(-36.679 -44.637)" fill="#f9d0b4" />
                                        <path id="Path_8403" data-name="Path 8403"
                                              d="M37.384,87.588V79.651a4.385,4.385,0,0,0-1.41,8.656,4.185,4.185,0,0,0,1.438,0A6.251,6.251,0,0,1,37.384,87.588Z"
                                              transform="translate(-23.363 -57.583)" fill="#f9d0b4" />
                                        <path id="Path_8404" data-name="Path 8404"
                                              d="M49,156.417H36.223a1.416,1.416,0,0,1-1.41-1.41v-8.352l-1.466-.719a3.377,3.377,0,0,1-1.881-3.042V141.4a10.362,10.362,0,0,1-10.343,0v1.493a3.377,3.377,0,0,1-1.881,3.042l-2.461,1.217a9.253,9.253,0,0,1-1.908.691L7.13,149.779a4.452,4.452,0,0,0-3.346,4.065l-1.3,16.51A1.883,1.883,0,0,0,4.2,172.374H48.253a1.882,1.882,0,0,0,1.881-1.881v-.138Z"
                                              transform="translate(-1.793 -102.296)" fill="#70d6f9" />
                                        <path id="Path_8405" data-name="Path 8405"
                                              d="M73.967,146.754l-1.466-.719a3.377,3.377,0,0,1-1.881-3.042V141.5a10.362,10.362,0,0,1-10.343,0v1.493a3.377,3.377,0,0,1-1.881,3.042l-1.8.885a10.448,10.448,0,0,0,17.367.5Z"
                                              transform="translate(-40.947 -102.368)" fill="#f9d0b4" />
                                        <path id="Path_8406" data-name="Path 8406"
                                              d="M76.1,118.739a5.487,5.487,0,0,1-4.674-2.572.713.713,0,0,1,.221-.968.688.688,0,0,1,.968.221,4.132,4.132,0,0,0,7,0,.7.7,0,0,1,1.189.747A5.634,5.634,0,0,1,76.1,118.739Z"
                                              transform="translate(-51.602 -83.257)" />
                                        <circle id="Ellipse_126" data-name="Ellipse 126" cx="1.244" cy="1.244" r="1.244"
                                                transform="translate(18.75 25.609)" />
                                        <circle id="Ellipse_127" data-name="Ellipse 127" cx="1.244" cy="1.244" r="1.244"
                                                transform="translate(27.987 25.609)" />
                                        <path id="Path_8407" data-name="Path 8407"
                                              d="M34.889,87.249A5.075,5.075,0,0,1,34.861,77.1c.277,0,.553.028.83.055a.688.688,0,0,1,.581.691v7.937a5.789,5.789,0,0,0,.028.664.671.671,0,0,1-.581.719,4.221,4.221,0,0,1-.83.083Zm0-8.767a3.678,3.678,0,1,0,0,7.356V78.483Z"
                                              transform="translate(-21.559 -55.778)" />
                                        <path id="Path_8408" data-name="Path 8408"
                                              d="M46.46,171.4H2.572A2.567,2.567,0,0,1,0,168.825v-.194l1.3-16.51a5.094,5.094,0,0,1,3.872-4.674l7.743-1.936a10.413,10.413,0,0,0,1.77-.636l2.461-1.217a2.626,2.626,0,0,0,1.493-2.406v-1.493a.685.685,0,0,1,.691-.691.657.657,0,0,1,.332.083,9.7,9.7,0,0,0,9.652,0,.682.682,0,0,1,.94.249.736.736,0,0,1,.083.332v1.493a2.674,2.674,0,0,0,1.493,2.406l1.466.719a.663.663,0,0,1,.387.608v8.352a.714.714,0,0,0,.719.719H47.179a.693.693,0,0,1,.691.636l1.106,13.966a2.57,2.57,0,0,1-2.351,2.765H46.46ZM20.022,140.865v.36a4.058,4.058,0,0,1-2.268,3.65l-2.461,1.217a8.617,8.617,0,0,1-2.046.747L5.5,148.775A3.686,3.686,0,0,0,2.683,152.2l-1.3,16.538a1.2,1.2,0,0,0,1.079,1.272h44a1.18,1.18,0,0,0,1.189-1.189v-.083L46.6,155.412H34.458a2.1,2.1,0,0,1-2.1-2.1V145.4l-1.079-.525a4.039,4.039,0,0,1-2.268-3.65v-.36A11.285,11.285,0,0,1,20.022,140.865Z"
                                              transform="translate(0 -100.6)" />
                                        <path id="Path_8409" data-name="Path 8409"
                                              d="M63.661,150.738a11.1,11.1,0,0,1-9.43-5.2.713.713,0,0,1,.221-.968.1.1,0,0,0,.055-.028l1.8-.885a2.626,2.626,0,0,0,1.493-2.406v-1.493a.685.685,0,0,1,.691-.691.657.657,0,0,1,.332.083,9.7,9.7,0,0,0,9.652,0,.682.682,0,0,1,.94.249.736.736,0,0,1,.083.332v1.493a2.674,2.674,0,0,0,1.493,2.406l1.466.719a.663.663,0,0,1,.387.608v.636a.823.823,0,0,1-.138.415A11.054,11.054,0,0,1,63.661,150.738ZM55.835,145.4a9.762,9.762,0,0,0,15.653,0l-1.079-.525a4.039,4.039,0,0,1-2.268-3.65v-.36a11,11,0,0,1-8.96,0v.36a4.058,4.058,0,0,1-2.268,3.65Z"
                                              transform="translate(-39.159 -100.6)" />
                                        <circle id="Ellipse_128" data-name="Ellipse 128" cx="8.048" cy="8.048" r="8.048"
                                                transform="translate(54.01 0.691)" fill="#87d147" />
                                        <path id="Path_8410" data-name="Path 8410"
                                              d="M210.467,26.562,208.006,24.1a1.389,1.389,0,0,1,1.936-1.991l.028.028,1.493,1.493,3.125-3.125a1.389,1.389,0,1,1,1.991,1.936l-.028.028-4.093,4.093A1.4,1.4,0,0,1,210.467,26.562Z"
                                              transform="translate(-150.179 -14.532)" fill="#edf4fc" />
                                        <path id="Path_8411" data-name="Path 8411"
                                              d="M201.539,17.478a8.739,8.739,0,1,1,8.739-8.739A8.74,8.74,0,0,1,201.539,17.478Zm0-16.1A7.356,7.356,0,1,0,208.9,8.739,7.353,7.353,0,0,0,201.539,1.383Z"
                                              transform="translate(-139.481)" />
                                        <path id="Path_8412" data-name="Path 8412"
                                              d="M209.653,25.859a2.072,2.072,0,0,1-1.466-.608l-2.461-2.461A2.073,2.073,0,1,1,208.6,19.8l.055.055,1,1,2.627-2.627a2.073,2.073,0,1,1,2.987,2.876l-.055.055-4.093,4.093a2.072,2.072,0,0,1-1.466.608Zm-.5-1.576a.666.666,0,0,0,.5.194.8.8,0,0,0,.5-.194l4.093-4.093a.668.668,0,0,0,0-.968.721.721,0,0,0-.968,0l-3.125,3.125a.668.668,0,0,1-.968,0l-1.493-1.493a.721.721,0,0,0-.968,0,.668.668,0,0,0,0,.968Z"
                                              transform="translate(-148.369 -12.723)" />
                                        <path id="Path_8413" data-name="Path 8413"
                                              d="M149.561,70.222H119a2.1,2.1,0,0,1-2.1-2.1V23.4a2.1,2.1,0,0,1,2.1-2.1h19.884a.685.685,0,0,1,.691.691.471.471,0,0,1-.028.194,7.363,7.363,0,0,0,11.062,8.158.713.713,0,0,1,.968.221.608.608,0,0,1,.111.36V68.148A2.138,2.138,0,0,1,149.561,70.222ZM119,22.683a.714.714,0,0,0-.719.719V68.148a.714.714,0,0,0,.719.719h30.559a.714.714,0,0,0,.719-.719V32.085A8.728,8.728,0,0,1,138.692,27.8a8.569,8.569,0,0,1-.664-5.116Z"
                                              transform="translate(-84.571 -15.409)" />
                                        <path id="Path_8414" data-name="Path 8414"
                                              d="M36.491,40.963a.685.685,0,0,1-.691-.691v-4.84A11.561,11.561,0,0,1,47.332,23.9H50.4a6.719,6.719,0,0,1,5.365,2.71,6.7,6.7,0,0,1,3.18-.636.718.718,0,0,1,.664.691V37.119a.685.685,0,0,1-.691.691h-.083a10.952,10.952,0,0,1-6.416-2.71c-4.01,4.95-9.873,4.314-11.809,3.927v.332a.685.685,0,0,1-.691.691H39.81A4.126,4.126,0,0,0,39.229,40a3.625,3.625,0,0,0-2.3.8.628.628,0,0,1-.442.166Zm10.841-15.68A10.174,10.174,0,0,0,37.183,35.432v3.623a4.678,4.678,0,0,1,2.046-.415,1.231,1.231,0,0,1,1.466-.968c2.074.387,7.218.913,10.73-3.512a1.243,1.243,0,0,1,1.77-.194.382.382,0,0,0,.111.083,9.023,9.023,0,0,0,4.95,2.3v-8.96a4.907,4.907,0,0,0-2.323.747.682.682,0,0,1-.94-.249,5.378,5.378,0,0,0-4.535-2.6Z"
                                              transform="translate(-25.899 -17.29)" />
                                        <path id="Path_8415" data-name="Path 8415"
                                              d="M59.373,84.088A11.177,11.177,0,0,1,48.2,72.915V64.453a1.18,1.18,0,0,1,.47-.968,1.221,1.221,0,0,1,1.051-.249c2.019.415,7.163.94,10.675-3.485a1.243,1.243,0,0,1,1.77-.194.382.382,0,0,0,.111.083A9.5,9.5,0,0,0,68,62.074a.689.689,0,0,1,.608.691V79.027a.823.823,0,0,1-.138.415A11.421,11.421,0,0,1,59.373,84.088Zm-9.79-19.469v8.269A9.8,9.8,0,0,0,67.227,78.75V63.319a10.641,10.641,0,0,1-5.808-2.627c-4.038,4.95-9.9,4.314-11.836,3.927Z"
                                              transform="translate(-34.87 -42.882)" />
                                        <path id="Path_8416" data-name="Path 8416"
                                              d="M170.371,69.683h-9.679a.691.691,0,0,1,0-1.383h9.679a.691.691,0,1,1,0,1.383Z"
                                              transform="translate(-115.752 -49.412)" />
                                        <path id="Path_8417" data-name="Path 8417"
                                              d="M169.212,89.683h-17.92a.691.691,0,0,1,0-1.383h17.92a.691.691,0,0,1,0,1.383Z"
                                              transform="translate(-108.952 -63.881)" />
                                        <path id="Path_8418" data-name="Path 8418"
                                              d="M169.212,102.383h-17.92a.691.691,0,1,1,0-1.383h17.92a.691.691,0,0,1,0,1.383Z"
                                              transform="translate(-108.952 -73.068)" />
                                        <path id="Path_8419" data-name="Path 8419"
                                              d="M169.212,115.083h-17.92a.691.691,0,1,1,0-1.383h17.92a.691.691,0,0,1,0,1.383Z"
                                              transform="translate(-108.952 -82.256)" />
                                        <path id="Path_8420" data-name="Path 8420"
                                              d="M169.212,127.783h-17.92a.691.691,0,0,1,0-1.383h17.92a.685.685,0,0,1,.691.691A.7.7,0,0,1,169.212,127.783Z"
                                              transform="translate(-108.952 -91.444)" />
                                        <path id="Path_8421" data-name="Path 8421"
                                              d="M169.212,140.383h-17.92a.691.691,0,1,1,0-1.383h17.92a.691.691,0,0,1,0,1.383Z"
                                              transform="translate(-108.952 -100.559)" />
                                        <path id="Path_8422" data-name="Path 8422"
                                              d="M169.212,153.083h-17.92a.691.691,0,0,1,0-1.383h17.92a.691.691,0,1,1,0,1.383Z"
                                              transform="translate(-108.952 -109.747)" />
                                        <path id="Path_8423" data-name="Path 8423"
                                              d="M138.717,89.683h-.525a.691.691,0,0,1,0-1.383h.525a.691.691,0,1,1,0,1.383Z"
                                              transform="translate(-99.474 -63.881)" />
                                        <path id="Path_8424" data-name="Path 8424"
                                              d="M138.717,102.383h-.525a.691.691,0,0,1,0-1.383h.525a.691.691,0,0,1,0,1.383Z"
                                              transform="translate(-99.474 -73.068)" />
                                        <path id="Path_8425" data-name="Path 8425"
                                              d="M138.717,115.083h-.525a.691.691,0,0,1,0-1.383h.525a.691.691,0,0,1,0,1.383Z"
                                              transform="translate(-99.474 -82.256)" />
                                        <path id="Path_8426" data-name="Path 8426"
                                              d="M138.717,127.783h-.525a.691.691,0,0,1,0-1.383h.525a.685.685,0,0,1,.691.691A.7.7,0,0,1,138.717,127.783Z"
                                              transform="translate(-99.474 -91.444)" />
                                        <path id="Path_8427" data-name="Path 8427"
                                              d="M138.717,140.383h-.525a.691.691,0,1,1,0-1.383h.525a.691.691,0,0,1,0,1.383Z"
                                              transform="translate(-99.474 -100.559)" />
                                        <path id="Path_8428" data-name="Path 8428"
                                              d="M138.717,153.083h-.525a.691.691,0,0,1,0-1.383h.525a.691.691,0,0,1,0,1.383Z"
                                              transform="translate(-99.474 -109.747)" />
                                        <path id="Path_8429" data-name="Path 8429"
                                              d="M31.191,221.53a.685.685,0,0,1-.691-.691V210.191a.691.691,0,1,1,1.383,0v10.647A.685.685,0,0,1,31.191,221.53Z"
                                              transform="translate(-22.065 -151.563)" />
                                        <path id="Path_8430" data-name="Path 8430"
                                              d="M143.191,221.53a.685.685,0,0,1-.691-.691V210.191a.691.691,0,0,1,1.383,0v10.647A.685.685,0,0,1,143.191,221.53Z"
                                              transform="translate(-103.092 -151.563)" />
                                        </svg>

                                    </div>
                                    <div class="topic-content">
                                        <h4><a href="faq-page.html">Admission</a></h4>
                                        <p>Read how to get admission to
                                            your favorite course</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- faq-area-end -->
        </main>

        <%-- FOOTER --%>
        <%@ include file="../template/footer.jsp" %>
        <%-- BACK TO TOP --%>
        <%@ include file="../template/backToTop.jsp" %>

        <!-- JS here -->
        <%@ include file="../template/script.jsp" %>
    </body>

</html>
