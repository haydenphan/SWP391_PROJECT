package controller;

import DAO.CourseSectionDAO;
import DAO.SectionLectureDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.CourseSection;
import model.SectionLecture;

@WebServlet(name = "ViewSectionServlet", urlPatterns = {"/view-section-servlet"})
public class ViewSectionServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ViewSectionServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewSectionServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        List<CourseSection> courseSections = CourseSectionDAO.getCourseSections(courseId);
        for (CourseSection section : courseSections) {
            List<SectionLecture> lectures = SectionLectureDAO.getLecturesBySectionId(section.getSectionID());
            section.setLectures(lectures);
        }
        request.setAttribute("sections", courseSections);
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/viewSection.jsp");
        dispatcher.forward(request, response);
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
