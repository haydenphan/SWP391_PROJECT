package controller;

import DAO.CourseDAO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import model.Course;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.LocalDateTimeAdapter;

@WebServlet(name = "CourseForInstructorStatisticServlet", urlPatterns = {"/courses"})
public class CourseForInstructorStatisticServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(CourseForInstructorStatisticServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        String instructorIdStr = request.getParameter("instructorId");

        int instructorId;
        try {
            instructorId = Integer.parseInt(instructorIdStr);
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\": \"Invalid instructorId format\"}");
            return;
        }

        CourseDAO courseDAO = new CourseDAO();
        List<Course> courses;
        try {
            courses = courseDAO.getCoursesByInstructor(instructorId);
            if (courses == null || courses.isEmpty()) {
                LOGGER.info("No courses found for instructorId: " + instructorId);
            } else {
                LOGGER.info("Courses found for instructorId: " + instructorId + ", count: " + courses.size());
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Failed to fetch courses", e);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Failed to fetch courses: " + e.getMessage() + "\"}");
            return;
        }

        Gson gson = new GsonBuilder()
                .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter())
                .create();

        String json = gson.toJson(courses);

        try (PrintWriter out = response.getWriter()) {
            out.print(json);
        }
    }
}
