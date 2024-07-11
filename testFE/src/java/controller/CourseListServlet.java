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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import model.Course;
import model.Language;
import model.Level;
import model.User;

@WebServlet(name = "CourseListServlet", urlPatterns = {"/CourseList"})
public class CourseListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        // Retrieve filter criteria from request parameters
        String[] categoryNamesArray = request.getParameterValues("category");
        String priceFilter = request.getParameter("price");
        String[] languageIDArray = request.getParameterValues("language");
        String[] levelIDArray = request.getParameterValues("level");
        String minRatingStr = request.getParameter("rating");
        String sortOrder = request.getParameter("sortOrder");

        Double minRating = minRatingStr != null && !minRatingStr.isEmpty() ? Double.parseDouble(minRatingStr) : null;

        // Fetch category IDs for the given category names
        List<Integer> categoryIDs = new ArrayList<>();
        if (categoryNamesArray != null) {
            for (String categoryName : categoryNamesArray) {
                try {
                    int categoryID = CategoryDAO.getCategoryIdByName(categoryName);
                    categoryIDs.add(categoryID);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        List<Integer> languageIDs = new ArrayList<>();
        if (languageIDArray != null) {
            for (String languageID : languageIDArray) {
                languageIDs.add(Integer.parseInt(languageID));
            }
        }

        List<Integer> levelIDs = new ArrayList<>();
        if (levelIDArray != null) {
            for (String levelID : levelIDArray) {
                levelIDs.add(Integer.parseInt(levelID));
            }
        }

        // Use CourseDAO to get filtered courses
        List<Course> allCourses = courseDAO.getFilteredCourses(categoryIDs, priceFilter, languageIDs, levelIDs, minRating, sortOrder);

        // Check if the user is logged in and is a student
        User student = (User) request.getSession().getAttribute("user");
        final List<Integer> enrolledCourseIDs;
        if (student != null) {
            // Get the list of enrolled course IDs
            try {
                enrolledCourseIDs = courseDAO.getEnrolledCourseIDs(student.getUserID());
            } catch (Exception ex) {
                Logger.getLogger(CourseListServlet.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
                throw new ServletException("Error retrieving enrolled courses", ex);
            }

            // Filter out unpublished courses and enrolled courses
            allCourses = allCourses.stream()
                    .filter(Course::IsPublished)
                    .filter(course -> !enrolledCourseIDs.contains(course.getCourseID()))
                    .collect(Collectors.toList());
        } else {
            // Filter out unpublished courses
            allCourses = allCourses.stream()
                    .filter(Course::IsPublished)
                    .collect(Collectors.toList());
        }

        // Set filtered courses as request attribute
        request.setAttribute("courses", allCourses);

        // Forward to JSP page
        request.getRequestDispatcher("/pages/courseList.jsp").forward(request, response);
    }
}
