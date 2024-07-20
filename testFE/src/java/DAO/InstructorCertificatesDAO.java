package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.InstructorCertificates;

public class InstructorCertificatesDAO extends DAO<InstructorCertificates> {

    @Override
    public int insert(InstructorCertificates t) {
        String sql = "INSERT INTO LecturerCertificates (ApprovalID, CertificateURL, UploadDate) VALUES (?, ?, ?)";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, t.getApprovalID());
            ps.setString(2, t.getCertificateUrl());
            ps.setTimestamp(3, Timestamp.valueOf(t.getUploadDate())); // Use Timestamp for LocalDateTime

            int affectedRows = ps.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Inserting certificate failed, no rows affected.");
            }

            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Inserting certificate failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(InstructorCertificatesDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(InstructorCertificatesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public InstructorCertificates getCertificateByApprovalID(int approvalID) throws Exception {
        String sql = "SELECT * FROM LecturerCertificates WHERE ApprovalID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, approvalID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                InstructorCertificates cert = new InstructorCertificates();
                cert.setCertificateID(rs.getInt("CertificateID"));
                cert.setApprovalID(rs.getInt("ApprovalID"));
                cert.setCertificateUrl(rs.getString("CertificateURL"));
                cert.setUploadDate(rs.getTimestamp("UploadDate").toLocalDateTime()); // Convert Timestamp to LocalDateTime
                return cert;
            }
        } catch (SQLException e) {
            Logger.getLogger(InstructorCertificatesDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public void update(InstructorCertificates t) throws Exception {
        String sql = "UPDATE LecturerCertificates SET CertificateURL = ?, UploadDate = ? WHERE CertificateID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, t.getCertificateUrl());
            ps.setTimestamp(2, Timestamp.valueOf(t.getUploadDate())); // Use Timestamp for LocalDateTime
            ps.setInt(3, t.getCertificateID());
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(InstructorCertificatesDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void delete(int certificateId) throws Exception {
        String sql = "DELETE FROM LecturerCertificates WHERE CertificateID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, certificateId);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(InstructorCertificatesDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public List<InstructorCertificates> getAllCertificatesByUserID(int userID) throws Exception {
        List<InstructorCertificates> certificates = new ArrayList<>();
        String sql = "SELECT * FROM LecturerCertificates WHERE ApprovalID IN (SELECT ApprovalID FROM InstructorApprovals WHERE UserID = ?)";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                InstructorCertificates cert = new InstructorCertificates();
                cert.setCertificateID(rs.getInt("CertificateID"));
                cert.setApprovalID(rs.getInt("ApprovalID"));
                cert.setCertificateUrl(rs.getString("CertificateURL"));
                cert.setUploadDate(rs.getTimestamp("UploadDate").toLocalDateTime()); // Convert Timestamp to LocalDateTime
                certificates.add(cert);
            }
        } catch (SQLException e) {
            Logger.getLogger(InstructorCertificatesDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return certificates;
    }

    public static void main(String[] args) throws Exception {
        for (InstructorCertificates instructorCertificates : new InstructorCertificatesDAO().getAllCertificatesByUserID(7)) {
            System.out.println(instructorCertificates.toString());
        }
    }
}
