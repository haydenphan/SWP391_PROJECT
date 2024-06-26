<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Quiz</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <div class="container">
        <h2>Add New Quiz</h2>
        <form action="${pageContext.request.contextPath}/AddQuiz" method="post">
            Lecture ID: <input type="text" name="lectureId"><br>
            Quiz Name: <input type="text" name="quizName"><br>
            Graded: <input type="checkbox" name="isGraded"><br>
            <input type="submit" value="Create Quiz">
        </form>
    </div>
</body>
</html>
