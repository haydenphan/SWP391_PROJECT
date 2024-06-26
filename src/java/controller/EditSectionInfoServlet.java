package controller;

import DAO.CourseSectionDAO;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CourseSection;

@WebServlet(name = "EditSectionInfoServlet", urlPatterns = {"/edit-section-info"})
public class EditSectionInfoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        int sectionId = Integer.parseInt(request.getParameter("sectionId"));
        CourseSection section = CourseSectionDAO.getSectionById(sectionId);
        if ("save".equals(action)) {
            saveSection(request, section);
            response.sendRedirect(request.getContextPath() + "/pages/instructor-profile.jsp");
        } else {
            request.setAttribute("section", section);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/editSectionInfo.jsp");
            dispatcher.forward(request, response);
        }
    }
    
     private void saveSection(HttpServletRequest request, CourseSection section) throws IOException, ServletException, Exception {
        String name = request.getParameter("sectionName");
        section.setSectionName(name);
        boolean isUpdated = CourseSectionDAO.updateSection(section);
        if (!isUpdated) {
            throw new ServletException("Error updating section");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(EditSectionInfoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(EditSectionInfoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
