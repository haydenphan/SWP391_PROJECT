package controller;

import DAO.QuizDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.Quiz;

@WebServlet(name = "QuizServlet", urlPatterns = {"/quiz-servlet"})
public class QuizServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sectionId = Integer.parseInt(request.getParameter("sectionId"));

        QuizDAO quizDAO = new QuizDAO();
        List<Quiz> quizzes = quizDAO.getQuizzesBySectionId(sectionId);

        request.setAttribute("quizzes", quizzes);
        request.getRequestDispatcher("/pages/quizzes.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet to display quizzes";
    }
}
