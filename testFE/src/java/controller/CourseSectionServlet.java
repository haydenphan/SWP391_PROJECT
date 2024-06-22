package controller;

import DAO.CourseSectionDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CourseSection;

@WebServlet(name = "CourseSectionServlet", urlPatterns = {"/course-section-servlet"})
public class CourseSectionServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        List<CourseSection> sectionList = CourseSectionDAO.getCourseSections(courseId);
        if (sectionList != null) {
            request.setAttribute("sectionList", sectionList);
            RequestDispatcher dis = request.getRequestDispatcher("/pages/manageSection.jsp");
            dis.forward(request, response);
        } else {
            request.setAttribute("error", "The course do not have any section!");
            RequestDispatcher dis = request.getRequestDispatcher("/errors/errorAlert.jsp");
            dis.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
