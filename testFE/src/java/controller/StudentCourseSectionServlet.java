package controller;

import DAO.CourseSectionDAO;
import DAO.QuizDAO;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CourseSection;
import model.Quiz;

@WebServlet(name = "StudentCourseSectionServlet", urlPatterns = {"/student-course-section-servlet"})
public class StudentCourseSectionServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        int sectionID = Integer.parseInt(request.getParameter("sectionId"));
        CourseSection section = CourseSectionDAO.getSectionById(sectionID);
        List<Quiz> quizzes = QuizDAO.getQuizzesBySectionId(sectionID);
        request.setAttribute("quizzes", quizzes);
        request.setAttribute("section", section);
        RequestDispatcher dis = request.getRequestDispatcher("/pages/studentCourseSections.jsp?sectionName=" + section.getSectionName());
        dis.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(StudentCourseSectionServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(StudentCourseSectionServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
