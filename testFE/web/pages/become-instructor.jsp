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
            <!-- hero-area -->
            <jsp:include page="../template/heroArea.jsp">
                <jsp:param name="title" value="Become An Instructor" />
            </jsp:include>

            <!-- features-area-start -->
            <div class="features-area fix pt-110 pb-85">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="section-title text-center mb-50">
                                <h2>Spread Your <span class="down-mark-line-2">Knowledge</span></h2>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12">
                            <div class="features-box text-center mb-30">
                                <div class="features-svg">
                                    <svg id="Group_3029" data-name="Group 3029" xmlns="http://www.w3.org/2000/svg" width="79.896"
                                         height="78.92" viewBox="0 0 79.896 78.92">
                                    <path id="Path_7772" data-name="Path 7772"
                                          d="M82.875,23.294a1.417,1.417,0,0,1-1.417-1.417v-4.6a1.417,1.417,0,0,1,2.833,0v4.6A1.417,1.417,0,0,1,82.875,23.294Z"
                                          transform="translate(-29.154 -9.968)" fill="#3b4456" />
                                    <path id="Path_7773" data-name="Path 7773"
                                          d="M51.863,65.151a1.417,1.417,0,0,1-1.315-.888c-1.314-3.258-5.242-4.975-5.279-4.992a1.417,1.417,0,1,1,1.109-2.607c.2.087,5.038,2.179,6.8,6.539a1.417,1.417,0,0,1-.783,1.842,1.4,1.4,0,0,1-.529.106Z"
                                          transform="translate(-18.348 -21.837)" fill="#ffb013" />
                                    <path id="Path_7774" data-name="Path 7774"
                                          d="M72.484,65.152a1.4,1.4,0,0,1-.529-.1,1.417,1.417,0,0,1-.783-1.842c1.759-4.36,6.592-6.452,6.8-6.539a1.417,1.417,0,0,1,1.109,2.607c-.062.027-3.967,1.744-5.279,4.991a1.417,1.417,0,0,1-1.315.885Z"
                                          transform="translate(-26.124 -21.838)" fill="#ffb013" />
                                    <path id="Path_7775" data-name="Path 7775"
                                          d="M63.417,55.92A1.417,1.417,0,0,1,62,54.5l.011-8.048a1.417,1.417,0,0,1,2.833,0L64.833,54.5A1.417,1.417,0,0,1,63.417,55.92Z"
                                          transform="translate(-23.479 -18.479)" fill="#ffb013" />
                                    <path id="Path_7776" data-name="Path 7776"
                                          d="M82.016,84.739a1.417,1.417,0,0,1-.878-2.529A68.338,68.338,0,0,1,91.1,75.6a1.417,1.417,0,1,1,1.333,2.5,65.535,65.535,0,0,0-9.54,6.333A1.417,1.417,0,0,1,82.016,84.739Z"
                                          transform="translate(-28.904 -27.337)" fill="#3b4456" />
                                    <path id="Path_7777" data-name="Path 7777"
                                          d="M87.042,78.893,84.679,74.8a3.559,3.559,0,0,0-4.838-1.3l-2.564,1.48a8.1,8.1,0,0,1-2.735-4.675,3.568,3.568,0,0,0-1.983-2.383,3.484,3.484,0,0,0-3.03.053C55.44,75.053,49.794,83.786,47.567,89.016,45.34,83.786,39.694,75.053,25.6,67.979a3.484,3.484,0,0,0-3.031-.053,3.566,3.566,0,0,0-1.983,2.384,8.1,8.1,0,0,1-2.736,4.675L15.29,73.5a3.547,3.547,0,0,0-4.838,1.3l-2.36,4.092a3.547,3.547,0,0,0,1.3,4.839l32.4,18.707a11.586,11.586,0,0,0,11.55,0l32.4-18.708a3.546,3.546,0,0,0,1.3-4.838ZM70.8,70.511a.708.708,0,0,1,.992.492,11.813,11.813,0,0,0,2.871,5.49L49.945,90.764C51.789,86.164,56.941,77.47,70.8,70.511ZM23.342,71a.7.7,0,0,1,.992-.492c13.86,6.96,19.011,15.655,20.856,20.254L20.468,76.493A11.816,11.816,0,0,0,23.339,71ZM84.331,81.277l-32.4,18.707a8.738,8.738,0,0,1-8.717,0L10.806,81.278a.708.708,0,0,1-.259-.968l2.362-4.091a.691.691,0,0,1,.967-.259L46.859,95a1.455,1.455,0,0,0,1.417,0c6.769-3.907,25.959-14.988,32.983-19.043a.708.708,0,0,1,.967.259l2.362,4.091a.708.708,0,0,1-.259.968Z"
                                          transform="translate(-7.619 -25.06)" fill="#455d76" />
                                    <path id="Path_7778" data-name="Path 7778"
                                          d="M43.923,16.826l5.351,2.125v7.035A2.925,2.925,0,0,0,52.2,28.9H63.341a2.925,2.925,0,0,0,2.925-2.918V18.948l5.35-2.125a2.125,2.125,0,0,0,0-3.951L58.551,7.693a2.125,2.125,0,0,0-1.565,0L43.923,12.875a2.139,2.139,0,0,0,0,3.951Zm19.511,9.16a.092.092,0,0,1-.092.085H52.2a.092.092,0,0,1-.092-.085V20.072c.539.154,5.2,2.218,5.663,2.086.45.137,5.149-1.939,5.667-2.085ZM57.767,10.43l11.142,4.42-4.63,1.837h-.008l-6.5,2.584-6.522-2.587-4.621-1.833Z"
                                          transform="translate(-17.822 -7.543)" fill="#ffb013" />
                                    <path id="Path_7779" data-name="Path 7779"
                                          d="M22.166,47.758l1.386.2a.708.708,0,0,1,.533.387L24.7,49.6a3.542,3.542,0,0,0,6.352,0l.621-1.257a.708.708,0,0,1,.533-.386l1.386-.2a3.564,3.564,0,0,0,1.962-6.042l-1-.975a.708.708,0,0,1-.205-.627l.238-1.381A3.564,3.564,0,0,0,29.451,35l-1.239.651c-.468.305-1.269-.377-1.9-.652a3.564,3.564,0,0,0-5.143,3.734l.237,1.381a.708.708,0,0,1-.2.626l-1,.978a3.564,3.564,0,0,0,1.965,6.042Zm.014-4.012,1-.978A3.542,3.542,0,0,0,24.2,39.631l-.237-1.38A.7.7,0,0,1,25,37.506l1.239.65a3.533,3.533,0,0,0,3.3,0l1.238-.65a.7.7,0,0,1,1.026.747l-.238,1.381a3.542,3.542,0,0,0,1.017,3.134l1,.978a.708.708,0,0,1-.392,1.2l-1.386.2a3.542,3.542,0,0,0-2.667,1.937l-.62,1.256a.708.708,0,0,1-1.271,0l-.618-1.252a3.542,3.542,0,0,0-2.666-1.935l-1.386-.2a.7.7,0,0,1-.393-1.209Z"
                                          transform="translate(-10.984 -15.436)" fill="#2467ec" />
                                    <path id="Path_7780" data-name="Path 7780"
                                          d="M95.99,50.744a7.077,7.077,0,0,0,7.069-7.069c-.388-9.377-13.75-9.376-14.137,0A7.076,7.076,0,0,0,95.99,50.744Zm0-11.3a4.235,4.235,0,0,1,0,8.47A4.235,4.235,0,0,1,95.99,39.44Z"
                                          transform="translate(-31.331 -16.03)" fill="#2467ec" />
                                    </svg>
                                </div>
                                <div class="features-text">
                                    <h4>Expand Yourself</h4>
                                    <p>Expand your professional network, build your expertise, and earn money on each paid
                                        enrollment and find the university</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12">
                            <div class="features-box text-center mb-30">
                                <div class="features-svg">
                                    <svg id="teacher" xmlns="http://www.w3.org/2000/svg" width="70.837" height="78.921"
                                         viewBox="0 0 70.837 78.921">
                                    <path id="Path_7781" data-name="Path 7781" d="M277.332,341.332h2.952v8.855h-2.952Zm0,0"
                                          transform="translate(-238.962 -286.023)" fill="#ffb013" />
                                    <path id="Path_7782" data-name="Path 7782" d="M53.332,437.332h2.952v8.855H53.332Zm0,0"
                                          transform="translate(-45.953 -368.742)" fill="#ffb013" />
                                    <path id="Path_7783" data-name="Path 7783"
                                          d="M29.515,355.756H1.476A1.476,1.476,0,0,1,0,354.28V341a10.342,10.342,0,0,1,10.331-10.33h2.951v2.951H10.331A7.388,7.388,0,0,0,2.951,341V352.8H28.04V341a1.475,1.475,0,0,1,1.475-1.475H44.273a2.952,2.952,0,0,0,0-5.9H22.136v-2.951H44.273a5.9,5.9,0,1,1,0,11.806H30.991V354.28a1.476,1.476,0,0,1-1.476,1.476Zm0,0"
                                          transform="translate(0 -276.835)" fill="#2467ec" />
                                    <path id="Path_7784" data-name="Path 7784"
                                          d="M72.855,221.871A8.863,8.863,0,0,1,64,213.017v-4.427a1.476,1.476,0,0,1,1.476-1.475c1.567,0,2.788-2.7,3.028-3.418a1.476,1.476,0,0,1,2.875.466c0,2.087,5.768,2.952,8.855,2.952a1.476,1.476,0,0,1,1.476,1.475v4.427A8.863,8.863,0,0,1,72.855,221.871Zm-5.9-12.054v3.2a5.9,5.9,0,0,0,11.806,0v-3c-2.311-.141-6.572-.67-8.831-2.656a6.3,6.3,0,0,1-2.975,2.457Zm0,0"
                                          transform="translate(-55.145 -166.563)" fill="#455d76" />
                                    <path id="Path_7785" data-name="Path 7785"
                                          d="M91.235,328.855a5.9,5.9,0,0,1-5.9-5.9V320h2.952v2.951a2.951,2.951,0,1,0,5.9,0V320h2.952v2.951a5.9,5.9,0,0,1-5.9,5.9Zm0,0"
                                          transform="translate(-73.526 -267.643)" fill="#455d76" />
                                    <path id="Path_7786" data-name="Path 7786"
                                          d="M72.517,164.09H71.041v-4.427a7.379,7.379,0,0,0-14.757,0v4.427H54.808a1.476,1.476,0,0,1-1.476-1.476v-2.951a10.331,10.331,0,1,1,20.661,0v2.951A1.476,1.476,0,0,1,72.517,164.09Zm0,0"
                                          transform="translate(-45.953 -121.41)" fill="#ffb013" />
                                    <g id="Group_3030" data-name="Group 3030" transform="translate(5.903 40.551)">
                                    <path id="Path_7787" data-name="Path 7787"
                                          d="M181.332,243.523v-2.952a1.476,1.476,0,1,0,0-2.951v-2.951a4.427,4.427,0,0,1,0,8.855Zm0,0"
                                          transform="translate(-162.147 -234.668)" fill="#455d76" />
                                    <path id="Path_7788" data-name="Path 7788"
                                          d="M47.1,243.523a4.427,4.427,0,0,1,0-8.855v2.951a1.476,1.476,0,1,0,0,2.951Zm0,0"
                                          transform="translate(-42.668 -234.668)" fill="#455d76" />
                                    <path id="Path_7789" data-name="Path 7789" d="M437.332,373.332h2.952v9.93h-2.952Zm0,0"
                                          transform="translate(-382.729 -362.144)" fill="#455d76" />
                                    <path id="Path_7790" data-name="Path 7790"
                                          d="M420.427,456.855a4.427,4.427,0,1,1,4.427-4.427A4.428,4.428,0,0,1,420.427,456.855Zm0-5.9a1.476,1.476,0,1,0,1.476,1.476A1.476,1.476,0,0,0,420.427,450.951Zm0,0"
                                          transform="translate(-364.349 -428.358)" fill="#455d76" />
                                    </g>
                                    <path id="Path_7791" data-name="Path 7791"
                                          d="M240.233,103.041H225.476A1.476,1.476,0,0,1,224,101.566V86.808a1.476,1.476,0,0,1,1.476-1.476h14.757a1.476,1.476,0,0,1,1.476,1.476v14.758A1.476,1.476,0,0,1,240.233,103.041Zm-13.282-2.951h11.806V88.284H226.951Zm0,0"
                                          transform="translate(-193.009 -73.526)" fill="#2467ec" />
                                    <path id="Path_7792" data-name="Path 7792"
                                          d="M167.508,53.127H154.226V50.176h13.282a1.476,1.476,0,0,0,1.476-1.476V4.427a1.476,1.476,0,0,0-1.476-1.476H121.759a1.476,1.476,0,0,0-1.475,1.476V17.709h-2.952V4.427A4.428,4.428,0,0,1,121.759,0h45.749a4.427,4.427,0,0,1,4.427,4.427V48.7A4.427,4.427,0,0,1,167.508,53.127Zm0,0"
                                          transform="translate(-101.099)" fill="#ffb013" />
                                    <path id="Path_7793" data-name="Path 7793"
                                          d="M287.663,159.328A10.33,10.33,0,1,1,297.993,149,10.33,10.33,0,0,1,287.663,159.328Zm0-17.709A7.379,7.379,0,1,0,295.041,149,7.379,7.379,0,0,0,287.663,141.619Zm0,0"
                                          transform="translate(-238.962 -119.483)" fill="#455d76" />
                                    <path id="Path_7794" data-name="Path 7794"
                                          d="M423.379,50.047h-2.951V47.1a1.476,1.476,0,0,0-1.476-1.476H416V42.668h2.951a4.427,4.427,0,0,1,4.427,4.427Zm0,0"
                                          transform="translate(-358.445 -36.765)" fill="#2467ec" />
                                    <path id="Path_7795" data-name="Path 7795" d="M373.332,42.668h2.952v2.951h-2.952Zm0,0"
                                          transform="translate(-321.681 -36.765)" fill="#455d76" />
                                    </svg>
                                </div>
                                <div class="features-text">
                                    <h4>Expand Yourself</h4>
                                    <p>Publish the course you want, in the way you want, and always have of control your own
                                        content. If you are passionate</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12">
                            <div class="features-box text-center mb-30">
                                <div class="features-svg">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="78.918" height="78.921"
                                         viewBox="0 0 78.918 78.921">
                                    <g id="save-money" transform="translate(-0.009)">
                                    <g id="Group_3032" data-name="Group 3032" transform="translate(54.246 42.495)">
                                    <g id="Group_3031" data-name="Group 3031">
                                    <path id="Path_7796" data-name="Path 7796"
                                          d="M353.59,279.087a1.695,1.695,0,1,1,1.566-2.343A1.7,1.7,0,0,1,353.59,279.087Z"
                                          transform="translate(-351.891 -275.706)" fill="#455d76" />
                                    </g>
                                    </g>
                                    <path id="Path_7797" data-name="Path 7797"
                                          d="M174.807,28.361h9.769a12.421,12.421,0,0,1-12.407-12.407A12.557,12.557,0,0,1,175.816,7.1a12.2,12.2,0,0,1,17.519,0,12.557,12.557,0,0,1,3.647,8.856,12.421,12.421,0,0,1-12.407,12.407h9.769a15.865,15.865,0,0,0,1.406-23.642,15.591,15.591,0,0,0-22.35,0,15.865,15.865,0,0,0,1.407,23.642Z"
                                          transform="translate(-142.756 0)" fill="#ffb013" />
                                    <g id="Group_3033" data-name="Group 3033" transform="translate(35.424 9.558)">
                                    <path id="Path_7798" data-name="Path 7798"
                                          d="M236.17,74.805a6.4,6.4,0,1,1,6.4-6.4,6.4,6.4,0,0,1-6.4,6.4Zm0-9.4a3.005,3.005,0,1,0,3.005,3.005A3.009,3.009,0,0,0,236.17,65.4Z"
                                          transform="translate(-229.774 -62.013)" fill="#ffb013" />
                                    </g>
                                    <g id="Group_3034" data-name="Group 3034" transform="translate(0.009 20.953)">
                                    <path id="Path_7799" data-name="Path 7799"
                                          d="M72.531,157.453H70.8a24.743,24.743,0,0,0-3.794-8.139l6.66-7.874a1.7,1.7,0,0,0-.1-2.294,10.917,10.917,0,0,0-12.605-2.052L58.9,138.123c-.8-.428-1.625-.825-2.467-1.191a15.784,15.784,0,0,1-1.628,2.991,30.608,30.608,0,0,1,3.216,1.587,1.7,1.7,0,0,0,1.6.044l2.86-1.426a7.53,7.53,0,0,1,7.488.435l-6.424,7.595a1.7,1.7,0,0,0-.03,2.153,21.478,21.478,0,0,1,4.281,9.178,1.7,1.7,0,0,0,1.661,1.355h3.073a3.009,3.009,0,0,1,3.005,3.005v4.7a3.009,3.009,0,0,1-3.005,3.005c-.4,0-3.925,0-4.546.027A1.7,1.7,0,0,0,66.5,172.6a22.485,22.485,0,0,1-6.886,8.849,1.7,1.7,0,0,0-.676,1.346c0,.549-.006,2.647-.009,4.723a3.064,3.064,0,0,1-5.178,2.163,2.839,2.839,0,0,1-.836-2.022c0-.982,0-1.762,0-2.022a1.7,1.7,0,0,0-2.493-1.5c-3.87,2.212-13.34,2.213-17.213,0a1.7,1.7,0,0,0-2.492,1.5v2.027a2.861,2.861,0,0,1-2.858,2.858,3.019,3.019,0,0,1-3.16-3c0-2.242-.008-4.626-.012-5.5a1.7,1.7,0,0,0-.76-1.407C7.16,169.461,10.46,147.514,28.826,139.917a15.787,15.787,0,0,1-1.623-2.984C16.275,141.682,9.366,151.339,9.577,161.97a7.919,7.919,0,0,1-3.853-2.087A7.561,7.561,0,0,1,3.4,154.447a1.7,1.7,0,0,0-3.391,0A11.265,11.265,0,0,0,9.905,165.46a27.148,27.148,0,0,0,11.4,17.454c0,1.143.006,2.915.009,4.606.261,8.08,11.864,8.678,12.781.617a28.673,28.673,0,0,0,15.45,0,6.284,6.284,0,0,0,6.382,5.769,6.405,6.405,0,0,0,6.4-6.387c0-1.475,0-2.961.006-3.892a26.014,26.014,0,0,0,6.816-8.671c.961-.007,2.369-.01,3.384-.01a6.4,6.4,0,0,0,6.4-6.4v-4.7a6.4,6.4,0,0,0-6.4-6.4Z"
                                          transform="translate(-0.009 -135.942)" fill="#2467ec" />
                                    </g>
                                    <g id="Group_3035" data-name="Group 3035" transform="translate(28.373 28.361)">
                                    <path id="Path_7800" data-name="Path 7800"
                                          d="M209.226,187.395h-23.5a1.7,1.7,0,1,1,0-3.391h23.5a1.7,1.7,0,1,1,0,3.391Z"
                                          transform="translate(-184.027 -184.004)" fill="#455d76" />
                                    </g>
                                    </g>
                                    </svg>
                                </div>
                                <div class="features-text">
                                    <h4>Earn Money</h4>
                                    <p>Earn money from Law is a career-oriented course after your 12th or graduation. We have jotted
                                        some of the instructors.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- features-area-end -->

            <!-- step-journey-area-start -->
            <div class="step-journey-area pt-110 pb-90">
                <div class="container">
                    <div class="row">
                        <div class="col-xxl-12">
                            <div class="section-title text-center mb-45">
                                <h2>How to <span class="down-mark-line-2">Start</span> Your Journey as an Instructor</h2>
                            </div>
                        </div>
                        <div class="col-xxl-12">
                            <ul class="nav nav-tabs step-journey justify-content-center" id="myTab" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link active" id="register-tab" data-bs-toggle="tab" data-bs-target="#register"
                                            type="button" role="tab" aria-controls="register" aria-selected="true">Quick Register</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="create-course-tab" data-bs-toggle="tab" data-bs-target="#create-course"
                                            type="button" role="tab" aria-controls="create-course" aria-selected="false">Create Your Course</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="launch-course-tab" data-bs-toggle="tab" data-bs-target="#launch-course"
                                            type="button" role="tab" aria-controls="launch-course" aria-selected="false">Launch Course</button>
                                </li>
                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="register" role="tabpanel" aria-labelledby="register-tab">
                                    <div class="step-tab-content pt-60 mb-30">
                                        <div class="row">
                                            <div class="col-xl-6 col-lg-6">
                                                <div class="step-journey-box mb-30">
                                                    <div class="step-journey-content mt-30">
                                                        <h4>01. Register Your Account</h4>
                                                        <p>Create an account with us and choose the role as an instructor to start your teaching journey. Provide the necessary personal details and set up your profile.</p>
                                                        <h4>02. Confirm Your Information</h4>
                                                        <p>Confirm your information and credentials by filling out the form and submitting it. Wait for the admin to review and provide feedback.</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-6 col-lg-6">
                                                <div class="step-journey-thumb d-flex-align-items-center">
                                                    <img src="${pageContext.request.contextPath}/img/bg/step-journey-1.png" alt="step-journey">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="create-course" role="tabpanel" aria-labelledby="create-course-tab">
                                    <div class="step-tab-content pt-60 mb-30">
                                        <div class="row">
                                            <div class="col-xl-6 col-lg-6">
                                                <div class="step-journey-box mb-30">
                                                    <div class="step-journey-content mt-30">
                                                        <h4>01. Enter Course Information</h4>
                                                        <p>Provide detailed information about your course including the title, description, and select the appropriate category for your course.</p>
                                                    </div>
                                                    <div class="step-journey-content mt-30">
                                                        <h4>02. Create Lessons</h4>
                                                        <p>Upload your lecture videos and supplementary materials to create comprehensive lessons for your course. Ensure the content is well-organized and easy to follow.</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-6 col-lg-6">
                                                <div class="step-journey-thumb d-flex-align-items-center">
                                                    <img src="${pageContext.request.contextPath}/img/bg/step-journey-2.png" alt="step-journey">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="launch-course" role="tabpanel" aria-labelledby="launch-course-tab">
                                    <div class="step-tab-content pt-60 mb-30">
                                        <div class="row">
                                            <div class="col-xl-6 col-lg-6">
                                                <div class="step-journey-box mb-30">
                                                    <div class="step-journey-content mt-30">
                                                        <h4>01. Submit for Approval</h4>
                                                        <p>Submit your course for approval by our admin team.</p>
                                                    </div>
                                                    <div class="step-journey-content mt-30">
                                                        <h4>02. Track Approval Status</h4>
                                                        <p>Monitor the status of your course approval process. You will receive notifications about the progress and any required modifications.</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-6 col-lg-6">
                                                <div class="step-journey-thumb d-flex-align-items-center">
                                                    <img src="${pageContext.request.contextPath}/img/bg/step-journey-3.png" alt="step-journey">
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
            <!-- step-journey-area-end -->

            <!-- become-intructor-area-start -->
            <div class="become-intructor-area pt-110 pb-120">
                <div class="container">
                    <div class="row justify-content-center text-center">
                        <div class="col-xl-6 col-md-8">
                            <div class="become-intructor-text">
                                <h2>Become an Instructor Today</h2>
                                <p>Join one of the world’s largest online learning marketplaces. Our Instructor Support Team is
                                    ready to help you while our Teaching Center</p>
                                <a class="edu-btn" href="${pageContext.request.contextPath}/pages/registration.jsp">Get started now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- become-intructor-area-end -->

        </main>

        <%-- FOOTER --%>
        <%@ include file="../template/footer.jsp" %>
        <%-- BACK TO TOP --%>
        <%@ include file="../template/backToTop.jsp" %>

        <!-- JS here -->
        <%@ include file="../template/script.jsp" %>

    </body>

</html>
