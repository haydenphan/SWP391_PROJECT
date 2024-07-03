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
        
        #timer {
            font-size: 24px;
            color: red;
            margin-top: 10px;
        }
    </style>
    <script>
        let timeLeft = 480; // Thời gian ban đầu (8 phút)

        function startTimer() {
            let timer = document.getElementById("timer");

            // Lấy thời gian giới hạn từ giáo viên
            let teacherTimeLimitInput = document.getElementById("teacherTimeLimit");
            if (teacherTimeLimitInput && teacherTimeLimitInput.value) {
                let timeParts = teacherTimeLimitInput.value.split(":");
                timeLeft = parseInt(timeParts[0]) * 60 + parseInt(timeParts[1]);
            }

            function updateTimer() {
                if (timeLeft <= 0) {
                    document.getElementById("timeTaken").value = 480;
                    document.getElementById("quizForm").submit();
                } else {
                    let minutes = Math.floor(timeLeft / 60);
                    let seconds = timeLeft % 60;
                    timer.innerHTML = `${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
                    timeLeft--;
                }
            }

            updateTimer(); // Gọi hàm để hiển thị thời gian ngay lập tức
            setInterval(updateTimer, 1000); // Cập nhật mỗi giây
        }

        function submitForm() {
            document.getElementById("timeTaken").value = 480 - timeLeft;
            document.getElementById("quizForm").submit();
        }

        window.onload = startTimer;
    </script>
</head>
<body>
    <h1>Take Quiz</h1>
    <div id="timer">08:20</div>
    
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
            <div class="form-group">
                <label for="teacherTimeLimit">Teacher's Time Limit (minutes:seconds):</label>
                <input type="text" id="teacherTimeLimit" name="teacherTimeLimit" pattern="\d{1,2}:\d{2}" title="Format: mm:ss">
            </div>
            <input type="hidden" name="studentId" value="1"> <!-- Thay bằng ID học sinh thực tế -->
            <input type="hidden" name="quizId" value="${quiz.quizId}">
            <input type="hidden" id="timeTaken" name="timeTaken" value="0"> <!-- Cập nhật thời gian đã trôi qua -->
            <button type="button" onclick="submitForm()">Submit Quiz</button>
        </form>
    </c:if>
    
    <c:if test="${empty quiz}">
        <div>
            <p>No quiz found.</p>
        </div>
    </c:if>
</body>
</html>
