package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Certificate;

public class CertificateDAO {
    private Connection connection;

    public CertificateDAO(Connection connection) {
        this.connection = connection;
    }

    public void insertCertificate(Certificate certificate) throws SQLException {
        String sql = "INSERT INTO Certificates (LearnerID, LearnerName, InstructorName, CourseName, CertificateUrl) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, certificate.getLearnerID());
            stmt.setString(2, certificate.getLearnerName());
            stmt.setString(3, certificate.getInstructorName());
            stmt.setString(4, certificate.getCourseName());
            stmt.setString(5, certificate.getCertificateUrl());
            stmt.executeUpdate();
        }
    }

    public List<Certificate> getCertificatesByUserId(int userId) throws SQLException {
        List<Certificate> certificates = new ArrayList<>();
        String sql = "SELECT * FROM Certificates WHERE LearnerID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Certificate certificate = new Certificate(
                    rs.getInt("CertificateID"),
                    rs.getInt("LearnerID"),
                    rs.getString("LearnerName"),
                    rs.getString("InstructorName"),
                    rs.getString("CourseName"),
                    rs.getString("CertificateUrl")
                );
                certificates.add(certificate);
            }
        }
        return certificates;
    }
}
