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
import model.Course;
import model.CourseEnrollment;
import model.User;

public class CourseEnrollmentDAO {

    public int insertEnrollment(CourseEnrollment enrollment) {
        String sql = "INSERT INTO CourseEnrollments (StudentID, CourseID, EnrollmentDate) VALUES (?, ?, ?)";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            st.setInt(1, enrollment.getUserID());
            st.setInt(2, enrollment.getCourseID());
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
        String sql = "SELECT * FROM CourseEnrollments WHERE StudentID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, userID);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    CourseEnrollment enrollment = new CourseEnrollment(
                            rs.getInt("EnrollmentID"),
                            rs.getInt("StudentID"),
                            rs.getInt("CourseID"),
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
                            rs.getInt("EnrollmentID"),
                            rs.getInt("StudentID"),
                            rs.getInt("CourseID"),
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

    public static List<Course> getCoursesByUserID(int userID) {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT c.* FROM Courses c "
                + "INNER JOIN CourseEnrollments ce ON c.CourseID = ce.CourseID "
                + "WHERE ce.StudentID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {

            st.setInt(1, userID);

            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Course course = new Course();
                    course.setCourseID(rs.getInt("CourseID"));
                    course.setCourseName(rs.getString("CourseName"));
                    course.setDescription(rs.getString("Description"));
                    course.setCreatedBy(rs.getInt("CreatedBy"));
                    course.setCreatedDate(rs.getTimestamp("CreatedDate").toLocalDateTime()); // Correct conversion from java.sql.Date to LocalDate
                    course.setIsPublished(rs.getBoolean("IsPublished"));
                    course.setSubcategoryID(rs.getInt("SubcategoryID"));
                    course.setLevelID(rs.getInt("LevelID"));
                    course.setLanguageID(rs.getInt("LanguageID"));
                    course.setPrice(rs.getInt("Price"));
                    course.setImageURL(rs.getString("ImageURL"));
                    course.setTotalEnrolled(rs.getInt("TotalEnrolled"));
                    course.setLastUpdate(rs.getTimestamp("LastUpdate").toLocalDateTime()); // Correct conversion from java.sql.Date to LocalDate
                    course.setRequirements(rs.getString("Requirements"));
                    courses.add(course);
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return courses;
    }

    public static int countEnrollmentsByCourseID(int courseID) {
        String sql = "SELECT COUNT(*) AS enrollmentCount FROM CourseEnrollments WHERE CourseID = ?";
        int count = 0;

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {

            st.setInt(1, courseID);

            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    count = rs.getInt("enrollmentCount");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CourseEnrollmentDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CourseEnrollmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count;
    }

    public boolean isLearnerEnrolledInInstructorCourse(int learnerID, int lecturerID) {
        String sql = "SELECT COUNT(*) AS count FROM CourseEnrollments ce "
                + "JOIN Courses c ON ce.CourseID = c.CourseID "
                + "WHERE ce.studentID = ? AND c.CreatedBy = ?";

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
    
    public List<User> getLearnersByCourseID(String courseID) {
        List<User> learners = new ArrayList<>();
        String sql = "SELECT u.*, ce.EnrollmentDate AS EnrollmentDate FROM Users u " +
             "JOIN CourseEnrollments ce ON u.userID = ce.StudentID " +
             "WHERE ce.CourseID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); 
             PreparedStatement st = con.prepareStatement(sql)) {
             
            st.setString(1, courseID);
            try (ResultSet rs = st.executeQuery()) {

                while (rs.next()) {
                    User learner = new User();
                    learner.setUserID(rs.getInt("UserID"));
                    learner.setUserName(rs.getString("Username"));
                    learner.setEmail(rs.getString("Email"));
                    learner.setEnrollmentDate(rs.getTimestamp("EnrollmentDate").toLocalDateTime());
                    learners.add(learner);
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println(e.getMessage());
            Logger.getLogger(CourseEnrollmentDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CourseEnrollmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return learners;
    }

public static void main(String[] args) {
        CourseEnrollmentDAO enrollmentDAO = new CourseEnrollmentDAO();
        
        // Giả sử courseID là "1"
        String courseID = "2";
        
        List<User> learners = enrollmentDAO.getLearnersByCourseID(courseID);
        
        if (learners.isEmpty()) {
            System.out.println("Không có học viên nào trong khóa học này.");
        } else {
            System.out.println("Danh sách học viên trong khóa học ID = " + courseID + ":");
            for (User learner : learners) {
                System.out.println("UserID: " + learner.getUserID());
                System.out.println("Username: " + learner.getUserName());
                System.out.println("Email: " + learner.getEmail());
                System.out.println(learner.getEnrollmentDate());
                System.out.println("----------------------------");
            }
        }
    }
}
