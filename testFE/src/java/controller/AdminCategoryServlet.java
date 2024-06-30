package controller;

import DAO.CategoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.SubCategory;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AdminCategoryServlet", urlPatterns = {"/AdminCategory"})
public class AdminCategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<String> listCategory = new ArrayList<>();
        Map<String, List<SubCategory>> subcategoriesMap = new HashMap<>();

        try {
            listCategory = CategoryDAO.getAllCategoryName();
            for (String category : listCategory) {
                subcategoriesMap.put(category, CategoryDAO.getSubCategoriesByCategoryName(category));
            }
            request.setAttribute("categoriesName", listCategory);
            request.setAttribute("subcategoriesMap", subcategoriesMap);
            request.getRequestDispatcher("/admin/categoriesList.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while fetching categories.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String categoryName = request.getParameter("categoryName");

        try {
            switch (action) {
                case "add":
                    addCategory(request, response, categoryName);
                    break;
                case "edit":
                    editCategory(request, response);
                    break;
                case "delete":
                    deleteCategory(request, response, categoryName);
                    break;
                case "addSubcategory":
                    addSubcategory(request, response);
                    break;
                case "editSubcategory":
                    editSubcategory(request, response);
                    break;
                case "deleteSubcategory":
                    deleteSubcategory(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
                    break;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request.");
        }
    }

    private void addCategory(HttpServletRequest request, HttpServletResponse response, String categoryName)
            throws ServletException, IOException {
        if (categoryName != null && !categoryName.trim().isEmpty()) {
            Category newCategory = new Category();
            newCategory.setName(categoryName.trim());

            try {
                if (CategoryDAO.categoryExists(newCategory.getName())) {
                    request.setAttribute("error", "Category already exists.");
                } else {
                    CategoryDAO.insertCategory(newCategory);
                    request.setAttribute("success", "Category added successfully!");
                }
                doGet(request, response);
            } catch (Exception ex) {
                ex.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while adding the category.");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Category name cannot be empty.");
        }
    }

    private void editCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String oldCategoryName = request.getParameter("oldCategoryName");
        String newCategoryName = request.getParameter("newCategoryName");

        if (oldCategoryName != null && newCategoryName != null && !newCategoryName.trim().isEmpty()) {
            try {
                if (CategoryDAO.categoryExists(newCategoryName.trim())) {
                    request.setAttribute("error", "Category name already exists.");
                } else {
                    CategoryDAO.updateCategoryName(oldCategoryName, newCategoryName.trim());
                    request.setAttribute("success", "Category updated successfully!");
                }
                doGet(request, response);
            } catch (Exception ex) {
                ex.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while editing the category.");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Category names cannot be empty.");
        }
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response, String categoryName)
            throws ServletException, IOException {
        if (categoryName != null && !categoryName.trim().isEmpty()) {
            try {
                CategoryDAO.deleteCategory(categoryName.trim());
                request.setAttribute("success", "Category deleted successfully!");
                doGet(request, response);
            } catch (Exception ex) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while deleting the category: " + ex.getMessage());
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Category name cannot be empty.");
        }
    }

    private void addSubcategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String categoryName = request.getParameter("categoryName");
        String subcategoryName = request.getParameter("subcategoryName");

        if (categoryName != null && subcategoryName != null && !subcategoryName.trim().isEmpty()) {
            SubCategory newSubcategory = new SubCategory();
            newSubcategory.setName(subcategoryName.trim());

            try {
                int categoryId = CategoryDAO.getCategoryIdByName(categoryName);
                newSubcategory.setCategoryID(categoryId);
                if (CategoryDAO.subcategoryExists(newSubcategory.getName(), categoryId)) {
                    request.setAttribute("error", "Subcategory already exists.");
                } else {
                    CategoryDAO.insertSubCategory(newSubcategory);
                    request.setAttribute("success", "Subcategory added successfully!");
                }
                doGet(request, response);
            } catch (Exception ex) {
                ex.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while adding the subcategory.");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Subcategory name cannot be empty.");
        }
    }

    private void editSubcategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String oldSubcategoryName = request.getParameter("oldSubcategoryName");
        String newSubcategoryName = request.getParameter("newSubcategoryName");
        String categoryName = request.getParameter("categoryName");

        if (oldSubcategoryName != null && newSubcategoryName != null && !newSubcategoryName.trim().isEmpty()) {
            try {
                int categoryId = CategoryDAO.getCategoryIdByName(categoryName);
                int subcategoryId = CategoryDAO.getSubcategoryIdByName(oldSubcategoryName, categoryId);

                if (CategoryDAO.subcategoryExists(newSubcategoryName.trim(), categoryId)) {
                    request.setAttribute("error", "Subcategory name already exists.");
                } else {
                    CategoryDAO.updateSubCategoryName(subcategoryId, newSubcategoryName.trim());
                    request.setAttribute("success", "Subcategory updated successfully!");
                }
                doGet(request, response);
            } catch (Exception ex) {
                ex.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while editing the subcategory.");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Subcategory names cannot be empty.");
        }
    }

    private void deleteSubcategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String subcategoryName = request.getParameter("subcategoryName");
        String categoryName = request.getParameter("categoryName");

        if (subcategoryName != null && categoryName != null) {
            try {
                int categoryId = CategoryDAO.getCategoryIdByName(categoryName);
                int subcategoryId = CategoryDAO.getSubcategoryIdByName(subcategoryName, categoryId);
                CategoryDAO.deleteSubCategory(subcategoryId);
                request.setAttribute("success", "Subcategory deleted successfully!");
                doGet(request, response);
            } catch (Exception ex) {
                ex.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while deleting the subcategory: " + ex.getMessage());
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Subcategory name cannot be empty.");
        }
    }

    @Override
    public String getServletInfo() {
        return "AdminCategoryServlet handles displaying, adding, editing, and deleting categories.";
    }
}