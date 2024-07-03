package controller;

import DAO.JDBC;
import DAO.QuizSubmissionDAO;
import DAO.QuizSubmissionDetailsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.Date;

import model.QuizSubmission;

@WebServlet("/submitQuiz")
public class SubmitQuizServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Parse parameters from request
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            int quizId = Integer.parseInt(request.getParameter("quizId"));
            int timeTaken = 0; // Initialize timeTaken to 0
            
            String timeTakenStr = request.getParameter("timeTaken");
            if (timeTakenStr != null && !timeTakenStr.isEmpty()) {
                timeTaken = Integer.parseInt(timeTakenStr);
            }

            // Create a new QuizSubmission object
            QuizSubmission submission = new QuizSubmission();
            submission.setStudentID(studentId);
            submission.setQuizID(quizId);
            submission.setSubmissionDate(new Date());
            submission.setTime_taken(timeTaken);

            // Save quiz submission to database
            try (Connection connection = JDBC.getConnectionWithSqlJdbc()) {
                // Save the main quiz submission
                QuizSubmissionDAO submissionDAO = new QuizSubmissionDAO(connection);
                int submissionID = submissionDAO.saveQuizSubmission(submission);

                // Save each quiz answer detail
                QuizSubmissionDetailsDAO detailsDAO = new QuizSubmissionDetailsDAO(connection);
                String[] questionIds = request.getParameterValues("questionId");

                if (questionIds != null) {
                    for (String questionId : questionIds) {
                        int questionID = Integer.parseInt(questionId);
                        int answerID = Integer.parseInt(request.getParameter("question_" + questionId));
                        detailsDAO.saveAnswer(submissionID, questionID, answerID);
                    }
                }

                // Redirect to home.jsp after successful submission
                response.sendRedirect(request.getContextPath() + "/pages/home.jsp");
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().println("Error saving quiz submission");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.getWriter().println("Invalid input format");
        }
    }
}
