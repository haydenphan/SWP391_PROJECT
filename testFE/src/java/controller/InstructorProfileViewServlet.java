package controller;

import DAO.CourseEnrollmentDAO;
import DAO.InstructorFeedbackDAO;
import DAO.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.FeedbackStatistics;
import model.User;

@WebServlet(name = "InstructorProfileViewServlet", urlPatterns = {"/InstructorProfileView"})
public class InstructorProfileViewServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        CourseEnrollmentDAO ceDAO = new CourseEnrollmentDAO();
//        User user = new User();
//        user.setUserID(1);
        String instructorID = request.getParameter("id");
        boolean hasEnrolled = user != null && ceDAO.isLearnerEnrolledInInstructorCourse(user.getUserID(), Integer.parseInt(instructorID));
        FeedbackStatistics instStats = new FeedbackStatistics();
        InstructorFeedbackDAO instFbDAO = new InstructorFeedbackDAO();
        instStats.setNumberOfStarRatingList(instFbDAO.getStarRatingsCount(instructorID));
        request.setAttribute("instStats", instStats);
        request.setAttribute("hasEnrolled", hasEnrolled);
        UserDAO dao = new UserDAO();
        User instructor = dao.getUserByID(Integer.parseInt(instructorID));
        if (user != null) {
            request.setAttribute("hasSubmittedFeedback", InstructorFeedbackDAO.hasSubmittedFeedback(instructor.getUserID(), user.getUserID()));
        }
        request.setAttribute("instructor", instructor);
        request.getRequestDispatcher("/pages/instructor-profile-view.jsp").forward(request, response);
    }

}
