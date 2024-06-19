package controller;

import DAO.CourseDAO;
import DAO.CourseEnrollmentDAO;
import DAO.CourseFeedbackDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Course;
import model.FeedbackStatistics;
import model.User;

@WebServlet(name = "CourseDetailServlet", urlPatterns = {"/CourseDetail"})
public class CourseDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CourseDAO courseDAO = new CourseDAO();
        CourseEnrollmentDAO ceDAO = new CourseEnrollmentDAO();
        CourseFeedbackDAO courseFbDAO = new CourseFeedbackDAO();
        User user = (User) request.getSession().getAttribute("user");
        
        String courseID = request.getParameter("id");
        boolean hasEnrolled = user!=null && ceDAO.isUserEnrolledInCourse(user.getUserID(), Integer.parseInt(courseID));
        boolean hasFeedbacked = user!=null && courseFbDAO.getFeedbackForCourseByLearner(courseID, user.getUserID())!=null;
        Course course = courseDAO.getCourseByID(courseID);
        FeedbackStatistics coStats = new FeedbackStatistics();
        coStats.setNumberOfStarRatingList(courseDAO.getStarRatingsCount(courseID));
        request.setAttribute("course", course);
        request.setAttribute("coStats", coStats);
        request.setAttribute("hasEnrolled", hasEnrolled);
        request.setAttribute("hasFeedbacked", hasFeedbacked);
        request.getRequestDispatcher("/pages/courseDetails.jsp").forward(request, response);
    }

}
