package controller;

import DAO.CourseSectionDAO;
import model.CourseSection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "SectionManagementServlet", urlPatterns = {"/section-management"})
public class SectionManagementServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        if ("save".equals(action)) {
            int sectionId = Integer.parseInt(request.getParameter("sectionId"));
            CourseSection section = CourseSectionDAO.getSectionById(sectionId);
            saveSection(request, section);
            response.sendRedirect(request.getContextPath() + "/course-section-servlet?courseId=" + section.getCourseID());
        } else if ("add-section".equals(action)) {
            addSection(request);
            response.sendRedirect(request.getContextPath() + "/course-section-servlet?courseId=" + request.getParameter("courseId"));
        }
    }

    private void saveSection(HttpServletRequest request, CourseSection section) throws Exception {
        String name = request.getParameter("sectionName");
        section.setSectionName(name);
        boolean isUpdated = CourseSectionDAO.updateSection(section);
        if (!isUpdated) {
            throw new ServletException("Error updating section");
        }
    }

    private void addSection(HttpServletRequest request) throws Exception {
        String name = request.getParameter("sectionName");
        int order = Integer.parseInt(request.getParameter("sectionOrder"));
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        String description = request.getParameter("sectionDescription");

        CourseSection newSection = new CourseSection();
        newSection.setSectionName(name);
        newSection.setSectionOrder(order);
        newSection.setCourseID(courseId);
        newSection.setCreatedDate(LocalDateTime.now());
        newSection.setSectionDescription(description);

        CourseSectionDAO dao = new CourseSectionDAO();
        int isAdded = dao.insert(newSection);
        if (isAdded == 0) {
            throw new ServletException("Error adding new section");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(SectionManagementServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(SectionManagementServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Section Management Servlet";
    }
}
