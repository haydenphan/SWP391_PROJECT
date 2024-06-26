package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.CourseEnrollment;

public class CourseEnrollmentDAO {

    public int insertEnrollment(CourseEnrollment enrollment) {
        String sql = "INSERT INTO CourseEnrollments (UserID, CourseID, EnrollmentDate) VALUES (?, ?, ?)";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            st.setString(1, enrollment.getUserID());
            st.setString(2, enrollment.getCourseID());
            st.setTimestamp(3, java.sql.Timestamp.valueOf(enrollment.getEnrollmentDate()));
            int affectedRows = st.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = st.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        enrollment.setId(generatedKeys.getInt(1));
                    }
                }
            }
            return affectedRows;
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CourseEnrollmentDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CourseEnrollmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<CourseEnrollment> getEnrollmentsByUserID(String userID) {
        List<CourseEnrollment> enrollments = new ArrayList<>();
        String sql = "SELECT * FROM CourseEnrollments WHERE UserID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, userID);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    CourseEnrollment enrollment = new CourseEnrollment(
                            rs.getInt("ID"),
                            rs.getString("UserID"),
                            rs.getString("CourseID"),
                            rs.getTimestamp("EnrollmentDate").toLocalDateTime()
                    );
                    enrollments.add(enrollment);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CourseEnrollmentDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CourseEnrollmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return enrollments;
    }

    public List<CourseEnrollment> getEnrollmentsByCourseID(String courseID) {
        List<CourseEnrollment> enrollments = new ArrayList<>();
        String sql = "SELECT * FROM CourseEnrollments WHERE CourseID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, courseID);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    CourseEnrollment enrollment = new CourseEnrollment(
                            rs.getInt("ID"),
                            rs.getString("UserID"),
                            rs.getString("CourseID"),
                            rs.getTimestamp("EnrollmentDate").toLocalDateTime()
                    );
                    enrollments.add(enrollment);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CourseEnrollmentDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CourseEnrollmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return enrollments;
    }

    public boolean isUserEnrolledInCourse(int userID, int courseID) {
        String sql = "SELECT COUNT(*) FROM CourseEnrollments WHERE StudentID = ? AND CourseID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, userID);
            st.setInt(2, courseID);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next() && rs.getInt(1) > 0) {
                    return true;
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CourseEnrollmentDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CourseEnrollmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public boolean isLearnerEnrolledInInstructorCourse(int learnerID, int lecturerID) {
        String sql = "SELECT COUNT(*) AS count FROM CourseEnrollments ce " +
                     "JOIN Courses c ON ce.CourseID = c.CreatedBy " +
                     "WHERE ce.studentID = ? AND c.CreatedBy = ?";
        
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, learnerID);
            st.setInt(2, lecturerID);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt("count");
                    return count > 0;
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static void main(String[] args) {
        CourseEnrollmentDAO dao = new CourseEnrollmentDAO();

        // Example usage
        int learnerID = 1; // Replace with actual learner ID
        int lecturerID = 1; // Replace with actual lecturer ID
        boolean isEnrolled = dao.isLearnerEnrolledInInstructorCourse(learnerID, lecturerID);
        System.out.println("Is Learner Enrolled: " + isEnrolled);
    }
}