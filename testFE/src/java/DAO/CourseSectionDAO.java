package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.CourseSection;
import model.Quiz;

public class CourseSectionDAO extends DAO<CourseSection> {

    @Override
    public int insert(CourseSection courseSection) {
        String sql = "INSERT INTO CourseSections (CourseID, SectionName, SectionOrder, SectionDescription, CreatedDate) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, courseSection.getCourseID());
            ps.setString(2, courseSection.getSectionName());
            ps.setInt(3, courseSection.getSectionOrder());
            ps.setString(4, courseSection.getSectionDescription());
            ps.setObject(5, courseSection.getCreatedDate());
            int affectedRows = ps.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating course section failed, no rows affected.");
            }

            try (var generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Creating course section failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(CourseSectionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public static List<CourseSection> getCourseSections(int courseId) {
        List<CourseSection> courseSections = new ArrayList<>();
        String sql = "SELECT * FROM CourseSections WHERE CourseID = ? ORDER BY SectionOrder";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, courseId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    CourseSection courseSection = new CourseSection();
                    courseSection.setSectionID(rs.getInt("SectionID"));
                    courseSection.setCourseID(rs.getInt("CourseID"));
                    courseSection.setSectionName(rs.getString("SectionName"));
                    courseSection.setSectionOrder(rs.getInt("SectionOrder"));
                    courseSection.setCreatedDate(rs.getTimestamp("CreatedDate").toLocalDateTime());
                    courseSection.setSectionDescription(rs.getString("SectionDescription"));
                    courseSection.setLectures(SectionLectureDAO.getLecturesBySectionId(courseSection.getSectionID()));
                    courseSections.add(courseSection);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(CourseSectionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return courseSections;
    }

    public static boolean updateSection(CourseSection courseSection) {
        String sql = "UPDATE CourseSections SET SectionName = ?, SectionOrder = ?, CreatedDate = ?, SectionDescription = ? WHERE SectionID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, courseSection.getSectionName());
            ps.setInt(2, courseSection.getSectionOrder());
            ps.setObject(3, courseSection.getCreatedDate());
            ps.setString(4, courseSection.getSectionDescription());
            ps.setInt(5, courseSection.getSectionID());

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(CourseSectionDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CourseSectionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }
//
//    public int delete(int sectionId) throws Exception {
//        String sql = "DELETE FROM CourseSections WHERE SectionID = ?";
//        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {
//            ps.setInt(1, sectionId);
//            return ps.executeUpdate();
//        } catch (SQLException | ClassNotFoundException e) {
//            Logger.getLogger(CourseSectionDAO.class.getName()).log(Level.SEVERE, null, e);
//            return -1; // Return -1 in case of error
//        }
//    }

    public static CourseSection getSectionById(int sectionId) {
        String sql = "SELECT * FROM CourseSections WHERE SectionID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, sectionId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    CourseSection courseSection = new CourseSection();
                    courseSection.setSectionID(rs.getInt("SectionID"));
                    courseSection.setCourseID(rs.getInt("CourseID"));
                    courseSection.setSectionName(rs.getString("SectionName"));
                    courseSection.setSectionOrder(rs.getInt("SectionOrder"));
                    courseSection.setCreatedDate(rs.getTimestamp("CreatedDate").toLocalDateTime());
                    courseSection.setSectionDescription(rs.getString("SectionDescription"));
                    courseSection.setLectures(SectionLectureDAO.getLecturesBySectionId(courseSection.getSectionID()));
                    return courseSection;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(CourseSectionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static int getTotalLectures(int sectionId) {
        String sql = "SELECT COUNT(*) FROM Lectures WHERE SectionID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, sectionId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(CourseSectionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public static List<String> getSectionDescriptionsByCourseID(int courseId) {
        List<String> descriptions = new ArrayList<>();
        String sql = "SELECT SectionDescription FROM CourseSections WHERE CourseID = ? ORDER BY SectionOrder";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, courseId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    descriptions.add(rs.getString("SectionDescription"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(CourseSectionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return descriptions;
    }

    public static List<CourseSection> getCourseSectionsWithQuizzes(int courseId) {
        List<CourseSection> sections = new ArrayList<>();
        try (Connection connection = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = connection.prepareStatement(
                "SELECT cs.SectionID, cs.SectionDescription, cs.CourseID, cs.SectionName, cs.SectionOrder, cs.CreatedDate, "
                + "q.QuizID, q.QuizName, q.IsGraded, q.CreatedDate as QuizCreatedDate "
                + "FROM CourseSections cs "
                + "LEFT JOIN Quizzes q ON cs.SectionID = q.SectionID "
                + "WHERE cs.CourseID = ?")) {
            ps.setInt(1, courseId);
            try (ResultSet rs = ps.executeQuery()) {
                CourseSection currentSection = null;
                while (rs.next()) {
                    int sectionID = rs.getInt("SectionID");
                    if (currentSection == null || currentSection.getSectionID() != sectionID) {
                        currentSection = new CourseSection();
                        currentSection.setSectionID(sectionID);
                        currentSection.setSectionDescription(rs.getString("SectionDescription"));
                        currentSection.setCourseID(rs.getInt("CourseID"));
                        currentSection.setSectionName(rs.getString("SectionName"));
                        currentSection.setSectionOrder(rs.getInt("SectionOrder"));
                        currentSection.setCreatedDate(rs.getTimestamp("CreatedDate").toLocalDateTime());
                        currentSection.setQuizzes(new ArrayList<>());  // Initialize the quizzes list
                        sections.add(currentSection);
                    }
                    int quizID = rs.getInt("QuizID");
                    if (quizID > 0) {
                        Quiz quiz = new Quiz();
                        quiz.setQuizId(quizID);
                        quiz.setSectionId(rs.getInt("SectionID"));
                        quiz.setQuizName(rs.getString("QuizName"));
                        quiz.setCreatedDate(rs.getTimestamp("QuizCreatedDate").toLocalDateTime());
                        currentSection.getQuizzes().add(quiz);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sections;
    }

    public static void main(String[] args) {
        for (CourseSection courseSectionsWithQuizze : CourseSectionDAO.getCourseSectionsWithQuizzes(9)) {
            System.out.println(courseSectionsWithQuizze.toString());
        }
    }
}
