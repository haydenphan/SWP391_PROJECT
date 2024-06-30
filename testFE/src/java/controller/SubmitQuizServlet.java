package controller;

import DAO.QuizSubmissionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Date;

import model.QuizSubmission;

@WebServlet("/submitQuiz")
public class SubmitQuizServlet extends HttpServlet {
    private Connection connection;

    @Override
    public void init() throws ServletException {
        super.init();
        // Initialize your database connection here
        String url = "jdbc:sqlserver://localhost:1433;databaseName=OnlineLearningV2;encrypt=true;trustServerCertificate=true";
        String username = "sa";
        String password = "123";
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException e) {
            throw new ServletException("Database connection error", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            int quizId = Integer.parseInt(request.getParameter("quizId"));

            QuizSubmission submission = new QuizSubmission();
            submission.setStudentID(studentId);
            submission.setQuizID(quizId);
            submission.setSubmissionDate(new Date()); // Set current timestamp
            submission.setTime_taken(0); // Set time taken to 0

            QuizSubmissionDAO submissionDAO = new QuizSubmissionDAO(connection);
            int submissionID = submissionDAO.saveQuizSubmission(submission);

            // Redirect to a result page or do further processing
            response.sendRedirect("quizResult.jsp?submissionID=" + submissionID);
        } catch (NumberFormatException | SQLException e) {
            throw new ServletException("Error processing quiz submission", e);
        }
    }

    @Override
    public void destroy() {
        super.destroy();
        // Close your database connection here
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
