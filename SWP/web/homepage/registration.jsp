<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="zxx">


    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Eduman - Education & Online Courses HTML Template</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Place favicon.ico in the root directory -->
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/favicon.png">
        <!-- CSS here -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/preloader.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/meanmenu.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/swiper-bundle.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/backToTop.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/huicalendar.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontAwesome5Pro.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>

    <body>
        <!-- sign up area start -->
        <div class="signup-page-area pt-120 pb-120">
            <div class="signup-page-area-wrapper">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-10 col-lg-10">
                            <form action="register" method="post">
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="signup-box text-center">
                                            <div class="signup-text">
                                                <h3>Sign up</h3>
                                            </div>
                                            <div class="signup-message">
                                                <img src="${pageContext.request.contextPath}/img/sing-up/sign-up-message.png" alt="image not found">
                                            </div>
                                            <div class="signup-thumb">
                                                <img src="${pageContext.request.contextPath}/img/sing-up/sign-up.png" alt="image not found">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="signup-form-wrapper">
                                            <div class="signup-input-wrapper">
                                                <input type="text" name="firstname" placeholder="First Name" required>
                                                <input type="text" name="lastname" placeholder="Last Name" required>
                                            </div>
                                            <div class="signup-wrapper">
                                                <input type="text" name="email" id="emailInput" placeholder="Email" required>
                                                <span id="emailError" style="color: red;"></span>
                                            </div>

                                            <script>
                                                // Function to validate email format
                                                function validateEmail() {
                                                    var emailInput = document.getElementById('emailInput');
                                                    var emailError = document.getElementById('emailError');
                                                    var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

                                                    if (!emailPattern.test(emailInput.value)) {
                                                        emailError.textContent = 'Please enter a valid email address.';
                                                        return false;
                                                    } else {
                                                        emailError.textContent = '';
                                                        return true;
                                                    }
                                                }

                                                // Add event listener to input for real-time validation
                                                var emailInput = document.getElementById('emailInput');
                                                emailInput.addEventListener('input', validateEmail);
                                            </script>


                                            <div class="signup-wrapper">
                                                <input type="text" name="username" placeholder="Username" required>
                                            </div>
                                            <div class="signup-wrapper">
                                                <input type="password" name="password" placeholder="Password" required>
                                            </div>
                                            <div style="display: flex;">
                                                <label style="padding: 10px; margin-right: 10px" for="roles">Are you Learner or Lecturer?</label>
                                                <select id="roles" name="role" aria-label="Default select example">
                                                    <option value="3">Learner</option>
                                                    <option value="2">Lecturer</option>
                                                </select>
                                                <c:if test="${not empty errorMessage}">
                                                    <h5 style="color:red">${errorMessage}</h5>
                                                </c:if>
                                            </div>
                                            <br/>
                                            <div class="signup-action">
                                                <div class="course-sidebar-list">
                                                    <input class="signup-checkbox" type="checkbox" id="sing-up">
                                                    <label class="sign-check" for="sing-up"><span>Accept the terms and
                                                            <a href="#">Privacy Policy</a></span></label>
                                                </div>
                                            </div>
                                            <div class="sing-buttom mb-20">
                                                <button class="sing-btn">Register now</button>
                                            </div>
                                            <div class="acount-login text-center">
                                                <span>Already have an account? <a href="login.jsp">Log in</a></span>
                                            </div>
                                            <div class="sign-social text-center">
                                                <span>Or Sign- in with</span>
                                            </div>
                                            <div class="sign-social-icon">
                                                <div class="sign-facebook">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="9.034"
                                                         height="18.531" viewBox="0 0 9.034 18.531">
                                                    <path id="Path_2121121" data-name="Path 212"
                                                          d="M183.106,757.2v-1.622c0-.811.116-1.274,1.39-1.274h1.621v-3.127h-2.664c-3.243,0-4.285,1.506-4.285,4.169v1.969h-2.085v3.127h1.969v9.265h4.054v-9.265h2.664l.347-3.243Z"
                                                          transform="translate(-177.083 -751.176)" fill="#2467ec" />
                                                    </svg>
                                                    <a href="#">Facebook</a>
                                                </div>
                                                <div class="sign-gmail">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="21.692"
                                                         height="16.273" viewBox="0 0 21.692 16.273">
                                                    <g id="gmail-01" transform="translate(0 -63.953)">
                                                    <path id="Path_868365" data-name="Path 863185"
                                                          d="M1.479,169.418H4.93v-8.381l-2.26-3.946L0,157.339v10.6a1.479,1.479,0,0,0,1.479,1.479Z"
                                                          transform="translate(0 -89.192)" fill="#0085f7" />
                                                    <path id="Path_863286" data-name="Path 8683106"
                                                          d="M395.636,169.418h3.451a1.479,1.479,0,0,0,1.479-1.479v-10.6l-2.666-.248-2.264,3.946v8.381Z"
                                                          transform="translate(-378.874 -89.192)"
                                                          fill="#00a94b" />
                                                    <path id="Path_8322687" data-name="Path 831687"
                                                          d="M349.816,65.436,347.789,69.3l2.027,2.541,4.93-3.7V66.176A2.219,2.219,0,0,0,351.2,64.4Z"
                                                          transform="translate(-333.054)" fill="#ffbc00" />
                                                    <path id="Path_863088" data-name="Path 868038"
                                                          d="M72.7,105.365l-1.932-4.08L72.7,98.956l5.916,4.437,5.916-4.437v6.409L78.619,109.8Z"
                                                          transform="translate(-67.773 -33.52)" fill="#ff4131"
                                                          fill-rule="evenodd" />
                                                    <path id="Path_8682519" data-name="Path 868921"
                                                          d="M0,66.176v1.972l4.93,3.7V65.436L3.55,64.4A2.219,2.219,0,0,0,0,66.176Z"
                                                          transform="translate(0)" fill="#e51c19" />
                                                    </g>
                                                    </svg>
                                                    <a href="#">Google</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- signup-area-start -->

    </main>

    <!-- JS here -->
    <script src="${pageContext.request.contextPath}/js/vendor/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/vendor/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/meanmenu.js"></script>
    <script src="${pageContext.request.contextPath}/js/swiper-bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/huicalendar.js"></script>
    <script src="${pageContext.request.contextPath}/js/parallax.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/backToTop.js"></script>
    <script src="${pageContext.request.contextPath}/js/nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/counterup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/ajax-form.js"></script>
    <script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/isotope.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/imagesloaded.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>


<!-- Mirrored from codeskdhaka.com/html/eduman-prv/eduman/registration.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 May 2024 15:25:34 GMT -->
</html>