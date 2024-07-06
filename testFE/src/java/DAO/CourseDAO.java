package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;
import model.User;

public class CourseDAO extends DAO<Course> {

    public static boolean isCoursePublished(int courseId) {
        String sql = "SELECT IsPublished FROM Courses WHERE CourseID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, courseId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return rs.getBoolean("IsPublished");
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

    @Override
    public int insert(Course t) {
        int res = 0;
        String sql = "INSERT INTO Courses (CourseName, Description, CreatedBy, CreatedDate, IsPublished, SubcategoryID, LevelID, LanguageID, Price, ImageURL, TotalEnrolled, LastUpdate, Requirements) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {

            st.setString(1, t.getCourseName());
            st.setString(2, t.getDescription());
            st.setInt(3, t.getCreatedBy());
            st.setDate(4, Date.valueOf(t.getCreatedDate().toLocalDate()));
            st.setBoolean(5, t.IsPublished());
            st.setInt(6, t.getSubcategoryID());
            st.setInt(7, t.getLevelID());
            st.setInt(8, t.getLanguageID());
            st.setDouble(9, t.getPrice());
            st.setString(10, t.getImageURL());
            st.setInt(11, t.getTotalEnrolled());
            st.setDate(12, Date.valueOf(t.getLastUpdate().toLocalDate()));
            st.setString(13, t.getRequirements());

            res = st.executeUpdate();

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return res;
    }

    public Course getCourseByID(String ID) {
        String sql = "SELECT c.*, sc.SubcategoryName, l.LevelName, lg.LanguageName, ISNULL(AVG(cf.Rating), 0) AS AverageRating "
                + "FROM Courses c "
                + "LEFT JOIN CourseFeedback cf ON c.CourseID = cf.CourseID "
                + "LEFT JOIN Subcategories sc ON c.SubcategoryID = sc.SubcategoryID "
                + "LEFT JOIN CourseLevels l ON c.LevelID = l.LevelID "
                + "LEFT JOIN CourseLanguages lg ON c.LanguageID = lg.LanguageID "
                + "WHERE c.CourseID = ? "
                + "GROUP BY c.CourseID, c.CourseName, c.Description, c.CreatedBy, c.CreatedDate, c.IsPublished, c.SubcategoryID, c.TotalEnrolled, c.LastUpdate, c.Requirements, c.Price, c.LanguageID, c.LevelID, c.ImageURL, sc.SubcategoryName, l.LevelName, lg.LanguageName";

        Course course = null;

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, ID);

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

                    Timestamp lastUpdateTimestamp = rs.getTimestamp("LastUpdate");
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

    public static List<Course> getAllCourses() {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT CourseID, CourseName, Description, CreatedBy, CreatedDate, IsPublished, SubcategoryID, LevelID, LanguageID, Price, ImageURL, TotalEnrolled, LastUpdate, Requirements FROM Courses";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql); ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                Course course = new Course();
                course.setCourseID(rs.getInt("CourseID"));
                course.setCourseName(rs.getString("CourseName"));
                course.setDescription(rs.getString("Description"));
                course.setCreatedBy(rs.getInt("CreatedBy"));
                course.setCreatedDate(rs.getTimestamp("CreatedDate").toLocalDateTime()); // Correct conversion from java.sql.Timestamp to LocalDateTime
                course.setIsPublished(rs.getBoolean("IsPublished"));
                course.setSubcategoryID(rs.getInt("SubcategoryID"));
                course.setLevelID(rs.getInt("LevelID"));
                course.setLanguageID(rs.getInt("LanguageID"));
                course.setPrice(rs.getInt("Price"));
                course.setImageURL(rs.getString("ImageURL"));
                course.setTotalEnrolled(rs.getInt("TotalEnrolled"));
                course.setLastUpdate(rs.getTimestamp("LastUpdate").toLocalDateTime()); // Correct conversion from java.sql.Timestamp to LocalDateTime
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

    public static User getInstructor(int id) {
        String sql = "SELECT * FROM Users WHERE UserID = ?";
        User instructor = null;

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, id);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    instructor = new User();
                    instructor.setAvatar(rs.getString("Avatar"));
                    instructor.setBio(rs.getString("Bio"));
                    instructor.setEmail(rs.getString("Email"));
                    instructor.setFirstName(rs.getString("FirstName"));
                    instructor.setIsActive(rs.getBoolean("IsActive"));
                    instructor.setLastName(rs.getString("LastName"));
                    instructor.setPasswordHash(rs.getString("PasswordHash"));
                    instructor.setRegistrationDate(rs.getTimestamp("RegistrationDate").toLocalDateTime());
                    instructor.setRole(rs.getInt("RoleID"));
                    instructor.setStoredSalt(rs.getBytes("StoredSalt"));
                    instructor.setUserID(rs.getInt("UserID"));
                    instructor.setEmail(rs.getString("Username"));
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return instructor;
    }

    public static ArrayList<Course> getCoursesByInstructor(int id) {
        String sql = "SELECT * FROM Courses WHERE CreatedBy = ?";
        ArrayList<Course> list = new ArrayList<>();

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, id);
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
                    list.add(course);
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public static int getCourseIDByInstructorAndName(int id, String name) {
        String sql = "SELECT * FROM Courses WHERE CreatedBy = ? AND CourseName = ?";
        int courseID = -1;

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, id);
            st.setString(2, name);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    courseID = rs.getInt("CourseID");
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return courseID;
    }

    public List<Course> getFilteredCourses(Integer categoryID, Integer subcategoryID, String priceFilter, List<Integer> languageIDs, List<Integer> levelIDs, Double minRating, String sortOrder, int currentPage, int pageSize) {
        List<Course> courses = new ArrayList<>();
        StringBuilder sql = new StringBuilder(
                "SELECT c.*, sc.SubcategoryName, l.LevelName, lg.LanguageName, ISNULL(AVG(cf.Rating), 0) AS AverageRating "
                + "FROM Courses c "
                + "LEFT JOIN CourseFeedback cf ON c.CourseID = cf.CourseID "
                + "LEFT JOIN Subcategories sc ON c.SubcategoryID = sc.SubcategoryID "
                + "LEFT JOIN CourseLevels l ON c.LevelID = l.LevelID "
                + "LEFT JOIN CourseLanguages lg ON c.LanguageID = lg.LanguageID "
                + "WHERE 1 = 1 ");

        if (categoryID != null) {
            sql.append("AND sc.CategoryID = ? ");
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
        if (languageIDs != null && !languageIDs.isEmpty()) {
            sql.append("AND c.LanguageID IN (");
            for (int i = 0; i < languageIDs.size(); i++) {
                sql.append("?");
                if (i < languageIDs.size() - 1) {
                    sql.append(", ");
                }
            }
            sql.append(") ");
        }
        if (levelIDs != null && !levelIDs.isEmpty()) {
            sql.append("AND c.LevelID IN (");
            for (int i = 0; i < levelIDs.size(); i++) {
                sql.append("?");
                if (i < levelIDs.size() - 1) {
                    sql.append(", ");
                }
            }
            sql.append(") ");
        }
        sql.append("GROUP BY c.CourseID, c.CourseName, c.Description, c.CreatedBy, c.CreatedDate, c.IsPublished, c.SubcategoryID, c.TotalEnrolled, c.LastUpdate, c.Requirements, c.Price, c.LanguageID, c.LevelID, c.ImageURL, sc.SubcategoryName, l.LevelName, lg.LanguageName ");

        if (minRating != null) {
            sql.append("HAVING AVG(cf.Rating) >= ? ");
        }

        if (sortOrder != null) {
            if (sortOrder.equals("popularity")) {
                sql.append("ORDER BY c.TotalEnrolled DESC ");
            } else if (sortOrder.equals("latest")) {
                sql.append("ORDER BY c.CreatedDate DESC ");
            }
        } else {
            sql.append("ORDER BY c.CourseID DESC ");
        }
        // Pagination
        int offset = (currentPage - 1) * pageSize;
        sql.append("OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql.toString())) {
            int paramIndex = 1;
            if (categoryID != null) {
                st.setInt(paramIndex++, categoryID);
            }
            if (subcategoryID != null) {
                st.setInt(paramIndex++, subcategoryID);
            }
            if (languageIDs != null && !languageIDs.isEmpty()) {
                for (Integer languageID : languageIDs) {
                    st.setInt(paramIndex++, languageID);
                }
            }
            if (levelIDs != null && !levelIDs.isEmpty()) {
                for (Integer levelID : levelIDs) {
                    st.setInt(paramIndex++, levelID);
                }
            }
            if (minRating != null) {
                st.setDouble(paramIndex++, minRating);
            }
            st.setInt(paramIndex++, offset);
            st.setInt(paramIndex++, pageSize);
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

                    Timestamp lastUpdateTimestamp = rs.getTimestamp("LastUpdate");
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

    public int getTotalCourses(Integer categoryID, Integer subcategoryID, String priceFilter, List<Integer> languageIDs, List<Integer> levelIDs, Double minRating) {
        int totalCourses = 0;
        StringBuilder sql = new StringBuilder(
                "SELECT COUNT(DISTINCT c.CourseID) AS TotalCourses "
                + "FROM Courses c "
                + "LEFT JOIN CourseFeedback cf ON c.CourseID = cf.CourseID "
                + "LEFT JOIN Subcategories sc ON c.SubcategoryID = sc.SubcategoryID "
                + "LEFT JOIN CourseLevels l ON c.LevelID = l.LevelID "
                + "LEFT JOIN CourseLanguages lg ON c.LanguageID = lg.LanguageID "
                + "WHERE 1 = 1 ");

        if (categoryID != null) {
            sql.append("AND sc.CategoryID = ? ");
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
        if (languageIDs != null && !languageIDs.isEmpty()) {
            sql.append("AND c.LanguageID IN (");
            for (int i = 0; i < languageIDs.size(); i++) {
                sql.append("?");
                if (i < languageIDs.size() - 1) {
                    sql.append(", ");
                }
            }
            sql.append(") ");
        }
        if (levelIDs != null && !levelIDs.isEmpty()) {
            sql.append("AND c.LevelID IN (");
            for (int i = 0; i < levelIDs.size(); i++) {
                sql.append("?");
                if (i < levelIDs.size() - 1) {
                    sql.append(", ");
                }
            }
            sql.append(") ");
        }

        if (minRating != null) {
            sql.append("HAVING AVG(cf.Rating) >= ? ");
        }

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql.toString())) {
            int paramIndex = 1;
            if (categoryID != null) {
                st.setInt(paramIndex++, categoryID);
            }
            if (subcategoryID != null) {
                st.setInt(paramIndex++, subcategoryID);
            }
            if (languageIDs != null && !languageIDs.isEmpty()) {
                for (Integer languageID : languageIDs) {
                    st.setInt(paramIndex++, languageID);
                }
            }
            if (levelIDs != null && !levelIDs.isEmpty()) {
                for (Integer levelID : levelIDs) {
                    st.setInt(paramIndex++, levelID);
                }
            }
            if (minRating != null) {
                st.setDouble(paramIndex++, minRating);
            }

            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    totalCourses = rs.getInt("TotalCourses");
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return totalCourses;
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
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {
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

    public static Course getCoursesByIDForCart(int id) {
        String sql = "SELECT * FROM Courses WHERE CourseID = ?";
        Course course = null;

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, id);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    course = new Course();
                    course.setCourseID(rs.getInt("CourseID"));
                    course.setCourseName(rs.getString("CourseName"));
                    course.setPrice(rs.getDouble("Price"));
                    course.setImageURL(null);
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

    public List<Integer> getStarRatingsCount(String courseId) {
        List<Integer> starCounts = new ArrayList<>(5);
        // Initialize list with zeros for 1 to 5 stars
        for (int i = 0; i < 5; i++) {
            starCounts.add(0);
        }

        String sql = "SELECT Rating, COUNT(*) AS starCount "
                + "FROM CourseFeedback "
                + "WHERE CourseID = ? "
                + "GROUP BY Rating";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {

            st.setString(1, courseId);

            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    int rating = rs.getInt("Rating");
                    int count = rs.getInt("starCount");

                    if (rating >= 1 && rating <= 5) {
                        starCounts.set(rating - 1, count);
                    }
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return starCounts;
    }

    // Method to get the total number of feedback entries
    public int getTotalFeedbacksForCourse(String courseID) {
        int totalFeedbacks = 0;
        String sql = "SELECT COUNT(*) AS total FROM CourseFeedback WHERE CourseID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, courseID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    totalFeedbacks = rs.getInt("total");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalFeedbacks;
    }

    // Method to calculate the total number of pages based on the total number of feedback entries and entries per page
    public int getTotalPages(String courseID, int entriesPerPage) {
        int totalFeedbacks = getTotalFeedbacksForCourse(courseID);
        return (int) Math.ceil((double) totalFeedbacks / entriesPerPage);
    }

    public static void main(String[] args) {
        CourseDAO dao = new CourseDAO();
        List<Course> list = dao.getFilteredCourses(1, null, null, null, null, null, null, 1, 10);
        for (Course course : list) {
            System.out.println(course.toString());
        }
        System.out.println(dao.getTotalCourses(1, null, null, null, null, null));
//        System.out.println(dao.getCourseByID("3"));
//        List<Integer> starCounts = dao.getStarRatingsCount("3");
//        System.out.println("Star ratings count for course ID " + "3" + ": " + starCounts);
//        System.out.println(CourseDAO.getCoursesByInstructor(3).size());
//        for (Course course : CourseDAO.getCoursesByInstructor(3)) {
//            System.out.println(course.toString());
//        }
    }
}
