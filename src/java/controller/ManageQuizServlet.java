package controller;

import DAO.QuizAnswerDAO;
import DAO.QuizDAO;
import DAO.QuizQuestionDAO;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.QuizAnswer;
import model.QuizQuestion;

@WebServlet(name = "ManageQuizServlet", urlPatterns = {"/manage-quiz/*"})
public class ManageQuizServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        String actionString = request.getPathInfo();
        String url = "";
        int sectionId = Integer.parseInt(request.getParameter("sectionId"));
        int quizId = Integer.parseInt(request.getParameter("quizId"));
        switch (actionString) {
            case "/delete" -> {
                List<QuizQuestion> questionList = QuizQuestionDAO.getQuizQuestionsByQuizId(quizId);
                for (QuizQuestion quizQuestion : questionList) {
                    QuizAnswerDAO.deleteAllAnswerByQuestionId(quizQuestion.getQuestionID());
                }
                QuizQuestionDAO.deleteAllQuestionsByQuizId(quizId);

                boolean isDeleted = QuizDAO.deleteQuizById(quizId);
                if (isDeleted) {
                    url = "/pages/quizManagement.jsp?sectionId=" + sectionId; // Redirect to quiz list page
                    request.setAttribute("message", "Quiz deleted successfully.");
                } else {
                    url = "/errors/errorAlert.jsp"; // Redirect to an error page
                    request.setAttribute("errorMessage", "Failed to delete quiz.");
                }
            }
            default ->
                throw new AssertionError();
        }
        RequestDispatcher dis = request.getRequestDispatcher(url);
        dis.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ManageQuizServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ManageQuizServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
