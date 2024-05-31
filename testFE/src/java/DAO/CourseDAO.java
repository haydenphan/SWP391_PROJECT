package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Course;
import DAO.JDBC;

public class CourseDAO extends DAO<Course> {

    @Override
    public int insert(Course t) {
        int res = 0;
        String sql = "INSERT INTO Courses (CourseName, Description, CreatedBy, CreatedDate, IsPublished, SubcategoryID, TotalEnrolled, LastUpdate, Requirements, Level, Ratings, Price, Language, Duration, BackgroundImage, Curriculum) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {

            st.setString(1, t.getCourseName());
            st.setString(2, t.getDescription());
            st.setInt(3, t.getCreatedBy());
            st.setTimestamp(4, java.sql.Timestamp.valueOf(t.getCreatedDate())); // Correct conversion from LocalDateTime to java.sql.Timestamp
            st.setBoolean(5, t.isIsPublished());
            st.setInt(6, t.getSubcategoryID());
            st.setInt(7, t.getTotalEnrolled());
            st.setTimestamp(8, java.sql.Timestamp.valueOf(t.getLastUpdate())); // Correct conversion from LocalDateTime to java.sql.Timestamp
            st.setString(9, t.getRequirements());
            st.setString(10, t.getLevel());
            st.setInt(11, t.getRatings());
            st.setDouble(12, t.getPrice());
            st.setString(13, t.getLanguage());
            st.setInt(14, t.getDuration());
            st.setString(15, t.getBackgroundImage());
            st.setString(16, t.getCurriculum());

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
        String sql = "SELECT * FROM Courses";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql); ResultSet rs = st.executeQuery()) {

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
                course.setLastUpdate(rs.getTimestamp("LastUpdate").toLocalDateTime());
                course.setRequirements(rs.getString("Requirements"));
                course.setLevel(rs.getString("Level"));
                course.setRatings(rs.getInt("Ratings"));
                course.setPrice(rs.getDouble("Price"));
                course.setLanguage(rs.getString("Language"));
                course.setDuration(rs.getInt("Duration"));
                course.setBackgroundImage(rs.getString("BackgroundImage"));
                course.setCurriculum(rs.getString("Curriculum"));

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

    // Phương thức lấy thông tin khóa học dựa trên ID
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
                    course.setLevel(rs.getString("Level"));
                    course.setRatings(rs.getInt("Ratings"));
                    course.setPrice(rs.getDouble("Price"));
                    course.setLanguage(rs.getString("Language"));
                    course.setDuration(rs.getInt("Duration"));
                    course.setBackgroundImage(rs.getString("BackgroundImage"));
                    course.setCurriculum(rs.getString("Curriculum"));
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

    public static Category getCourseSubCategory(Course course) {
        int subCategoryID = course.getSubcategoryID();
        String sql = "SELECT Categories.CategoryID, Categories.CategoryName\n"
                + "FROM Categories\n"
                + "INNER JOIN Subcategories\n"
                + "ON Categories.CategoryID=Subcategories.CategoryID\n"
                + "WHERE Subcategories.SubcategoryID = ?;";

        Category category = null;
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, subCategoryID);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    category = new Category();
                    category.setCategoryID(rs.getInt("CategoryID"));
                    category.setCategoryName(rs.getString("CategoryName"));
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return category;
    }

    public List<Course> SearchCourseByName(String name) {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT * FROM Courses WHERE [CourseName] LIKE ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                // populate the course object with data from result set
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
                course.setLevel(rs.getString("Level"));
                course.setRatings(rs.getInt("Ratings"));
                course.setPrice(rs.getDouble("Price"));
                course.setLanguage(rs.getString("Language"));
                course.setDuration(rs.getInt("Duration"));
                course.setBackgroundImage(rs.getString("BackgroundImage"));
                course.setCurriculum(rs.getString("Curriculum"));
                list.add(course);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
