package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import model.Course;

public class CourseCompletionDAO {

    private Connection connection;

    public CourseCompletionDAO(Connection connection) {
        this.connection = connection;
    }

    public void markCourseAsCompleted(int userId, int courseId) throws SQLException {
        String sql = "INSERT INTO CourseCompletion (UserId, CourseID, completionDate, Status) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, courseId);
            ps.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            ps.setString(4, "Completed");
            ps.executeUpdate();
        }
    }

    public void completeCourse(int userId, Course course) throws SQLException {
        // Check if the student has completed all required tasks
        if (isCourseCompleted(userId, course)) {
            // Mark the course as completed
            markCourseAsCompleted(userId, course.getCourseID());

            // Generate the certificate
            generateCertificate(userId, course);
        }
    }

    private boolean isCourseCompleted(int userId, Course course) {

        return true;
    }

    private void generateCertificate(int userId, Course course) throws SQLException {

        String url = "http://yourserver.com/generateCertificate?studentName=" + getLearnerName(userId)
                + "&courseName=" + course.getCourseName()
                + "&instructorName=" + getInstructorName(course.getCreatedBy());
        System.out.println("Certificate generation URL: " + url);
    }

    public String getLearnerName(int userId) throws SQLException {
        String sql = "SELECT FirstName, LastName FROM Users WHERE UserID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("FirstName") + " " + rs.getString("LastName");
                }
            }
        }
        return "Learner Name";
    }

    public String getInstructorName(int instructorId) throws SQLException {
        String sql = "SELECT FirstName, LastName FROM Users WHERE UserID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, instructorId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("FirstName") + " " + rs.getString("LastName");
                }
            }
        }
        return "Instructor Name";
    }
}
