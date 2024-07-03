package controller;

import DAO.CategoryDAO;
import DAO.SubcategoryDAO;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "GetSubcategories", urlPatterns = {"/getSubcategories"})
public class GetSubcategoriesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Logger.getLogger(GetSubcategoriesServlet.class.getName()).log(Level.INFO, "Servlet called");
        String category = request.getParameter("category");
        Logger.getLogger(GetSubcategoriesServlet.class.getName()).log(Level.INFO, "Category: " + category);
        int categoryId = 0;
        try {
            categoryId = CategoryDAO.getCategoryIdByName(category);
            Logger.getLogger(GetSubcategoriesServlet.class.getName()).log(Level.INFO, "Category ID: " + categoryId);
        } catch (Exception ex) {
            Logger.getLogger(GetSubcategoriesServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        List<String> subcategories = null;
        try {
            subcategories = SubcategoryDAO.getSubcategoryNamesByCategoryID(categoryId);
            Logger.getLogger(GetSubcategoriesServlet.class.getName()).log(Level.INFO, "Subcategories: " + subcategories);
        } catch (Exception ex) {
            Logger.getLogger(GetSubcategoriesServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(new Gson().toJson(subcategories));
    }
}