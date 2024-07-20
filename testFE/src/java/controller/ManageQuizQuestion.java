package controller;

import DAO.QuizAnswerDAO;
import DAO.QuizQuestionDAO;
import DAO.QuizSubmissionDAO;
import DAO.QuizSubmissionDetailDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.QuizAnswer;
import model.QuizQuestion;

@WebServlet(urlPatterns = {"/manage-question"})
public class ManageQuizQuestion extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        int quizID = Integer.parseInt(request.getParameter("quizId"));

        try {
            if ("delete".equalsIgnoreCase(action)) {
                int questionID = Integer.parseInt(request.getParameter("questionId"));
                deleteQuestion(questionID);
            } else if ("add".equalsIgnoreCase(action)) {
                addQuestion(request, quizID);
            }

            // Redirect to quiz previews page with the quiz ID
            response.sendRedirect(request.getContextPath() + "/pages/quizPreviews.jsp?quizId=" + quizID);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "An error occurred while managing the quiz question. Please try again.");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    private void addQuestion(HttpServletRequest request, int quizID) throws Exception {
        // Retrieve single question data from request
        String questionText = request.getParameter("questionText");
        String questionType = request.getParameter("questionType");

        // Add question to database and get the generated question ID
        QuizQuestion question = new QuizQuestion();
        question.setQuizID(quizID);
        question.setQuestionText(questionText);
        question.setQuestionType(questionType);
        int questionID = QuizQuestionDAO.addQuizQuestion(question);

        // Process answers for the current question based on question type
        if ("TrueFalse".equals(questionType)) {
            String[] answers = {"True", "False"};
            for (int i = 1; i <= 2; i++) {
                String answerText = answers[i - 1];
                boolean isCorrect = request.getParameter("isCorrect" + i) != null;

                // Add answer to database
                QuizAnswer answer = new QuizAnswer();
                answer.setQuestionID(questionID);
                answer.setAnswerText(answerText);
                answer.setCorrect(isCorrect);
                QuizAnswerDAO.addQuizAnswer(answer);
            }
        } else if ("MultipleChoice".equals(questionType)) {
            for (int i = 1; i <= 4; i++) {
                String answerText = request.getParameter("answerText" + i);
                boolean isCorrect = request.getParameter("isCorrect" + i) != null;

                // Add answer to database
                QuizAnswer answer = new QuizAnswer();
                answer.setQuestionID(questionID);
                answer.setAnswerText(answerText);
                answer.setCorrect(isCorrect);
                QuizAnswerDAO.addQuizAnswer(answer);
            }
        }
    }

    private void deleteQuestion(int questionId) throws Exception {
        QuizSubmissionDetailDAO.deleteQuizSubmissionDetailsByQuestionId(questionId);
        QuizAnswerDAO.deleteAllAnswerByQuestionId(questionId);
        QuizQuestionDAO.deleteQuestionById(questionId);
    }

    @Override
    public String getServletInfo() {
        return "Servlet to add or delete a quiz question and its answers.";
    }
}
