<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="DAO.*" %>
<%@ page import="model.*" %>
<%@ page import="java.util.*" %>

<%
    int quizId = Integer.parseInt(request.getParameter("quizId"));
    User user = (User) session.getAttribute("user");

    Quiz quiz = QuizDAO.getQuizById(quizId);
    List<QuizQuestion> questions = QuizQuestionDAO.getQuizQuestionsByQuizId(quizId);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Take Quiz</title>
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
                background-color: #e6f7ff;
                border: 1px solid #b3d9ff;
                border-radius: 8px;
            }
            h1 {
                text-align: center;
                color: #004080;
            }
            .question {
                background-color: #cceeff;
                border-radius: 8px;
                padding: 15px;
                margin: 20px 0;
                border: 1px solid #99ccff;
            }
            .question h3 {
                color: #004080;
            }
            .answer {
                margin: 10px 0;
            }
            .answer input[type="radio"] {
                margin-right: 10px;
            }
            .submit-btn {
                display: block;
                width: 100%;
                padding: 15px;
                background-color: #004080;
                color: white;
                border: none;
                border-radius: 8px;
                font-size: 16px;
                cursor: pointer;
            }
            .submit-btn:hover {
                background-color: #003366;
            }
            .view-results-btn {
                display: block;
                width: 100%;
                padding: 15px;
                background-color: #008000;
                color: white;
                border: none;
                border-radius: 8px;
                font-size: 16px;
                cursor: pointer;
                text-align: center;
                text-decoration: none;
            }
            .view-results-btn:hover {
                background-color: #006400;
            }
            #timer {
                text-align: center;
                font-size: 24px;
                color: red;
                margin-bottom: 20px;
            }
            .message {
                text-align: center;
                font-size: 18px;
                color: red;
                margin-bottom: 20px;
            }
        </style>
        <script>
            function startTimer(duration) {
                var timer = duration, minutes, seconds;
                setInterval(function () {
                    minutes = parseInt(timer / 60, 10);
                    seconds = parseInt(timer % 60, 10);

                    minutes = minutes < 10 ? "0" + minutes : minutes;
                    seconds = seconds < 10 ? "0" + seconds : seconds;

                    document.getElementById('timer').textContent = minutes + ":" + seconds;

                    if (--timer < 0) {
                        timer = 0;
                        document.forms['quizForm'].submit(); // Automatically submit the form when time is up
                    }
                }, 1000);
            }

            window.onload = function () {
                var duration = "${quiz.duration}".split(':');
                var totalSeconds = parseInt(duration[0]) * 60 + parseInt(duration[1]);
                startTimer(totalSeconds);
            };
        </script>
    </head>
    <body>
        <div class="container">
            <h1>Quiz: ${quiz.quizName}</h1>
            <div id="timer">Loading...</div>
            <form name="quizForm" action="${pageContext.request.contextPath}/submit-quiz-servlet" method="post">
                <c:forEach var="question" items="<%=questions%>">
                    <div class="question">
                        <h3>${question.questionText}</h3>
                        <c:forEach var="answer" items="${QuizAnswerDAO.getAnswersByQuestionId(question.questionID)}">
                            <div class="answer">
                                <input type="radio" name="question_${question.questionID}" value="${answer.answerID}" /> ${answer.answerText}
                            </div>
                        </c:forEach>
                    </div>
                </c:forEach>
                <input type="hidden" name="quizId" value="${quiz.quizId}" />
                <input type="hidden" name="studentId" value="${studentId}" />
                <button type="submit" class="submit-btn">Submit Quiz</button>
            </form>
        </div>
    </body>
</html>
