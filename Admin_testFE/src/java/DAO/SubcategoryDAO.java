package DAO;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.SQLException;

public class SubcategoryDAO extends DAO {

    @Override
    public int insert(Object t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static List<String> getSubcategoryNamesByCategoryID(int categoryID) throws Exception {
        List<String> subcategoryNames = new ArrayList<>();
        String sql = "SELECT SubcategoryName FROM Subcategories WHERE CategoryID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setInt(1, categoryID);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    subcategoryNames.add(resultSet.getString("SubcategoryName"));
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(SubcategoryDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return subcategoryNames;
    }

    public static int getSubcategoryIdByName(String subcategoryName) {
        int id = -1;
        String sql = "SELECT SubcategoryID FROM Subcategories WHERE SubcategoryName = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setString(1, subcategoryName);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    id = resultSet.getInt("SubcategoryID");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error: " + e.getMessage());
            Logger.getLogger(LanguageDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(LanguageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return id;
    }

    public static String getCategoryNameBySubId(int id) throws Exception {
        String sql = "SELECT c.CategoryName "
                + "FROM [OnlineLearningV3].[dbo].[Subcategories] AS s "
                + "JOIN [OnlineLearningV3].[dbo].[Categories] AS c "
                + "ON s.CategoryID = c.CategoryID "
                + "WHERE s.SubcategoryID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("CategoryName");
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return null;
    }

    public static void main(String[] args) {
        System.out.println(SubcategoryDAO.getSubcategoryIdByName("Database"));
    }
}
