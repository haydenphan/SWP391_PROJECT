package controller;

import DAO.CourseEnrollmentDAO;
import DAO.InstructorFeedbackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.InstructorFeedback;
import model.User;
import utils.TimeUtils;

@WebServlet(name = "InstructorFeedbackServlet", urlPatterns = {"/instructorFeedbacks"})
public class InstructorFeedbackServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Method intentionally left blank
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        InstructorFeedbackDAO instructorFbDAO = new InstructorFeedbackDAO();
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int instructorID = Integer.parseInt(request.getParameter("instructorID"));
            int page = Integer.parseInt(request.getParameter("page"));

            List<InstructorFeedback> feedbacks = instructorFbDAO.getFeedbacksByPage(instructorID, page, 10);

            if (feedbacks.isEmpty()) {
                out.println("<p>No more feedback available.</p>");
            } else {
                // Build HTML response
                for (int i = 0; i < feedbacks.size(); i++) {
                    InstructorFeedback feedback = feedbacks.get(i);
                    out.println("<div class=\"course-review-item mb-30\">");
                    out.println("<div class=\"course-reviews-img\">");
                    out.println("<a href=\"#\"><img src=\"" + feedback.getLearner().getAvatar() + "\" alt=\"image not found\"></a>");
                    out.println("</div>");
                    out.println("<div class=\"course-review-list\">");
                    out.println("<h5><a href=\"#\">" + feedback.getLearner().getFirstName() + " " + feedback.getLearner().getLastName() + "</a></h5>");
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
        User user = (User) session.getAttribute("user");
        CourseEnrollmentDAO ceDAO = new CourseEnrollmentDAO();
//        User user = new User();
//        user.setUserID(1);
        int instructorID = Integer.parseInt(request.getParameter("instructorID"));
        boolean hasEnrolled = user != null && ceDAO.isLearnerEnrolledInInstructorCourse(user.getUserID(), instructorID);
        if (!hasEnrolled) {
            return;
        }
        InstructorFeedbackDAO instructorFbDAO = new InstructorFeedbackDAO();

        // Receive parameters from the request
        String content = request.getParameter("content");
        int rating = Integer.parseInt(request.getParameter("rating"));

        // Create a new feedback object
        InstructorFeedback feedback = new InstructorFeedback();
        feedback.setInstructorID(instructorID);
        feedback.setComment(content);
        feedback.setRating(rating);
        feedback.setFeedbackDate(LocalDateTime.now());
        User learner = new User();
        learner.setUserID(user.getUserID());
        feedback.setLearner(learner);

        // Insert the feedback into the database
        int result = instructorFbDAO.insert(feedback);

        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/InstructorProfileView?id=" + instructorID + "&res=success");
        } else {
            response.sendRedirect(request.getContextPath() + "/InstructorDetail?id=" + instructorID + "&res=fail");
        }
    }

    @Override
    public String getServletInfo() {
        return "Instructor Feedback Servlet";
    }
}
