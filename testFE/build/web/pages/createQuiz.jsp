<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>
<%@ page import="DAO.*" %>

<!DOCTYPE html>
<html>
    <head>
        <%-- HEAD --%>
        <%@ include file="../template/head.jsp" %>
        <style>
            body {
                background-color: #f0f8ff;
                font-family: 'Roboto', sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }

            .container {
                background-color: #fff;
                padding: 2rem;
                border-radius: 15px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                max-width: 500px;
                width: 100%;
            }

            h2 {
                text-align: center;
                color: #2467EC;
                margin-bottom: 1.5rem;
            }

            form {
                display: flex;
                flex-direction: column;
                gap: 1rem;
            }

            label {
                font-weight: bold;
                color: #333;
            }

            input[type="text"],
            input[type="checkbox"],
            input[type="submit"] {
                border: 1px solid #d3d3d3;
                border-radius: 10px;
                padding: 0.75rem;
                font-size: 1rem;
                transition: border-color 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            }

            input[type="text"]:focus,
            input[type="checkbox"]:focus {
                border-color: #1b53bb;
                box-shadow: 0 0 10px rgba(36, 103, 236, 0.2);
                outline: none;
            }

            input[type="submit"] {
                background-color: #2467EC;
                color: #fff;
                border: none;
                cursor: pointer;
                transition: background-color 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            }

            input[type="submit"]:hover {
                background-color: #1b53bb;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .form-group {
                display: flex;
                flex-direction: column;
            }
        </style>
    </head>
    <body>
        <%
            int sectionId = Integer.parseInt(request.getParameter("sectionId"));
        %>
        <div class="container">
            <h2>Add New Quiz</h2>
            <form action="${pageContext.request.contextPath}/add-quiz" method="post">
                <input type="hidden" name="sectionId" value="<%= sectionId%>"/>
                <div class="form-group">
                    <label for="quizName">Quiz Name:</label>
                    <input type="text" id="quizName" name="quizName">
                </div>
                <div>
                    <label for="isGraded">Graded:</label>
                    <input type="checkbox" id="isGraded" name="isGraded" value="true">
                </div>
                <input type="submit" value="Create Quiz">
            </form>
        </div>
    </body>
</html>