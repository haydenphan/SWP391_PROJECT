package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.SectionLecture;

public class SectionLectureDAO extends DAO<SectionLecture> {

    @Override
    public int insert(SectionLecture lecture) {
        String sql = "INSERT INTO Lectures (SectionID, LectureName, LectureType, LectureURL, CreatedDate) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, lecture.getSectionID());
            ps.setString(2, lecture.getLectureName());
            ps.setString(3, lecture.getLectureType());
            ps.setString(4, lecture.getLectureURL());
            ps.setObject(5, lecture.getCreatedDate());

            int affectedRows = ps.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Inserting lecture failed, no rows affected.");
            }

            try (var rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    return rs.getInt(1); // Return the generated LectureID
                } else {
                    throw new SQLException("Inserting lecture failed, no ID obtained.");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return -1; // Return -1 in case of error
        } catch (Exception ex) {
            Logger.getLogger(SectionLectureDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 1;
    }

    public static List<SectionLecture> getLecturesBySectionId(int sectionId) {
        List<SectionLecture> lectures = new ArrayList<>();
        String sql = "SELECT * FROM Lectures WHERE SectionID = ? ORDER BY CreatedDate";

        try (Connection con = JDBC.getConnectionWithSqlJdbc();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, sectionId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    SectionLecture lecture = new SectionLecture();
                    lecture.setLectureID(rs.getInt("LectureID"));
                    lecture.setSectionID(rs.getInt("SectionID"));
                    lecture.setLectureName(rs.getString("LectureName"));
                    lecture.setLectureType(rs.getString("LectureType"));
                    lecture.setLectureURL(rs.getString("LectureURL"));
                    lecture.setCreatedDate(rs.getTimestamp("CreatedDate").toLocalDateTime());

                    lectures.add(lecture);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(SectionLectureDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return lectures;
    }
}
