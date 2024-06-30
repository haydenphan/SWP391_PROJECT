<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Submit Quiz</title>
</head>
<body>
    <form id="quizForm" action="submitQuiz" method="post">
        <input type="hidden" name="studentId" value="1">
        <input type="hidden" name="quizId" value="1">
        <input type="hidden" name="remainingTime" id="remainingTime">
        
        <div>
            <label for="question_1">Question 1:</label>
            <input type="radio" name="question_1" value="1"> Answer 1
            <input type="radio" name="question_1" value="2"> Answer 2
        </div>
        
        <div>
            <label for="question_2">Question 2:</label>
            <input type="radio" name="question_2" value="1"> Answer 1
            <input type="radio" name="question_2" value="2"> Answer 2
        </div>

        <button type="submit">Submit</button>
    </form>

    <script>
        var remainingTime = 300; // Giả sử bạn có một bộ đếm thời gian đếm ngược

        // Cập nhật giá trị của input hidden khi form được gửi
        document.getElementById('quizForm').addEventListener('submit', function() {
            document.getElementById('remainingTime').value = remainingTime;
        });
    </script>
</body>
</html>
