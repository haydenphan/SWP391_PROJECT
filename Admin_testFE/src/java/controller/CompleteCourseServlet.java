package controller;

import DAO.CertificateDAO;
import DAO.CourseCompletionDAO;
import DAO.CourseDAO;
import DAO.JDBC;
import model.Certificate;
import model.Course;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "CompleteCourseServlet", urlPatterns = {"/completeCourse"})
public class CompleteCourseServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public CompleteCourseServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Logger logger = Logger.getLogger(CompleteCourseServlet.class.getName());
        int userId = 0;
        int courseId = 0;

        try {
            userId = Integer.parseInt(request.getParameter("userId"));
            courseId = Integer.parseInt(request.getParameter("courseId"));
            logger.log(Level.INFO, "Received request: userId={0}, courseId={1}", new Object[]{userId, courseId});
        } catch (NumberFormatException e) {
            logger.log(Level.SEVERE, "Invalid UserID or CourseID format", e);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid UserID or CourseID format");
            return;
        }

        Connection connection = null;
        try {
            connection = JDBC.getConnectionWithSqlJdbc();
            logger.log(Level.INFO, "Database connection established");

            CourseCompletionDAO completionDAO = new CourseCompletionDAO(connection);
            CourseDAO courseDAO = new CourseDAO();

            // Retrieve course information
            Course course = courseDAO.getCourseByID(courseId);
            if (course == null) {
                logger.log(Level.SEVERE, "Course not found for courseId: {0}", courseId);
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Course not found");
                return;
            }
            logger.log(Level.INFO, "Course retrieved: {0}", course.getCourseName());

            String learnerName = completionDAO.getLearnerName(userId);
            if (learnerName == null) {
                logger.log(Level.SEVERE, "Learner not found for userId: {0}", userId);
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Learner not found");
                return;
            }
            logger.log(Level.INFO, "Learner retrieved: {0}", learnerName);

            String instructorName = completionDAO.getInstructorName(course.getCreatedBy());
            if (instructorName == null) {
                logger.log(Level.SEVERE, "Instructor not found for instructorId: {0}", course.getCreatedBy());
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Instructor not found");
                return;
            }
            logger.log(Level.INFO, "Instructor retrieved: {0}", instructorName);

            // Complete the course
            completionDAO.completeCourse(userId, courseId);
            logger.log(Level.INFO, "Course completion recorded");

            // Generate the certificate PDF
            String certificateUrl = CertificateGenerator.generateCertificate(getServletContext(), response, learnerName, course.getCourseName(), instructorName);
            logger.log(Level.INFO, "Certificate generated successfully");

            // Save certificate info to database
            Certificate certificate = new Certificate(userId, learnerName, instructorName, course.getCourseName(), certificateUrl);
            CertificateDAO certificateDAO = new CertificateDAO(connection);
            certificateDAO.insertCertificate(certificate);

            logger.log(Level.INFO, "Certificate saved to database successfully");

        } catch (SQLException | ClassNotFoundException e) {
            logger.log(Level.SEVERE, "Database error", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while completing the course.");
        } catch (Exception ex) {
            logger.log(Level.SEVERE, "An error occurred", ex);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred: " + ex.getMessage());
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                    logger.log(Level.INFO, "Database connection closed");
                } catch (SQLException e) {
                    logger.log(Level.SEVERE, "Error closing the database connection", e);
                }
            }
        }
    }
}
