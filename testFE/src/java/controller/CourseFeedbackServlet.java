package controller;

import DAO.CourseEnrollmentDAO;
import DAO.CourseFeedbackDAO;
import DAO.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.CourseFeedback;
import model.User;
import utils.TimeUtils;

@WebServlet(name = "CourseFeedbackServlet", urlPatterns = {"/courseFeedbacks"})
public class CourseFeedbackServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                CourseFeedbackDAO courseFbDAO = new CourseFeedbackDAO();
                UserDAO userDAO = new UserDAO();
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String courseID = request.getParameter("courseID");
            int page = Integer.parseInt(request.getParameter("page"));

            List<CourseFeedback> feedbacks = courseFbDAO.getFeedbacksByPage(courseID, page, 10);
            List<User> students = new ArrayList<>();
            for(CourseFeedback fb : feedbacks){
                int curUID = fb.getUserID();
                User curUser = userDAO.getUserByID(curUID);
                students.add(curUser);
            }
            if (feedbacks.isEmpty()) {
                out.println("<p>No more feedback available.</p>");
            } else {
                // Build HTML response
                for (int i = 0; i < feedbacks.size(); i++) {
                    CourseFeedback feedback = feedbacks.get(i);
                    User std = students.get(i);
                    out.println("<div class=\"course-review-item mb-30\">");
                    out.println("<div class=\"course-reviews-img\">");
                    out.println("<a href=\"#\"><img src=\"" + std.getAvatar() + " alt=\"image not found\"></a>");
                    out.println("</div>");
                    out.println("<div class=\"course-review-list\">");
                    out.println("<h5><a href=\"#\">" + std.getFirstName() + " " + std.getLastName() + "</a></h5>");
                    out.println("<div class=\"course-start-icon\">");
                    for (int j = 0; j < feedback.getRating(); j++) {
                        out.println("<i class=\"fas fa-star\"></i>");
                    }
                    out.println("<span>" + TimeUtils.getTimeAgo(feedback.getFeedbackDate()) + "</span>");
                    out.println("</div>");
                    out.println("<p>" + feedback.getComment() + "</p>");
                    out.println("</div>");
                    out.println("</div>");
                }
            }

        }
    }

    @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        CourseEnrollmentDAO ceDAO = new CourseEnrollmentDAO();
        String courseID = request.getParameter("courseID");
        boolean hasEnrolled = user!=null && ceDAO.isUserEnrolledInCourse(user.getUserID(), Integer.parseInt(courseID));
        if(!hasEnrolled){
            return;
        }
        CourseFeedbackDAO courseFbDAO = new CourseFeedbackDAO();
        // Receive parameters from the request
        String content = request.getParameter("content");
        int rating = Integer.parseInt(request.getParameter("rating"));
        
        // Create a new feedback object
        CourseFeedback feedback = new CourseFeedback();
        feedback.setCourseID(courseID);
        feedback.setComment(content);
        feedback.setRating(rating);
        feedback.setFeedbackDate(LocalDateTime.now());
        feedback.setUserID(user.getUserID()); 
        
        // Insert the feedback into the database
        int result = courseFbDAO.insert(feedback);
        
        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/CourseDetail?id=" + courseID + "&res=success");
        } else {
            response.sendRedirect(request.getContextPath() + "/CourseDetail?id=" + courseID + "&res=fail");
        }
    }

    @Override
    public String getServletInfo() {
        return "Course Feedback Servlet";
    }
}