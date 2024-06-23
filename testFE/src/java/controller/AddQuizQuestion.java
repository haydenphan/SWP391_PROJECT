package controller;

import DAO.QuizAnswerDAO;
import DAO.QuizQuestionDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.QuizAnswer;
import model.QuizQuestion;

@WebServlet(urlPatterns = {"/addquestion"})
public class AddQuizQuestion extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        int quizID = Integer.parseInt(request.getParameter("quizId"));

        // Loop through each question
        int questionCount = 1;
        while (request.getParameter("questionText" + questionCount) != null) {
            String questionText = request.getParameter("questionText" + questionCount);
            String questionType = request.getParameter("questionType" + questionCount);

            // Add question to database and get the generated question ID
            QuizQuestion question = new QuizQuestion();
            question.setQuizID(quizID);
            question.setQuestionText(questionText);
            question.setQuestionType(questionType);
            int questionID = QuizQuestionDAO.addQuizQuestion(question);

            // Process answers for the current question
            int answerCount = 1;
            while (request.getParameter("answerText" + questionCount + "_" + answerCount) != null) {
                String answerText = request.getParameter("answerText" + questionCount + "_" + answerCount);
                boolean isCorrect = request.getParameter("isCorrect" + questionCount + "_" + answerCount) != null;

                // Add answer to database
                QuizAnswer answer = new QuizAnswer();
                answer.setQuestionID(questionID);
                answer.setAnswerText(answerText);
                answer.setCorrect(isCorrect);
                QuizAnswerDAO.addQuizAnswer(answer);
                answerCount++;
            }

            questionCount++;
        }

        // Redirect or forward as needed
        request.setAttribute("quizId", quizID);
        RequestDispatcher dis = request.getRequestDispatcher("/pages/quizPreviews.jsp");
        dis.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet to add quiz questions and their answers.";
    }
}
