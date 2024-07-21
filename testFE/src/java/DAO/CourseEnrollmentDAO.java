package DAO;

import java.security.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;
import model.CourseEnrollment;
import model.User;

public class CourseEnrollmentDAO {

    public List<Integer> getMonthlyCourseCompleted(int year) {
        String sql = "SELECT MONTH(CompletionDate) as Month, COUNT(*) as Total "
                + "FROM CourseEnrollments "
                + "WHERE YEAR(CompletionDate) = ? AND IsCompleted = 1 "
                + "GROUP BY MONTH(CompletionDate)";
        List<Integer> monthlyCompletions = new ArrayList<>();
        for (int i = 0; i < 12; i++) {
            monthlyCompletions.add(0);
        }

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, year);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int month = rs.getInt("Month");
                int total = rs.getInt("Total");
                monthlyCompletions.set(month - 1, total);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CourseEnrollmentDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CourseEnrollmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return monthlyCompletions;
    }

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

    public List<User> getLearnersByCourseID(String courseID) {
        List<User> learners = new ArrayList<>();
        String sql = "SELECT u.*, ce.EnrollmentDate AS EnrollmentDate FROM Users u "
                + "JOIN CourseEnrollments ce ON u.userID = ce.StudentID "
                + "WHERE ce.CourseID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {

            st.setString(1, courseID);
            try (ResultSet rs = st.executeQuery()) {

                while (rs.next()) {
                    User learner = new User();
                    learner.setUserID(rs.getInt("UserID"));
                    learner.setUserName(rs.getString("Username"));
                    learner.setEmail(rs.getString("Email"));
//                    learner.setEnrollmentDate(rs.getTimestamp("EnrollmentDate").toLocalDateTime());
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

    public static List<Course> getCoursesByUserID(int studentID) {
        String sql = "SELECT c.CourseID, c.CourseName, c.Description, c.CreatedBy, c.CreatedDate, c.IsPublished, "
                + "c.SubcategoryID, c.LevelID, c.LanguageID, c.Price, c.ImageURL, c.TotalEnrolled, c.LastUpdate, "
                + "c.Requirements, c.isCancelled, sc.SubcategoryName, l.LevelName, lg.LanguageName, "
                + "ISNULL(AVG(cf.Rating), 0) AS AverageRating "
                + "FROM Courses c "
                + "JOIN CourseEnrollments ce ON c.CourseID = ce.CourseID "
                + "LEFT JOIN CourseFeedback cf ON c.CourseID = cf.CourseID "
                + "LEFT JOIN Subcategories sc ON c.SubcategoryID = sc.SubcategoryID "
                + "LEFT JOIN CourseLevels l ON c.LevelID = l.LevelID "
                + "LEFT JOIN CourseLanguages lg ON c.LanguageID = lg.LanguageID "
                + "WHERE ce.StudentID = ? "
                + "GROUP BY c.CourseID, c.CourseName, c.Description, c.CreatedBy, c.CreatedDate, c.IsPublished, "
                + "c.SubcategoryID, c.LevelID, c.LanguageID, c.Price, c.ImageURL, c.TotalEnrolled, c.LastUpdate, "
                + "c.Requirements, c.isCancelled, sc.SubcategoryName, l.LevelName, lg.LanguageName";

        List<Course> courses = new ArrayList<>();

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, studentID);

            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Course course = new Course();
                    course.setCourseID(rs.getInt("CourseID"));
                    course.setCourseName(rs.getString("CourseName"));
                    course.setDescription(rs.getString("Description"));
                    course.setCreatedBy(rs.getInt("CreatedBy"));
                    course.setCreatedDate(rs.getTimestamp("CreatedDate").toLocalDateTime());
                    course.setIsPublished(rs.getBoolean("IsPublished"));
                    course.setSubcategoryID(rs.getInt("SubcategoryID"));
                    course.setTotalEnrolled(rs.getInt("TotalEnrolled"));

                    java.sql.Timestamp lastUpdateTimestamp = rs.getTimestamp("LastUpdate");
                    if (lastUpdateTimestamp != null) {
                        course.setLastUpdate(lastUpdateTimestamp.toLocalDateTime());
                    }

                    course.setRequirements(rs.getString("Requirements"));
                    course.setPrice(rs.getDouble("Price"));
                    course.setLanguageID(rs.getInt("LanguageID"));
                    course.setLevelID(rs.getInt("LevelID"));
                    course.setImageURL(rs.getString("ImageURL"));
                    course.setAverageRating(rs.getDouble("AverageRating"));
                    course.setSubcategoryName(rs.getString("SubcategoryName"));
                    course.setLevelName(rs.getString("LevelName"));
                    course.setLanguageName(rs.getString("LanguageName"));
                    course.setIsCancelled(rs.getBoolean("isCancelled"));

                    courses.add(course);
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
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

    public static boolean isCourseCompleted(int learnerID, int courseID) {
        String sql = "SELECT COUNT(l.LectureID) AS totalLectures, "
                + "SUM(CASE WHEN lp.WatchedPercentage >= 80 THEN 1 ELSE 0 END) AS completedLectures "
                + "FROM Lectures l "
                + "JOIN CourseSections cs ON l.SectionID = cs.SectionID "
                + "LEFT JOIN LectureProgress lp ON l.LectureID = lp.LectureID AND lp.UserID = ? "
                + "WHERE cs.CourseID = ?";

        try (Connection connection = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setInt(1, learnerID);
            stmt.setInt(2, courseID);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int totalLectures = rs.getInt("totalLectures");
                    int completedLectures = rs.getInt("completedLectures");
                    return completedLectures >= totalLectures;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public static void updateCourseCompletionStatus(int learnerID, int courseID) {
        String sql = "UPDATE CourseEnrollments "
                + "SET IsCompleted = 1, CompletionDate = CURRENT_TIMESTAMP "
                + "WHERE StudentID = ? AND CourseID = ?";

        try (Connection connection = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setInt(1, learnerID);
            stmt.setInt(2, courseID);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Integer> getMonthlyCourseEnrolled(int year) {
        String sql = "SELECT MONTH(EnrollmentDate) as Month, COUNT(*) as Total "
                + "FROM CourseEnrollments "
                + "WHERE YEAR(EnrollmentDate) = ? "
                + "GROUP BY MONTH(EnrollmentDate)";
        List<Integer> monthlyEnrollments = new ArrayList<>();
        for (int i = 0; i < 12; i++) {
            monthlyEnrollments.add(0);
        }

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, year);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int month = rs.getInt("Month");
                int total = rs.getInt("Total");
                monthlyEnrollments.set(month - 1, total);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CourseEnrollmentDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CourseEnrollmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return monthlyEnrollments;
    }

    public static boolean isCertificateGenerated(int learnerID, int courseID) {
        String sql = "SELECT COUNT(*) AS certificateCount FROM CourseCertificates WHERE LearnerID = ? AND CourseID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, learnerID);
            st.setInt(2, courseID);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next() && rs.getInt("certificateCount") > 0) {
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

    public static int countCompletedEnrollments() throws Exception {
        String sql = "SELECT COUNT(*) AS CompletedCount "
                + "FROM [OnlineLearningV2].[dbo].[CourseEnrollments] "
                + "WHERE IsCompleted = 1";
        int completedCount = 0;

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql); ResultSet rs = st.executeQuery()) {

            if (rs.next()) {
                completedCount = rs.getInt("CompletedCount");
            }

        } catch (SQLException | ClassNotFoundException e) {
        }

        return completedCount;
    }

    public static int countCoursesByLearnerID(int learnerID) {
        String sql = "SELECT COUNT(*) AS courseCount FROM CourseEnrollments WHERE StudentID = ?";
        int count = 0;

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, learnerID);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    count = rs.getInt("courseCount");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CourseEnrollmentDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CourseEnrollmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count;
    }

    public static int countIncompleteCoursesByLearnerID(int learnerID) {
        String sql = "SELECT COUNT(*) AS incompleteCourseCount FROM CourseEnrollments WHERE StudentID = ? AND IsCompleted = 0";
        int count = 0;

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, learnerID);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    count = rs.getInt("incompleteCourseCount");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CourseEnrollmentDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CourseEnrollmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count;
    }

    public static int countCompletedCoursesByLearnerID(int learnerID) {
        String sql = "SELECT COUNT(*) AS completedCourseCount FROM CourseEnrollments WHERE StudentID = ? AND IsCompleted = 1";
        int count = 0;

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, learnerID);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    count = rs.getInt("completedCourseCount");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CourseEnrollmentDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CourseEnrollmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count;
    }

    public static boolean hasLearnerCompletedCourse(int learnerID, int courseID) {
        String sql = "SELECT IsCompleted FROM CourseEnrollments WHERE StudentID = ? AND CourseID = ?";
        boolean isCompleted = false;

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, learnerID);
            st.setInt(2, courseID);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    isCompleted = rs.getBoolean("IsCompleted");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CourseEnrollmentDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CourseEnrollmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return isCompleted;
    }

    public static void main(String[] args) {
//        CourseEnrollmentDAO dao = new CourseEnrollmentDAO();

        // Check if user is enrolled in course
//        boolean isEnrolled = dao.isUserEnrolledInCourse(1, 1);
//        System.out.println("Is user enrolled in course: " + isEnrolled);
        List<Course> courses = CourseEnrollmentDAO.getCoursesByUserID(6);
        for (Course course : courses) {
            System.out.println(course.toString());
        }
//        boolean isEnrolled = dao.isLearnerEnrolledInInstructorCourse(2, 3);
//        System.out.println("Is user enrolled in course: " + isEnrolled);
    }
}
