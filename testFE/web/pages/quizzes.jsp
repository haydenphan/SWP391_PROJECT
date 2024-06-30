<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quizzes</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff; /* Màu nền xanh dương nhạt */
            color: #333; /* Màu chữ đen */
            margin: 20px;
        }
        h1 {
            color: #007bff; /* Màu tiêu đề xanh dương */
        }
        .quiz-container {
            margin: 20px 0;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff; /* Màu nền trắng */
            box-shadow: 0 0 10px rgba(0,0,0,0.1); /* Đổ bóng nhẹ */
        }
        .quiz-container h2 {
            margin: 0;
            padding: 0;
            color: #007bff; /* Màu tiêu đề quiz xanh dương */
        }
        .quiz-container p {
            margin: 5px 0;
        }
        .btn-start {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff; /* Màu nút xanh dương */
            color: #fff; /* Màu chữ trắng */
            text-decoration: none;
            border-radius: 5px;
        }
        .btn-start:hover {
            background-color: #0056b3; /* Màu nút xanh dương nhạy cảm */
        }
    </style>
</head>
<body>
    <h1>Quizzes</h1>
    <c:if test="${not empty quizzes}">
        <c:forEach var="quiz" items="${quizzes}">
            <div class="quiz-container">
                <h2>Quiz: ${quiz.quizName}</h2>
                <p>Graded: ${quiz.graded ? 'Yes' : 'No'}</p>
                <p>Created Date: ${quiz.createdDate}</p>
                <a class="btn-start" href="${pageContext.request.contextPath}/start-quiz-servlet?quizId=${quiz.quizId}">Start Quiz</a>
            </div>
        </c:forEach>
    </c:if>
    <c:if test="${empty quizzes}">
        <div class="quiz-container">
            <p>No quizzes available for this section.</p>
        </div>
    </c:if>
</body>
</html>
