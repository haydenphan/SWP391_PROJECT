/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
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

/**
 *
 * @author Khoi
 */
public class CategoryDAO extends DAO<Category> {

    @Override
    public int insert(Category category) {
        // This method is not implemented in this example.
        throw new UnsupportedOperationException("Insert operation is not supported.");
    }

    public ArrayList<Category> selectAllWithSubCategories() throws Exception {
        ArrayList<Category> categories = new ArrayList<>();
        String sql = "SELECT c.CategoryID, c.CategoryName AS CategoryName, sc.SubCategoryID, sc.SubCategoryName AS SubCategoryName " +
                     "FROM Categories c " +
                     "LEFT JOIN SubCategories sc ON c.CategoryID = sc.CategoryID";

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
        }

        return categories;
    }

    private Category findCategoryById(ArrayList<Category> categories, int categoryId) {
        for (Category category : categories) {
            if (category.getCategoryID() == categoryId) {
                return category;
            }
        }
        return null;
    }

    public static void main(String[] args) throws Exception {
        CategoryDAO categoryDAO = new CategoryDAO();
        ArrayList<Category> categories = categoryDAO.selectAllWithSubCategories();
        for (Category category : categories) {
            System.out.println(category);
        }
    }
}
