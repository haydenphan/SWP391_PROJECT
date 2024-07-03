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
        String sql = "SELECT CategoryID FROM Categories WHERE CategoryName = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, categoryName);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
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

    public static boolean categoryExists(String categoryName) throws Exception {
        String sql = "SELECT 1 FROM Categories WHERE CategoryName = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, categoryName);
            try (ResultSet rs = st.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, e);
            throw e;
        }
    }

    public static void insertCategory(Category category) throws Exception {
        if (categoryExists(category.getName())) {
            throw new Exception("Category already exists.");
        }

        String sql = "INSERT INTO Categories (CategoryName) VALUES(?)";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, category.getName());
            st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, "Error inserting category", e);
            throw e;
        }
    }

    public static void updateCategoryName(String oldCategoryName, String newCategoryName) throws Exception {
        String sql = "UPDATE Categories SET CategoryName = ? WHERE CategoryName = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, newCategoryName);
            st.setString(2, oldCategoryName);
            st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, "Error updating category name", e);
            throw e;
        }
    }

    public static void deleteCategory(String categoryName) throws Exception {
        try (Connection con = JDBC.getConnectionWithSqlJdbc()) {
            con.setAutoCommit(false); // Start transaction

            // First, delete all subcategories related to this category
            String sql1 = "DELETE FROM Subcategories WHERE CategoryID = (SELECT CategoryID FROM Categories WHERE CategoryName = ?)";
            try (PreparedStatement st1 = con.prepareStatement(sql1)) {
                st1.setString(1, categoryName);
                st1.executeUpdate();
            }

            // Then, delete the category
            String sql2 = "DELETE FROM Categories WHERE CategoryName = ?";
            try (PreparedStatement st2 = con.prepareStatement(sql2)) {
                st2.setString(1, categoryName);
                st2.executeUpdate();
            }

            con.commit(); // Commit transaction
        } catch (SQLException | ClassNotFoundException e) {
            throw new Exception("Error deleting category: " + e.getMessage());
        }
    }

    public static int getSubcategoryIdByName(String subcategoryName, int categoryId) throws Exception {
        int id = 0;
        String sql = "SELECT SubCategoryID FROM Subcategories WHERE SubCategoryName = ? AND CategoryID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, subcategoryName);
            st.setInt(2, categoryId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    id = rs.getInt("SubCategoryID");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return id;
    }

    public static boolean subcategoryExists(String subcategoryName, int categoryId) throws Exception {
        String sql = "SELECT 1 FROM Subcategories WHERE SubCategoryName = ? AND CategoryID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, subcategoryName);
            st.setInt(2, categoryId);
            try (ResultSet rs = st.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, e);
            throw e;
        }
    }

    public static void insertSubCategory(SubCategory subcategory) throws Exception {
        if (subcategoryExists(subcategory.getName(), subcategory.getCategoryID())) {
            throw new Exception("Subcategory already exists.");
        }
        String sql = "INSERT INTO Subcategories (CategoryID, SubCategoryName) VALUES(?, ?)";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, subcategory.getCategoryID());
            st.setString(2, subcategory.getName());
            st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, "Error inserting subcategory", e);
            throw e;
        }
    }

    public static void updateSubCategoryName(int subcategoryId, String newSubcategoryName) throws Exception {
        String sql = "UPDATE Subcategories SET SubCategoryName = ? WHERE SubCategoryID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, newSubcategoryName);
            st.setInt(2, subcategoryId);
            st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, "Error updating subcategory name", e);
            throw e;
        }
    }

    public static void deleteSubCategory(int subcategoryId) throws Exception {
        String sql = "DELETE FROM Subcategories WHERE SubCategoryID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, subcategoryId);
            st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, "Error deleting subcategory", e);
            throw e;
        }
    }

    public static ArrayList<SubCategory> getSubCategoriesByCategoryName(String categoryName) throws Exception {
        ArrayList<SubCategory> subcategories = new ArrayList<>();
        String sql = "SELECT sc.SubCategoryID, sc.SubCategoryName FROM Subcategories sc "
                + "JOIN Categories c ON sc.CategoryID = c.CategoryID "
                + "WHERE c.CategoryName = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, categoryName);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    SubCategory subcategory = new SubCategory();
                    subcategory.setSubCategoryID(rs.getInt("SubCategoryID"));
                    subcategory.setName(rs.getString("SubCategoryName"));
                    subcategories.add(subcategory);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, e);
            throw e;
        }

        return subcategories;
    }

    public static int getQuantityOfCategory(int categoryID) throws Exception {
        int quantity = 0;
        String sql = "SELECT COUNT(*) AS Quantity FROM Courses c "
                + "JOIN Subcategories sc ON c.SubcategoryID = sc.SubcategoryID "
                + "WHERE sc.CategoryID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, categoryID);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    quantity = rs.getInt("Quantity");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return quantity;
    }

    public static Category getCategoryBySubcategoryID(int subcategoryID) throws Exception {
        Category category = null;
        String sql = "SELECT c.CategoryID, c.CategoryName "
                + "FROM Categories c "
                + "JOIN Subcategories sc ON c.CategoryID = sc.CategoryID "
                + "WHERE sc.SubCategoryID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, subcategoryID);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    int categoryId = rs.getInt("CategoryID");
                    String categoryName = rs.getString("CategoryName");
                    category = new Category(categoryId, categoryName, new ArrayList<>());
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return category;
    }

    public static void main(String[] args) throws Exception {
        System.out.println(CategoryDAO.getCategoryIdByName("Development"));
    }
}