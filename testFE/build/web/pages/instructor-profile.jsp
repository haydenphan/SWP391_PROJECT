<%@page import="java.time.ZoneId"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>
<%@ page import="DAO.*" %>
<%@ page import="java.util.ArrayList" %>

<!doctype html>
<html class="no-js" lang="zxx">

    <head>
        <%-- HEAD --%>
        <%@ include file="../template/head.jsp" %>

        <!-- jQuery and Bootstrap JS -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <script>
            const contextPath = '${pageContext.request.contextPath}';
        </script>
    </head>

    <body>
        <script src="${pageContext.request.contextPath}/js/instructorWallet.js"></script>

        <%-- PRE LOADER --%>
        <%@ include file="../template/preLoader.jsp" %>

        <%-- SIDE TOGGLE --%>
        <%@ include file="../template/sideToggle.jsp" %>

        <%-- HEADER --%>
        <%@ include file="../template/header.jsp" %>

        <main>
            <%
                int instructorID = ((User) session.getAttribute("user")).getUserID();
                List<Course> coursesList = CourseDAO.getCoursesByInstructor(instructorID);
                List<InstructorFeedback> feedbackList = InstructorFeedbackDAO.getAllFeedbackByInstructorID(instructorID);
                InstructorCertificatesDAO icDAO = new InstructorCertificatesDAO();
                List<InstructorCertificates> certificateList = icDAO.getAllCertificatesByUserID(instructorID);

                // Convert LocalDateTime to Date for feedbackList
                List<Map<String, Object>> feedbackWithDates = new ArrayList<>();
                for (InstructorFeedback feedback : feedbackList) {
                    Map<String, Object> feedbackMap = new HashMap<>();
                    feedbackMap.put("learner", feedback.getLearner());
                    feedbackMap.put("rating", feedback.getRating());
                    feedbackMap.put("comment", feedback.getComment());
                    LocalDateTime localDateTime = feedback.getFeedbackDate();
                    Date date = Date.from(localDateTime.atZone(ZoneId.systemDefault()).toInstant());
                    feedbackMap.put("feedbackDate", date);
                    feedbackWithDates.add(feedbackMap);
                }
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
                            <img style="width: 200px; height: 200px" id="avatarImage" src="<%=user.getAvatar()%>" alt="img not found" />
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
                            <span>Hello instructor,</span>
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
                                        <button class="nav-link" id="profile-tab" data-bs-toggle="tab"
                                                data-bs-target="#profile" type="button" role="tab" aria-controls="profile"
                                                aria-selected="false"><i class="fas fa-user"></i> My Profile</button>
                                    </li>

                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="reviews-tab" data-bs-toggle="tab"
                                                data-bs-target="#reviews" type="button" role="tab" aria-controls="reviews"
                                                aria-selected="false"><i class="fas fa-star"></i> Reviews</button>
                                    </li>

                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="certificate-tab" data-bs-toggle="tab"
                                                data-bs-target="#certificate" type="button" role="tab" aria-controls="certificate"
                                                aria-selected="false"><i class="fas fa-bookmark"></i> Credentials</button>
                                    </li>

                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="wallet-tab" data-bs-toggle="tab" data-bs-target="#wallet"
                                                type="button" role="tab" aria-controls="wallet" aria-selected="false"><i class="fas fa-wallet"></i> Wallet</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="setting-tab" data-bs-toggle="tab"
                                                data-bs-target="#setting" type="button" role="tab" aria-controls="setting"
                                                aria-selected="false"><i class="fas fa-cog"></i> Settings</button>
                                    </li>

                                </ul>
                            </div>
                        </div>
                        <div class="col-xl-9 col-lg-8">
                            <div class="student-profile-content">
                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab">
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
                                                <h5>Role :</h5>
                                                <span><%=user.getRoleName()%></span>
                                            </li>
                                            <li>
                                                <h5>Biography :</h5>
                                                <span><%=user.getBio()%></span>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
                                        <h4 class='mb-25'>Reviews</h4>
                                        <div class="student-profile-reviews">
                                            <c:forEach var="feedback" items="<%=feedbackWithDates%>">
                                                <div class="student-profile-reviews-item mb-30">
                                                    <div style="display: flex; justify-content: space-between" class="student-profile-reviews-course-title">
                                                        <h5>${feedback.learner.getFirstName()} ${feedback.learner.getLastName()}</h5>
                                                        <h5><fmt:formatDate value="${feedback.feedbackDate}" pattern="HH:mm dd-MM-yyyy" /></h5>
                                                    </div>
                                                    <div class="student-profile-reviews-text">
                                                        <div class="student-profile-reviews-text-wrap mb-20">
                                                            <div class="student-profile-review-icon">
                                                                <c:forEach var="i" begin="1" end="${feedback.rating}">
                                                                    <a href="#"><i class="fas fa-star"></i></a>
                                                                    </c:forEach>
                                                                    <c:forEach var="i" begin="${feedback.rating + 1}" end="5">
                                                                    <a href="#"><i class="far fa-star"></i></a>
                                                                    </c:forEach>
                                                            </div>
                                                            <div class="student-profile-review-update">
                                                                <form action="${pageContext.request.contextPath}/pages/report.jsp" method="post">
                                                                    <input type="hidden" name="feedbackId" value="${feedback.id}" />
                                                                    <button type='submit' class='student-profile-review-update-btn'>
                                                                        <i class="far fa-edit"></i> Report
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                        <div class="student-profile-review-content">
                                                            <p>${feedback.comment}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>

                                    </div>

                                    <div class="tab-pane fade" id="certificate" role="tabpanel" aria-labelledby="certificate-tab">
                                        <h4 class='mb-25'>Instructor Credentials</h4>
                                        <c:forEach var="certificate" items="<%=certificateList%>">
                                            <div style="margin-bottom: 18px" class="certificate-item">
                                                <a href="${certificate.certificateUrl}" target="_blank">View Certificate</a>
                                            </div>
                                        </c:forEach>
                                    </div>       

                                    <div class="tab-pane fade" id="wallet" role="tabpanel" aria-labelledby="wallet-tab">
                                        <h4 class='mb-25'>Wallet</h4>
                                        <div class="modal-body">
                                            <p id="walletBalance">Loading...</p>
                                            <form id="withdrawForm" action="${pageContext.request.contextPath}/withdraw" method="post">
                                                <div class="form-group">
                                                    <label for="accountNumber">Account Number:</label>
                                                    <input type="text" class="form-control" id="accountNumber" name="accountNumber" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="bankName">Bank Name:</label>
                                                    <input type="text" class="form-control" id="bankName" name="bankName" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="amount">Amount:</label>
                                                    <input type="number" class="form-control" id="amount" name="amount" required>
                                                </div>
                                                <button type="submit" class="btn btn-primary">Withdraw</button>
                                            </form>
                                        </div>
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
                                                <c:if test="<%=user.getProviderID() == 1%>">
                                                    <li class="nav-item" role="presentation">
                                                        <button class="nav-link" id="password-tab" data-bs-toggle="tab"
                                                                data-bs-target="#password" type="button" role="tab"
                                                                aria-controls="password" aria-selected="false">Password</button>
                                                    </li>
                                                </c:if>
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
                                                <c:if test="<%=user.getProviderID() == 1%>">
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
                                                                        <button type='submit' class="cont-btn">Update
                                                                            Profile</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </c:if>
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


    </body>

</html>
