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
}
