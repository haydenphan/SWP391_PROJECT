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
            st.setBoolean(5, t.IsPublished());
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

    public List<Course> getFilteredCourses(Integer categoryID, Integer subcategoryID, String priceFilter, Integer languageID, Double minRating, String sortOrder) {
        List<Course> courses = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT c.*, ISNULL(AVG(cf.Rating), 0) AS AverageRating "
                + "FROM Courses c "
                + "LEFT JOIN CourseFeedbacks cf ON c.CourseID = cf.CourseID "
                + "WHERE 1 = 1 ");

        if (categoryID != null) {
            sql.append("AND c.SubcategoryID IN (SELECT SubcategoryID FROM Subcategories WHERE CategoryID = ?) ");
        }
        if (subcategoryID != null) {
            sql.append("AND c.SubcategoryID = ? ");
        }
        if (priceFilter != null) {
            if (priceFilter.equals("free")) {
                sql.append("AND c.Price = 0 ");
            } else if (priceFilter.equals("paid")) {
                sql.append("AND c.Price > 0 ");
            }
        }
        if (languageID != null) {
            sql.append("AND c.LanguageID = ? ");
        }
        if (minRating != null) {
            sql.append("HAVING AVG(cf.Rating) >= ? ");
        }
        sql.append("GROUP BY c.CourseID, c.CourseName, c.Description, c.CreatedBy, c.CreatedDate, c.IsPublished, c.SubcategoryID, c.TotalEnrolled, c.LastUpdate, c.Requirements, c.Price, c.LanguageID, c.LevelID, c.ImageURL ");

        // Add sorting logic
        if (sortOrder != null) {
            if (sortOrder.equals("popularity")) {
                sql.append("ORDER BY c.TotalEnrolled DESC ");
            } else if (sortOrder.equals("latest")) {
                sql.append("ORDER BY c.CreatedDate DESC ");
            }
        }

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql.toString())) {
            int paramIndex = 1;
            if (categoryID != null) {
                st.setInt(paramIndex++, categoryID);
            }
            if (subcategoryID != null) {
                st.setInt(paramIndex++, subcategoryID);
            }
            if (languageID != null) {
                st.setInt(paramIndex++, languageID);
            }
            if (minRating != null) {
                st.setDouble(paramIndex++, minRating);
            }

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
                    course.setLastUpdate(rs.getTimestamp("LastUpdate").toLocalDateTime());
                    course.setRequirements(rs.getString("Requirements"));
                    course.setPrice(rs.getDouble("Price"));
                    course.setLanguageID(rs.getInt("LanguageID"));
                    course.setLevelID(rs.getInt("LevelID"));
                    course.setImageURL(rs.getString("ImageURL"));
                    course.setAverageRating(rs.getDouble("AverageRating"));

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
    
    public static List<Course> selectBySubCategoryID(int subcategoryID) {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT CourseID, CourseName, Description, CreatedBy, CreatedDate, IsPublished, SubcategoryID, TotalEnrolled, LastUpdate, Requirements "
                + "FROM Courses WHERE SubcategoryID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, subcategoryID);

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
                    course.setLastUpdate(rs.getTimestamp("LastUpdate").toLocalDateTime());
                    course.setRequirements(rs.getString("Requirements"));

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

    public static List<Course> selectByCategoryID(int categoryID) {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT c.CourseID, c.CourseName, c.Description, c.CreatedBy, c.CreatedDate, c.IsPublished, c.SubcategoryID, c.TotalEnrolled, c.LastUpdate, c.Requirements "
                + "FROM Courses c "
                + "JOIN Subcategories s ON c.SubcategoryID = s.SubcategoryID "
                + "WHERE s.CategoryID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, categoryID);

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
                    course.setLastUpdate(rs.getTimestamp("LastUpdate").toLocalDateTime());
                    course.setRequirements(rs.getString("Requirements"));

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
                course.setPrice(rs.getDouble("Price"));
                list.add(course);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        CourseDAO dao = new CourseDAO();
        List<Course> list = dao.getAllCourses();
        for (Course course : list) {
            System.out.println(course.toString());
        }
    }
}
