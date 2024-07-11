package controller;

import DAO.CourseDAO;
import DAO.NotificationDAO;
import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Course;
import model.Notification;
import model.User;

@WebServlet(name = "EditRequestServlet", urlPatterns = {"/edit-request"})
public class EditRequestServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("user");
        String action = request.getParameter("action");
        int courseId = Integer.parseInt(request.getParameter("courseId"));

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        boolean success = false;

        if (user != null && action != null) {
            switch (action) {
                case "requestEdit" -> {
                    handleRequestEditCourse(user, courseId, request, response);
                    success = true;
                }
                case "approveEdit" -> {
                    success = handleApproveEditCourse(user, courseId, request, response);
                }
                case "rejectEdit" -> {
                    success = handleRejectEditCourse(user, courseId, request, response);
                }
                default -> {
                    response.sendRedirect(request.getContextPath() + "/CourseDetail?id=" + courseId);
                }
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/CourseDetail?id=" + courseId);
        }

        out.print("{\"success\": " + success + "}");
        out.flush();
    }

    private void handleRequestEditCourse(User user, int courseId, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        NotificationDAO notiDAO = new NotificationDAO();
        UserDAO userDAO = new UserDAO();
        List<Integer> adminIds = userDAO.getAllAdminIds();

        for (int adminId : adminIds) {
            Notification notification = new Notification();
            notification.setUserId(adminId);
            notification.setMessage("Instructor " + user.getUserID() + " requested edit course " + courseId + "!");
            notification.setType("EditCourseRequest");
            notification.setTimeStamp(LocalDateTime.now());
            notification.setTarget("EditCourseRequest");
            notification.setTargetId(courseId);
            notification.setIsRead(false);
            notiDAO.insertNotification(notification);
        }

        // Set an alert flag
        request.getSession().setAttribute("showAlert", true);

        // Redirect to the course details page
        response.sendRedirect(request.getContextPath() + "/CourseDetail?id=" + courseId);
    }

    private boolean handleApproveEditCourse(User user, int courseId, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Logic to approve the edit request
        CourseDAO courseDAO = new CourseDAO();
        courseDAO.setCourseUnpublished(courseId);

        Course course = courseDAO.getCourseByID(courseId);

        // Notify the instructor
        NotificationDAO notiDAO = new NotificationDAO();
        Notification notification = new Notification();
        notification.setUserId(course.getCreatedBy());
        notification.setMessage("Your course edit request has been approved. Start editing!");
        notification.setType("CourseEditApproved");
        notification.setTimeStamp(LocalDateTime.now());
        notification.setTarget("Course");
        notification.setTargetId(courseId);
        notification.setIsRead(false);
        notiDAO.insertNotification(notification);

        return true;
    }

    private boolean handleRejectEditCourse(User user, int courseId, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Logic to reject the edit request
        CourseDAO courseDAO = new CourseDAO();
        Course course = courseDAO.getCourseByID(courseId);

        // Notify the instructor
        NotificationDAO notiDAO = new NotificationDAO();
        Notification notification = new Notification();
        notification.setUserId(course.getCreatedBy());
        notification.setMessage("Your course edit request has been rejected.");
        notification.setType("CourseEditRejected");
        notification.setTimeStamp(LocalDateTime.now());
        notification.setTarget("Course");
        notification.setTargetId(courseId);
        notification.setIsRead(false);
        notiDAO.insertNotification(notification);

        return true;
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
        return "Course Action Servlet";
    }
}
