package controller;

import DAO.CourseEnrollmentDAO;
import DAO.InstructorFeedbackDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.FeedbackStatistics;
import model.User;

@WebServlet(name = "InstructorProfileViewServlet", urlPatterns = {"/InstructorProfileView"})
public class InstructorProfileViewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        CourseEnrollmentDAO ceDAO = new CourseEnrollmentDAO();
//        User user = new User();
//        user.setUserID(1);
        String instructorID = request.getParameter("id");
        boolean hasEnrolled = user!=null && ceDAO.isLearnerEnrolledInInstructorCourse(user.getUserID(), Integer.parseInt(instructorID));
        FeedbackStatistics instStats = new FeedbackStatistics();
        InstructorFeedbackDAO instFbDAO = new InstructorFeedbackDAO();
        instStats.setNumberOfStarRatingList(instFbDAO.getStarRatingsCount(instructorID));
        request.setAttribute("instStats", instStats);
        request.setAttribute("hasEnrolled", hasEnrolled);
        request.getRequestDispatcher("/pages/instructor-profile-view.jsp").forward(request, response);
    }

}