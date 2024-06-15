<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Quiz</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f0f8ff; /* Light blue background */
        }
        h1 {
            color: #1e90ff; /* Dodger blue */
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #1e90ff; /* Dodger blue */
        }
        .form-group input, .form-group textarea, .form-group select {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #1e90ff; /* Dodger blue */
            border-radius: 4px;
        }
        .form-group textarea {
            height: 60px;
        }
        .question-group {
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #1e90ff; /* Dodger blue */
            border-radius: 4px;
            background-color: #e6f2ff; /* Light blue background for questions */
        }
        .question-group input {
            width: calc(100% - 30px);
            margin-right: 10px;
            display: inline-block;
            border: 1px solid #1e90ff; /* Dodger blue */
            border-radius: 4px;
        }
        .correct-answer {
            margin-top: 10px;
        }
        .add-question-btn, .submit-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            color: white;
            background-color: #1e90ff; /* Dodger blue */
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
        }
        .add-question-btn:hover, .submit-btn:hover {
            background-color: #1c86ee; /* Slightly darker blue */
        }
    </style>
    <script>
        let questionCount = 1;

        function addQuestion() {
            questionCount++;
            const questionGroup = document.createElement('div');
            questionGroup.className = 'question-group';
            questionGroup.innerHTML = `
                <h3>${questionCount}. Enter Question Here:</h3>
                <textarea name="question${questionCount}" required></textarea>
                <div>
                    a) <input type="text" name="q${questionCount}aText" required>
                </div>
                <div>
                    b) <input type="text" name="q${questionCount}bText" required>
                </div>
                <div>
                    c) <input type="text" name="q${questionCount}cText" required>
                </div>
                <div>
                    d) <input type="text" name="q${questionCount}dText" required>
                </div>
                <div class="correct-answer">
                    <label for="correct${questionCount}">Correct Answer:</label>
                    <select id="correct${questionCount}" name="correct${questionCount}" required>
                        <option value="">Select correct answer</option>
                        <option value="a">a</option>
                        <option value="b">b</option>
                        <option value="c">c</option>
                        <option value="d">d</option>
                    </select>
                </div>
            `;
            document.getElementById('questionsContainer').appendChild(questionGroup);
        }
    </script>
</head>
<body>
    <h1>Create Quiz</h1>
    <form action="add-quiz-servlet?courseId=${requestScope.courseId}" method="post" id="request">
        <div id="questionsContainer">
            <div class="question-group">
                <h3>1. Enter Question Here:</h3>
                <textarea name="question1" required></textarea>
                <div>
                    a) <input type="text" name="q1aText" required>
                </div>
                <div>
                    b) <input type="text" name="q1bText" required>
                </div>
                <div>
                    c) <input type="text" name="q1cText" required>
                </div>
                <div>
                    d) <input type="text" name="q1dText" required>
                </div>
                <div class="correct-answer">
                    <label for="correct1">Correct Answer:</label>
                    <select id="correct1" name="correct1" required>
                        <option value="">Select correct answer</option>
                        <option value="a">a</option>
                        <option value="b">b</option>
                        <option value="c">c</option>
                        <option value="d">d</option>
                    </select>
                </div>
            </div>
        </div>

        <button type="button" class="add-question-btn" onclick="addQuestion()">Add Question</button>
        <button type="submit" class="submit-btn">Create Quiz</button>
    </form>
</body>
</html>
