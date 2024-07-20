package controller;

import DAO.QuizDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Quiz;

@WebServlet(name = "AddQuiz", urlPatterns = {"/add-quiz"})
public class AddQuiz extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
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
            String quizDescription = request.getParameter("quizDescription");
            String duration = request.getParameter("duration"); // Get duration as MM:SS

            LocalDateTime createdDate = LocalDateTime.now();

            Quiz newQuiz = new Quiz();
            newQuiz.setSectionId(sectionId);
            newQuiz.setQuizName(quizName);
            newQuiz.setQuizDescription(quizDescription);
            newQuiz.setCreatedDate(createdDate);
            newQuiz.setDuration(duration);

            int quizId = QuizDAO.addQuiz(newQuiz); // Changed to int
            newQuiz.setQuizId(quizId); // Set the quiz ID after creation

            request.setAttribute("newQuiz", newQuiz);

            // Redirect to quizQuestion.jsp with quizID parameter
            RequestDispatcher rd = request.getRequestDispatcher("/pages/quizManagement.jsp?sectionId=" + newQuiz.getSectionId());
            rd.forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input format");
        } catch (IOException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing request");
        } catch (Exception ex) {
            Logger.getLogger(AddQuiz.class.getName()).log(Level.SEVERE, null, ex);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing request");
        }
    }

    @Override
    public String getServletInfo() {
        return "AddQuiz Servlet";
    }
}
