<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.CategoryDAO" %>
<%@ page import="DAO.LanguageDAO" %>
<%@ page import="DAO.LevelDAO" %>
<%@ page import="model.*" %>

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
            <div class="contact-area pt-120 pb-90">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12 col-lg-7 col-md-12">
                            <form id="courseForm" action="${pageContext.request.contextPath}/instructor-registration" method="POST" enctype="multipart/form-data">
                                <div class="contact-area-wrapper">
                                    <div class="section-title mb-50">
                                        <h2>Enter Your Information:</h2>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-6">
                                        <h4><label for="courseName">Full Name:</label></h4>
                                        <div class="contact-from-input mb-20">
                                            <input value="${user.getFirstName()} ${user.getLastName()}" id="name" name="name" type="text" placeholder="Full Name" required>
                                        </div>
                                    </div>
                                    <div class="col-xl-6">
                                        <h4><label for="price">Email:</label></h4>
                                        <div class="contact-from-input mb-20">
                                            <input value="${user.getEmail()}" id="email" name="email" type="email" placeholder="Email" required>
                                        </div>
                                    </div>

                                    <!-- Cover Image Upload -->
                                    <div class="col-xl-6">
                                        <div class="contact-from-input mb-20">
                                            <h4><label for="coverImage">Your Image:</label></h4>
                                            <input value="${user.getAvatar()}" id="coverImage" name="coverImage" type="file" required>
                                        </div>
                                    </div>

                                    <div class="col-xl-6">
                                        <div class="contact-from-input mb-20">
                                            <h4><label for="credentials">Your Credentials:</label></h4>
                                            <input id="credentials" name="credentials" type="file" multiple required>
                                            <small class="form-text text-muted">You can select multiple files.</small>
                                        </div>
                                    </div>

                                    <div class="col-xl-12">
                                        <div class="contact-from-input mb-20">
                                            <h4><label for="description">Bio: </label></h4>
                                            <textarea id="bio" placeholder="Bio" name="bio"></textarea>
                                        </div>
                                    </div>

                                    <div class="col-xl-12">
                                        <div class="sing-buttom mb-20">
                                            <button type="submit" class="sing-btn">Submit</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <%-- FOOTER --%>
        <%@ include file="../template/footer.jsp" %>

        <%-- BACK TO TOP --%>
        <%@ include file="../template/backToTop.jsp" %>

        <!-- JS here -->
        <%@ include file="../template/script.jsp" %>
    </body>
</html>
