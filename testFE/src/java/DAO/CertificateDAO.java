package DAO;

import model.Certificate;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;

public class CertificateDAO extends DAO<Certificate> {
    
    @Override
    public int insert(Certificate certificate) {
        String sql = "INSERT INTO CourseCertificates (LearnerID, InstructorID, CourseID, CertificateURL, UploadDate) VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP)";
        
        try (Connection connection = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = connection.prepareStatement(sql)) {
            
            stmt.setInt(1, certificate.getLearnerID());
            stmt.setInt(2, certificate.getInstructorID());
            stmt.setInt(3, certificate.getCourseID());
            stmt.setString(4, certificate.getCertificateUrl());
            
            return stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    public static List<Certificate> getCertificatesByUserId(int userId) {
        String sql = "SELECT * FROM CourseCertificates WHERE LearnerID = ?";
        List<Certificate> certificates = new ArrayList<>();
        
        try (Connection connection = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Certificate certificate = new Certificate();
                    certificate.setCertificateID(rs.getInt("CertificateID"));
                    certificate.setLearnerID(rs.getInt("LearnerID"));
                    certificate.setInstructorID(rs.getInt("InstructorID"));
                    certificate.setCourseID(rs.getInt("CourseID"));
                    certificate.setCertificateUrl(rs.getString("CertificateURL"));
                    certificate.setUploadDate(rs.getTimestamp("UploadDate"));
                    
                    certificates.add(certificate);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return certificates;
    }
    
    public static String getCourseNameByCertificateID(int certificateID) {
        String sql = "SELECT c.CourseName FROM Courses c JOIN CourseCertificates cc ON c.CourseID = cc.CourseID WHERE cc.CertificateID = ?";
        String courseName = null;
        
        try (Connection connection = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, certificateID);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    courseName = rs.getString("CourseName");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return courseName;
    }
    
    public static void main(String[] args) {
        System.out.println(CertificateDAO.getCourseNameByCertificateID(1));
    }
}
