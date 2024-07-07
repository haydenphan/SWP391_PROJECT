<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.QuizQuestion" %>
<%@ page import="model.QuizAnswer" %>
<%@ page import="DAO.QuizQuestionDAO" %>
<%@ page import="DAO.QuizAnswerDAO" %>
<%@ page import="java.util.List" %>




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
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Quiz Previews</h2>

           
            <div class="question-group" id="question_">
                <button type="button" class="delete-question" onclick="deleteQuestion()">×</button>
                <button type="button" class="edit-question" onclick="editQuestion()">✎</button>
                <h3>Question: </h3>
                <p>Type: </p>

                <div class="answers">
                    <h4>Answers:</h4>
                    
                    <div class="answer-group" id="answer_">
                        <input type="text" value="" readonly>
                        <input type="checkbox"  disabled>
                        <label for="isCorrect">Correct</label>
                        <button type="button" class="delete-answer" onclick="deleteAnswer()">×</button>
                        <button type="button" class="edit-answer" onclick="editAnswer()">✎</button>
                    </div>
                    
                </div>
            </div>
         

            <div class="btn-container">
                <button type="button" class="cont-btn" onclick="addQuestion()">Add Question</button>
            </div>
        </div>

        <script>
            function deleteQuestion(questionID) {
                // Add your delete logic here
                document.getElementById('question_' + questionID).remove();
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

            function addQuestion() {
                // Add your add logic here
                alert('Add new question');
            }
        </script>
    </body>
</html>
