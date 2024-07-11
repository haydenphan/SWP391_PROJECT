<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.User, model.Course, DAO.*" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
<style>
.container {
    width: 80%;
    margin: 20px auto;
    padding: 20px;
    background-color: #ffffff;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.profile-header {
    text-align: center;
    margin-bottom: 20px;
}

.avatar {
    width: 150px;
    height: 150px;
    border-radius: 50%;
}

.profile-content {
    margin-bottom: 20px;
}

.profile-info {
    list-style-type: none;
    padding: 0;
}

.profile-info li {
    margin-bottom: 10px;
}

.courses-list .course-item {
    border: 1px solid #ddd;
    padding: 10px;
    margin-bottom: 10px;
}

/* Đoạn CSS mới với tone màu xanh biển */
.profile-header,
.profile-header h1,
.profile-content h2,
.courses-list .course-item h3 {
    color: #007ea7; /* Màu xanh biển tối */
}
</style>

</head>
<body>
<%
    int userID = Integer.parseInt(request.getParameter("userID"));
    UserDAO dao = new UserDAO();
    User nUser = dao.getUserByID(userID);
    List<Course> courseList = CourseEnrollmentDAO.getCoursesByUserID(userID);
%>
<div class="container">
    <div class="profile-header">
        <img src="<%=nUser.getAvatar()%>" alt="Avatar" class="avatar">
        <h1><%= nUser.getFirstName() %> <%= nUser.getLastName() %></h1>
    </div>
    <div class="profile-content">
        <h2>My Profile</h2>
        <ul class="profile-info">
            <li><strong>Registration Date:</strong> <%= nUser.getRegistrationDate() %></li>
            <li><strong>First Name:</strong> <%= nUser.getFirstName() %></li>
            <li><strong>Last Name:</strong> <%= nUser.getLastName() %></li>
            <li><strong>Username:</strong> <%= nUser.getUserName() %></li>
            <li><strong>Email:</strong> <%= nUser.getEmail() %></li>
            <li><strong>Role:</strong> <%= nUser.getRoleName() %></li>
            <li><strong>Biography:</strong> <%= nUser.getBio() %></li>
        </ul>
    </div>
    <div class="profile-content">
        <h2>Enrolled Courses</h2>
        <div class="courses-list">
            <c:forEach var="course" items="<%=courseList%>">
                <div class="course-item">
                    <h3>${course.getCourseName()}</h3>
                    <p>${course.getDescription()}</p>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>
