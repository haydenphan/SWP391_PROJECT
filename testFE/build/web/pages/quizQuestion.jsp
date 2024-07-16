<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }
        input[type="text"],
        select {
            width: calc(100% - 20px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
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
        .delete-question {
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
        .delete-question:hover {
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
    <script>
        function addQuestion() {
            var questionsContainer = document.getElementById('questions-container');
            var questionCount = questionsContainer.getElementsByClassName('question-group').length + 1;

            var newQuestionGroup = document.createElement('div');
            newQuestionGroup.classList.add('question-group');

            var deleteButton = document.createElement('button');
            deleteButton.type = 'button';
            deleteButton.classList.add('delete-question');
            deleteButton.textContent = '×';
            deleteButton.setAttribute('onclick', 'deleteQuestion(this)');
            newQuestionGroup.appendChild(deleteButton);

            var questionHeading = document.createElement('h3');
            questionHeading.textContent = 'Question ' + questionCount;
            newQuestionGroup.appendChild(questionHeading);

            var questionText = document.createElement('label');
            questionText.setAttribute('for', 'questionText' + questionCount);
            questionText.textContent = 'Question Text:';
            newQuestionGroup.appendChild(questionText);

            var questionInput = document.createElement('input');
            questionInput.setAttribute('type', 'text');
            questionInput.setAttribute('id', 'questionText' + questionCount);
            questionInput.setAttribute('name', 'questionText' + questionCount);
            questionInput.setAttribute('required', '');
            newQuestionGroup.appendChild(questionInput);

            var questionTypeLabel = document.createElement('label');
            questionTypeLabel.setAttribute('for', 'questionType' + questionCount);
            questionTypeLabel.textContent = 'Question Type:';
            newQuestionGroup.appendChild(questionTypeLabel);

            var questionTypeSelect = document.createElement('select');
            questionTypeSelect.setAttribute('id', 'questionType' + questionCount);
            questionTypeSelect.setAttribute('name', 'questionType' + questionCount);
            questionTypeSelect.setAttribute('onchange', 'changeAnswers(this, ' + questionCount + ')');
            newQuestionGroup.appendChild(questionTypeSelect);

            var option1 = document.createElement('option');
            option1.setAttribute('value', 'MultipleChoice');
            option1.textContent = 'Multiple Choice';
            questionTypeSelect.appendChild(option1);

            var option2 = document.createElement('option');
            option2.setAttribute('value', 'TrueFalse');
            option2.textContent = 'True/False';
            questionTypeSelect.appendChild(option2);

            var answersHeading = document.createElement('h4');
            answersHeading.textContent = 'Answers:';
            newQuestionGroup.appendChild(answersHeading);

            var answersDiv = document.createElement('div');
            answersDiv.classList.add('answers');
            answersDiv.setAttribute('id', 'answers' + questionCount);
            newQuestionGroup.appendChild(answersDiv);

            for (var i = 1; i <= 4; i++) {
                var answerGroup = document.createElement('div');
                answerGroup.classList.add('answer-group');

                var answerInput = document.createElement('input');
                answerInput.setAttribute('type', 'text');
                answerInput.setAttribute('id', 'answerText' + questionCount + '_' + i);
                answerInput.setAttribute('name', 'answerText' + questionCount + '_' + i);
                answerInput.setAttribute('required', '');
                answerGroup.appendChild(answerInput);

                var correctCheckbox = document.createElement('input');
                correctCheckbox.setAttribute('type', 'checkbox');
                correctCheckbox.setAttribute('id', 'isCorrect' + questionCount + '_' + i);
                correctCheckbox.setAttribute('name', 'isCorrect' + questionCount + '_' + i);
                answerGroup.appendChild(correctCheckbox);

                var correctLabel = document.createElement('label');
                correctLabel.setAttribute('for', 'isCorrect' + questionCount + '_' + i);
                correctLabel.textContent = 'Correct';
                answerGroup.appendChild(correctLabel);

                answersDiv.appendChild(answerGroup);
            }

            questionsContainer.appendChild(newQuestionGroup);
            reindexQuestions();
        }

        function deleteQuestion(button) {
            var questionGroup = button.parentElement;
            questionGroup.remove();
            reindexQuestions();
        }

        function reindexQuestions() {
            var questionsContainer = document.getElementById('questions-container');
            var questionGroups = questionsContainer.getElementsByClassName('question-group');

            for (var i = 0; i < questionGroups.length; i++) {
                var questionGroup = questionGroups[i];
                var questionNumber = i + 1;
                questionGroup.querySelector('h3').textContent = 'Question ' + questionNumber;

                questionGroup.querySelectorAll('input[type="text"]').forEach(function (input) {
                    var name = input.getAttribute('name').replace(/[0-9]+$/, questionNumber);
                    var id = input.getAttribute('id').replace(/[0-9]+$/, questionNumber);
                    input.setAttribute('name', name);
                    input.setAttribute('id', id);
                });

                questionGroup.querySelectorAll('input[type="checkbox"]').forEach(function (checkbox) {
                    var name = checkbox.getAttribute('name').replace(/[0-9]+$/, questionNumber);
                    var id = checkbox.getAttribute('id').replace(/[0-9]+$/, questionNumber);
                    checkbox.setAttribute('name', name);
                    checkbox.setAttribute('id', id);
                });

                questionGroup.querySelectorAll('label').forEach(function (label) {
                    var htmlFor = label.getAttribute('for').replace(/[0-9]+$/, questionNumber);
                    label.setAttribute('for', htmlFor);
                });
            }
        }

        function changeAnswers(selectElement, questionNumber) {
            var answerDiv = document.getElementById('answers' + questionNumber);
            answerDiv.innerHTML = '';

            if (selectElement.value === 'TrueFalse') {
                for (var i = 1; i <= 2; i++) {
                    var answerGroup = document.createElement('div');
                    answerGroup.classList.add('answer-group');

                    var answerInput = document.createElement('input');
                    answerInput.setAttribute('type', 'text');
                    answerInput.setAttribute('id', 'answerText' + questionNumber + '_' + i);
                    answerInput.setAttribute('name', 'answerText' + questionNumber + '_' + i);
                    answerInput.setAttribute('required', '');
                    answerInput.setAttribute('value', i === 1 ? 'True' : 'False');
                    answerGroup.appendChild(answerInput);

                    var correctCheckbox = document.createElement('input');
                    correctCheckbox.setAttribute('type', 'checkbox');
                    correctCheckbox.setAttribute('id', 'isCorrect' + questionNumber + '_' + i);
                    correctCheckbox.setAttribute('name', 'isCorrect' + questionNumber + '_' + i);
                    answerGroup.appendChild(correctCheckbox);

                    var correctLabel = document.createElement('label');
                    correctLabel.setAttribute('for', 'isCorrect' + questionNumber + '_' + i);
                    correctLabel.textContent = 'Correct';
                    answerGroup.appendChild(correctLabel);

                    answerDiv.appendChild(answerGroup);
                }
            } else {
                for (var i = 1; i <= 4; i++) {
                    var answerGroup = document.createElement('div');
                    answerGroup.classList.add('answer-group');

                    var answerInput = document.createElement('input');
                    answerInput.setAttribute('type', 'text');
                    answerInput.setAttribute('id', 'answerText' + questionNumber + '_' + i);
                    answerInput.setAttribute('name', 'answerText' + questionNumber + '_' + i);
                    answerInput.setAttribute('required', '');
                    answerGroup.appendChild(answerInput);

                    var correctCheckbox = document.createElement('input');
                    correctCheckbox.setAttribute('type', 'checkbox');
                    correctCheckbox.setAttribute('id', 'isCorrect' + questionNumber + '_' + i);
                    correctCheckbox.setAttribute('name', 'isCorrect' + questionNumber + '_' + i);
                    answerGroup.appendChild(correctCheckbox);

                    var correctLabel = document.createElement('label');
                    correctLabel.setAttribute('for', 'isCorrect' + questionNumber + '_' + i);
                    correctLabel.textContent = 'Correct';
                    answerGroup.appendChild(correctLabel);

                    answerDiv.appendChild(answerGroup);
                }
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Add Quiz Question</h2>

        <%-- Display message if available --%>
        <% if (request.getAttribute("message") != null) { %>
        <div class="message">
            <%= request.getAttribute("message") %>
        </div>
        <% } %>

        <form id="quizForm" action="${pageContext.request.contextPath}/addquestion" method="post">
            <input type="hidden" name="quizId" value="${param.quizID}">

            <div id="questions-container">
                <div class="question-group">
                    <button type="button" class="delete-question" onclick="deleteQuestion(this)">×</button>
                    <h3>Question 1</h3>
                    <label for="questionText1">Question Text:</label>
                    <input type="text" id="questionText1" name="questionText1" required>

                    <label for="questionType1">Question Type:</label>
                    <select id="questionType1" name="questionType1" onchange="changeAnswers(this, 1)">
                        <option value="MultipleChoice">Multiple Choice</option>
                        <option value="TrueFalse">True/False</option>
                    </select>

                    <div class="answers" id="answers1">
                        <h4>Answers:</h4>
                        <div class="answer-group">
                            <input type="text" id="answerText1_1" name="answerText1_1" required>
                            <input type="checkbox" id="isCorrect1_1" name="isCorrect1_1">
                            <label for="isCorrect1_1">Correct</label>
                        </div>
                        <div class="answer-group">
                            <input type="text" id="answerText1_2" name="answerText1_2" required>
                            <input type="checkbox" id="isCorrect1_2" name="isCorrect1_2">
                            <label for="isCorrect1_2">Correct</label>
                        </div>
                        <div class="answer-group">
                            <input type="text" id="answerText1_3" name="answerText1_3" required>
                            <input type="checkbox" id="isCorrect1_3" name="isCorrect1_3">
                            <label for="isCorrect1_3">Correct</label>
                        </div>
                        <div class="answer-group">
                            <input type="text" id="answerText1_4" name="answerText1_4" required>
                            <input type="checkbox" id="isCorrect1_4" name="isCorrect1_4">
                            <label for="isCorrect1_4">Correct</label>
                        </div>
                    </div>
                </div>
            </div>

            <div class="btn-container">
                <button style="margin-right: 10px;" type="button" class="cont-btn" onclick="addQuestion()">Add Question</button>
                <input style="border: none; background-color: green" class="cont-btn" type="submit" value="Submit">
            </div>
        </form>
    </div>
</body>
</html>
