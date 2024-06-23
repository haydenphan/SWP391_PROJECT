package controller;

import DAO.CourseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

@WebServlet(name = "AdminCourseManage", urlPatterns = {"/AdminCourseManage/*"})
public class AdminCourseManage extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminCourseManage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminCourseManage at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CourseDAO cdao = new CourseDAO();
        String courseIDParam = request.getParameter("courseID");
        String actionString = request.getPathInfo();
        String url = "";

        switch (actionString) {
            case "/approve" -> {
                if (courseIDParam != null) {
                    int courseID = Integer.parseInt(courseIDParam);
                    cdao.updateCourseStatus(courseID, true);
                    url = "../pending-course-list";
                }
            }
            case "/cancel" -> {
                if (courseIDParam != null) {
                    int courseID = Integer.parseInt(courseIDParam);
                    try {
                        cdao.cancelCourse(courseID);
                    } catch (Exception ex) {
                        Logger.getLogger(AdminCourseManage.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    url = "../pending-course-list";
                }
            }
            default ->
                throw new AssertionError();
        }

        response.sendRedirect(url);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
