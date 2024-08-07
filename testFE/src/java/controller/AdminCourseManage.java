package controller;

import DAO.CourseDAO;
import DAO.NotificationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Course;
import model.Notification;

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
                    Course course = CourseDAO.getCoursesByID(courseID);
                    cdao.updateCourseStatus(courseID, true);

                    // Notify the instructor
                    NotificationDAO notiDAO = new NotificationDAO();
                    Notification notification = new Notification();
                    notification.setUserId(course.getCreatedBy());
                    notification.setMessage("Your course publication request has been approved!");
                    notification.setType("CourseApproved");
                    notification.setTimeStamp(LocalDateTime.now());
                    notification.setTarget("Course");
                    notification.setTargetId(courseID);
                    notification.setIsRead(false);
                    notiDAO.insertNotification(notification);

                    url = "../pending-course-list";
                }
            }
            case "/cancel" -> {
                if (courseIDParam != null) {
                    int courseID = Integer.parseInt(courseIDParam);
                    try {
                        cdao.cancelCourse(courseID);

                        Course course = CourseDAO.getCoursesByID(courseID);
                        // Notify the instructor
                        NotificationDAO notiDAO = new NotificationDAO();
                        Notification notification = new Notification();
                        notification.setUserId(course.getCreatedBy());
                        notification.setMessage("Your course publication request has been rejected!");
                        notification.setType("CourseRejected");
                        notification.setTimeStamp(LocalDateTime.now());
                        notification.setTarget("CourseRejected");
                        notification.setTargetId(courseID);
                        notification.setIsRead(false);
                        notiDAO.insertNotification(notification);

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
