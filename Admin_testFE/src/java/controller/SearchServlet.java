package controller;

import DAO.CategoryDAO;
import DAO.CourseDAO;
import DAO.LanguageDAO;
import DAO.LevelDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;
import model.Course;
import model.Language;
import model.Level;

@WebServlet(name = "SearchController", urlPatterns = {"/search"})
public class SearchServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Instantiate DAOs
        LanguageDAO languageDAO = new LanguageDAO();
        LevelDAO levelDAO = new LevelDAO();
        CourseDAO courseDAO = new CourseDAO();

        // Get all languages and levels
        List<Language> languages = languageDAO.getAllLanguages();
        List<Level> levels = levelDAO.getAllLevels();

        // Get all categories
        List<String> categories = null;
        try {
            categories = CategoryDAO.getAllCategoryName();
        } catch (Exception ex) {
            Logger.getLogger(CourseListServlet.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        Map<String, Integer> courseQuantityOfCategory = new HashMap<>();
        for (String categoryName : categories) {
            try {
                int categoryId = CategoryDAO.getCategoryIdByName(categoryName);
                int quantity = CategoryDAO.getQuantityOfCategory(categoryId);
                courseQuantityOfCategory.put(categoryName, quantity);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // Set request attributes for languages and levels
        request.setAttribute("languages", languages);
        request.setAttribute("courseLevels", levels);
        request.setAttribute("courseQuantityOfCategory", courseQuantityOfCategory);

        // Lấy tham số tìm kiếm từ request
        String txtSearch = (String) request.getParameter("txt");

        // Gọi phương thức tìm kiếm trong DAO
        List<Course> searchResults = courseDAO.SearchCourseByName(txtSearch);
        for (Course course : searchResults) {
            System.out.println(course.toString());
        }

        // Đặt danh sách kết quả tìm kiếm vào thuộc tính của request
        request.setAttribute("courses", searchResults);

        // Chuyển hướng sang trang courseList.jsp để hiển thị kết quả
        request.getRequestDispatcher("pages/courseList.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}