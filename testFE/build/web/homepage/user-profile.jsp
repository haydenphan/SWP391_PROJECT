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
        <main>
            <!-- hero-area-start -->
            <div class="hero-arera course-item-height" data-background="${pageContext.request.contextPath}/img/slider/course-slider.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-course-1-text">
                                <h2>User Profile</h2>
                            </div>
                            <div class="course-title-breadcrumb">
                                <nav>
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">User</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- hero-area-end -->


            <!-- User Profile Start-->
            <div class="course-details-area pt-120 pb-100">
                <div class="container">
                    <div class="student-profile-author pb-30">
                        <div class="student-profile-author-img">
                            <img src="${pageContext.request.contextPath}/img/course/course-student.png" alt="img not found" />
                        </div>
                        <div class="student-profile-author-text">
                            <span>Hello,</span>
                            <h3 class='student-profile-author-name'>User</h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xl-3 col-lg-4">
                            <div class="student-profile-sidebar mb-30">
                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link active" id="home-tab" data-bs-toggle="tab"
                                                data-bs-target="#home" type="button" role="tab" aria-controls="home"
                                                aria-selected="true"><i class="fas fa-tachometer-alt-fast"></i>
                                            Dashboard</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="profile-tab" data-bs-toggle="tab"
                                                data-bs-target="#profile" type="button" role="tab" aria-controls="profile"
                                                aria-selected="false"><i class="fas fa-user"></i> My Profile</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="contact-tab" data-bs-toggle="tab"
                                                data-bs-target="#contact" type="button" role="tab" aria-controls="contact"
                                                aria-selected="false"><i class="fas fa-graduation-cap"></i> Enrolled
                                            Courses</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="wishlist-tab" data-bs-toggle="tab"
                                                data-bs-target="#wishlist" type="button" role="tab" aria-controls="wishlist"
                                                aria-selected="false"><i class="fas fa-bookmark"></i> Wishlist</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="reviews-tab" data-bs-toggle="tab"
                                                data-bs-target="#reviews" type="button" role="tab" aria-controls="reviews"
                                                aria-selected="false"><i class="fas fa-star"></i> Reviews</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="quiz-tab" data-bs-toggle="tab" data-bs-target="#quiz"
                                                type="button" role="tab" aria-controls="quiz" aria-selected="false"><i
                                                class="fas fa-cubes"></i> My Quiz Attempts</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="history-tab" data-bs-toggle="tab"
                                                data-bs-target="#history" type="button" role="tab" aria-controls="history"
                                                aria-selected="false"><i class="fas fa-cart-plus"></i> Order
                                            History</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="ques-tab" data-bs-toggle="tab" data-bs-target="#ques"
                                                type="button" role="tab" aria-controls="ques" aria-selected="false"><i
                                                class="fas fa-fist-raised"></i> Question &
                                            Answer</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="setting-tab" data-bs-toggle="tab"
                                                data-bs-target="#setting" type="button" role="tab" aria-controls="setting"
                                                aria-selected="false"><i class="fas fa-cog"></i> Settings</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="logout-tab" data-bs-toggle="tab"
                                                data-bs-target="#logout" type="button" role="tab" aria-controls="logout"
                                                aria-selected="false" onclick="window.location.href = 'login.jsp';"><i class="fas fa-sign-out-alt"></i> Logout</button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-xl-9 col-lg-8">
                            <div class="student-profile-content">
                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="home" role="tabpanel"
                                         aria-labelledby="home-tab">
                                        <h4 class='mb-25'>Dashboard</h4>
                                        
                                    </div>
                                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                        <h4 class='mb-25'>My Profile</h4>
                                        <ul class='student-profile-info'>
                                            <li>
                                                <h5>Registration Date :</h5>
                                                <span>October 15, 2022 10:30 am</span>
                                            </li>
                                            <li>
                                                <h5>First Name :</h5>
                                                <span>Steve</span>
                                            </li>
                                            <li>
                                                <h5>Last Name :</h5>
                                                <span>Smith</span>
                                            </li>
                                            <li>
                                                <h5>Username :</h5>
                                                <span>Steve3h</span>
                                            </li>
                                            <li>
                                                <h5>Email :</h5>
                                                <span>adminh@gmail.com</span>
                                            </li>
                                            <li>
                                                <h5>Phone :</h5>
                                                <span>(987) 547587587</span>
                                            </li>
                                            <li>
                                                <h5>Occupation :</h5>
                                                <span>Student</span>
                                            </li>
                                            <li>
                                                <h5>Biography :</h5>
                                                <span>Alison Johnson is finishing her first year at DePaul University where
                                                    she is interested in business. Although she has yet to declare a major,
                                                    she’s considering finance or marketing. After watching her parents run a
                                                    restaurant for years, she knew at a very young age that she also wanted
                                                    to go into business.</span>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                                        <h4 class='mb-25'>Enrolled Courses</h4>
                                        
                                    </div>
                                    <div class="tab-pane fade" id="wishlist" role="tabpanel" aria-labelledby="wishlist-tab">
                                        <h4 class='mb-25'>Wishlist</h4>
                                        
                                    </div>
                                    <div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
                                        <h4 class='mb-25'>Reviews</h4>
                                        
                                    </div>
                                    <div class="tab-pane fade" id="quiz" role="tabpanel" aria-labelledby="quiz-tab">
                                        <p>No quiz attempts yet.</p>
                                    </div>
                                    <div class="tab-pane fade" id="history" role="tabpanel" aria-labelledby="history-tab">
                                        <h4 class='mb-25'>Order History</h4>
                                        
                                    </div>
                                    <div class="tab-pane fade" id="ques" role="tabpanel" aria-labelledby="ques-tab">
                                        <p>No question completed yet.</p>
                                    </div>
                                    <div class="tab-pane fade" id="setting" role="tabpanel" aria-labelledby="setting-tab">
                                        <h4 class='mb-25'>Settings</h4>
                                        <div class="student-profile-enroll">
                                            <ul class="nav mb-30" id="myTab" role="tablist">
                                                <li class="nav-item" role="presentation">
                                                    <button class="nav-link active" id="profileA-tab" data-bs-toggle="tab"
                                                            data-bs-target="#profileA" type="button" role="tab"
                                                            aria-controls="profileA" aria-selected="true">Profile</button>
                                                </li>
                                                <li class="nav-item" role="presentation">
                                                    <button class="nav-link" id="password-tab" data-bs-toggle="tab"
                                                            data-bs-target="#password" type="button" role="tab"
                                                            aria-controls="password" aria-selected="false">Password</button>
                                                </li>
                                                <li class="nav-item" role="presentation">
                                                    <button class="nav-link" id="completedA-tab" data-bs-toggle="tab"
                                                            data-bs-target="#completedA" type="button" role="tab"
                                                            aria-controls="completedA" aria-selected="false">Social</button>
                                                </li>
                                            </ul>
                                            <div class="tab-content" id="myTabContent">
                                                <div class="tab-pane fade show active" id="profileA" role="tabpanel"
                                                     aria-labelledby="profileA-tab">
                                                    <div class="student-profile-settings">
                                                        <div class="student-profile-setting-img mb-40">
                                                            <div class="student-profile-setting-cover-img"
                                                                 data-background="${pageContext.request.contextPath}/img/slider/course-slider.jpg">
                                                            </div>
                                                            <div class="student-profile-setting-author-img">
                                                                <img src="${pageContext.request.contextPath}/img/course/course-student.png" alt="" />
                                                            </div>
                                                        </div>
                                                        <form action="#">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="contact-from-input mb-20">
                                                                        <label htmlFor="FirstName">First Name</label>
                                                                        <input id='FirstName' type="text"
                                                                               placeholder="First Name" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="contact-from-input mb-20">
                                                                        <label htmlFor="LastName">Last Name</label>
                                                                        <input id='LastName' type="text"
                                                                               placeholder="Last Name" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="contact-from-input mb-20">
                                                                        <label htmlFor="User">User Name</label>
                                                                        <input id='User' type="text"
                                                                               placeholder="User Name" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="contact-from-input mb-20">
                                                                        <label htmlFor="Email">Email</label>
                                                                        <input id='Email' type="email"
                                                                               placeholder="Email" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="contact-from-input mb-20">
                                                                        <label htmlFor="Phone">Phone </label>
                                                                        <input id='Phone' type="text" placeholder="Phone" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="contact-from-input mb-20">
                                                                        <label htmlFor="Occupation">Occupation </label>
                                                                        <input id='Occupation' type="text"
                                                                               placeholder="Occupation " />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="contact-from-input mb-20">
                                                                        <label htmlFor="Bio">Biography </label>
                                                                        <textarea id='Bio'
                                                                                  placeholder="Biography"></textarea>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-12">
                                                                    <div class="cont-btn mb-20 mt-10">
                                                                        <button type='button' class="cont-btn">Update
                                                                            Profile</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                                <div class="tab-pane fade" id="password" role="tabpanel"
                                                     aria-labelledby="password-tab">
                                                    <form action="#">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="contact-from-input mb-20">
                                                                    <label htmlFor="Current">Current Password</label>
                                                                    <input id='Current' type="password"
                                                                           placeholder="Type password" />
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="contact-from-input mb-20">
                                                                    <label htmlFor="New">New Password</label>
                                                                    <input id='New' type="password"
                                                                           placeholder="Type password" />
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="contact-from-input mb-20">
                                                                    <label htmlFor="Retype">Re-type New Password</label>
                                                                    <input id='Retype' type="password"
                                                                           placeholder="Type password" />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-12">
                                                                <div class="cont-btn mb-20 mt-10">
                                                                    <button type='button' class="cont-btn">Update
                                                                        Profile</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="tab-pane fade" id="completedA" role="tabpanel"
                                                     aria-labelledby="completedA-tab">
                                                    <div class="student-social-profile-link">
                                                        <span class='mb-20'>Social Profile Link</span>
                                                        <form action="#">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="contact-from-input mb-20">
                                                                        <input type="text"
                                                                               placeholder="Write Your Facebook URL" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="contact-from-input mb-20">
                                                                        <input type="text"
                                                                               placeholder="Write Your Twitter URL" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="contact-from-input mb-20">
                                                                        <input type="text"
                                                                               placeholder="Write Your Instagram URL" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="contact-from-input mb-20">
                                                                        <input type="text"
                                                                               placeholder="Write Your Linkedin URL" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-12 ">
                                                                    <div class="cont-btn mb-20 mt-10">
                                                                        <button type='button' class="cont-btn">Update
                                                                            Profile</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
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
            <!-- User Profile End-->

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

</html>