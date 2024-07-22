<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <%-- HEAD --%>
        <%@ include file="../template/head.jsp" %>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            .container {
                width: 80%;
                margin: auto;
                border: 1px solid #ddd;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .header {
                text-align: center;
                margin-bottom: 30px;
            }
            .details, .summary, .questions {
                margin-bottom: 20px;
            }
            .summary table, .questions table {
                width: 100%;
                border-collapse: collapse;
            }
            .summary table, .summary th, .summary td, .questions table, .questions th, .questions td {
                border: 1px solid #ddd;
            }
            .summary th, .summary td, .questions th, .questions td {
                padding: 10px;
                text-align: left;
            }
            .correct {
                color: green;
            }
            .incorrect {
                color: red;
            }
            .back-button {
                display: flex;
                justify-content: center;
                margin-top: 20px;
            }
            .back-button form {
                display: inline;
            }
            .back-button button {
                padding: 10px 20px;
                border: none;
                background-color: #007bff;
                color: #fff;
                cursor: pointer;
                border-radius: 4px;
                transition: background-color 0.3s;
            }
            .back-button button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h2>${quiz.getQuizName()}</h2>
            </div>
            <div class="details">
                <p><strong>Quiz Code:</strong> ${quiz.getQuizId()}</p>
                <p><strong>Submitted date:</strong> ${quizDateSubmit}</p>
                <p><strong>Attempts allowed:</strong> 1</p>
                <p><strong>Grade to pass:</strong> 5.00 out of 10.00</p>
            </div>
            <div class="summary">
                <h3>Summary of your previous attempts</h3>
                <table>
                    <tr>
                        <th>State</th>
                        <th>Marks / ${numbresQuiz}</th>
                        <th>Grade / 10.00</th>
                        <th>Review</th>
                    </tr>
                    <tr>
                        <td>Finished<br>Submitted ${quizDateSubmit}</td>
                        <td>${score}</td>
                        <td>${(score / numbresQuiz) * 10}</td>
                        <td>Not permitted</td>
                    </tr>
                </table>
            </div>
            <div class="questions">
                <h3>Questions and Answers</h3>
                <c:forEach var="question" items="${questions}">
                    <div>
                        <h4>Question ${question.getQuestionID()}: ${question.getQuestionText()}</h4>
                        <ul>
                            <c:forEach var="answer" items="${question.getAnswers()}">
                                <li>
                                    <c:choose>
                                        <c:when test="${answer.isCorrect()}">
                                            <span class="correct">${answer.getAnswerText()} (Correct)</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span>${answer.getAnswerText()}</span>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:if test="${questionAnswerMap[question.getQuestionID()] == answer.getAnswerID()}">
                                        <c:choose>
                                            <c:when test="${answer.isCorrect()}">
                                                <span class="correct"> (Your Answer)</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="incorrect"> (Your Answer - Incorrect)</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:forEach>
            </div>
            <div class="back-button">
                <form action="${pageContext.request.contextPath}/student-course-section-servlet" method="get">
                    <input type="hidden" name="sectionId" value="${quiz.getSectionId()}">
                    <button type="submit">Back to Quizzes</button>
                </form>
            </div>
        </div>
    </body>
</html>
