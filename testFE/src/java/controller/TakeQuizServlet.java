package controller;

import DAO.QuizDAO;
import model.Quiz;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "TakeQuizServlet", urlPatterns = {"/take-quiz-servlet"})
public class TakeQuizServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int quizId = Integer.parseInt(request.getParameter("quizId"));
        
        // Fetch quiz data from the database
        QuizDAO quizDAO = new QuizDAO();
        Quiz quiz = quizDAO.getQuizById(quizId);
        
        if (quiz == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Quiz not found");
            return;
        }

        // Set the quiz object as a request attribute
        request.setAttribute("quiz", quiz);

        // Store quiz start time in session
        HttpSession session = request.getSession();
        session.setAttribute("quizStartTime", java.time.LocalDateTime.now());

        // Forward to takeQuiz.jsp
        request.getRequestDispatcher("/pages/takeQuiz.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet to handle displaying a quiz";
    }
}
