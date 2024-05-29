package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;

public class CourseDAO extends DAO<Course> {

    @Override
    public int insert(Course t) {
        int res = 0;
        String sql = "INSERT INTO Courses (CourseName, Description, CreatedBy, CreatedDate, IsPublished, SubcategoryID, TotalEnrolled, LastUpdate, Requirements) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {

            st.setString(1, t.getCourseName());
            st.setString(2, t.getDescription());
            st.setInt(3, t.getCreatedBy());
            st.setDate(4, Date.valueOf(t.getCreatedDate().toLocalDate()));
            st.setBoolean(5, t.isIsPublished());
            st.setInt(6, t.getSubcategoryID());
            st.setInt(7, t.getTotalEnrolled());
            st.setDate(8, Date.valueOf(t.getLastUpdate().toLocalDate()));
            st.setString(9, t.getRequirements());

            res = st.executeUpdate();

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return res;
    }

    public static List<Course> getAllCourses() {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT CourseID, CourseName, Description, CreatedBy, CreatedDate, IsPublished, SubcategoryID, TotalEnrolled, LastUpdate, Requirements FROM Courses";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql); ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                Course course = new Course();
                course.setCourseID(rs.getInt("CourseID"));
                course.setCourseName(rs.getString("CourseName"));
                course.setDescription(rs.getString("Description"));
                course.setCreatedBy(rs.getInt("CreatedBy"));
                course.setCreatedDate(rs.getTimestamp("CreatedDate").toLocalDateTime()); // Correct conversion from java.sql.Date to LocalDate
                course.setIsPublished(rs.getBoolean("IsPublished"));
                course.setSubcategoryID(rs.getInt("SubcategoryID"));
                course.setTotalEnrolled(rs.getInt("TotalEnrolled"));
                course.setLastUpdate(rs.getTimestamp("LastUpdate").toLocalDateTime()); // Correct conversion from java.sql.Date to LocalDate
                course.setRequirements(rs.getString("Requirements"));

                courses.add(course);
            }

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return courses;
    }

    public static Course getCoursesByID(int id) {
        String sql = "SELECT * FROM Courses WHERE CourseID = ?";
        Course course = null;

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, id);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    course = new Course();
                    course.setCourseID(rs.getInt("CourseID"));
                    course.setCourseName(rs.getString("CourseName"));
                    course.setDescription(rs.getString("Description"));
                    course.setCreatedBy(rs.getInt("CreatedBy"));
                    course.setCreatedDate(rs.getTimestamp("CreatedDate").toLocalDateTime());
                    course.setIsPublished(rs.getBoolean("IsPublished"));
                    course.setSubcategoryID(rs.getInt("SubcategoryID"));
                    course.setTotalEnrolled(rs.getInt("TotalEnrolled"));
                    course.setLastUpdate(rs.getTimestamp("LastUpdate").toLocalDateTime());
                    course.setRequirements(rs.getString("Requirements"));
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return course;
    }

    public static void main(String[] args) {
        CourseDAO dao = new CourseDAO();
        List<Course> list = dao.getAllCourses();
        for (Course course : list) {
            System.out.println(course.toString());
        }
    }
}
