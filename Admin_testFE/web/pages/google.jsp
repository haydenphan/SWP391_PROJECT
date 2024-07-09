<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="DAO.UserDAO" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.security.NoSuchAlgorithmException" %>
<%@ page import="java.util.logging.Level" %>
<%@ page import="java.util.logging.Logger" %>
<%@ page import="utils.PasswordUtils" %>
<!DOCTYPE html>
<html>
    <head>
        <%-- HEAD --%>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <%@ include file="../template/head.jsp" %>
        <style>
            body {
                background-color: #f8f9fa;
            }
            .form-container {
                margin-top: 50px;
                padding: 30px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }
            .form-check-label {
                font-weight: bold;
                font-size: 1.1em;
            }
            .form-check-input {
                margin-top: 0.3em;
            }
            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
                transition: background-color 0.3s ease;
            }
            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #0056b3;
            }
        </style>
    </head>
    <body>

        <%
            User pojo = (User) request.getAttribute("pojo");
            String defaultBio = "No bio yet";
            User user = new User();
            user.setEmail(pojo.getEmail());
            user.setUserName(pojo.getUserName());
            user.setFirstName(pojo.getFirstName());
            user.setLastName(pojo.getLastName());
            user.setRole(1);
            user.setRegistrationDate(LocalDateTime.now());
            user.setIsActive(true);
            user.setBio(defaultBio);
            user.setAvatar(pojo.getAvatar());
            user.setProviderID(2);
            user.setPasswordHash(null);
            user.setStoredSalt(null);
            System.out.println(user.toString());
            session.setAttribute("user", user);
        %>

        <!-- form start -->
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="form-container">
                        <h2 class="text-center mb-4">Let us know more about you!</h2>
                        <form action="choose-role" method="POST">
                            <div class="form-check mb-3">
                                <input class="form-check-input" type="radio" name="role" id="flexRadioDefault1" value="1">
                                <label class="form-check-label" for="flexRadioDefault1">
                                    Learner
                                </label>
                            </div>
                            <div class="form-check mb-4">
                                <input class="form-check-input" type="radio" name="role" id="flexRadioDefault2" value="2" checked>
                                <label class="form-check-label" for="flexRadioDefault2">
                                    Instructor
                                </label>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary btn-lg">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- form end -->

        <!-- JS here -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <%@ include file="../template/script.jsp" %>
    </body>
</html>