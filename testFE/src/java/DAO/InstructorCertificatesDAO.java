package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.InstructorCertificates;

public class InstructorCertificatesDAO extends DAO<InstructorCertificates> {

    @Override
    public int insert(InstructorCertificates t) {
        String sql = "INSERT INTO LecturerCertificates (UserID, CertificateURL, UploadDate) VALUES (?, ?, ?)";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, t.getUserID());
            ps.setString(2, t.getCertificateUrl());
            ps.setDate(3, Date.valueOf(t.getUploadDate().toLocalDate()));
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
            Logger.getLogger(CourseSectionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

}