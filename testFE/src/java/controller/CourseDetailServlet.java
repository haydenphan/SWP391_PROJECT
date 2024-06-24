package controller;

import DAO.CourseDAO;
import DAO.CourseEnrollmentDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Course;
import model.User;

@WebServlet(name = "CourseDetailServlet", urlPatterns = {"/CourseDetail"})
public class CourseDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CourseDAO courseDAO = new CourseDAO();
        CourseEnrollmentDAO ceDAO = new CourseEnrollmentDAO();
        User user = (User) request.getSession().getAttribute("user");
        String courseID = request.getParameter("id");
        boolean hasEnrolled = user==null? false : ceDAO.isUserEnrolledInCourse(user.getUserID(), Integer.parseInt(courseID));
        Course course = courseDAO.getCourseByID(Integer.parseInt(courseID));
        course.setNumberOfStarRatingList(courseDAO.getStarRatingsCount(courseID));
        request.setAttribute("course", course);
        request.setAttribute("hasEnrolled", hasEnrolled);
        request.getRequestDispatcher("/pages/courseDetails.jsp").forward(request, response);
    }

}
