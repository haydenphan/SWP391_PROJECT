<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Course Sections</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff; /* Màu xanh dương nhạt */
            color: #333; /* Màu chữ đen */
            margin: 20px;
        }
        h1, h2, h3 {
            color: #007bff; /* Màu xanh dương */
        }
        .btn-container {
            margin-top: 10px;
        }
        .btn-quiz {
            display: inline-block;
            padding: 8px 12px;
            background-color: #007bff; /* Màu nút xanh dương */
            color: #fff; /* Màu chữ trắng */
            text-decoration: none;
            border-radius: 4px;
        }
        .btn-quiz:hover {
            background-color: #0056b3; /* Màu nút xanh dương nhạy cảm */
        }
    </style>
</head>
<body>
    <h1>Course Sections</h1>
    <c:forEach var="section" items="${courseSections}">
        <div style="background-color: #fff; /* Màu nền trắng */ padding: 10px; margin-bottom: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1);">
            <h2>Section: ${section.sectionName}</h2>
            <p>Order: ${section.sectionOrder}</p>
            <p>Created Date: ${section.createdDate}</p>

            <h3>Lectures:</h3>
            <ul>
                <c:forEach var="lecture" items="${section.lectures}">
                    <li>${lecture.lectureName}</li>
                </c:forEach>
            </ul>

            <h3>Quizzes:</h3>
            <ul>
                <c:forEach var="quiz" items="${section.quizzes}">
                    <li>${quiz.quizName} - Graded: ${quiz.graded}</li>
                </c:forEach>
            </ul>

            <div class="btn-container">
                <a class="btn-quiz" href="${pageContext.request.contextPath}/quiz-servlet?sectionId=${section.sectionID}">
                    <span class="me-2">Do Quiz</span>
                    <i class="far fa-pencil-alt"></i>
                </a>
            </div>
        </div>
    </c:forEach>
</body>
</html>
