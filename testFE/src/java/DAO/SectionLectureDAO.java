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
        String sql = "INSERT INTO Lectures (SectionID, LectureName, LectureURL, CreatedDate) VALUES (?, ?, ?, ?)";

        try (Connection conn = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, lecture.getSectionID());
            ps.setString(2, lecture.getLectureName());
            ps.setString(3, lecture.getLectureURL());
            ps.setObject(4, lecture.getCreatedDate());

            int affectedRows = ps.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Inserting lecture failed, no rows affected.");
            }

            try (ResultSet rs = ps.getGeneratedKeys()) {
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
            return -1; // Return -1 in case of error
        }
    }

    public static List<SectionLecture> getLecturesBySectionId(int sectionId) {
        List<SectionLecture> lectures = new ArrayList<>();
        String sql = "SELECT * FROM Lectures WHERE SectionID = ? ORDER BY CreatedDate";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, sectionId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    SectionLecture lecture = new SectionLecture();
                    lecture.setLectureID(rs.getInt("LectureID"));
                    lecture.setSectionID(rs.getInt("SectionID"));
                    lecture.setLectureName(rs.getString("LectureName"));
                    lecture.setLectureURL(rs.getString("LectureURL"));
                    lecture.setCreatedDate(rs.getTimestamp("CreatedDate").toLocalDateTime());
                    LectureMaterialDAO dao = new LectureMaterialDAO();
                    lecture.setLectureMaterials(dao.getLectureMaterialsByLectureID(lecture.getLectureID()));
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

    public static boolean updateLectureName(int lectureId, String name) {
        String sql = "UPDATE Lectures SET LectureName = ? WHERE LectureID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setInt(2, lectureId);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0; // Return true if update was successful
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false; // Return false in case of error
        } catch (Exception ex) {
            Logger.getLogger(SectionLectureDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false; // Return false in case of error
        }
    }

    public static boolean updateLectureVideo(int lectureId, String videoUrl) {
        String sql = "UPDATE Lectures SET LectureURL = ? WHERE LectureID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, videoUrl);
            ps.setInt(2, lectureId);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0; // Return true if update was successful
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false; // Return false in case of error
        } catch (Exception ex) {
            Logger.getLogger(SectionLectureDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false; // Return false in case of error
        }
    }

    public boolean updateLecture(SectionLecture lecture) {
        String sql = "UPDATE Lectures SET SectionID = ?, LectureName = ?, LectureURL = ? WHERE LectureID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, lecture.getSectionID());
            ps.setString(2, lecture.getLectureName());
            ps.setString(3, lecture.getLectureURL());
            ps.setInt(4, lecture.getLectureID());

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(SectionLectureDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(SectionLectureDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public int delete(int lectureId) throws Exception {
        String sql = "DELETE FROM Lectures WHERE LectureID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, lectureId);
            return ps.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(SectionLectureDAO.class.getName()).log(Level.SEVERE, null, e);
            return -1; // Return -1 in case of error
        }
    }

    public static SectionLecture getLectureById(int lectureId) {
        String sql = "SELECT * FROM Lectures WHERE LectureID = ?";
        SectionLecture lecture = null;

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, lectureId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    lecture = new SectionLecture();
                    lecture.setLectureID(rs.getInt("LectureID"));
                    lecture.setSectionID(rs.getInt("SectionID"));
                    lecture.setLectureName(rs.getString("LectureName"));
                    lecture.setLectureURL(rs.getString("LectureURL"));
                    lecture.setCreatedDate(rs.getTimestamp("CreatedDate").toLocalDateTime());

                    // Assuming you have a method to fetch materials by lecture ID
                    LectureMaterialDAO dao = new LectureMaterialDAO();
                    lecture.setLectureMaterials(dao.getLectureMaterialsByLectureID(lecture.getLectureID()));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(SectionLectureDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return lecture;
    }

    public static void main(String[] args) {
        for (SectionLecture lecture : SectionLectureDAO.getLecturesBySectionId(1)) {
            System.out.println(lecture.toString());
        }
    }
}
