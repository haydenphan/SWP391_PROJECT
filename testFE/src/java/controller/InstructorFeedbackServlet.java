package controller;

import DAO.CourseEnrollmentDAO;
import DAO.InstructorFeedbackDAO;
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
            User user = (User) request.getSession().getAttribute("user");
//            user = new User();
//            user.setUserID(1);
            if (user != null) {
                InstructorFeedback userFeedback = instructorFbDAO.getFeedbackForInstructorByLearner(instructorID, user.getUserID());
                if (userFeedback != null) {
                    out.println("<h4>Your feedback</h4>");
                    out.println("<div class=\"course-review-item mb-30\">");
                    out.println("<div class=\"course-reviews-img\">");
                    out.println("<a href=\"#\"><img src=\"" + userFeedback.getLearner().getAvatar() + "\" alt=\"image not found\"></a>");
                    out.println("</div>");
                    out.println("<div class=\"course-review-list\">");
                    out.println("<h5><a href=\"#\">" + userFeedback.getLearner().getFirstName() + " " + userFeedback.getLearner().getLastName() + "</a></h5>");
                    out.println("<div class=\"course-start-icon\">");
                    for (int j = 0; j < userFeedback.getRating(); j++) {
                        out.println("<i class=\"fas fa-star\"></i>");
                    }
                    out.println("<span>" + TimeUtils.getTimeAgo(userFeedback.getFeedbackDate()) + "</span>");
                    out.println("</div>");
                    out.println("<p>" + userFeedback.getComment() + "</p>");
                    out.println("</div>");
                    out.println("</div>");
                }
            }
            List<InstructorFeedback> feedbacks = instructorFbDAO.getFeedbacksByPage(instructorID, page, 10);
            if (user != null) {
                for (int i = 0; i < feedbacks.size(); i++) {
                    if (feedbacks.get(i).getLearnerID() == user.getUserID()) {
                        feedbacks.remove(i);
                        break;
                    }
                }
            }

            if (feedbacks.isEmpty()) {
                out.println("<p>No more feedback available.</p>");
            } else {
                // Build HTML response
                out.println("<h4>Other feedbacks</h4>");
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
        String method = (String)request.getParameter("_method");
        if(method.equals("PUT")){
            doPut(request, response);
            return;
        }
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        CourseEnrollmentDAO ceDAO = new CourseEnrollmentDAO();
//        User user = new User();
//        user.setUserID(1);
        int instructorID = Integer.parseInt(request.getParameter("instructorID"));

        //Check to allow post 
        if (user == null) {
            return;
        }
        if (!ceDAO.isLearnerEnrolledInInstructorCourse(user.getUserID(), instructorID)) {
            return;
        }
        InstructorFeedbackDAO instructorFbDAO = new InstructorFeedbackDAO();
        if (instructorFbDAO.getFeedbackForInstructorByLearner(instructorID, user.getUserID()) != null) {
            return;
        }

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
        response.sendRedirect(request.getContextPath() + "/InstructorProfileView?id=" + instructorID + "&res=success");
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
//        user = new User();
//        user.setUserID(1);
        if(user == null){
            return;
        }
        String content = request.getParameter("content");
        int instructorID = Integer.parseInt(request.getParameter("instructorID"));
        int rating = Integer.parseInt(request.getParameter("rating"));

        InstructorFeedbackDAO instructorFbDAO = new InstructorFeedbackDAO();
        InstructorFeedback feedback = instructorFbDAO.getFeedbackForInstructorByLearner(instructorID, user.getUserID());

        if (feedback != null) {
            feedback.setComment(content);
            feedback.setRating(rating);
            feedback.setFeedbackDate(LocalDateTime.now());

            int result = instructorFbDAO.update(feedback);
            String resTxt = "";
            if (result > 0) {
                resTxt = "success";
                response.sendRedirect(request.getContextPath() + "/InstructorProfileView?id=" + instructorID + "&res="+resTxt);
            } else {
                resTxt = "fail";
                response.sendRedirect(request.getContextPath() + "/InstructorProfileView?id=" + instructorID + "&res="+resTxt);
            }
        } else {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "You do not have permission to update this feedback.");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if(user == null){
            return;
        }
        int instructorID = Integer.parseInt(request.getParameter("instructorID"));
        InstructorFeedbackDAO instructorFbDAO = new InstructorFeedbackDAO();
        InstructorFeedback feedback = instructorFbDAO.getFeedbackForInstructorByLearner(instructorID, user.getUserID());

        if (feedback != null) {
            int result = instructorFbDAO.delete(feedback.getFeedbackID());
            String resTxt = "";
            if (result > 0) {
                resTxt = "success";
                response.sendRedirect(request.getContextPath() + "/InstructorProfileView?id=" + instructorID + "&res="+resTxt);
            } else {
                resTxt = "fail";
                response.sendRedirect(request.getContextPath() + "/InstructorProfileView?id=" + instructorID + "&res="+resTxt);
            }
        } else {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "You do not have permission to delete this feedback.");
        }
    }

    @Override
    public String getServletInfo() {
        return "Instructor Feedback Servlet";
    }
}
