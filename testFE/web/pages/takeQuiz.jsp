<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Take Quiz</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff; /* Light blue background */
            color: #333; /* Dark gray text */
            margin: 20px;
        }
        
        h1 {
            color: #0074D9; /* Blue header */
        }
        
        h2, h3 {
            color: #0074D9; /* Blue headers */
        }
        
        form {
            margin-top: 20px;
        }
        
        button {
            background-color: #0074D9; /* Blue button */
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }
        
        button:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }
        
        hr {
            border: 0.5px solid #0074D9; /* Blue horizontal rule */
        }
    </style>
</head>
<body>
    <h1>Take Quiz</h1>
    
    <c:if test="${not empty quiz}">
        <h2>Quiz: ${quiz.quizName}</h2>
        <p>Graded: ${quiz.graded}</p>
        <p>Created Date: ${quiz.createdDate}</p>
        
        <form id="quizForm" action="${pageContext.request.contextPath}/submitQuiz" method="post">
            <c:forEach var="question" items="${quiz.questions}">
                <div>
                    <h3>Question: ${question.questionText}</h3>
                    <c:forEach var="answer" items="${question.answers}">
                        <div>
                            <input type="radio" name="question_${question.questionID}" value="${answer.answerID}" id="answer_${answer.answerID}">
                            <label for="answer_${answer.answerID}">${answer.answerText}</label>
                        </div>
                    </c:forEach>
                </div>
                <hr>
            </c:forEach>
            <input type="hidden" name="studentId" value="1"> <!-- Replace with actual student ID -->
            <input type="hidden" name="quizId" value="${quiz.quizId}">
            <!-- Removed time_taken input -->
            <button type="submit">Submit Quiz</button>
        </form>
    </c:if>
    
    <c:if test="${empty quiz}">
        <div>
            <p>No quiz found.</p>
        </div>
    </c:if>
</body>
</html>
