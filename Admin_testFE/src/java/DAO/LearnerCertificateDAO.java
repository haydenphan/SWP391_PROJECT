//package DAO;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import java.util.List;
//import model.Certificate;
//
//public class LearnerCertificateDAO {
//    private final Connection connection;
//
//    public LearnerCertificateDAO(Connection connection) {
//        this.connection = connection;
//    }
//
//    public void insertCertificate(Certificate certificate) throws Exception {
//        String sql = "INSERT INTO Certificates (LearnerID, LearnerName, InstructorName, CourseName, CertificateUrl) VALUES (?, ?, ?, ?, ?)";
//
//        try (PreparedStatement statement = connection.prepareStatement(sql)) {
//            statement.setInt(1, certificate.getLearnerID());
//            statement.setString(2, certificate.getLearnerName());
//            statement.setString(3, certificate.getInstructorName());
//            statement.setString(4, certificate.getCourseName());
//            statement.setString(5, certificate.getCertificateUrl());
//            statement.executeUpdate();
//        }
//    }
//
//    public List<Certificate> getCertificatesByLearnerId(int learnerId) throws Exception {
//        List<Certificate> certificates = new ArrayList<>();
//        String sql = "SELECT * FROM Certificates WHERE LearnerID = ?";
//
//        try (PreparedStatement statement = connection.prepareStatement(sql)) {
//            statement.setInt(1, learnerId);
//            ResultSet rs = statement.executeQuery();
//
//            while (rs.next()) {
//                Certificate certificate = new Certificate(
//                    rs.getInt("CertificateID"),
//                    rs.getInt("LearnerID"),
//                    rs.getString("LearnerName"),
//                    rs.getString("InstructorName"),
//                    rs.getString("CourseName"),
//                    rs.getString("CertificateUrl")
//                );
//                certificates.add(certificate);
//            }
//        }
//
//        return certificates;
//    }
//}
