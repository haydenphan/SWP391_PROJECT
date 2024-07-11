package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.LectureMaterial;

public class LectureMaterialDAO extends DAO<LectureMaterial> {
    
    @Override
    public int insert(LectureMaterial t) {
        int res = 0;
        String sql = "INSERT INTO LectureExtraMaterials (LectureID, MaterialUrl) VALUES (?, ?)";
        
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            
            st.setInt(1, t.getLectureId());
            st.setString(2, t.getLectureMaterialUrl());
            
            res = st.executeUpdate();

            // Get the generated keys
            try (ResultSet generatedKeys = st.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    res = generatedKeys.getInt(1);
                }
            }
            
        } catch (SQLException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(LectureMaterialDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(LectureMaterialDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return res;
    }
    
    public static List<LectureMaterial> getLectureMaterialsByLectureID(int lectureID) {
        List<LectureMaterial> lectureMaterials = new ArrayList<>();
        String sql = "SELECT LectureExtraMaterialsId, LectureID, MaterialUrl FROM LectureExtraMaterials WHERE LectureID = ?";
        
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            
            st.setInt(1, lectureID);
            
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt("LectureExtraMaterialsId");
                    String materialUrl = rs.getString("MaterialUrl");
                    
                    LectureMaterial lectureMaterial = new LectureMaterial();
                    lectureMaterial.setLectureMaterialId(id);
                    lectureMaterial.setLectureMaterialUrl(materialUrl);
                    lectureMaterial.setLectureId(lectureID);
                    lectureMaterials.add(lectureMaterial);
                }
            }
            
        } catch (SQLException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(LectureMaterialDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(LectureMaterialDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return lectureMaterials;
    }
    
    public boolean updateMaterial(LectureMaterial material) {
        String sql = "UPDATE LectureExtraMaterials SET LectureID = ?, MaterialUrl = ? WHERE LectureExtraMaterialsId = ?";
        
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, material.getLectureId());
            ps.setString(2, material.getLectureMaterialUrl());
            ps.setInt(3, material.getLectureMaterialId());
            
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(LectureMaterialDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(LectureMaterialDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return false;
    }
    
    public static boolean deleteMaterial(int materialId) {
        String sql = "DELETE FROM LectureExtraMaterials WHERE LectureExtraMaterialsId = ?";
        
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, materialId);
            
            int rowsDeleted = ps.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(LectureMaterialDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(LectureMaterialDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return false;
    }
}
