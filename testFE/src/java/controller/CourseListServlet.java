package controller;

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
import java.util.List;
import java.util.stream.Collectors;
import model.Course;
import model.Language;
import model.Level;

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

        // Set request attributes for languages and levels
        request.setAttribute("languages", languages);
        request.setAttribute("courseLevels", levels);

        // Retrieve filter criteria from request parameters
        String categoryIDStr = request.getParameter("categoryID");
        String subcategoryIDStr = request.getParameter("subcategoryID");
        String priceFilter = request.getParameter("price");
        String[] languageIDArray = request.getParameterValues("language");
        String[] levelIDArray = request.getParameterValues("level");
        String minRatingStr = request.getParameter("rating");
        String sortOrder = request.getParameter("sortOrder");

        Integer categoryID = categoryIDStr != null && !categoryIDStr.isEmpty() ? Integer.parseInt(categoryIDStr) : null;
        Integer subcategoryID = subcategoryIDStr != null && !subcategoryIDStr.isEmpty() ? Integer.parseInt(subcategoryIDStr) : null;
        Double minRating = minRatingStr != null && !minRatingStr.isEmpty() ? Double.parseDouble(minRatingStr) : null;

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
        List<Course> allCourses = courseDAO.getFilteredCourses(categoryID, subcategoryID, priceFilter, languageIDs, levelIDs, minRating, sortOrder);

        // Filter out unpublished courses
        List<Course> filteredCourses = allCourses.stream()
                .filter(Course::IsPublished)
                .collect(Collectors.toList());

        // Set filtered courses as request attribute
        request.setAttribute("courses", filteredCourses);

        // Forward to JSP page
        request.getRequestDispatcher("/pages/courseList.jsp").forward(request, response);
    }
}