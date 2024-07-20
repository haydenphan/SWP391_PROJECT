package controller;

import DAO.QuizAnswerDAO;
import DAO.QuizDAO;
import DAO.QuizQuestionDAO;
import DAO.QuizSubmissionDetailDAO;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Quiz;
import model.QuizQuestion;
import model.QuizSubmissionDetail;
import model.User;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import model.QuizAnswer;

@WebServlet(name = "ViewQuizResultController", urlPatterns = {"/view-quiz-result"})
public class ViewQuizResultController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            request.getRequestDispatcher("pages/login.jsp").forward(request, response);
            return;
        }
        int quizID = Integer.parseInt(request.getParameter("quizID"));
        Quiz quiz = QuizDAO.getQuizById(quizID);
        int userID = user.getUserID();

        // Get questions and answers
        List<QuizQuestion> questions = QuizQuestionDAO.getQuizQuestionsByQuizId(quizID);
        for (QuizQuestion question : questions) {
            List<QuizAnswer> answers = QuizAnswerDAO.getAnswersByQuestionId(question.getQuestionID());
            question.setAnswers(answers);
        }

        // Get user's answers
        List<QuizSubmissionDetail> userAnswers = QuizSubmissionDetailDAO.getUserAnswers(userID, quizID);

        // Create a map between questions and user's selected answers
        Map<Integer, Integer> questionAnswerMap = new HashMap<>();
        for (QuizSubmissionDetail detail : userAnswers) {
            questionAnswerMap.put(detail.getQuestionId(), detail.getAnswerId());
        }

        request.setAttribute("questions", questions);
        request.setAttribute("questionAnswerMap", questionAnswerMap);
        request.setAttribute("score", QuizDAO.calculateScore(quizID, userID));
        request.setAttribute("quiz", quiz);
        request.setAttribute("quizDateSubmit", QuizDAO.DateSubmit(userID, quizID));
        request.setAttribute("numbresQuiz", QuizDAO.numbersQuiz(quizID));

        request.getRequestDispatcher("pages/viewQuizResult.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ViewQuizResultController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ViewQuizResultController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
