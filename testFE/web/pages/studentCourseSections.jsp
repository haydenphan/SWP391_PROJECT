<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="DAO.*" %>
<%@ page import="model.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
    <head>
        <%-- HEAD --%>
        <%@ include file="../template/head.jsp" %>
        <style>
            body {
                font-family: 'Helvetica Neue', Arial, sans-serif;
                background-color: #f8f9fa;
                color: #343a40;
                margin: 0;
                padding: 0;
            }
            .container {
                width: 80%;
                max-width: 1200px;
                margin: 50px auto;
                padding: 20px;
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            h1 {
                text-align: center;
                color: #007bff;
                margin-bottom: 40px;
                font-size: 2.5em;
            }
            .section {
                background-color: #e9ecef;
                border: 1px solid #dee2e6;
                border-radius: 8px;
                margin: 20px 0;
                padding: 20px;
            }
            .section h2 {
                color: #007bff;
                font-size: 1.75em;
                margin-bottom: 20px;
            }
            .section p {
                margin: 10px 0;
                line-height: 1.6;
            }
            .quizzes {
                background-color: #f1f1f1;
                border-radius: 8px;
                padding: 20px;
                margin-bottom: 20px;
            }
            .quizzes ul {
                list-style-type: none;
                padding: 0;
            }
            .quizzes li {
                background-color: #ffffff;
                border: 1px solid #dee2e6;
                border-radius: 8px;
                margin: 10px 0;
                padding: 15px;
                transition: all 0.3s ease;
            }
            .quizzes li:hover {
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                transform: translateY(-5px);
            }
            .quizzes a {
                color: #fff;
                text-decoration: none;
                font-weight: bold;
            }
            .quizzes .quiz-description {
                margin-top: 10px;
                font-size: 0.9em;
                color: #6c757d;
            }
            .btn-primary {
                display: inline-block;
                font-weight: 400;
                color: #fff;
                text-align: center;
                vertical-align: middle;
                background-color: #007bff;
                border: 1px solid #007bff;
                padding: 0.375rem 0.75rem;
                font-size: 1rem;
                line-height: 1.5;
                border-radius: 0.25rem;
                transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            }
            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #004085;
            }
            .btn-secondary {
                display: inline-block;
                font-weight: 400;
                color: #fff;
                text-align: center;
                vertical-align: middle;
                background-color: #6c757d;
                border: 1px solid #6c757d;
                padding: 0.375rem 0.75rem;
                font-size: 1rem;
                line-height: 1.5;
                border-radius: 0.25rem;
                transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            }
            .btn-secondary:hover {
                background-color: #5a6268;
                border-color: #545b62;
            }
            .quiz-status {
                font-size: 0.9em;
                color: #6c757d;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Quizzes for ${param.sectionName}</h1>
            <c:if test="${not empty quizzes}">
                <div class="quizzes">
                    <ul>
                        <c:forEach var="quiz" items="${quizzes}">
                            <li>
                                <strong>${quiz.quizName}</strong> - Duration: ${quiz.duration}
                                <p class="quiz-description">
                                    Quiz Description: ${quiz.quizDescription}
                                </p>
                                <c:set var="hasSubmitted" value="${QuizSubmissionDAO.hasLearnerSubmittedQuiz(user.getUserID(), quiz.quizId)}"/>
                                <c:set var="hasPassedQuiz" value="${QuizDAO.hasPassedQuiz(quiz.quizId, user.getUserID())}"/>

                                <c:choose>
                                    <c:when test="${hasSubmitted && hasPassedQuiz}">
                                        <span class="quiz-status">Status: Passed</span>
                                        <a class="btn-primary" href="${pageContext.request.contextPath}/view-quiz-result?quizID=${quiz.quizId}">View Result</a>
                                    </c:when>
                                    <c:when test="${!hasSubmitted}">
                                        <span class="quiz-status">Status: Not Yet Taken</span>
                                        <a class="btn-primary" href="${pageContext.request.contextPath}/take-quiz-servlet?quizId=${quiz.quizId}">Do Quiz</a>
                                    </c:when>
                                    <c:when test="${hasSubmitted && !hasPassedQuiz}">
                                        <span class="quiz-status">Status: Not Passed</span><br/>
                                        <a class="btn-secondary" href="${pageContext.request.contextPath}/view-quiz-result?quizID=${quiz.quizId}">View Previous Results</a>
                                        <a class="btn-primary" href="${pageContext.request.contextPath}/take-quiz-servlet?quizId=${quiz.quizId}">Retake Quiz</a>
                                    </c:when>
                                </c:choose>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </c:if>
            <c:if test="${empty quizzes}">
                <p>No quizzes available for this section.</p>
            </c:if>
        </div>
    </body>
</html>
