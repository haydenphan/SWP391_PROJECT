package controller;

import DAO.QuizAnswerDAO;
import DAO.QuizDAO;
import DAO.QuizQuestionDAO;
import DAO.QuizSubmissionDAO;
import DAO.QuizSubmissionDetailDAO;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.QuizQuestion;
import model.QuizSubmission;

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
                List<Integer> submissionIDs = QuizSubmissionDAO.getSubmissionIdsByQuizId(quizId);
                if (submissionIDs != null) {
                    for (Integer submissionID : submissionIDs) {
                        QuizSubmissionDetailDAO.deleteQuizSubmissionDetailsBySubmissionId(submissionID);
                    }
                }

                QuizSubmissionDAO.deleteSubmissionsByQuizId(quizId);

                List<QuizQuestion> questions = QuizQuestionDAO.getQuizQuestionsByQuizId(quizId);

                if (questions != null) {
                    for (QuizQuestion question : questions) {
                        QuizAnswerDAO.deleteAllAnswerByQuestionId(question.getQuestionID());
                    }
                }
                QuizQuestionDAO.deleteAllQuestionsByQuizId(quizId);

                boolean isDeleted = QuizDAO.deleteQuiz(quizId);
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
