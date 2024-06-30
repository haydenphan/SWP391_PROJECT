package controller;

import DAO.QuizDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Quiz;

@WebServlet(name = "StartQuizServlet", urlPatterns = {"/start-quiz-servlet"})
public class StartQuizServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int quizId = Integer.parseInt(request.getParameter("quizId"));
        
        // Lấy chi tiết bài quiz từ cơ sở dữ liệu
        Quiz quiz = QuizDAO.getQuizById(quizId);
        
        // Đặt quiz vào request attribute
        request.setAttribute("quiz", quiz);
        
        // Chuyển tiếp đến trang takeQuiz.jsp
        request.getRequestDispatcher("/pages/takeQuiz.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet to start taking a quiz";
    }
}
