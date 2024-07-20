<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.QuizQuestion" %>
<%@ page import="model.QuizAnswer" %>
<%@ page import="DAO.QuizQuestionDAO" %>
<%@ page import="DAO.QuizAnswerDAO" %>
<%@ page import="java.util.List" %>

<%
    int quizId = Integer.parseInt(request.getParameter("quizId"));
    List<QuizQuestion> questions = QuizQuestionDAO.getQuizQuestionsByQuizId(quizId);
%>

<!DOCTYPE html>
<html>
    <head>
        <%-- HEAD --%>
        <%@ include file="../template/head.jsp" %>
        <style>
            body {
                background-color: #f0f8ff;
                font-family: 'Roboto', sans-serif;
            }

            .container {
                max-width: 800px;
                margin: 50px auto;
                padding: 20px;
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            h2 {
                text-align: center;
                color: #2467ec;
                margin-bottom: 20px;
            }

            .question-group {
                position: relative;
                padding: 20px;
                border: 1px solid #d3d3d3;
                border-radius: 10px;
                margin-bottom: 20px;
                background-color: #f9f9f9;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .question-group h3 {
                margin-top: 0;
                color: #2467ec;
            }

            .answer-group {
                display: flex;
                align-items: center;
                gap: 10px;
                margin-top: 10px;
            }

            .answer-group input[type="text"] {
                flex-grow: 1;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .delete-question, .edit-question, .delete-answer, .edit-answer {
                position: absolute;
                top: 10px;
                right: 10px;
                background-color: transparent;
                border: none;
                color: black;
                font-size: 20px;
                cursor: pointer;
                width: 30px;
                height: 30px;
            }

            .delete-question {
                right: 40px;
            }

            .delete-question:hover, .edit-question:hover, .delete-answer:hover, .edit-answer:hover {
                background-color: #ff1a1a;
                color: white;
            }

            .btn-container {
                text-align: center;
                margin-top: 20px;
            }

            .cont-btn.submit {
                background-color: green;
            }

            /* Modal styles */
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgb(0,0,0);
                background-color: rgba(0,0,0,0.4);
                padding-top: 60px;
            }

            .modal-content {
                background-color: #fefefe;
                margin: 5% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
                border-radius: 10px;
            }

            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Quiz Previews</h2>

            <% for (QuizQuestion question : questions) {%>
            <div class="question-group" id="question_<%= question.getQuestionID()%>">
                <button type="button" class="delete-question" onclick="deleteQuestion(<%= question.getQuestionID()%>)">×</button>
                <button type="button" class="edit-question" onclick="openEditModal(<%= question.getQuestionID()%>)">✎</button>
                <h3>Question: <%= question.getQuestionText()%></h3>
                <p>Type: <%= question.getQuestionType()%></p>

                <div class="answers">
                    <h4>Answers:</h4>
                    <% List<QuizAnswer> answers = QuizAnswerDAO.getAnswersByQuestionId(question.getQuestionID()); %>
                    <% for (QuizAnswer answer : answers) {%>
                    <div class="answer-group" id="answer_<%= answer.getAnswerID()%>">
                        <input type="text" value="<%= answer.getAnswerText()%>" readonly>
                        <input type="checkbox" <%= answer.isCorrect() ? "checked" : ""%> disabled>
                        <label for="isCorrect<%= answer.getAnswerID()%>">Correct</label>
                        <button type="button" class="delete-answer" onclick="deleteAnswer(<%= answer.getAnswerID()%>)">×</button>
                        <button type="button" class="edit-answer" onclick="openEditModal(<%= question.getQuestionID()%>)">✎</button>
                    </div>
                    <% } %>
                </div>
            </div>
            <% }%>

            <div class="btn-container">
                <button type="button" class="cont-btn" onclick="openAddModal()">Add Question</button>
            </div>
        </div>

        <!-- Modal -->
        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <h2 id="modalTitle">Add New Question</h2>
                <form id="modalForm" action="${pageContext.request.contextPath}/manage-question" method="post">
                    <input type="hidden" name="action" id="modalAction" value="add">
                    <input type="hidden" name="quizId" value="<%=quizId%>">
                    <input type="hidden" name="questionId" id="questionId">

                    <label for="questionText">Question Text:</label>
                    <input type="text" id="questionText" name="questionText" required>

                    <label for="questionType">Question Type:</label>
                    <select id="questionType" name="questionType" onchange="changeAnswers(this)">
                        <option value="MultipleChoice">Multiple Choice</option>
                        <option value="TrueFalse">True/False</option>
                    </select>

                    <div class="answers" id="answers">
                        <h4>Answers:</h4>
                        <div class="answer-group">
                            <input type="text" name="answerText1" required>
                            <input type="checkbox" name="isCorrect1">
                            <label for="isCorrect1">Correct</label>
                        </div>
                        <div class="answer-group">
                            <input type="text" name="answerText2" required>
                            <input type="checkbox" name="isCorrect2">
                            <label for="isCorrect2">Correct</label>
                        </div>
                        <div class="answer-group">
                            <input type="text" name="answerText3" required>
                            <input type="checkbox" name="isCorrect3">
                            <label for="isCorrect3">Correct</label>
                        </div>
                        <div class="answer-group">
                            <input type="text" name="answerText4" required>
                            <input type="checkbox" name="isCorrect4">
                            <label for="isCorrect4">Correct</label>
                        </div>
                    </div>

                    <div class="btn-container">
                        <input class="cont-btn submit-btn" type="submit" value="Submit">
                    </div>
                </form>
            </div>
        </div>

        <form id="deleteForm" action="${pageContext.request.contextPath}/manage-question" method="post" style="display:none;">
            <input type="hidden" name="action" value="delete">
            <input type="hidden" name="questionId" id="deleteQuestionId">
            <input type="hidden" name="quizId" value="<%=quizId%>">
        </form>

        <script>
            function openAddModal() {
                document.getElementById('modalTitle').innerText = "Add New Question";
                document.getElementById('modalAction').value = "add";
                document.getElementById('questionId').value = "";
                document.getElementById('questionText').value = "";
                document.getElementById('questionType').value = "MultipleChoice";
                changeAnswers(document.getElementById('questionType'));
                document.getElementById('myModal').style.display = "block";
            }

            function openEditModal(questionID) {
                document.getElementById('modalTitle').innerText = "Edit Question";
                document.getElementById('modalAction').value = "edit";
                document.getElementById('questionId').value = questionID;

                // Fetch question and answer details from the DOM or make an AJAX call to get them
                var questionText = document.querySelector('#question_' + questionID + ' h3').innerText.replace('Question: ', '');
                var questionType = document.querySelector('#question_' + questionID + ' p').innerText.replace('Type: ', '');

                document.getElementById('questionText').value = questionText;
                document.getElementById('questionType').value = questionType;
                changeAnswers(document.getElementById('questionType'));

                var answers = document.querySelectorAll('#question_' + questionID + ' .answer-group');
                answers.forEach((answer, index) => {
                    document.getElementsByName('answerText' + (index + 1))[0].value = answer.querySelector('input[type="text"]').value;
                    document.getElementsByName('isCorrect' + (index + 1))[0].checked = answer.querySelector('input[type="checkbox"]').checked;
                });

                document.getElementById('myModal').style.display = "block";
            }

            function closeModal() {
                document.getElementById('myModal').style.display = "none";
            }

            window.onclick = function (event) {
                if (event.target == document.getElementById('myModal')) {
                    closeModal();
                }
            }

            function changeAnswers(selectElement) {
                var answersDiv = document.getElementById('answers');
                answersDiv.innerHTML = '';

                if (selectElement.value === 'TrueFalse') {
                    answersDiv.innerHTML = `
                        <div class="answer-group">
                            <input type="text" name="answerText1" value="True" readonly>
                            <input type="checkbox" name="isCorrect1">
                            <label for="isCorrect1">Correct</label>
                        </div>
                        <div class="answer-group">
                            <input type="text" name="answerText2" value="False" readonly>
                            <input type="checkbox" name="isCorrect2">
                            <label for="isCorrect2">Correct</label>
                        </div>
                    `;
                } else if (selectElement.value === 'MultipleChoice') {
                    answersDiv.innerHTML = `
                        <div class="answer-group">
                            <input type="text" name="answerText1" required>
                            <input type="checkbox" name="isCorrect1">
                            <label for="isCorrect1">Correct</label>
                        </div>
                        <div class="answer-group">
                            <input type="text" name="answerText2" required>
                            <input type="checkbox" name="isCorrect2">
                            <label for="isCorrect2">Correct</label>
                        </div>
                        <div class="answer-group">
                            <input type="text" name="answerText3" required>
                            <input type="checkbox" name="isCorrect3">
                            <label for="isCorrect3">Correct</label>
                        </div>
                        <div class="answer-group">
                            <input type="text" name="answerText4" required>
                            <input type="checkbox" name="isCorrect4">
                            <label for="isCorrect4">Correct</label>
                        </div>
                    `;
                }
            }

            function deleteQuestion(questionID) {
                document.getElementById('deleteQuestionId').value = questionID;
                document.getElementById('deleteForm').submit();
            }

            function editQuestion(questionID) {
                // Add your edit logic here
                alert('Edit question ' + questionID);
            }

            function deleteAnswer(answerID) {
                // Add your delete logic here
                document.getElementById('answer_' + answerID).remove();
            }

            function editAnswer(answerID) {
                // Add your edit logic here
                alert('Edit answer ' + answerID);
            }
        </script>
    </body>
</html>
