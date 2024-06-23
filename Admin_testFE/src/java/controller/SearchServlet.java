package controller;

import DAO.CourseDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.Course;

@WebServlet(name = "SearchController", urlPatterns = {"/search"})
public class SearchServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // Lấy tham số tìm kiếm từ request
        String txtSearch = (String)request.getParameter("txt");

        // Gọi phương thức tìm kiếm trong DAO
        CourseDAO courseDAO = new CourseDAO();
        System.out.println(txtSearch);
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
