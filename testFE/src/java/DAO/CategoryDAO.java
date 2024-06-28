package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Category;
import model.SubCategory;

public class CategoryDAO extends DAO<Category> {

    @Override
    public int insert(Category category) {
        // This method is not implemented in this example.
        throw new UnsupportedOperationException("Insert operation is not supported.");
    }

    public static ArrayList<Category> selectAllWithSubCategories() {
        ArrayList<Category> categories = new ArrayList<>();
        String sql = "SELECT c.CategoryID, c.CategoryName AS CategoryName, sc.SubCategoryID, sc.SubCategoryName AS SubCategoryName "
                + "FROM Categories c "
                + "LEFT JOIN SubCategories sc ON c.CategoryID = sc.CategoryID";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql); ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                int categoryId = rs.getInt("CategoryID");
                String categoryName = rs.getString("CategoryName");

                Category category = findCategoryById(categories, categoryId);
                if (category == null) {
                    category = new Category(categoryId, categoryName, new ArrayList<>());
                    categories.add(category);
                }

                int subCategoryId = rs.getInt("SubCategoryID");
                if (subCategoryId != 0) {
                    String subCategoryName = rs.getString("SubCategoryName");
                    SubCategory subCategory = new SubCategory(subCategoryId, categoryId, subCategoryName);
                    category.getSubCategories().add(subCategory);
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return categories;
    }

    public static Category findCategoryById(ArrayList<Category> categories, int categoryId) {
        for (Category category : categories) {
            if (category.getCategoryID() == categoryId) {
                return category;
            }
        }
        return null;
    }

    public static int getCategoryIdByName(String categoryName) throws Exception {
        int id = 0;
        String sql = "SELECT CategoryID "
                + "FROM Categories "
                + "WHERE CategoryName = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, categoryName);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    id = rs.getInt("CategoryID");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return id;
    }
    
    public static ArrayList<String> getAllCategoryName() throws Exception {
        ArrayList<String> list = new ArrayList<>();
        String sql = "SELECT CategoryName FROM Categories";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    list.add(rs.getString("CategoryName"));
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public static String getCategoryBySubcategory(int subID) throws Exception {
        String categoryName = null;
        String sql = "SELECT c.CategoryName " // Corrected to select CategoryName
                + "FROM Categories c "
                + "JOIN Subcategories sc ON c.CategoryID = sc.CategoryID " // Added space before WHERE
                + "WHERE sc.SubcategoryID = ?"; // Added table alias sc before SubcategoryID

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, subID); // Changed to setInt to match the parameter type
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) { // Changed to if since we expect only one result
                    categoryName = rs.getString("CategoryName"); // Corrected to fetch CategoryName
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return categoryName;
    }
    
      public static String getCategoryNameById(int categoryId) throws Exception {
        String categoryName = null;
        String sql = "SELECT CategoryName FROM Categories WHERE CategoryID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); 
             PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, categoryId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    categoryName = rs.getString("CategoryName");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return categoryName;
    }
      
    public static void main(String[] args) throws Exception {
        CategoryDAO categoryDAO = new CategoryDAO();
        ArrayList<Category> categories = categoryDAO.selectAllWithSubCategories();
        for (Category category : categories) {
            System.out.println(category);
        }

        System.out.println(CategoryDAO.getCategoryNameById(1));
    }
}