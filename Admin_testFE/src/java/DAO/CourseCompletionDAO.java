package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CourseCompletionDAO {

    private Connection connection;

    public CourseCompletionDAO(Connection connection) {
        this.connection = connection;
    }

//    public void markCourseAsCompleted(int userId, int courseId) throws SQLException {
//        String sql = "INSERT INTO CourseCompletion (UserId, CourseID, completionDate, Status) VALUES (?, ?, ?, ?)";
//        try (PreparedStatement ps = connection.prepareStatement(sql)) {
//            ps.setInt(1, userId);
//            ps.setInt(2, courseId);
//            ps.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
//            ps.setString(4, "Completed");
//            ps.executeUpdate();
//        } catch (SQLException e) {
//            Logger.getLogger(CourseCompletionDAO.class.getName()).log(Level.SEVERE, "SQL error: " + e.getMessage(), e);
//            throw e;
//        }
//    }
//
//    public void completeCourse(int userId, Course course) throws SQLException {
//        // Check if the student has completed all required tasks
//        if (isCourseCompleted(userId, course)) {
//            // Mark the course as completed
//            markCourseAsCompleted(userId, course.getCourseID());
//
//            // Generate the certificate
//            generateCertificate(userId, course);
//        }
//    }
//
//    private boolean isCourseCompleted(int userId, Course course) {
//        return true;  // Assuming course is always completed for this example
//    }
//
//    private void generateCertificate(int userId, Course course) throws SQLException {
//        String url = "http://yourserver.com/generateCertificate?studentName=" + getLearnerName(userId)
//                + "&courseName=" + course.getCourseName()
//                + "&instructorName=" + getInstructorName(course.getCreatedBy());
//        System.out.println("Certificate generation URL: " + url);
//    }
    public void completeCourse(int userId, int courseId) throws SQLException {
        String sql = "INSERT INTO CourseCompletions (UserID, CourseID, CompletionDate) VALUES (?, ?, GETDATE())";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, courseId);
            ps.executeUpdate();
        }
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
        } catch (SQLException e) {
            Logger.getLogger(CourseCompletionDAO.class.getName()).log(Level.SEVERE, "SQL error: " + e.getMessage(), e);
            throw e;
        }
        return null;
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
        } catch (SQLException e) {
            Logger.getLogger(CourseCompletionDAO.class.getName()).log(Level.SEVERE, "SQL error: " + e.getMessage(), e);
            throw e;
        }
        return null;
    }

    public List<Integer> getMonthlyCourseCompleted(int year) {
        String sql = "SELECT MONTH(completionDate) as Month, COUNT(*) as Total "
                + "FROM CourseCompletions "
                + "WHERE YEAR(completionDate) = ? "
                + "GROUP BY MONTH(completionDate)";
        List<Integer> monthlyCompletions = new ArrayList<>();
        for (int i = 0; i < 12; i++) {
            monthlyCompletions.add(0);
        }

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, year);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int month = rs.getInt("Month");
                int total = rs.getInt("Total");
                monthlyCompletions.set(month - 1, total);
            }
        } catch (SQLException e) {
            Logger.getLogger(CourseCompletionDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return monthlyCompletions;
    }

}