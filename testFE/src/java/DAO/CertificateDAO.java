package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CertificateDAO {

    public List<String> getCertificateURLsByUserId(int userId) throws Exception {
        List<String> certificateURLs = new ArrayList<>();
        String sql = "SELECT CertificateURL FROM CourseCertificates WHERE UserID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); 
             PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, userId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    String certificateURL = rs.getString("CertificateURL");
                    certificateURLs.add(certificateURL);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CertificateDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return certificateURLs;
    }
    
    public static void main(String[] args) throws Exception {
        CertificateDAO dao = new CertificateDAO();
        int userId = 5; 

        List<String> certificateURLs = dao.getCertificateURLsByUserId(userId);

        if (certificateURLs.isEmpty()) {
            System.out.println("No certificates found for user with ID: " + userId);
        } else {
            System.out.println("Certificates for user with ID " + userId + ":");
            for (String url : certificateURLs) {
                System.out.println(url);
            }
        }
    }
}
