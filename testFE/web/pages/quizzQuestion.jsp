<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add Quiz Question</title>
        .answer-group {
        margin-top: 10px;
        display: flex;
        align-items: center;
        gap: 10px; /* Adds space between input and checkbox/label */
        }

        .answer-group input[type="text"] {
        width: calc(100% - 120px); /* Adjust width as needed */
        padding: 10px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        }

        .answer-group label {
        margin: 0;
        min-width: 60px; /* Ensure space for the "Correct" label */
        }

    </head>
    <body>
        <div class="container">
            <h2>Add Quiz Question</h2>

            <%-- Display message if available --%>
            <% if (request.getAttribute("message") != null) {%>
            <div class="message">
                <%= request.getAttribute("message")%>
            </div>
            <% }%>

            <form id="quizForm" action="${pageContext.request.contextPath}/addquestion" method="post">
                <input type="hidden" name="quizId" value="${param.quizId}">

                <div id="questions-container">
                    <div class="question-group">
                        <h3>Question 1</h3>
                        <label for="questionText1">Question Text:</label>
                        <input type="text" id="questionText1" name="questionText1" required><br>

                        <label for="questionType1">Question Type:</label>
                        <select id="questionType1" name="questionType1">
                            <option value="MultipleChoice">Multiple Choice</option>
                            <option value="TrueFalse">True/False</option>
                        </select><br>

                        <div class="answers">
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

                <button type="button" onclick="addQuestion()">Add Question</button>
                <input type="submit" value="Submit">
            </form>
        </div>

        <script>
            function addQuestion() {
                var questionsContainer = document.getElementById('questions-container');
                var questionCount = questionsContainer.getElementsByClassName('question-group').length + 1;

                var newQuestionGroup = document.createElement('div');
                newQuestionGroup.classList.add('question-group');

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
                newQuestionGroup.appendChild(document.createElement('br'));

                var questionTypeLabel = document.createElement('label');
                questionTypeLabel.setAttribute('for', 'questionType' + questionCount);
                questionTypeLabel.textContent = 'Question Type:';
                newQuestionGroup.appendChild(questionTypeLabel);

                var questionTypeSelect = document.createElement('select');
                questionTypeSelect.setAttribute('id', 'questionType' + questionCount);
                questionTypeSelect.setAttribute('name', 'questionType' + questionCount);
                newQuestionGroup.appendChild(questionTypeSelect);
                newQuestionGroup.appendChild(document.createElement('br'));

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
            }
        </script>
    </body>
</html>
