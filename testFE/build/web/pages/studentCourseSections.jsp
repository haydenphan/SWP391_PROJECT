<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Course Sections</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #004080;
        }
        .section {
            background-color: #e6f7ff;
            border: 1px solid #b3d9ff;
            border-radius: 8px;
            margin: 20px 0;
            padding: 20px;
        }
        .section h2 {
            color: #004080;
        }
        .section p {
            margin: 10px 0;
        }
        .quizzes {
            background-color: #cceeff;
            border-radius: 8px;
            padding: 10px;
        }
        .quizzes ul {
            list-style-type: none;
            padding: 0;
        }
        .quizzes li {
            margin: 5px 0;
        }
        .quizzes a {
            color: #004080;
            text-decoration: none;
            font-weight: bold;
        }
        .quizzes a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Course Sections for Course ID: ${courseId}</h1>
        <c:if test="${not empty sectionList}">
            <c:forEach var="section" items="${sectionList}">
                <div class="section">
                    <h2>${section.sectionName}</h2>
                    <p>${section.sectionDescription}</p>
                    
                    <p>Created on: ${section.createdDate}</p>
                    <c:if test="${not empty section.quizzes}">
                        <div class="quizzes">
                            <h3>Quizzes:</h3>
                            <ul>
                                <c:forEach var="quiz" items="${section.quizzes}">
                                    <li>
                                        <strong>${quiz.quizName}</strong>
                                        <a href="${pageContext.request.contextPath}/take-quiz-servlet?quizId=${quiz.quizId}">Do Quiz</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </c:if>
                    <c:if test="${empty section.quizzes}">
                        <p>No quizzes available for this section.</p>
                    </c:if>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${empty sectionList}">
            <p>No sections available for this course.</p>
        </c:if>
    </div>
</body>
</html>
