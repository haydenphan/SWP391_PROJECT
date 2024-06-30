<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quiz Submission Result</title>
</head>
<body>
    <h1>Quiz Submission Result</h1>
    <c:if test="${not empty param.submissionID}">
        <p>Quiz submission successful!</p>
        <p>Submission ID: ${param.submissionID}</p>
    </c:if>
    <c:if test="${empty param.submissionID}">
        <p>Quiz submission failed.</p>
    </c:if>
</body>
</html>
