package DAO;

import static DAO.QuizDAO.getQuizzesBySectionId;
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
import model.SectionLecture;

public class CourseSectionDAO extends DAO<CourseSection> {

    @Override
    public int insert(CourseSection courseSection) {
        String sql = "INSERT INTO CourseSections (CourseID, SectionName, SectionOrder, CreatedDate) VALUES (?, ?, ?, ?)";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, courseSection.getCourseID());
            ps.setString(2, courseSection.getSectionName());
            ps.setInt(3, courseSection.getSectionOrder());
            ps.setObject(4, courseSection.getCreatedDate());
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
        String sql = "UPDATE CourseSections SET SectionName = ?, SectionOrder = ?, CreatedDate = ? WHERE SectionID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, courseSection.getSectionName());
            ps.setInt(2, courseSection.getSectionOrder());
            ps.setObject(3, courseSection.getCreatedDate());
            ps.setInt(4, courseSection.getSectionID());

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
    public List<CourseSection> getCourseSectionsByCourseId(int courseId) {
    List<CourseSection> sections = new ArrayList<>();
    String sql = "SELECT * FROM CourseSections WHERE courseID = ?";
    
    try (Connection con = JDBC.getConnectionWithSqlJdbc();
         PreparedStatement ps = con.prepareStatement(sql)) {
        
        ps.setInt(1, courseId);
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                CourseSection section = new CourseSection();
                section.setSectionID(rs.getInt("sectionID"));
                section.setCourseID(rs.getInt("courseID"));
                section.setSectionName(rs.getString("sectionName"));
                section.setSectionOrder(rs.getInt("sectionOrder"));
                section.setCreatedDate(rs.getTimestamp("createdDate").toLocalDateTime());

                // Lấy các bài giảng trong section
                List<SectionLecture> lectures = SectionLectureDAO.getLecturesBySectionId(section.getSectionID());
                section.setLectures(lectures);

                // Lấy các bài quiz trong section
                List<Quiz> quizzes = getQuizzesBySectionId(section.getSectionID());
                section.setQuizzes(quizzes);

                sections.add(section);
            }
        }
    } catch (SQLException | ClassNotFoundException e) {
        Logger.getLogger(CourseSectionDAO.class.getName()).log(Level.SEVERE, null, e);
    } catch (Exception ex) {
        Logger.getLogger(CourseSectionDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return sections;
}


     public static void main(String[] args) {
        CourseSectionDAO courseSectionDAO = new CourseSectionDAO();
        int testCourseId = 12; // Thay đổi ID này phù hợp với dữ liệu trong cơ sở dữ liệu của bạn

        List<CourseSection> courseSections = courseSectionDAO.getCourseSectionsByCourseId(testCourseId);
        if (courseSections.isEmpty()) {
            System.out.println("No sections found for course ID: " + testCourseId);
        } else {
            for (CourseSection section : courseSections) {
                System.out.println("Section ID: " + section.getSectionID());
                System.out.println("Course ID: " + section.getCourseID());
                System.out.println("Section Name: " + section.getSectionName());
                System.out.println("Section Order: " + section.getSectionOrder());
                System.out.println("Created Date: " + section.getCreatedDate());

                List<SectionLecture> lectures = section.getLectures();
                if (lectures.isEmpty()) {
                    System.out.println("No lectures found for section ID: " + section.getSectionID());
                } else {
                    System.out.println("Lectures:");
                    for (SectionLecture lecture : lectures) {
                        System.out.println("  Lecture ID: " + lecture.getLectureID());
                        System.out.println("  Lecture Name: " + lecture.getLectureName());
                    }
                }

                List<Quiz> quizzes = section.getQuizzes();
                if (quizzes.isEmpty()) {
                    System.out.println("No quizzes found for section ID: " + section.getSectionID());
                } else {
                    System.out.println("Quizzes:");
                    for (Quiz quiz : quizzes) {
                        System.out.println("  Quiz ID: " + quiz.getQuizId());
                        System.out.println("  Quiz Name: " + quiz.getQuizName());
                        System.out.println("  Graded: " + quiz.isGraded());
                    }
                }
            }
        }
    }
}