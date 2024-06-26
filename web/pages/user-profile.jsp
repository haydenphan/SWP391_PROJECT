<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>
<%@ page import="DAO.*" %>
<%@ page import="java.util.*" %>

<!doctype html>
<html class="no-js" lang="zxx">


    <head>
        <%-- HEAD --%>
        <%@ include file="../template/head.jsp" %>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                int learnerID = ((User) session.getAttribute("user")).getUserID();
                courses = CourseEnrollmentDAO.getCoursesByUserID(learnerID);
            %>

            <!-- hero-area -->
            <jsp:include page="../template/heroArea.jsp">
                <jsp:param name="title" value="My profile" />
            </jsp:include>

            <!-- User Profile Start-->
            <div class="course-details-area pt-120 pb-100">
                <div class="container">
                    <div class="student-profile-author pb-30">
                        <div class="student-profile-author-img">
                            <img style="width: 200px; height: 200px" id="avatarImage" src="${user.getAvatar()}" alt="img not found" />
                            <input type="file" id="avatarUpload" style="display: none;" onchange="changeAva();">
                            <label for="avatarUpload" style="cursor: pointer;">
                                <span style="
                                      width: 30px;
                                      height: 30px;
                                      display: inline-block;
                                      background-image: url('${pageContext.request.contextPath}/img/icon/upload.png');
                                      background-size: cover;
                                      position: relative;
                                      top: -40px;
                                      left: 150px;">
                                </span>
                            </label>
                        </div>
                        <div class="student-profile-author-text">
                            <span>Hello,</span>
                            <h3 class='student-profile-author-name'>
                                <%=user.getFirstName()%> <%=user.getLastName()%>
                            </h3>
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
                                        <button class="nav-link" id="history-tab" data-bs-toggle="tab" data-bs-target="#history" 
                                                type="button" role="tab" aria-controls="history" aria-selected="false"><i 
                                                class="fas fa-cart-plus"></i> Order History</a>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="ques-tab" data-bs-toggle="tab" data-bs-target="#ques"
                                                type="button" role="tab" aria-controls="ques" aria-selected="false"><i
                                                class="fas fa-fist-raised"></i> Question & Answer</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="setting-tab" data-bs-toggle="tab"
                                                data-bs-target="#setting" type="button" role="tab" aria-controls="setting"
                                                aria-selected="false"><i class="fas fa-cog"></i> Settings
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
                                                <span><%=user.getRegistrationDate()%></span>
                                            </li>
                                            <li>
                                                <h5>First Name :</h5>
                                                <span><%=user.getFirstName()%></span>
                                            </li>
                                            <li>
                                                <h5>Last Name :</h5>
                                                <span><%=user.getLastName()%></span>
                                            </li>
                                            <li>
                                                <h5>Username :</h5>
                                                <span><%=user.getUserName()%></span>
                                            </li>
                                            <li>
                                                <h5>Email :</h5>
                                                <span><%=user.getEmail()%></span>
                                            </li>
                                            <li>
                                                <h5>Phone :</h5>
                                                <span></span>
                                            </li>
                                            <li>
                                                <h5>Role :</h5>
                                                <span><%=user.getRoleName()%></span>
                                            </li>
                                            <li>
                                                <h5>Biography :</h5>
                                                <span><%=user.getBio()%></span>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                                        <h4 class='mb-25'>My Enrolled Courses</h4>

                                        <div class="row">
                                            <c:forEach var="course" items="<%=courses%>">
                                                <c:set var="currentCourse" value="${course}" scope="request" />
                                                <jsp:include page="../template/course/learnerCourseComponent.jsp" />
                                            </c:forEach>
                                        </div>
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
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Transaction ID</th>
                                                    <th>Course Name</th>
                                                    <th>Amount</th>
                                                    <th>Date</th>
                                                    <th>Status</th>
                                                </tr>
                                            </thead>
                                            <tbody id="transaction-list">
                                                <!-- Transactions will be appended here by JavaScript -->
                                            </tbody>
                                        </table>
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
                                                                <img src="<%=user.getAvatar()%>" alt="" />
                                                            </div>
                                                        </div>
                                                        <form action="${pageContext.request.contextPath}/user-profile/update" method="post">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="contact-from-input mb-20">
                                                                        <label for="FirstName">First Name</label>
                                                                        <input id='FirstName' name ='firstName' type="text" value="<%=user.getFirstName()%>" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="contact-from-input mb-20">
                                                                        <label for="LastName">Last Name</label>
                                                                        <input id='LastName' name ='lastName' type="text" value="<%=user.getLastName()%>" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="contact-from-input mb-20">
                                                                        <label for="Email">Email</label>
                                                                        <input id='Email' name ='email' type="email" value="<%=user.getEmail()%>" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="contact-from-input mb-20">
                                                                        <label for="Bio">Biography</label>
                                                                        <textarea id='Bio' name ='bio'><%=user.getBio()%></textarea>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-12">
                                                                    <div class="cont-btn mb-20 mt-10">
                                                                        <button type='submit' class="cont-btn">Update Profile</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                                <div class="tab-pane fade" id="password" role="tabpanel"
                                                     aria-labelledby="password-tab">
                                                    <form action="user-profile/changePassword" method="POST">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="contact-from-input mb-20">
                                                                    <label htmlFor="Current">Current Password</label>
                                                                    <input name="oldPassword" id='Current' type="password"
                                                                           placeholder="Type password" />
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="contact-from-input mb-20">
                                                                    <label htmlFor="New">New Password</label>
                                                                    <input name="newPassword" id='New' type="password"
                                                                           placeholder="Type password" />
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="contact-from-input mb-20">
                                                                    <label htmlFor="Retype">Re-type New Password</label>
                                                                    <input name="confirmPassword" id='Retype' type="password"
                                                                           placeholder="Type password" />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-12">
                                                                <div class="cont-btn mb-20 mt-10">
                                                                    <button type='submit' class="cont-btn">Update Profile</button>
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
                                                                        <button type='button' class="cont-btn">Update Profile</button>
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

        <%-- FOOTER --%>
        <%@ include file="../template/footer.jsp" %>

        <%-- BACK TO TOP --%>
        <%@ include file="../template/backToTop.jsp" %>

        <!-- JS here -->
        <%@ include file="../template/script.jsp" %>

        <script>
            $(document).ready(function () {
                $.ajax({
                    url: '${pageContext.request.contextPath}/user-profile',
                    type: 'GET',
                    data: {action: 'getTransactions'},
                    success: function (data) {
                        var transactionList = $('#transaction-list');
                        transactionList.empty(); // Clear any existing content

                        if (data.length === 0) {
                            transactionList.append('<tr><td colspan="5">No transactions found.</td></tr>');
                        } else {
                            $.each(data, function (index, transaction) {
                                $.each(transaction.transactionDetails, function (i, details) {
                                    var row = '<tr>' +
                                            '<td>' + transaction.TransactionID + '</td>' +
                                            '<td>' + details.CourseID.CourseName + '</td>' +
                                            '<td>' + details.Price + '</td>' +
                                            '<td>' + transaction.TransactionDate + '</td>' +
                                            '<td>' + transaction.Status + '</td>' +
                                            '</tr>';
                                    transactionList.append(row);
                                });
                            });
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error('Error fetching transactions:', error);
                        $('#transaction-list').append('<tr><td colspan="5">Error fetching transactions.</td></tr>');
                    }
                });
            });
        </script>

    </body>

</html>