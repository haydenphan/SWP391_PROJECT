<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Quiz Result</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            .container {
                width: 80%;
                margin: auto;
                border: 1px solid #ddd;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .header {
                text-align: center;
                margin-bottom: 30px;
            }
            .details, .summary {
                margin-bottom: 20px;
            }
            .summary table {
                width: 100%;
                border-collapse: collapse;
            }
            .summary table, .summary th, .summary td {
                border: 1px solid #ddd;
            }
            .summary th, .summary td {
                padding: 10px;
                text-align: left;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h2>ten course</h2>
            </div>
            <div class="details">
                <p><strong>Quiz Code:</strong> ${quizID}</p>
                <p><strong>Submitted date:</strong> ${quizDateSubmit}</p>
                <p><strong>Attempts allowed:</strong> 1</p>
                <p>To attempt this quiz you need to know the quiz password</p>
                <p><strong>Grade to pass:</strong> 5.00 out of 10.00</p>
            </div>
            <div class="summary">
                <h3>Summary of your previous attempts</h3>
                <table>
                    <tr>
                        <th>State</th>
                        <th>Marks / ${numbresQuiz}</th>
                        <th>Grade / 10.00</th>
                        <th>Review</th>
                    </tr>
                    <tr>
                        <td>Finished<br>Submitted ${quizDateSubmit}</td>
                        <td>${score}</td>
                        <td>${(score/numbresQuiz)*10}</td>
                        <td>Not permitted</td>
                    </tr>
                </table>
            </div>
        </div>
    </body>
</html>