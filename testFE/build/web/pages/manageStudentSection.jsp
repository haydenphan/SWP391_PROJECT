<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Student Sections</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            margin: 20px;
        }
        .section-card {
            padding: 20px;
            margin-bottom: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
        .section-card h3 {
            color: #0074D9;
            margin-top: 0;
        }
        .quiz-list {
            list-style-type: none;
            padding-left: 0;
        }
        .quiz-item {
            margin-bottom: 10px;
        }
        .quiz-item a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }
        .quiz-item a:hover {
            color: #0074D9;
        }
        .question-list {
            list-style-type: none;
            padding-left: 20px;
        }
        .question-item {
            margin-bottom: 5px;
            color: #666;
        }
    </style>
</head>
<body>
    <h2>Sections</h2>
    <c:forEach var="section" items="${sectionList}">
        <div class="section-card">
            <h3>Section ${section.sectionOrder}: ${section.sectionName}</h3>
            <ul class="quiz-list">
                <c:forEach var="quiz" items="${section.quizzes}">
                    <li class="quiz-item">
                        <a href="${pageContext.request.contextPath}/start-quiz-servlet?quizId=${quiz.quizId}">Quiz ${quiz.quizId}: ${quiz.quizName}</a>
                        <!-- Optional: Display questions if needed -->
                        <ul class="question-list">
                            <c:forEach var="question" items="${quiz.questions}">
                                <li class="question-item">Question: ${question.questionText}</li>
                            </c:forEach>
                        </ul>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </c:forEach>
</body>
</html>
