package controller;

import DAO.CourseDAO;
import DAO.CourseSectionDAO;
import DAO.LectureMaterialDAO;
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
import model.Course;
import model.CourseSection;
import model.LectureMaterial;
import model.SectionLecture;

@WebServlet(name = "ViewSectionServlet", urlPatterns = {"/view-section-servlet"})
public class ViewSectionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int courseId = Integer.parseInt(request.getParameter("courseId"));

        // Fetch course details
        Course course = CourseDAO.getCoursesByID(courseId);

        // Fetch course sections
        List<CourseSection> courseSections = CourseSectionDAO.getCourseSections(courseId);
        for (CourseSection section : courseSections) {
            // Fetch lectures for each section
            List<SectionLecture> lectures = SectionLectureDAO.getLecturesBySectionId(section.getSectionID());
            section.setLectures(lectures);

            for (SectionLecture lecture : lectures) {
                // Fetch materials for each lecture
                List<LectureMaterial> materials = LectureMaterialDAO.getLectureMaterialsByLectureID(lecture.getLectureID());
                lecture.setLectureMaterials(materials);
            }
        }

        // Set attributes for JSP
        request.setAttribute("course", course);
        request.setAttribute("sections", courseSections);

        // Forward to JSP
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
        return "Servlet for viewing sections, lectures, and materials of a course";
    }

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
}