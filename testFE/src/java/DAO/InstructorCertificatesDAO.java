package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.InstructorCertificates;

public class InstructorCertificatesDAO extends DAO<InstructorCertificates> {

    @Override
    public int insert(InstructorCertificates t) {
        String sql = "INSERT INTO LecturerCertificates (UserID, CourseId, CertificateURL, UploadDate) VALUES (?, ?, ?, ?)";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, t.getUserID());
            ps.setInt(2, t.getCourseID());
            ps.setString(3, t.getCertificateUrl());
            ps.setDate(4, Date.valueOf(t.getUploadDate().toLocalDate()));
            int affectedRows = ps.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Inserting certificate failed, no rows affected.");
            }

            try (var generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Inserting certificate failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(InstructorCertificatesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public InstructorCertificates getCertificateByCourseAndUser(int courseId, int userId) throws Exception {
        String sql = "SELECT * FROM LecturerCertificates WHERE CourseId = ? AND UserID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, courseId);
            ps.setInt(2, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                InstructorCertificates cert = new InstructorCertificates();
                cert.setCertificateID(rs.getInt("CertificateID"));
                cert.setUserID(rs.getInt("UserID"));
                cert.setCourseID(rs.getInt("CourseId"));
                cert.setCertificateUrl(rs.getString("CertificateURL"));
                cert.setUploadDate(rs.getTimestamp("UploadDate").toLocalDateTime());
                return cert;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void update(InstructorCertificates t) throws Exception {
        String sql = "UPDATE LecturerCertificates SET CertificateURL = ?, UploadDate = ? WHERE CertificateID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, t.getCertificateUrl());
            ps.setDate(2, Date.valueOf(t.getUploadDate().toLocalDate()));
            ps.setInt(3, t.getCertificateID());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int certificateId) throws Exception {
        String sql = "DELETE FROM LecturerCertificates WHERE CertificateID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, certificateId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
