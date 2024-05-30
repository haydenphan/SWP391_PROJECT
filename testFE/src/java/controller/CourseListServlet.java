/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.CourseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Course;

/**
 *
 * @author Khoi
 */
@WebServlet(name = "CourseListServlet", urlPatterns = {"/CourseList"})
public class CourseListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve filter criteria from request parameters
        String categoryIDStr = request.getParameter("categoryID");
        String subcategoryIDStr = request.getParameter("subcategoryID");
        String priceFilter = request.getParameter("priceFilter");
        String languageIDStr = request.getParameter("languageID");
        String minRatingStr = request.getParameter("minRating");
        String sortOrder = request.getParameter("sortOrder");

        Integer categoryID = categoryIDStr != null && !categoryIDStr.isEmpty() ? Integer.parseInt(categoryIDStr) : null;
        Integer subcategoryID = subcategoryIDStr != null && !subcategoryIDStr.isEmpty() ? Integer.parseInt(subcategoryIDStr) : null;
        Integer languageID = languageIDStr != null && !languageIDStr.isEmpty() ? Integer.parseInt(languageIDStr) : null;
        Double minRating = minRatingStr != null && !minRatingStr.isEmpty() ? Double.parseDouble(minRatingStr) : null;

        // Use CourseDAO to get filtered courses
        CourseDAO courseDAO = new CourseDAO();
        List<Course> filteredCourses = courseDAO.getFilteredCourses(categoryID, subcategoryID, priceFilter, languageID, minRating, sortOrder);

        // Set filtered courses as request attribute
        request.setAttribute("courses", filteredCourses);

        // Forward to JSP page
        request.getRequestDispatcher("/courseList.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
