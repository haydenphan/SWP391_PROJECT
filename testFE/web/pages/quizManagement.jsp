<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.QuizDAO" %>
<%@ page import="model.Quiz" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <%-- HEAD --%>
        <%@ include file="../template/head.jsp" %>
        <style>
            body {
                background-color: #f0f8ff;
                font-family: 'Roboto', sans-serif;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 1200px;
                margin: 50px auto;
                padding: 20px;
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            h2 {
                text-align: center;
                color: #2467ec;
                margin-bottom: 30px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 30px;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 12px;
                text-align: left;
            }

            th {
                background-color: #2467ec;
                color: white;
            }

            tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            tr:hover {
                background-color: #f1f1f1;
            }

            .btn-container {
                text-align: center;
                margin-top: 20px;
            }

            .icon-btn {
                background: none;
                border: none;
                cursor: pointer;
                margin-left: 5px;
            }

            .icon-btn i {
                font-size: 20px;
                color: #2467ec;
            }

            .icon-btn i:hover {
                color: #1b53bb;
            }
        </style>
        <script>
            function confirmDelete(form) {
                if (confirm("Are you sure you want to delete this quiz?")) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <div class="container">
            <%
                int sectionId = Integer.parseInt(request.getParameter("sectionId"));
                List<Quiz> quizzes = QuizDAO.getQuizzesBySectionId(sectionId);
                request.setAttribute("quizzes", quizzes);
            %>

            <h2>Quizzes for Section <%= sectionId%></h2>
            <table>
                <thead>
                    <tr>
                        <th>Quiz ID</th>
                        <th>Quiz Name</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="quiz" items="${quizzes}">
                        <tr>
                            <td>${quiz.quizId}</td>
                            <td>${quiz.quizName}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/pages/quizPreviews.jsp" method="get" style="display:inline;">
                                    <input type="hidden" name="quizId" value="${quiz.quizId}">
                                    <button type="submit" class="icon-btn">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </form>
                              
                                <form action="${pageContext.request.contextPath}/manage-quiz/delete?sectionId=<%= sectionId%>" method="post" style="display:inline;" onsubmit="return confirmDelete(this);">
                                    <input type="hidden" name="quizId" value="${quiz.quizId}">
                                    <button type="submit" class="icon-btn">
                                        <i class="fas fa-trash-alt"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <div class="btn-container">
                <form action="${pageContext.request.contextPath}/pages/createQuiz.jsp?sectionId=<%= sectionId%>" method="POST">
                    <button type="submit" class="cont-btn">New Quiz</button>
                </form>
            </div>
        </div>

        <%-- BACK TO TOP --%>
        <%@ include file="../template/backToTop.jsp" %>

        <!-- JS here -->
        <%@ include file="../template/script.jsp" %>
    </body>
</html>