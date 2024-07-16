package controller;

import DAO.QuizSubmissionDAO;
import DAO.QuizSubmissionDetailDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.QuizSubmissionDetail;

@WebServlet(name = "SubmitQuizServlet", urlPatterns = {"/submit-quiz-servlet"})
public class SubmitQuizServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(SubmitQuizServlet.class.getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer studentId = (Integer) session.getAttribute("studentId");
        if (studentId == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Student ID is missing in session");
            return;
        }

        int quizId = Integer.parseInt(request.getParameter("quizId"));
        LocalDateTime submissionDate = LocalDateTime.now();

        // Calculate timespent in seconds
        LocalDateTime startTime = (LocalDateTime) session.getAttribute("quizStartTime");
        if (startTime == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Quiz start time is missing in session");
            return;
        }
        int timeSpentSeconds = (int) java.time.Duration.between(startTime, submissionDate).getSeconds();
        String timeSpent = String.format("%02d:%02d", timeSpentSeconds / 60, timeSpentSeconds % 60);

        int submissionId = QuizSubmissionDAO.saveQuizSubmission(studentId, quizId, submissionDate, timeSpent);

        List<QuizSubmissionDetail> submissionDetails = new ArrayList<>();
        // Process each question and answer
        for (Map.Entry<String, String[]> entry : request.getParameterMap().entrySet()) {
            String paramName = entry.getKey();
            String[] paramValues = entry.getValue();
            if (paramName.startsWith("question_")) {
                try {
                    int questionId = Integer.parseInt(paramName.split("_")[1]);
                    int answerId = Integer.parseInt(paramValues[0]);
                    submissionDetails.add(new QuizSubmissionDetail(submissionId, questionId, answerId));
                } catch (NumberFormatException e) {
                    LOGGER.log(Level.SEVERE, "Invalid question or answer ID format: " + paramName + " = " + paramValues[0], e);
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid question or answer ID format");
                    return;
                }
            }
        }

        QuizSubmissionDetailDAO.saveQuizSubmissionDetails(submissionDetails);

        response.sendRedirect("quizSubmissionConfirmation.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Servlet to handle quiz submission";
    }
}
