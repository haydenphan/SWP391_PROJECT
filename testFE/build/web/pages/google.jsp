<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="DAO.UserDAO" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.security.NoSuchAlgorithmException" %>
<%@ page import="java.util.logging.Level" %>
<%@ page import="java.util.logging.Logger" %>
<%@ page import="utils.PasswordUtils" %>
<!DOCTYPE html>
<html>
    <head>
        <%-- HEAD --%>
        <%@ include file="../template/head.jsp" %>
    </head>
    <body>

        <% 
            User pojo = (User)request.getAttribute("pojo");
            String hashedPassword = "GG";
            String defaultBio = "No bio yet";

            User user = new User(null, hashedPassword, pojo.getFirstName(), pojo.getLastName(), pojo.getEmail(), 0, pojo.getRegistrationDate(), true, pojo.getAvatar(), defaultBio, null);
            System.out.println(user.toString());
            session.setAttribute("user", user);
        %>

        <!-- form start -->
        <main class="container">
            <h2>
                Let us know more about you!
            </h2>
            <div class="container">
                <form action="choose-role" method="POST">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="role" id="flexRadioDefault1" value="1">
                        <label class="form-check-label" for="flexRadioDefault1">
                            Learner
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="role" id="flexRadioDefault2" value="2" checked>
                        <label class="form-check-label" for="flexRadioDefault2">
                            Lecturer
                        </label>
                    </div>

                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </main>
        <!-- form end -->

        <!-- JS here -->
        <%@ include file="../template/script.jsp" %>
    </body>
</html>
