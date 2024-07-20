package controller;

import DAO.QuizDAO;
import DAO.QuizQuestionDAO;
import model.Quiz;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.QuizQuestion;

@WebServlet(name = "TakeQuizServlet", urlPatterns = {"/take-quiz-servlet"})
public class TakeQuizServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int quizId = Integer.parseInt(request.getParameter("quizId"));
        // Fetch quiz data from the database

        Quiz quiz = null;
        List<QuizQuestion> questions = QuizQuestionDAO.getQuizQuestionsByQuizId(quizId);
        try {
            quiz = QuizDAO.getQuizById(quizId);
        } catch (Exception ex) {
            Logger.getLogger(TakeQuizServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (quiz == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Quiz not found");
            return;
        }

        // Set the quiz object as a request attribute
        request.setAttribute("quiz", quiz);
        request.setAttribute("questions", questions);

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
