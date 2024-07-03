package controller;

import DAO.QuizDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import model.Quiz;

@WebServlet(name = "AddQuiz", urlPatterns = {"/add-quiz"})
public class AddQuiz extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddQuiz</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddQuiz at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            int sectionId = Integer.parseInt(request.getParameter("sectionId"));
            String quizName = request.getParameter("quizName");
            boolean isGraded = request.getParameter("isGraded") != null;
            LocalDateTime createdDate = LocalDateTime.now();
            int timeLimitInSeconds = Integer.parseInt(request.getParameter("timeLimitInSeconds")); // Get time limit from request

            Quiz newQuiz = new Quiz();
            newQuiz.setSectionId(sectionId);
            newQuiz.setQuizName(quizName);
            newQuiz.setGraded(isGraded);
            newQuiz.setCreatedDate(createdDate);
            newQuiz.setTimeLimitInSeconds(timeLimitInSeconds); // Set time limit

            QuizDAO.createQuiz(newQuiz);

            request.setAttribute("newQuiz", newQuiz);

            // Redirect to createQuizForm.jsp with quizID parameter
            response.sendRedirect(request.getContextPath() + "/pages/quizQuestion.jsp?quizID=" + newQuiz.getQuizId());

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input format");
        } catch (IOException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing request");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
