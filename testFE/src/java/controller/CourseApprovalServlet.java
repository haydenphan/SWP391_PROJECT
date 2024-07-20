package controller;

import DAO.CourseDAO;
import DAO.NotificationDAO;
import DAO.UserDAO;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Course;
import model.Notification;
import model.User;

@WebServlet(name = "CourseApprovalServlet", urlPatterns = {"/course-approval-servlet/*"})
public class CourseApprovalServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        String actionString = request.getPathInfo();

        System.out.println(actionString);
        String url = "";
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        int instructorId = Integer.parseInt(request.getParameter("instructorId"));
        Course course = CourseDAO.getCoursesByID(courseId);
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserByID(instructorId);
        request.setAttribute("instructor", user);
        request.setAttribute("course", course);

        switch (actionString) {
            case "/request" -> {
                handleSubmission(request, response, user, courseId);
            }
//            case "/submit" -> {
//                handleSubmission(request, response, user, courseId);
//            }
            default ->
                throw new AssertionError();
        }
        RequestDispatcher dis = request.getRequestDispatcher(url);
        dis.forward(request, response);
    }

    private void handleSubmission(HttpServletRequest request, HttpServletResponse response, User user, int courseId) throws ServletException, IOException {
        try {
            sendNotification(user, courseId);

            request.setAttribute("message", "Submission successful!");
            RequestDispatcher dis = request.getRequestDispatcher("/home?role="+user.getRole());
            dis.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Submission failed!");
            RequestDispatcher dis = request.getRequestDispatcher("/course-approval-servlet/request");
            dis.forward(request, response);
        }
    }

    private void sendNotification(User user, int courseId) {
        try {
            NotificationDAO notiDAO = new NotificationDAO();
            UserDAO userDAO = new UserDAO();
            List<Integer> adminIds = userDAO.getAllAdminIds();

            for (int adminId : adminIds) {
                Notification notification = new Notification();
                notification.setUserId(adminId);
                notification.setMessage("Instructor " + user.getUserID() + " requested to publish a course!");
                notification.setType("CoursePublicationRequest");
                notification.setTimeStamp(LocalDateTime.now());
                notification.setTarget("CoursePublicationRequest");
                notification.setTargetId(courseId);
                notification.setIsRead(false);
                notiDAO.insertNotification(notification);
            }
        } catch (Exception e) {
            Logger.getLogger(CourseApprovalServlet.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CourseApprovalServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CourseApprovalServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
